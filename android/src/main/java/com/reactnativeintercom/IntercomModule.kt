package com.reactnativeintercom

import android.app.Application
import com.facebook.react.bridge.*
import com.reactnativeintercom.options.UserAttributes
import io.intercom.android.sdk.Intercom
import io.intercom.android.sdk.identity.Registration
import org.json.JSONObject

class RNNIntercomModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RNNIntercom"
    }

    @ReactMethod
    fun setApiKey(apiKey: String, appId: String, promise: Promise) {
      val app: Application = reactApplicationContext.getApplicationContext() as Application
      Intercom.initialize(app, apiKey, appId)
      promise.resolve(null)
    }

    @ReactMethod
    fun registerUser(email: String, promise: Promise) {
      Intercom.client().registerIdentifiedUser(Registration.create().withEmail(email))
      promise.resolve(null)
    }

    @ReactMethod
    fun logout(promise: Promise) {
      Intercom.client().logout()
      promise.resolve(null)
    }

    @ReactMethod
    fun setLauncherVisible(visible: Boolean, promise: Promise) {
      if (visible)
        Intercom.client().setLauncherVisibility(Intercom.Visibility.GONE)
      else
        Intercom.client().setLauncherVisibility(Intercom.Visibility.VISIBLE)
      promise.resolve(null)
    }

    @ReactMethod
    fun presentMessenger(promise: Promise) {
      Intercom.client().displayMessenger()
      promise.resolve(null)
    }

    @ReactMethod
    fun registerForPushNotifications(promise: Promise) {

    }

    @ReactMethod
    fun setUserAttributes(options: ReadableMap) {
      val userAttributes: UserAttributes = UserAttributes(options)
      Intercom.client().updateUser(userAttributes.buildAttributes())
    }

    @ReactMethod
    fun handlePushMessage(promise: Promise) {
      Intercom.client().handlePushMessage();
    }


}
