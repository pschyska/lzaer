(function() {
  doctype(5);
  html(function() {
    head(function() {
      meta({
        charset: 'utf-8'
      });
      title("" + this.title);
      link({
        rel: 'stylesheet',
        href: '/css/ext-all.css'
      });
      link({
        rel: 'stylesheet',
        href: '/css/silk.css'
      });
      script({
        src: '/adapter/ext/ext-base.js'
      });
      return script({
        src: '/js/ext-all.js'
      });
    });
    return body(function() {
      return this.body;
    });
  });
}).call(this);
