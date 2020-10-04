# Available APIs

This API follows Intercom naming convention and methods. You should check out their documentation [here](https://developers.intercom.com/installing-intercom/docs).

Since this lib is still under development, some of the API methods are not available yet.

### Intercom Methods

* `(iOS/Android) Intercom.setApiKey(apiKey: string, appId: string): Promise<any>`

    Initialize and register your application with Intercom.

* `**Deprecated** (iOS/Android) Intercom.registerUser(email: string): Promise<any>`

    **Deprecated**. Use registerUserWithIdentifier()

    Register your user to Intercom so you can talk to them.

* `(iOS/Android) Intercom.registerUserWithIdentifier(email?: string, userId?: string): Promise<any>`

    Register users using either an email, userId or both.

    If you send both email and user_id values in your integration, you need to calculate the HMAC on the user_id value.


* `(iOS/Android) Intercom.registerUnidentifiedUser(): Promise<any>`

    Register a user that's not yet logged in / signed up.

* `(iOS/Android) Intercom.setUserHash(userHash: string): Promise<any>`

    Send user hash to Intercom.

* `(iOS/Android) Intercom.setLauncherVisible(visible: boolean): Promise<any>`

    Shows or hide the standard launcher at the bottom right-hand side of the screen.

* `(iOS/Android) Intercom.presentMessenger(): Promise<any>`

    Opens the Intercom messenger from another location in your mobile app. This method allows you to specify a button that will open the Intercom messenger.

    ```js
      <TouchableOpacity
        onPress={() => Intercom.presentMessenger()}
      >
        <Text>Help and Support</Text>
      </TouchableOpacity>
    ```

* `(iOS/Android) Intercom.hideMessenger(): Promise<any>`

    Hides the Intercom messenger programatically.

* `(iOS/Android) Intercom.presentMessageComposer(): Promise<any>`

    Present the message composer.

* `(iOS/Android) Intercom.presentHelpCenter(): Promise<any>`

    Present the help center.

* `(iOS/Android) Intercom.setInAppMessagesVisible(visible: boolean): Promise<any>`

    Use this to hide all incoming Intercom messages and message previews in the parts of your app where you do not wish to interrupt users, for example Camera views, parts of a game or other scenarios.

* `(iOS/Android) Intercom.getUnreadConversationCount(): Promise<any>`

    Returns the unread conversations in the promise resolver.

* `(iOS/Android) Intercom.setUserAttributes(user: UserAttributes): Promise<any>`

    Sets attributes for the registered user. Check [UserAttributes](UserAttributes.md).


* `(iOS/Android) Intercom.logEvent(name: String, metaData?: object): Promise<any>`

    Metadata Objects support a few simple types that Intercom can present on your behalf, see the
     [Intercom API docs](https://developers.intercom.com/reference/#event-metadata-types )


 * `(Android) Intercom.handlePushMessage(): Promise<any>`

    Opens Intercom conversations from FCM.

* `(iOS/Android) Intercom.registerForPushNotifications(): Promise<any>`

    Presents the Push notifications dialog from iOS. If the user denied access, the Promise will be rejected.

    ```js
      await Intercom.registerForPushNotifications()
                    .catch(err => {
                        //user denied push notifications
                    })
    ```

* `(iOS/Android) Intercom.logout(): Promise<any>`

    Logout users from Intercom. You should call this method when you logout users from your application.



