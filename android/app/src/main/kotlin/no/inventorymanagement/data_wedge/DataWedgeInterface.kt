package no.inventorymanagement.data_wedge

import android.content.Context
import android.content.Intent
import android.os.Bundle

class DataWedgeInterface {
    companion object {
        const val DATA_WEDGE_SEND_ACTION = "com.symbol.datawedge.api.ACTION"
        const val DATA_WEDGE_RETURN_ACTION = "com.symbol.datawedge.api.RESULT_ACTION"
        const val DATA_WEDGE_RETURN_CATEGORY = "android.intent.category.DEFAULT"
        const val DATA_WEDGE_EXTRA_SEND_RESULT = "SEND_RESULT"
        const val DATA_WEDGE_SCAN_EXTRA_DATA_STRING = "com.symbol.datawedge.data_string"
        const val DATA_WEDGE_SCAN_EXTRA_LABEL_TYPE = "com.symbol.datawedge.label_type"
        const val DATA_WEDGE_SEND_CREATE_PROFILE = "com.symbol.datawedge.api.CREATE_PROFILE"
        const val DATA_WEDGE_SEND_SET_CONFIG = "com.symbol.datawedge.api.SET_CONFIG"
    }

    fun sendCommandString(
        context: Context,
        command: String,
        parameter: String,
        sendResult: Boolean = false
    ) {
        val dataWedgeIntent = Intent()
        dataWedgeIntent.action = DATA_WEDGE_SEND_ACTION
        dataWedgeIntent.putExtra(command, parameter)
        if (sendResult)
            dataWedgeIntent.putExtra(DATA_WEDGE_EXTRA_SEND_RESULT, "true")
        context.sendBroadcast(dataWedgeIntent)
    }

    fun sendCommandBundle(context: Context, command: String, parameter: Bundle) {
        val dataWedgeIntent = Intent()
        dataWedgeIntent.action = DATA_WEDGE_SEND_ACTION
        dataWedgeIntent.putExtra(command, parameter)
        context.sendBroadcast(dataWedgeIntent)
    }
}