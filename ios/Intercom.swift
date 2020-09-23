import Foundation
import Intercom
import UserNotifications

@objc(RNNIntercom)
class RNNIntercom: NSObject {

    override init() {
        super.init()
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    @objc(setApiKey:appId:resolver:rejecter:)
    func setApiKey(apiKey: String, appId: String, resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
        Intercom.setApiKey(apiKey, forAppId: appId)
        resolve(nil)
    }
    
    @objc(registerUser:resolver:rejecter:)
    func registerUser(email: String, resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
        Intercom.registerUser(withEmail: email)
        resolve(nil)
    }
    
    @objc(logout:rejecter:)
    func logout(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        Intercom.logout()
        resolve(nil)
    }
    
    @objc(setLauncherVisible:resolver:rejecter:)
    func setLauncherVisible(visible: Bool, resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) {
        Intercom.setLauncherVisible(visible)
        resolve(nil)
    }
    
    @objc(presentMessenger:rejecter:)
    func presentMessenger(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        Intercom.presentMessenger()
        resolve(nil)
    }
    
    @objc(hideMessenger:rejecter:)
    func hideMessenger(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        Intercom.hideMessenger()
        resolve(nil)
    }
    
    @objc(getUnreadConversationCount:rejecter:)
    func getUnreadConversationCount(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        let unreadConversationCount = Intercom.unreadConversationCount()
        resolve(unreadConversationCount)
    }
    
    @objc(setUserAttributes:)
    func setUserAttributes(userAttributes: NSDictionary) {
        Intercom.updateUser(UserAttributes.init(data: userAttributes))
    }
    
    @objc(logEvent:metaData:)
    func logEvent(name: String, metaData: NSDictionary) {
        Intercom.logEvent(withName: name, metaData: metaData as! [AnyHashable : Any])
    }
    
    @objc(handlePushMessage:rejecter:)
    func handlePushMessage(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        //do nothing
        resolve(nil)
    }
    
    /**
     This method registers for Intercom push notifications

     # Notes: #
     You will need to add `didReceiveRemoteNotification` method to your AppDelegate.m

     # Example #
    ```
     - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
         if ([Intercom isIntercomPushNotification:userInfo]) {
             [Intercom handleIntercomPushNotification:userInfo];
         }
         completionHandler(UIBackgroundFetchResultNoData);
     }
     ```
    */
    
    @objc(registerForPushNotifications:rejecter:)
    func registerForPushNotifications(resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let application = UIApplication.shared
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { granted, error in
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
            if (error == nil) {
                resolve(nil)
            } else {
                reject("Error", "User denied push notifications.", nil)
            }
        })
    }
}
