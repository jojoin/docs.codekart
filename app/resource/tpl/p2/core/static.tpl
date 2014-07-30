
<h1>静态文件服务器</h1>

<p><dfn>Node.js</dfn>是一个精简的web服务器程序，
  精简到你甚至需要自己开发静态文件服务器，
  这在<dfn>PHP</dfn>等传统环境下环境下是不可想象的。
  幸好<dfn>Codekart</dfn>已经为你做好了一切！</p>

<h3>如何使用</h3>

<p>框架目录下有一个<var>static/</var>文件夹，静态文件都被放置在这里。
  当启动框架后，只需要把文件放置在<var>static/</var>目录下即可被 url 访问。</p>

<p>你可以为静态文件设置浏览器端的缓存，打开配置文件<var>app/config/config.js</var>，修改其中的项目：</p>

<pre><code> expires: 60*60*24        //静态文件客户端缓存时间，单位为秒</code></pre>

<p>缓存可以减少客户端对 jpg、css、js 等静态文件的读取，提升服务器性能。设置为0则不缓存。</p>


<h3>注意事项</h3>

<p>不需要在 url 里加上<a>static/</a>路径.
  例如，你需要为网站设置一个<var>favicon.ico</var>，
  就只需要把这个icon文件放置在<var>static/</var>目录下即可。
  访问的路径是 <a>http://example.com/favicon.ico</a>，
  而不是 <a>http://example.com/static/favicon.ico</a>。</p>

<p>静态文件地址必须带上 <var>.jpg</var>、<var>.html</var> 等后缀名，否则将被路由到<a href="/p/view_index">view</a>或<a href="/p/core_controller">controller</a>下处理。</p>

<h3>更多</h3>

<p>以上为普通静态文件的处理，当然<dfn>Codekart</dfn>也会满足你的特殊需求，例如针对不同的文件定义不同的缓存时间、静态文件在其他目录，甚至你的静态文件没有后缀名。</p>

<h5>指定静态目录及配置</h5>

<p>在<var>app/config/define.js</var>配置文件内，找到<code>exports.static_url_path</code>，项目如下：</p>

<pre><code>/*
指定由静态文件服务器处理的url一级路径
例如 http://example.com/static_path/img/picture.jpg
如果你确认/static_path下全部为静态文件的url
则在下方添加 'static_path'
添加静态路径将跳过 view 和 controller 的url匹配检查
这将大大提升服务器处理静态文件的效率
如果你的静态文件不带有后缀名,或者是不规则的路径
那么就需要定义下面的路径, 以防止被路由到view 和 controller处理
[注意] 如果你定义了此项, 那么处理程序就不会路由到view 和 controller之上!
*/
exports.static_url_path = {
  'img': {
    expires: 3600 //客户端缓存时间
    //root: '/data/storge/' //指定本地读取路径
    //url访问路径示例：http://example.com/img/picture.jpg
    //对应的本地文件：/data/storge/img/picture.jpg
  },
  'cssimg': {},
  'js': {},
  'css': {},
  'jslib': {},
  'csslib': {}
  /*
  'mp3':{
    root:'/data/storge/'  //指定读取静态文件处理的位置(末尾必须加'/')，例如http://example.com/mp3/music/001.mp3 对应本地文件:  '/data/storge/mp3/music/001.mp3'
  }
  */
};

</code></pre>

<p>通过修改和添加以上配置，你可以对每一个静态文件目录进行单独配置。</p>

<h5>静态路径动态处理</h5>

<p>如果你需要一个“伪静态”文件，例如同一个静态文件url地址，根据cookie，或者域名不同，返回不同的数据，实现动态数据，或者图片防盗链等功能，就需要配置<a href="/p/core_route">url路由</a>。</p>
