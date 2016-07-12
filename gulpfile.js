var gulp = require('gulp');

var screeps = require('gulp-screeps');
var shell = require('gulp-shell')

var credentials = require('./secrets.js');

gulp.task('default', function() {
});

//HACK updates submodules
gulp.task('updatedeps', shell.task([
  'rm -R ./lib/HaxeScreeps',
  'git submodule update --remote',
]))

//compiles project to ./dist folder
gulp.task('compile', shell.task([
  'haxe build.hxml'
]))

//deploys project to "test" branch
gulp.task('test', ['compile'], function() {
  gulp.src('dist/*.js')
    .pipe(screeps(credentials));
});

//deploys project to "default" branch (untested)
gulp.task('deploy', ['compile'], function() {
    credentials.branch = "default";

    gulp.src('dist/*.js')
        .pipe(screeps(credentials));
});
