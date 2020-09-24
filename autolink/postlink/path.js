var glob = require('glob');
var ignoreFolders = { ignore: ['node_modules/**', '**/build/**'] };

exports.appDelegate = glob.sync('**/AppDelegate.m', ignoreFolders)[0];

var mainApplicationJava = glob.sync("**/MainApplication.java", ignoreFolders)[0];
exports.mainApplicationJava = mainApplicationJava;
exports.rootGradle = mainApplicationJava.replace(/android\/app\/.*\.java/, "android/build.gradle");
exports.appRootGradle = mainApplicationJava.replace(/android\/app\/.*\.java/, "android/app/build.gradle");
