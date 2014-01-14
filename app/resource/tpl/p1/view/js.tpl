
<h1>web页面 - js</h1>

<p>在<a href="/p/view_tpl">tpl模板</a>中已经了解的模板的使用方法。现在可以为页面添加js。</p>

<p>新建路径为<var>app/view/frame.js</var>的页面配置文件，文件内容如下：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  tpl:[
    {body:'frame/frame'} //加载的文件：app/resource/tpl/frame/frame.tpl
  ],
  js:[
    'functions',  //加载的文件：app/resource/js/functions.js 或者 framework/resource/js/functions.js ，下同
    'json',
    'cookie',
    'jq-extend',
    'tmpl',
    'pro'
  ], //页面的js模板文件列表
  jslib:[
    'jquery-2.0.3.min'
  ] //js库文件列表，在static/jslib目录下
};
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p><dfn>css</dfn>和<dfn>js</dfn>模块的组合比较简单，都是线性的追加在末尾。
  自动通过<var>./resource/tpl/html.tpl</var>文件中的<var><!src_style!</var>和<var><!src_script!></var>标签替换成引用地址。</p>

<p><var>jslib</var>为比较大的外部<dfn>js</dfn>库文件。通常是一些已经压缩过的js文件，例如<dfn>JQuery</dfn>。
  框架不会对其进行解析压缩合并等操作，只是简单的在html中添加引用。</p>

<p>其中<var>less</var>和<var>csslib</var>参数可以为一个字符串路径，也可以为一个路径数组。</p>

<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>