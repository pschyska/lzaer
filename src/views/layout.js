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
      script({
        src: '/js/ext-all.js'
      });
      script({
        src: '/js/application.js'
      });
      return coffeescript(function() {
        return $().ready(function() {
          return alert('Alerts are so annoying...');
        });
      });
    });
    return body(function() {
      return header(function() {
        return h1(this.title);
      });
    });
  });
}).call(this);
