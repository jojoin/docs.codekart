
<h1>request 对象扩展</h1>

<p>Node.js 处理一次请求相当于一次大函数调用，采用如下方式方便的建立服务器：</p>

<pre><code> //Node.js原生方式建立web服务器
  var http = require('http');
  // Create an HTTP server
  http.createServer(function (request, response) {
      //TODO something
  });
</code></pre>

<p>Codekart 框架对其中的参数<dfn>request</dfn>进行了扩展，以便在<a href="/p/core_controller">controller</a>
请求处理控制器和view页面模板数据<a href="/p/view_data">data</a>方法中方便的使用。扩展内容如下：</p>

<h4>request.time</h4>

<p>请求到达的时间戳（秒）。</p>

<h4>request.time_ms</h4>

<p>请求到达的时间戳（毫秒）。</p>

<h4>request.url</h4>

<p>用<code>url.parse()</code>解析后的url替换原生的<var>request.url</var>，解析后的url对象，见
  <a href="http://nodejs.org/api/url.html#url_url">这里</a>。</p>

<h4>request.url.param</h4>

<p>在处理页面请求时，url的pathname可以定义成参数类型，详细见
  <a href="/p/view_index">view页面配置</a>和<a href="/p/core_route">route路由配置</a></p>

<h4>request.get</h4>

<p>url 请求解析处理后的<dfn>GET</dfn>参数，也就是<var>request.url.query</var>。</p>

<h4>request.post</h4>

<p>url 请求解析处理后的<dfn>POST</dfn>参数。</p>
<p><kbd>注意：</kbd>当请求的<var>content-type</var>类型为
  <var>multipart/form-data</var>等时（文件上传），<var>request.post</var>不可用。需要在
  <a href="/p/core_callthis#formdata">formdata</a>表单处理中处理。</p>

<h4>request.cookie</h4>

<p>url 请求解析处理后的<dfn>cookie</dfn>参数。</p>

<h4>request.route</h4>

<p>自定义的<a href="/p/core_route">url路由</a>规则。在 view 、controller 和 static 的不同处理环境下，数据也不相同。</p>












