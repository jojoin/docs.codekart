
<h1>前端 js 模块</h1>

<p>框架内置了一系列前端js工具模块，设计cookie，url解析，本地储存，数据处理等等方面。</p>

<p>框架内置的模块，也需要在<a href="/p/view_index">页面</a><dfn>stuff</dfn>配置<dfn>js</dfn>项目中显示加载：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  js:[
    'functions',  //加载的文件：app/resource/js/functions.js 或者 framework/resource/js/functions.js ，下同
    'json.ck',  //框架js模块
    'cookie.ck',  //框架js模块
    'jq-extend',
    'tmpl.ck',  //框架js模块
  ], //页面的js模板文件列表
  ...
};
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p>在<a href="/p/view_js">页面js</a>中了解更多相关内容。</p>

<p>所有框架内置的js模块，都以<dfn>.ck</dfn>后缀结尾。在前端，所有加载的js框架内置模块都被归并到全局变量<dfn>C</dfn>内。模块使用示例：</p>

<pre><code>//异步 get 数据请求
C.ajax.get('http://example.com/',{para:abc},function(err,data){

});

//将一个 javascript 对象解析成 JSON 格式的字符串。
var str = C.json.stringify({abc:'123'});

</code></pre>

<p>更多模块内容请查看：</p>

<ul>
  <!--
  <li><a href="/p/js_init">init 初始化</a></li>
  <li><a href="/p/js_function">functions</a></li>
  -->
  <li><a href="/p/js_json">json</a></li>
  <li><a href="/p/js_cookie">cookie</a></li>
  <li><a href="/p/js_url">url 处理</a></li>
  <li><a href="/p/js_ajax">ajax 请求</a></li>
  <li><a href="/p/js_store">store 本地储存</a></li>
  <li><a href="/p/js_datime">datime 时间处理</a></li>
</ul>