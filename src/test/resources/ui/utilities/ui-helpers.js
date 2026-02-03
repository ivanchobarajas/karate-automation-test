function uiHelpers() {
  return {
    open: function(url) {
      driver(url);
    },
    waitForVisible: function(selector) {
      waitFor(selector);
    }
  };
}
