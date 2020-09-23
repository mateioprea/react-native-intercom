# react-native-intercom

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
