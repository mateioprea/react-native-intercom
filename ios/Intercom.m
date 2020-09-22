#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNNIntercom, NSObject)

RCT_EXTERN_METHOD(setApiKey:(nonnull NSString *)apiKey appId:(nonnull NSString *)appId resolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(registerUser:(nonnull NSString *)email resolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(setLauncherVisible:(BOOL)email resolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(presentMessenger: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(registerForPushNotifications: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(logout: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(setUserAttributes: (NSDictionary) userAttributes)

@end
