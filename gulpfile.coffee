bHtml = require 'gulp-b-html'
browserSync = require 'browser-sync'
gulp = require 'gulp'
gutil = require 'gulp-util'
stylus = require 'gulp-stylus'
run = require 'run-sequence'
watch = require 'gulp-watch'

ignoreError = (stream) ->
  stream.on 'error', (e) ->
    gutil.log e
    @emit 'end'

gulp.task 'build', ['build:bhtml', 'build:stylus']

gulp.task 'build:bhtml', ->
  gulp.src './src/*.bhtml'
  .pipe bHtml()
  .pipe gulp.dest './public/'

gulp.task 'build:stylus', ->
  gulp.src './src/styles/*.styl'
  .pipe stylus()
  .pipe gulp.dest './public/styles/'

gulp.task 'watch', ['build'], ->
  browserSync
    server:
      baseDir: './public'
  watch [
    './src/styles/*.styl'
    './src/*.bhtml'
  ], ->
    run.apply run, [
      'build'
      ->
        browserSync.reload()
    ]
