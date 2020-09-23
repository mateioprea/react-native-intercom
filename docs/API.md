# Available APIs

This API follows Intercom naming convention and methods. You should check out their documentation [here](https://developers.intercom.com/installing-intercom/docs).

Since this lib is still under development, some of the API methods are not available yet.

### Intercom Methods

* `(iOS/Android) Intercom.setApiKey(apiKey: string, appId: string): Promise<any>`

    Initialize and register your application with Intercom.

* `(iOS/Android) Intercom.registerUser(email: string): Promise<any>`

    Register your user to Intercom so you can talk to them.

* `(iOS/Android) Intercom.logout(): Promise<any>`

    Logout users from Intercom. You should call this method when you logout users from your application.

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

* `(iOS) Intercom.registerForPushNotifications(): Promise<any>`

    Presents the Push notifications dialog from iOS. If the user denied access, the Promise will be rejected.

    ```js
      await Intercom.registerForPushNotifications()
                    .catch(err => {
                        //user denied push notifications
                    })
    ```

* `(iOS/Android) Intercom.setUserAttributes(user: UserAttributes): Promise<any>`

    Sets attributes for the registered user. Check [UserAttributes](UserAttributes.md).




