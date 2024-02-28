package no.inventorymanagement.android

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "inventorymanagement.no/zebra-scanner"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            call.method?.let { method ->
//                val uuid: String? = call.argument("uuid")
//                val apiPublicKey: String? = call.argument("apiPublicKey")
//                val mKey: String? = call.argument("mKey")
//
//                if (!uuid.isNullOrEmpty() && !apiPublicKey.isNullOrEmpty()) {
//                    try {
//                        val claySDK: IClaySDK? = ClaySDK.init(this, apiPublicKey, uuid)
//                        if (method == "get_public_key") {
//                            result.success(claySDK?.publicKey)
//                        } else if (method == "open_door") {
//                            mKey?.let { key ->
//                                openDoor(claySDK, key, result)
//                            }
//                        }
//                    } catch (e: ClayException) {
//                        result.error(e.errorCode.toString(), e.message, "Clay SDK init Exception")
//                    }
//
//                }
            }
        }
    }
}
