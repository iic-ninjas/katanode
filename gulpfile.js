var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sass = require('gulp-sass');
var jade = require('gulp-jade');
var concat = require('gulp-concat');
var insert = require('gulp-insert');
var tap = require('gulp-tap');
var del = require('del');

var insertToJST = function(file) {
  var templateName = file.relative.replace(/\.js/, '');
  file.contents = Buffer.concat([
    new Buffer("window.JST['" + templateName + "'] = "),
    file.contents,
    new Buffer(';')
  ]);
};

gulp.task('clean', function() {
  del([
    'public/javascripts',
    'public/stylesheets',
    'public/templates.js'
  ]);
});

gulp.task('templates', function() {
  gulp.src('./app/assets/templates/**/*.jade')
    .pipe(jade({client: true}))
    .pipe(tap(insertToJST))
    .pipe(concat('templates.js'))
    .pipe(insert.prepend('window.JST = {};\n'))
    .pipe(gulp.dest('./public'))
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

gulp.task('build', ['clean', 'templates', 'coffee', 'scss']);

gulp.task('develop', ['build'], function() {
  nodemon({
    script: './bin/www'
  });
});