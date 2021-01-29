package com.reactnativeintercom

import android.app.Application
import com.facebook.react.bridge.*
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.iid.FirebaseInstanceId
import com.reactnativeintercom.options.UserAttributes
import io.intercom.android.sdk.Intercom
import io.intercom.android.sdk.identity.Registration
import io.intercom.android.sdk.push.IntercomPushClient
import io.intercom.android.sdk.UserAttributes as IntercomUserAttributes

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
    fun registerUserWithIdentifier(email: String?, userId: String?, promise: Promise) {
      val attributes: IntercomUserAttributes = io.intercom.android.sdk.UserAttributes.Builder()
        .withUserId(userId)
        .withEmail(email)
        .build()
      Intercom.client().registerIdentifiedUser(Registration.create().withUserAttributes(attributes))
      promise.resolve(null)
    }

    @ReactMethod
    fun registerUnidentifiedUser(promise: Promise) {
      Intercom.client().registerUnidentifiedUser()
      promise.resolve(null)
    }

    @ReactMethod
    fun setUserHash(userHash: String?, promise: Promise) {
      Intercom.client().setUserHash(userHash)
      promise.resolve(null)
    }

    @ReactMethod
    fun setLauncherVisible(visible: Boolean, promise: Promise) {
      if (visible)
        Intercom.client().setLauncherVisibility(Intercom.Visibility.VISIBLE)
      else
        Intercom.client().setLauncherVisibility(Intercom.Visibility.GONE)
      promise.resolve(null)
    }

    @ReactMethod
    fun presentMessenger(promise: Promise) {
      Intercom.client().displayMessenger()
      promise.resolve(null)
    }

    @ReactMethod
    fun hideMessenger(promise: Promise) {
      Intercom.client().hideMessenger()
      promise.resolve(null)
    }

    @ReactMethod
    fun presentMessageComposer(initialMessage: String?, promise: Promise) {
      Intercom.client().displayMessageComposer(initialMessage)
      promise.resolve(null)
    }

    @ReactMethod
    fun presentHelpCenter(promise: Promise) {
      Intercom.client().displayHelpCenter()
      promise.resolve(null)
    }

    @ReactMethod
    fun setInAppMessagesVisible(visible: Boolean, promise: Promise) {
      if (visible)
        Intercom.client().setInAppMessageVisibility(Intercom.Visibility.VISIBLE)
      else
        Intercom.client().setInAppMessageVisibility(Intercom.Visibility.GONE)

      promise.resolve(null)
    }

    @ReactMethod
    fun getUnreadConversationCount(promise: Promise) {
      val unreadConversationCount = Intercom.client().unreadConversationCount
      promise.resolve(unreadConversationCount)
    }

    @ReactMethod
    fun setUserAttributes(options: ReadableMap, promise: Promise) {
      val userAttributes: UserAttributes = UserAttributes(options)
      Intercom.client().updateUser(userAttributes.buildAttributes())
      promise.resolve(null)
    }

    @ReactMethod
    fun logEvent(name: String, metaData: ReadableMap?, promise: Promise) {
      if (metaData != null) {
        Intercom.client().logEvent(name, metaData.toHashMap())
      } else {
        Intercom.client().logEvent(name)
      }
      promise.resolve(null)
    }

    @ReactMethod
    fun handlePushMessage(promise: Promise) {
      Intercom.client().handlePushMessage();
      promise.resolve(null)
    }

    @ReactMethod
    fun registerForPushNotifications(promise: Promise) {
      val options = FirebaseOptions.fromResource(reactApplicationContext.applicationContext)
      val intercomPushClient = IntercomPushClient()
      if (options != null) {
        FirebaseApp.initializeApp(reactApplicationContext.applicationContext)
      };

      if (FirebaseApp.getApps(reactApplicationContext.applicationContext).isEmpty()) {
        promise.reject("");
      } else {
        FirebaseInstanceId.getInstance().instanceId.addOnSuccessListener { instanceIdResult ->
          val token = instanceIdResult.token
          intercomPushClient.sendTokenToIntercom(reactApplicationContext.applicationContext as Application, token);
          promise.resolve(null);
        }
      }
    }

    @ReactMethod
    fun logout(promise: Promise) {
      Intercom.client().logout()
      promise.resolve(null)
    }


}
