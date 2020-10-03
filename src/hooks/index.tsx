import { NativeModules } from 'react-native';
import type { Intercom } from '../types/Intercom';

let RNNIntercom: Intercom;
({ RNNIntercom } = NativeModules);

export default function useIntercom() {
  const setApiKey = (apiKey: string, appId: string): Promise<any> => {
    return RNNIntercom.setApiKey(apiKey, appId);
  };

  return {
    setApiKey,
  };
}
