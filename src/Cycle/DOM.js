var makeDOMDriver = require('@cycle/dom').makeDOMDriver;

exports._makeDOMDriver = function (container) {
  var driver = makeDOMDriver(container);
  return function (vnodes) {
    return function () {
      return driver(vnodes);
    }
  }
};