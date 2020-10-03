import type { UserAttributes } from './UserAttributes';

export type Intercom = {
  setApiKey(apiKey: string, appId: string): Promise<any>;
  registerUser(email: string): Promise<any>;
  registerUserWithIdentifier(email?: string, userId?: string): Promise<any>;
  registerUnidentifiedUser(): Promise<any>;
  setUserHash(userHash: string): Promise<any>;
  setLauncherVisible(visible: boolean): Promise<any>;
  presentMessenger(): Promise<any>;
  hideMessenger(): Promise<any>;
  presentMessageComposer(initialMessage?: string): Promise<any>;
  presentHelpCenter(): Promise<any>;
  setInAppMessagesVisible(visible: boolean): Promise<any>;
  getUnreadConversationCount(): Promise<any>;
  setUserAttributes(user: UserAttributes): void;
  logEvent(name: string, userAttributes?: object): Promise<any>;
  handlePushMessage(): Promise<any>;
  registerForPushNotifications(): Promise<any>;
  logout(): Promise<any>;
};
