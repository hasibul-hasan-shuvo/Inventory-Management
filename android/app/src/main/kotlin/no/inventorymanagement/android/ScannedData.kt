package no.inventorymanagement.android

import org.json.JSONObject;

data class ScannedData(
    val data: String,
    val symbology: String,
    val dateTime: String,
) {
    fun toJson(): String {
        return JSONObject(
            mapOf(
                "data" to data,
                "symbology" to symbology,
                "date_time" to dateTime
            )
        ).toString();
    }
}