var PORT = window.location.search.match(/PORT=(\d+)/)[1]

export default {
  apiKey: 'ABC',
  endpoint: 'http://localhost:' + PORT
}
