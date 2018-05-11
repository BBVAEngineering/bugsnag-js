var bugsnag = require('bugsnag-js')
var config = require('./lib/config')

var bugsnagClient = bugsnag(config)

go()
  .then(function () {})
  .catch(function (e) {
    bugsnagClient.notify(e, {
      beforeSend: function () {
        setTimeout(function () {
          document.getElementById('bugsnag-test-state').innerText = 'DONE'
        }, 5000)
      }
    })
  })

function go() {
  return Promise.reject(new Error('bad things'))
}
