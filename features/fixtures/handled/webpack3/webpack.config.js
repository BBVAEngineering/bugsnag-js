const path = require('path')
const webpack = require('webpack')

module.exports = {
  entry: { a: './src/a.js', b: './src/b.js' },
  devtool: 'sourcemap',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js'
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({ compress: true, mangle: false })
  ]
}
