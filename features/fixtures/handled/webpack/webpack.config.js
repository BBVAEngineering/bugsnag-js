const path = require('path')

module.exports = {
  entry: { a: './src/a.js', b: './src/b.js' },
  mode: 'production',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js'
  }
}
