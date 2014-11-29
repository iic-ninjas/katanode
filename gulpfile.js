var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sass = require('gulp-sass');

gulp.task('coffee', function() {
  gulp.src('./app/assets/javascripts/**/*.coffee')
    .pipe(coffee({bare: true})).on('error', gutil.log)
    .pipe(gulp.dest('./public/javascripts'));
});

gulp.task('scss', function() {
  gulp.src('./app/assets/stylesheets/**/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('./public/stylesheets/'));
});

gulp.task('build', ['coffee', 'scss']);

gulp.task('develop', function() {
  nodemon({
    script: './bin/www'
  });
});