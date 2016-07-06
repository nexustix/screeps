var gulp = require('gulp');

var screeps = require('gulp-screeps');
var shell = require('gulp-shell')

var credentials = require('./secrets.js');

gulp.task('default', function() {
  // place code for your default task here
});

gulp.task('updatedeps', shell.task([
  'rm -R ./lib/HaxeScreeps',
  'git submodule update --remote',
]))

gulp.task('compile', shell.task([
  'haxe build.hxml'
]))

gulp.task('test', ['compile'], function() {
  gulp.src('dist/*.js')
    .pipe(screeps(credentials));
});

gulp.task('deploy', ['compile'], function() {
    credentials.branch = "default";

    gulp.src('dist/*.js')
        .pipe(screeps(credentials));
});
