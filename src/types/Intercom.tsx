import type { UserAttributes } from './UserAttributes';

export type Intercom = {
  setApiKey(apiKey: string, appId: string): Promise<any>;
  registerUser(email: string): Promise<any>;
  logout(): Promise<any>;
  setLauncherVisible(visible: boolean): Promise<any>;
  presentMessenger(): Promise<any>;
  registerForPushNotifications(): Promise<any>;
  setUserAttributes(user: UserAttributes): void;
};
