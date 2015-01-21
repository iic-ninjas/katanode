require('coffee-script/register');
var nconf = require('nconf');

var path = require('path');
GLOBAL.APP_ROOT = __dirname;
GLOBAL.requireApp = function(path) {
  args = Array.prototype.slice.call(arguments);
  return require.apply(null, [GLOBAL.APP_ROOT + "/" + path]);
};

var express = require('express');
var app = express();

nconf.file('github', 'config/' + app.get('env') + '/github.json');
require('./config/middleware')(app);

// view engine setup
app.set('views', path.join(__dirname, 'app/views'));
app.set('view engine', 'jade');

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

module.exports = app;
