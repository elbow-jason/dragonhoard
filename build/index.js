var koa    = require('koa'),
    koaPg  = require('koa-pg'),
    config = require('./config'),
    logger = require('koa-logger'),
    router = require('koa-router'),
    static = require('koa-static');


var app = koa();
app
  .use(logger())
  .use(koaPg(config.db))
  .use(static('public'));

app
  .use(function *() {
    this.body = "Hello. You shouldn't be seeing this. Tell your web master he's an idiot.";
  });

app.listen(1337);
