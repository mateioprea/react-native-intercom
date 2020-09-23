const fs = require('fs');
const path = require('./path');
const { errorn, logn, infon, warnn, debugn } = require('./log');
const {argv} = require('yargs');
const disableNotificationLink = argv.disableNotificationLink || false;

class AppDelegateLinker {
  constructor() {
    this.appDelegatePath = path.appDelegate;
    this.dependenciesImported = false;
    this.applePushNotificationsImported = false;
    this.didRegisterForRemoteNotificationsWithDeviceToken = false;
  }

  link() {
    if (!this.appDelegatePath) {
      errorn(
        'AppDelegate not found! Does the file exist in the correct folder?\n'
      );
      return;
    }

    logn('Linking AppDelegate...');

    var appDelegateContents = fs.readFileSync(this.appDelegatePath, 'utf8');

    appDelegateContents = this.importDependencies(appDelegateContents);

    if (this.dependenciesImported) {
      fs.writeFileSync(this.appDelegatePath, appDelegateContents);
    }

    appDelegateContents = this.importRegisterMethod(appDelegateContents);

    if (this.didRegisterForRemoteNotificationsWithDeviceToken) {
      fs.writeFileSync(this.appDelegatePath, appDelegateContents);
    }

    appDelegateContents = this.importApplePushNotificationsMethods(
      appDelegateContents
    );

    if (this.applePushNotificationsImported) {
      fs.writeFileSync(this.appDelegatePath, appDelegateContents);
    }

    if (this.dependenciesImported) {
      infon('AppDelegate linked successfully!\n');
    } else {
      warnn(
        'AppDelegate was partially linked, please check the details above and proceed with the manual installation documentation to complete the linking process.!\n'
      );
    }
  }

  importDependencies(content) {
    if (!this.doesImportDependencies(content)) {
      debugn('Importing Intercom');
      this.dependenciesImported = true;
      return content.replace(
        /#import\s+"AppDelegate.h"/,
        '#import "AppDelegate.h"\n@import Intercom;\n@import UserNotifications;'
      );
    }

    warnn('   AppDelegate already imports Intercom.h');
    return content;
  }

  doesImportDependencies(content) {
    return /@import\s+Intercom/.test(content);
  }

  importRegisterMethod(content) {
    if (!this.doesImportRegisterNotification(content)) {
      this.didRegisterForRemoteNotificationsWithDeviceToken = true;
      return content.replace(
        /@end/,
        '- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {\n' +
        '    [Intercom setDeviceToken:deviceToken];\n' +
        '}\n@end'
      )
    }

    warnn('AppDelegate already imports didRegisterForRemoteNotificationsWithDeviceToken');
    return content;

  }

  importApplePushNotificationsMethods(content) {
    if (!this.doesImportApplePushNotificationsMethods(content) && !disableNotificationLink) {
      this.applePushNotificationsImported = true;
      return content.replace(
        /@end/,
        '- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {\n' +
        '    if ([Intercom isIntercomPushNotification:userInfo]) {\n' +
        '        [Intercom handleIntercomPushNotification:userInfo];\n' +
        '    }\n' +
        '    completionHandler(UIBackgroundFetchResultNoData);\n' +
        '}\n@end'
      );
    }
    warnn('AppDelegate already imports didReceiveRemoteNotification');
    return content;
  }

  doesImportRegisterNotification(content) {
    return /didRegisterForRemoteNotificationsWithDeviceToken/.test(content);
  }

  doesImportApplePushNotificationsMethods(content) {
    return /didReceiveRemoteNotification/.test(content);
  }
}

module.exports = AppDelegateLinker;
