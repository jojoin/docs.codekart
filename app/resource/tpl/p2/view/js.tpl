
<h1>web页面 - js</h1>

<h3>如何使用</h3>

<p>在<a href="/p/view_tpl">tpl模板</a>中已经了解的模板的使用方法。现在可以为页面添加js。</p>

<p>新建路径为<var>app/view/frame.js</var>的页面配置文件，文件内容如下：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  tpl:[
    {body:'frame/frame'} //加载的文件：app/resource/tpl/frame/frame.tpl
  ],
  js:[
    'functions',  //加载的文件：app/resource/js/functions.js 或者 framework/resource/js/functions.js ，下同
    'json.ck',  //框架js模块
    'cookie.ck',  //框架js模块
    'jq-extend',
    'tmpl.ck',  //框架js模块
  ], //页面的js模板文件列表
  jslib:[
    'jquery-2.0.3.min'
  ] //js库文件列表，在static/jslib目录下
};
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p><dfn>css</dfn>和<dfn>js</dfn>模块的组合比较简单，都是线性的追加在文件末尾。合并压缩后的js文件，存放在<var>static/js/</var>目录下。然后在页面的<dfn>&lt;/body&gt;</dfn>标签之前插入引用链接。</p>

<p><var>jslib</var>为比较大的外部<dfn>js</dfn>库文件。通常是一些已经压缩过的js文件，例如<dfn>JQuery</dfn>。
  框架不会对其进行解析压缩合并等操作，只是简单的在html中添加引用。</p>

<p>其中<var>js</var>和<var>jslib</var>参数可以为一个字符串路径，也可以为一个路径数组。</p>

<h3>依赖关系</h3>

<p>框架提供的js模块，和用户自定义的前端js模块，都会存在模块依赖关系，如模块B需要使用模块A中定义的对象，这时就需要定义模块的依赖关系。</p>

<p>在<var>app/config/define.js</var>文件中找到如下项：</p>

<pre><code>/**
* 浏览器端 js 模块的依赖关系（先后关系）
* 【注意】不可出现循环依赖，否则程序会进入死循环!!!
*/
exports.client_js_depend = {
//在此处添加你的前端js模块依赖关系


  //下面是Codekart框架前端js模块依赖关系 如无必要请勿修改
  'ajax.ck': ['json.ck','url.ck','init.ck'],
  'websocket.ck': ['ajax.ck','init.ck']
};
</code></pre>

<p><code>'ajax.ck': ['json.ck','url.ck','init.ck']</code>表示<var>ajax.ck</var>模块依赖<var>json.ck</var>，<var>url.ck</var>，<var>init.ck</var>三个模块，这意味着后三者将在合并压缩的js文件中，位于前者之前！</p>

<p><kbd>注意：不可出现循环依赖，否则程序将进入死循环！</kbd></p>

<h3>框架内置模块前端使用</h3>


<p>在<a href="/p/js_index">前端js模块</a>中了解更多。</p>


<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>