var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');

gulp.task('coffee', function() {
  gulp.src('./app/assets/javascripts/**/*.coffee')
    .pipe(coffee({bare: true})).on('error', gutil.log)
    .pipe(gulp.dest('./public/javascripts'))
});

gulp.task('develop', function() {
  nodemon({
    script: './bin/www'
  });
});