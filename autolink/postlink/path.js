var glob = require('glob');
var ignoreFolders = { ignore: ['node_modules/**', '**/build/**'] };

exports.appDelegate = glob.sync('**/AppDelegate.m', ignoreFolders)[0];
