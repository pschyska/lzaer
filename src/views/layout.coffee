doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title}"
    
    link rel: 'stylesheet', href: '/css/ext-all.css'
    link rel: 'stylesheet', href: '/css/silk.css'    

    script src: '/adapter/ext/ext-base.js'
    script src: '/js/ext-all.js'
  body -> @body