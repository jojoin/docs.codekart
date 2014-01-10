
<h1>web页面 - css</h1>

<p>在<a href="/p/view_tpl">tpl模板</a>中已经了解的模板的使用方法。现在可以为模板设置css样式。</p>

<p>框架采用<dfn>less</dfn>编写<dfn>css</dfn>，
这是用一种比<dfn>css</dfn>简介的多但十分强大的样式语言。<dfn>less</dfn>完全向下兼容<dfn>css</dfn>，
如果不熟悉可以完全当成<dfn>css</dfn>来写。
详细了解<dfn>less</dfn>请访问<a href="http://www.lesscss.net/article/home.html">less中文官网</a>。</p>


<p>新建路径为<var>app/view/frame.js</var>的页面配置文件，文件内容如下：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  tpl:[
    {body:'frame/frame'},  //加载的文件：app/resource/tpl/frame/frame.tpl
  ]
  less: 'frame/frame',  //加载的文件：app/resource/less/frame/frame.less
  csslib: [
    'button',  //加载的css库文件：static/csslib/button.css
    //'input'
  ]
};

//继承父级页面 和 必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p><dfn>css</dfn>和<dfn>js</dfn>模块的组合比较简单，都是线性的追加在末尾。
<dfn>css</dfn>模块采用<dfn>less</dfn>编写，框架会自动帮你解析成<dfn>css</dfn>并压缩，
然后自动通过<var>./resource/tpl/html.tpl</var>文件中的<dfn><!src_style!<dfn>和</dfn><!src_script!></dfn>标签替换成引用地址。</p>

<p><var>csslib</var>为比较大的外部<dfn>css</dfn>库文件。通常是一些已经压缩过的css文件，
  框架不会对其进行解析压缩合并等操作，只是简单的在html中添加引用。</p>

<p>其中<var>less</var>和<var>csslib</var>参数可以为一个字符串路径，也可以为一个路径数组。</p>

<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>