const webpack = require('webpack');
const path = require('path');

const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: {
    bundle: './source/javascripts/all.js',
    style: './source/stylesheets/all.css.scss'
  },

  resolve: {
    modules: [
      path.join(__dirname, 'source/javascripts'),
      path.join(__dirname, "source/stylesheets"),
      "node_modules"
    ],
    extensions: ['.js', '.scss']
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'javascripts/[name].js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: [
            {
              loader: 'css-loader',
              options: {
                sourceMap: true
              }
            }, {
              loader: 'sass-loader',
              options: {
                sourceMap: true,
                includePaths: [
                  path.join(__dirname, 'node_modules')
                ]
              }
            }
          ]
        })
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin('stylesheets/style.css')
  ]
};
