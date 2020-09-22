import { NativeModules } from 'react-native';

type IntercomType = {
  setApiKey(apiKey: string, appId: string): Promise<any>;
  registerUser(email: string): Promise<any>;
  logout(): Promise<any>;
  setLauncherVisible(visible: boolean): Promise<any>;
  presentMessenger(): Promise<any>;
  registerForPushNotifications(): Promise<any>;
  setUserAttributes(user: any): void;
};

const { RNNIntercom } = NativeModules;
export default RNNIntercom as IntercomType;
