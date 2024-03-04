package no.inventorymanagement.android

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

class MainActivity : FlutterActivity() {

    private val SCAN_CHANNEL = "inventorymanagement.no/scan"
    private val PROFILE_INTENT_ACTION = "inventorymanagement.no.SCAN"

    private var dataWedgeBroadcastReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
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
                        intentFilter.addAction(PROFILE_INTENT_ACTION)
                        intentFilter.addAction(DataWedgeInterface.DATA_WEDGE_RETURN_ACTION)
                        intentFilter.addCategory(DataWedgeInterface.DATA_WEDGE_RETURN_CATEGORY)
                        registerReceiver(
                            dataWedgeBroadcastReceiver,
                            intentFilter,
                        )
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
                if (intent.action.equals(PROFILE_INTENT_ACTION)) {
                    val data =
                        intent.getStringExtra(DataWedgeInterface.DATA_WEDGE_SCAN_EXTRA_DATA_STRING)
                    val symbology =
                        intent.getStringExtra(DataWedgeInterface.DATA_WEDGE_SCAN_EXTRA_LABEL_TYPE)
                    val date = Calendar.getInstance().time
                    val dateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US)
                    val dateTimeString = dateFormat.format(date)
                    if (data != null && symbology != null) {
                        val scannedData = ScannedData(data, symbology, dateTimeString)
                        events?.success(scannedData.toJson())
                    }
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
}
