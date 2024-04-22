package no.inventorymanagement.android

import android.os.Bundle

object DataWedgeConfig {
    private const val ACTIVITY_LIST = "ACTIVITY_LIST"
    private const val INTENT_ACTION = "intent_action"
    private const val INTENT_DELIVERY = "intent_delivery"
    private const val INTENT_OUTPUT_ENABLED = "intent_output_enabled"
    private const val PACKAGE_NAME = "PACKAGE_NAME"
    private const val PARAM_LIST = "PARAM_LIST"
    private const val PLUGIN_BARCODE = "BARCODE"
    private const val PLUGIN_INTENT = "INTENT"
    private const val PLUGIN_NAME = "PLUGIN_NAME"
    private const val PROFILE_INTENT_BROADCAST = "2"
    private const val RESET_CONFIG = "RESET_CONFIG"

    const val APP_LIST = "APP_LIST"
    const val CONFIG_MODE = "UPDATE"
    const val CONFIG_MODE_KEY = "CONFIG_MODE"
    const val PLUGIN_CONFIG = "PLUGIN_CONFIG"
    const val PROFILE_ENABLED = "PROFILE_ENABLED"
    const val PROFILE_INTENT_ACTION = "inventorymanagement.no.SCAN"
    const val PROFILE_NAME = "DentalInventory"
    const val PROFILE_NAME_KEY = "PROFILE_NAME"
    const val TRUE_STRING = "true"

    fun getBarcodeConfig(): Bundle {
        val barcodeProps = Bundle()

        val barcodeConfig = Bundle()
        barcodeConfig.putString(PLUGIN_NAME, PLUGIN_BARCODE)
        barcodeConfig.putString(
            RESET_CONFIG,
            TRUE_STRING
        )
        barcodeConfig.putBundle(PARAM_LIST, barcodeProps)

        return barcodeConfig
    }

    fun getAppConfig(packageName: String): Bundle {
        val appConfig = Bundle()
        appConfig.putString(
            PACKAGE_NAME,
            packageName
        )
        appConfig.putStringArray(ACTIVITY_LIST, arrayOf("*"))

        return appConfig
    }

    private fun getIntentProps(): Bundle {
        val intentProps = Bundle()
        intentProps.putString(INTENT_OUTPUT_ENABLED, TRUE_STRING)
        intentProps.putString(INTENT_ACTION, PROFILE_INTENT_ACTION)
        intentProps.putString(INTENT_DELIVERY, PROFILE_INTENT_BROADCAST)

        return intentProps
    }

    fun getIntentConfig(): Bundle {
        val intentProps = getIntentProps()

        val intentConfig = Bundle()
        intentConfig.putString(PLUGIN_NAME, PLUGIN_INTENT)
        intentConfig.putString(RESET_CONFIG, TRUE_STRING)
        intentConfig.putBundle(PARAM_LIST, intentProps)

        return intentConfig
    }
}