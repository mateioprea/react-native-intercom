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
    
    @objc(registerUserWithIdentifier:userId:resolver:rejecter:)
    func registerUserWithIdentifier(email: String?, userId: String?, resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
        if (userId != nil && email != nil) {
            Intercom.registerUser(withUserId: userId!, email: email!)
            resolve(nil)
            return;
        } else if (userId != nil && email == nil) {
            Intercom.registerUser(withUserId: userId!)
            resolve(nil)
            return;
        } else if (userId == nil && email != nil) {
            Intercom.registerUser(withEmail: email!)
            resolve(nil)
            return;
        }
    }
    
    @objc(registerUnidentifiedUser:rejecter:)
    func registerUnidentifiedUser(resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
        Intercom.registerUnidentifiedUser()
        resolve(nil)
    }
    
    @objc(setUserHash:resolver:rejecter:)
    func setUserHash(userHash: String, resolver resolve:RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
        Intercom.setUserHash(userHash)
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
    
    @objc(presentMessageComposer:resolver:rejecter:)
    func presentMessageComposer(initialMessage: String?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
        Intercom.presentMessageComposer(initialMessage)
        resolve(nil)
    }
    
    @objc(presentHelpCenter:rejecter:)
    func presentHelpCenter(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
        Intercom.presentHelpCenter()
        resolve(nil)
    }
    
    @objc(setInAppMessagesVisible:resolver:rejecter:)
    func setInAppMessagesVisible(visible: Bool, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
        Intercom.setInAppMessagesVisible(visible)
        resolve(nil)
    }
    
    //TODO make this an event listener in the future
    @objc(getUnreadConversationCount:rejecter:)
    func getUnreadConversationCount(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        let unreadConversationCount = Intercom.unreadConversationCount()
        resolve(unreadConversationCount)
    }
    
    @objc(setUserAttributes:resolver:rejecter:)
    func setUserAttributes(userAttributes: NSDictionary, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        Intercom.updateUser(UserAttributes.init(data: userAttributes))
        resolve(nil)
    }
    
    @objc(logEvent:metaData:resolver:rejecter:)
    func logEvent(name: String, metaData: NSDictionary?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        if (metaData != nil) {
            Intercom.logEvent(withName: name, metaData: metaData as! [AnyHashable : Any])
            resolve(nil)
        } else {
            Intercom.logEvent(withName: name)
            resolve(nil)
        }
        
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
    
    @objc(logout:rejecter:)
    func logout(resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        Intercom.logout()
        resolve(nil)
    }
}
