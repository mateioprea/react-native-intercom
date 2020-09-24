// @ts-check
var { infon } = require('./log')
var GradleLinker = require('./gradleLinker');
var AppGradleLinker = require('./appGradleLinker');

module.exports = () => {
  infon('\nRunning Android postlink script.\n')
  new GradleLinker().link();
  new AppGradleLinker().link();
}
