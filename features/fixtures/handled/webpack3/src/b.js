var bugsnag = require('bugsnag-js')
var config = require('./lib/config')

var bugsnagClient = bugsnag(config)

try {
  foo.bar()
} catch (e) {
  bugsnagClient.notify(e, {
    beforeSend: function () {
      setTimeout(function () {
        document.getElementById('bugsnag-test-state').innerText = 'DONE'
      }, 5000)
    }
  })
}
