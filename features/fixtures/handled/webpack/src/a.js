import bugsnag from 'bugsnag-js'
import config from './lib/config'

var bugsnagClient = bugsnag(config)

bugsnagClient.notify(new Error('bad things'), {
  beforeSend: function () {
    setTimeout(function () {
      document.getElementById('bugsnag-test-state').innerText = 'DONE'
    }, 5000)
  }
})
