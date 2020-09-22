module.exports = {
  dependency: {
    platforms: {
      ios: {},
      android: {},
    },
    assets: [],
    hooks: {
      postlink: 'node node_modules/react-native-intercom/autolink/postlink/run',
    },
  },
  project: {
    ios: {
      project: './example/ios/IntercomExample.xcworkspace',
    },
    android: {},
  },
};
