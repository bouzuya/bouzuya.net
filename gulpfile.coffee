bHtml = require 'gulp-b-html'
browserSync = require 'browser-sync'
del = require 'del'
gulp = require 'gulp'
gutil = require 'gulp-util'
less = require 'gulp-less'
run = require 'run-sequence'
watch = require 'gulp-watch'

ignoreError = (stream) ->
  stream.on 'error', (e) ->
    gutil.log e
    @emit 'end'

gulp.task 'build', ['less'], ->
  gulp.src './src/*.bhtml'
  .pipe bHtml()
  .pipe gulp.dest './public/'

gulp.task 'clean', (done) ->
  del [
    './public/styles/*.css'
  ], done
  null

gulp.task 'default', (done) ->
  run.apply run, [
    'clean'
    'build'
    done
  ]
  null

gulp.task 'build:less', ->
  gulp.src './public/styles/*.less'
  .pipe less()
  .pipe gulp.dest './public/styles/'

gulp.task 'watch', ['build'], ->
  browserSync
    server:
      baseDir: './public'
  watch [
    './public/styles/*.less'
    './public/*.bhtml'
  ], ->
    run.apply run, [
      'build'
      ->
        browserSync.reload()
    ]
