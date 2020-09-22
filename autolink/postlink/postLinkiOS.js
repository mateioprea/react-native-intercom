var AppDelegateLinker = require('./appDelegateLinker');

module.exports = () => {
  new AppDelegateLinker().link();
};
