var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sass = require('gulp-sass');
var jade = require('gulp-jade');

gulp.task('templates', function() {
  gulp.src('./app/assets/templates/**/*.jade')
    .pipe(jade({client: true}))
    .pipe(gulp.dest('./public/templates'))
});

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

gulp.task('build', ['templates', 'coffee', 'scss']);

gulp.task('develop', function() {
  nodemon({
    script: './bin/www'
  });
});