const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

// About this magic, GoRails says:
// Bootstrap needs this because it refers to $, jQuery, and Popper (?)
environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment
