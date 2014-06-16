var koa    = require('koa'),
    logger = require('koa-logger'),
    router = require('koa-router'),
    static = require('koa-static');


var app = koa();
app
  .use(logger())
  .use(static('public'));

app
  .use(function *() {
    this.body = "Hello. You shouldn't be seeing this. Tell your web master he's an idiot.";
  });

app.listen(1337);
