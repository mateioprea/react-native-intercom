import * as React from 'react';
import {
  StyleSheet,
  View,
  Text,
  TouchableOpacity,
  Platform,
} from 'react-native';
import Intercom from 'react-native-intercom';
import { useState } from 'react';

export default function App() {
  const [isLauncherVisible, setIsLauncherVisible] = useState(false);

  React.useEffect(() => {
    async function initIntercom() {
      await Intercom.setApiKey(
        Platform.OS === 'android' ? 'android_api_key' : 'ios_api_key',
        'app_id'
      );
      await Intercom.registerUser('');
      setIsLauncherVisible(true);

      //Intercom.setUserAttributes({});
    }
    initIntercom();
  }, []);

  React.useEffect(() => {
    console.log(isLauncherVisible);
    Intercom.setLauncherVisible(isLauncherVisible);
  }, [isLauncherVisible]);

  return (
    <View style={styles.container}>
      <TouchableOpacity
        onPress={() => setIsLauncherVisible(!isLauncherVisible)}
      >
        <Text>Trigger Visibility</Text>
      </TouchableOpacity>
      <TouchableOpacity
        onPress={() => {
          Intercom.registerForPushNotifications();
        }}
      >
        <Text>Register for push notifications</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
