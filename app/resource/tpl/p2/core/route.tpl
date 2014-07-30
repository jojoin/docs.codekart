
<h1>route 控制器路由</h1>

<h3>定义</h3>

<p><a href="/p/core_static">static静态文件</a>和不带参数的<a href="/p/core_controller">controller请求处理</a>不需要配置，
  框架会自动转发到相应的处理程序。需要配置路由的是带参数的请求和<a href="/p/view_index">web页面</a>。</p>

<p>url路由配置文件<var>app/config/route.js</var>，内容如下：</p>

<pre><code>
/**
* url 路由配置文件，在此处定义你的页面、api路径等等
*/

exports.view = [

    ['/','codekart'],         //网站主页 页面配置文件：app/view/codekart.js
    ['/404','404'],           //配置文件：app/view/404.js
    ['/error','error'],        //配置文件：app/view/error.js
    ['/websocket','websocket']
];


/*
controller控制器文件：app/controller/test/test.js ，getuid为处理函数，不传默认为index
*/

//controller带参数请求示例(不带参数的不需要配置，会自动路由)
exports.ctrl = [

  ['/user/:uid','test/test','getuid']

  //['/cssimg/codekart/*.png','test','']  //拦截 http://example.com/cssimg/codekart/ 路径下 png格式图片的访问

];

</code></pre>

<h3>路由优先级</h3>

<p>请求的处理次序为：</p>

<p>1. 检索<var>app/config/define.js</var>内定义的<code>exports.static_url_path</code><a href="/p/core_static">静态路径配置</a>。<br>
2. 检索<code>exports.ctrl</code>定义的路由处理。（可以在此处进行请求重定向，拦截静态文件请求等等）<br>
3. 检索<code>exports.view</code>定义的<a href="/p/view_index">页面访问</a>请求。<br>
4. 检查是否为普通(带.jpg .html等后缀名)静态文件请求。<br>
5. 自动路由到<a href="/p/core_controller">controller控制器</a>处理（未找到相应controller则返回404）。<br>
</p>

<h3>路由规则</h3>

<p>Codekart 提供了有意义并富有表现力的URL映射API，
例如我们可能想让用户帐号的URL看起来像/user/12的样子，
下面的例子就能实现这样的路由，其中与占位标识符（本例为:uid）相关的值可以被request.url.param获取到。</p>

<p>下面是一些路由例子，以及与之相匹配的关联路径：</p>

<p><dfn>"/user/:id"</dfn>
/user/12
</p>

<p><dfn>"/users/:id?"</dfn>
/users/5　　
/users
</p>

<p><dfn>"/files/*"</dfn>
/files/jquery.js　　
/files/javascripts/jquery.js
</p>

<p><dfn>"/file/*.*"</dfn>
/files/jquery.js　　
/files/javascripts/jquery.js
</p>

<p><dfn>"/user/:id/:operation?"</dfn>
/user/1　　
/user/1/edit
</p>

<p><dfn>"/img/*.png"</dfn>
  /img/pic.png　　
  /img/pic2.png　　
</p>

<p><dfn>"/products.:format"</dfn>
  /products.json　　
  /products.xml
</p>

<p><dfn>"/products.:format?"</dfn>
/products.json　　
/products.xml　　
/products
</p>

<p><dfn>"/user/:id.:format?"</dfn>
/user/12　　
/user/12.json
</p>


<h3>使用</h3>

<p>使用<code>exports.ctrl</code>注册路由，可以进行url处理重定向等操作。还可以重新自定义<a href="/p/core_static">静态文件</a>的访问，
  例如同一个静态文件地址，根据不同的用户返回不同的文件内容，图片防盗链等等</p>



















