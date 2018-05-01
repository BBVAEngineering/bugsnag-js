var PORT = window.location.search.match(/PORT=(\d+)/)[1]

module.exports = {
  apiKey: 'ABC',
  endpoint: 'http://localhost:' + PORT
}
