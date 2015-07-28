gulp = require 'gulp'
browserSync = (require 'browser-sync').create()
reload = browserSync.reload
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
stylus = require 'gulp-stylus'
autoprefixer = require 'gulp-autoprefixer'
axis = require 'axis'
rupture = require 'rupture'
grid = require 'happy-grid'
downbeat = require 'downbeat'
lib = require 'stylus-lightning'
ghPages = require 'gulp-gh-pages'
bowerFiles = require 'main-bower-files'

gulp.task 'html', ->
  gulp.src './source/index.jade'
  .pipe jade
    pretty: true
  .pipe gulp.dest './production'

gulp.task 'css', ->
  gulp.src './source/style.styl'
  .pipe stylus
    use: [
      rupture
        implicit: false
      axis
        implicit: false
      lib()
      grid()
      downbeat()
    ]
  .pipe autoprefixer
    browsers: [
      '> 1%'
      'last 2 versions'
      'Firefox ESR'
      'Opera 12.1'
      'Explorer >= 9'
    ]
  .pipe gulp.dest './production'
  .pipe browserSync.stream
    match: '**/*.css'

gulp.task 'js', ->
  gulp.src './source/script.coffee'
  .pipe coffee()
  .pipe gulp.dest './production'

gulp.task 'bower', ->
  gulp.src bowerFiles()
  .pipe gulp.dest './production/lib'

gulp.task 'compile', ['html', 'css', 'js', 'bower']

gulp.task 'html-watch', ['html'], reload

gulp.task 'js-watch', ['js'], reload

gulp.task 'serve', ['compile'], ->
  browserSync.init
    notify: false
    server:
      baseDir: './production'
  # Watch for changes
  gulp.watch 'source/index.jade', ['html-watch']
  gulp.watch 'source/**/*.styl', ['css']
  gulp.watch 'source/script.coffee', ['js-watch']

gulp.task 'deploy', ['compile'], ->
  gulp.src './production/**/*'
  .pipe ghPages()

gulp.task 'default', ['serve']
