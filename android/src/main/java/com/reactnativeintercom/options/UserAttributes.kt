package com.reactnativeintercom.options

import com.facebook.react.bridge.ReadableMap
import io.intercom.android.sdk.models.User
import org.json.JSONObject
import io.intercom.android.sdk.UserAttributes as IntercomUserAttributes

class UserAttributes constructor(options: ReadableMap) {

  var name: String? = null
  var email: String? = null
  var companies: ArrayList<UserCompany> = arrayListOf<UserCompany>()

  init {
    name = options.getString("name")
    email = options.getString("email")
    val companiesArray = options.getArray("companies")
    if (companiesArray != null) {
      for (i in 0 until companiesArray.size()) {
        val company = companiesArray.getMap(i)?.let { UserCompany(it) }
        if (company != null) {
          companies.add(company)
        }
      }
    }
  }

  fun buildAttributes(): IntercomUserAttributes {
    val attributes: IntercomUserAttributes.Builder = IntercomUserAttributes.Builder()
      .withName(name)
      .withEmail(email)

    companies.forEach { company ->
      attributes.withCompany(company.build())
    }

    return attributes.build()
  }
}
