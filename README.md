<h1 align="center">
  React Native Intercom Native
</h1>

<p align="center">
  <a href="https://www.npmjs.com/package/react-native-intercom-native"><img src="https://img.shields.io/npm/dw/react-native-intercom-native.svg?style=flat-square" alt="NPM downloads"></a>
  <a href="https://www.npmjs.com/package/react-native-intercom-native"><img src="https://img.shields.io/npm/v/react-native-intercom-native/latest.svg?style=flat-square" alt="NPM latest version"></a>
</p>

Intercom implementation for react native

## Installation


### Automatic install
```sh
npm install react-native-intercom-native
```

```sh
npx intercom-link
```

If you don't want Intercom Push Notifications, you should run `npx intercom` along with the `--disable-notification-link` parameter.



### Manual Installation

```sh
npm install react-native-intercom-native
```

You should be set up!

## Usage

```js
import Intercom from "react-native-intercom-native";

Intercom.setApiKey(
	Platform.OS === 'android'
		? 'your_intercom_android_api_key'
		: 'your_intercom_ios_api_key',
	'your_app_id'
);

//TODO
```

## Documentation

Check the [available APIs](docs/API.md).


## Push Notifications

For configuring push notifications you should follow these steps:

### iOS

On iOS you should only follow steps 1, 2, 3 and 4 from Intercom documentation that's available [here](https://developers.intercom.com/installing-intercom/docs/ios-push-notifications)
This plugin already does the extra steps that are necessary to handle push notifications, so you should be good to go.

### Android

On iOS you should follow steps 1, 3 and 4 (yes, without step 2) from Intercom documentation that's available [here](https://developers.intercom.com/installing-intercom/docs/android-fcm-push-notifications)
After you generated the google-services.json file just place it in 'your_react_native_project_root/android/app/' folder. This is it. You're done.


## Hooks

//TODO

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
