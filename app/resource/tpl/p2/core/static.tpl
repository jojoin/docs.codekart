
<h1>静态文件服务器</h1>

<p>Node.js 是一个精简的web服务器程序，
  精简到你甚至需要自己开发静态文件服务器，
  这在PHP环境下是不可想象的。
  幸好Codekart已经为你做好了一切！</p>

<h3>如何使用</h3>

<p>框架目录下有一个<dfn>static</dfn>文件夹，所有的静态文件都被放置在这里。
  当启动工程后，只需要把文件放置在<dfn>static</dfn>目录下即可被 url 访问。</p>

<p>你可以为静态文件设置浏览器端的缓存，打开配置文件<var>app/config/config.js</var>，修改其中的项目：</p>

<pre><code> expires: 60*60*24        //静态文件客户端缓存时间，单位为秒</code></pre>

<p>缓存可以大大加快客户端对 jpg、css、js 等静态文件的读取时间。设置为0则不缓存。</p>


<h3>注意事项</h3>

<p><b>不需要在 url 里加上 static 路径！
  例如，你需要为网站设置一个<var>favicon.ico</var>，
  就只需要把这个icon文件放置在<dfn>static</dfn>目录下即可。
  访问的路径是 <var>[url]/favicon.ico</var>，
  而不是 <var>[url]/static/favicon.ico</var> ([url]为你的网站域名)。</b></p>

<p><b>静态文件地址必须带上 .jpg、.html 等后缀名，否则将被 Codekart 认为是 web 页面地址！</b></p>