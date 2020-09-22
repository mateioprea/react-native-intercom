package com.reactnativeintercom.options

import com.facebook.react.bridge.ReadableMap
import io.intercom.android.sdk.Company
import org.json.JSONObject

class UserCompany constructor(options: ReadableMap) {

  var name: String? = null
  var companyId: String? = null

  init {
    name = options.getString("name")
    companyId = options.getString("companyId")
  }

  fun build(): Company {
    val company: Company.Builder = Company.Builder()
      .withName(name)
      .withCompanyId(companyId)

    return company.build()
  }
}
