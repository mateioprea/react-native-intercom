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

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
