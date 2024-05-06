package no.inventorymanagement

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import no.inventorymanagement.android.DataWedgeConfig
import no.inventorymanagement.android.DataWedgeInterface
import no.inventorymanagement.android.ScannedData
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

class MainActivity : FlutterActivity() {

    private val SCAN_CHANNEL = "inventorymanagement.no/scan"

    private var dataWedgeBroadcastReceiver: BroadcastReceiver? = null

    private val dataWedgeInterface: DataWedgeInterface = DataWedgeInterface()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        subscribeEventChannel()
    }

    private fun subscribeEventChannel() {
        flutterEngine?.dartExecutor.let { dartExecutor ->
            EventChannel(dartExecutor, SCAN_CHANNEL).setStreamHandler(
                object : EventChannel.StreamHandler {
                    @SuppressLint("UnspecifiedRegisterReceiverFlag")
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        dataWedgeBroadcastReceiver = createDataWedgeBroadcastReceiver(events)
                        val intentFilter = IntentFilter()
                        intentFilter.addAction(DataWedgeConfig.PROFILE_INTENT_ACTION)
                        intentFilter.addAction(DataWedgeInterface.DATA_WEDGE_RETURN_ACTION)
                        intentFilter.addCategory(DataWedgeInterface.DATA_WEDGE_RETURN_CATEGORY)
                        registerReceiver(
                            dataWedgeBroadcastReceiver,
                            intentFilter,
                        )
                        createDataWedgeProfile()
                    }

                    override fun onCancel(arguments: Any?) {
                        unregisterReceiver(dataWedgeBroadcastReceiver)
                        dataWedgeBroadcastReceiver = null
                    }
                }
            )
        }
    }

    private fun createDataWedgeBroadcastReceiver(events: EventChannel.EventSink?): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                if (intent.action.equals(DataWedgeConfig.PROFILE_INTENT_ACTION)) {
                    val data =
                        intent.getStringExtra(DataWedgeInterface.DATA_WEDGE_SCAN_EXTRA_DATA_STRING)
                    val symbology =
                        intent.getStringExtra(DataWedgeInterface.DATA_WEDGE_SCAN_EXTRA_LABEL_TYPE)
                    val date = Calendar.getInstance().time
                    val dateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US)
                    val dateTimeString = dateFormat.format(date)
                    val scannedData = ScannedData(data, symbology, dateTimeString)
                    events?.success(scannedData.toJson())
                }
            }
        }
    }


    override fun onDestroy() {
        dataWedgeBroadcastReceiver?.let { receiver ->
            unregisterReceiver(receiver)
        }
        super.onDestroy()
    }


    private fun createDataWedgeProfile() {
        dataWedgeInterface.sendCommandString(
            this,
            DataWedgeInterface.DATA_WEDGE_SEND_CREATE_PROFILE,
            DataWedgeConfig.PROFILE_NAME
        )

        val barcodeConfig = DataWedgeConfig.getBarcodeConfig()
        val appConfig = DataWedgeConfig.getAppConfig(packageName)
        val intentConfig = DataWedgeConfig.getIntentConfig()

        val profileConfig = Bundle()
        profileConfig.putString(DataWedgeConfig.PROFILE_NAME_KEY, DataWedgeConfig.PROFILE_NAME)
        profileConfig.putString(DataWedgeConfig.PROFILE_ENABLED, DataWedgeConfig.TRUE_STRING)
        profileConfig.putString(DataWedgeConfig.CONFIG_MODE_KEY, DataWedgeConfig.CONFIG_MODE)
        profileConfig.putBundle(DataWedgeConfig.PLUGIN_CONFIG, barcodeConfig)
        profileConfig.putParcelableArray(DataWedgeConfig.APP_LIST, arrayOf(appConfig))

        dataWedgeInterface.sendCommandBundle(
            this,
            DataWedgeInterface.DATA_WEDGE_SEND_SET_CONFIG,
            profileConfig
        )

        Log.d("MainActivity", "Barcode config setup")

        profileConfig.remove(DataWedgeConfig.PLUGIN_CONFIG)
        profileConfig.putBundle(DataWedgeConfig.PLUGIN_CONFIG, intentConfig)

        dataWedgeInterface.sendCommandBundle(
            this,
            DataWedgeInterface.DATA_WEDGE_SEND_SET_CONFIG,
            profileConfig
        )

        Log.d("MainActivity", "Intent config setup")
    }
}
