gulp = require("gulp")
gutil = require("gulp-util")
webpack = require("webpack")
WebpackDevServer = require("webpack-dev-server")
webpackConfig = require("./webpack.config.js")

# The development server
gulp.task "default", ["webpack-dev-server"]

# Production build
gulp.task "build", ["webpack:build"]

gulp.task "webpack:build", (callback) ->
  # modify some webpack config options
  myConfig = Object.create(webpackConfig)
  myConfig.plugins = myConfig.plugins.concat(
    new webpack.DefinePlugin(
      "process.env":
        "NODE_ENV": JSON.stringify("production")
    ),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin()
  )

  # run webpack
  webpack myConfig, (err, stats) ->
    if err then throw new gutil.PluginError("webpack:build", err)
    gutil.log "[webpack:build]", stats.toString(colors: true)
    callback()

# modify some webpack config options
myDevConfig = Object.create(webpackConfig)
myDevConfig.devtool = "sourcemap"
myDevConfig.debug = true

# create a single instance of the compiler to allow caching
devCompiler = webpack(myDevConfig)

gulp.task "webpack:build-dev", (callback) ->
  # run webpack
  devCompiler.run (err, stats) ->
    if err then throw new gutil.PluginError("webpack:build-dev", err)
    gutil.log "[webpack:build-dev]", stats.toString(colors: true)
    callback()

gulp.task "webpack-dev-server", (callback) ->
  # modify some webpack config options
  myConfig = Object.create(webpackConfig)
  myConfig.devtool = "eval"
  myConfig.debug = true

  # Start a webpack-dev-server
  new WebpackDevServer webpack(myConfig),
    contentBase: "./src"
    publicPath: "/assets"
    noInfo: false
    quiet: false
    stats:
      colors: true
  .listen 8080, "localhost", (err) ->
    if err then throw new gutil.PluginError("webpack-dev-server", err)
    gutil.log "[webpack-dev-server]", "http:#localhost:8080/webpack-dev-server/index.html"