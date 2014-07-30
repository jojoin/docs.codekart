
<h1>web页面 - tpl模板</h1>

<p>Codekart 使用自建的<dfn>tmpl</dfn>解析器，简单而且高效，<a href="/p/tool_tmpl">点这里</a>了解它如何使用。</p>

<p>同一个页面的模板可以切分为不同的模块，它们保存在<var>app/resource/tpl/</var>目录下。</p>

<p>例如，现在需要建立一个<var>frame</var>框架页面，它包含通用的<dfn>header</dfn>页头和<dfn>footer</dfn>页脚，
       之后所有的页面都从它<a href="/p/view_inherit">继承</a>，方法如下：</p>

<p>这个通用的框架页面，需要从<var>view/html.js</var>继承 ：</p>

<pre><code>//html页面定义
var stuff = {
  tplpre[{pretpl:'pretpl'}], //前端备用的 tpl 模板 app/resource/tpl
  tpl:{html:'html'},  //页面的tpl模板文件列表  app/resource/tpl
  less:'html'  //页面的css模板文件列表  app/resource/less

};


//必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('base',stuff); //继承至base.js


/**
* tpl模板数据获取函数
* @param callback 返回模板数据
*/
exports.data = function(callback){
  var that = this
  , req = this.request;  //原生的request请求对象

  callback({
    title: 'Codekart'
  });
};
</code></pre>

<p>可以看到<var>view/html.js</var>加载了<var>resource/tpl/html.tpl</var>模板：</p>

<pre><code>
&lt;!DOCTYPE html&gt;
&lt;html lang="zh-CN"&gt;
  &lt;head&gt;
    &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8"&gt;
    &lt;title&gt;[:=title:]&lt;/title&gt; &lt;!--[:=title:] <a href="/p/view_data">模板变量</a>输出--&gt;
  &lt;/head&gt;
  &lt;body&gt;

    &lt;!body!&gt; &lt;!--子级页面模板填充预留标志位--&gt;

  &lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p>如果你需要自定义顶级html页面，新建文件<var>app/resource/tpl/html.js</var>，
并按你的需求自定义。框架会采用<code>read.resouce()</code>函数
优先加载<var>app/resource/tpl/</var>目录下的模板文件，更多请查看
<a href="/p/core_global">全局变量及函数</a>read部分。</p>


<p>请注意上面的模板标签，<dfn>&lt;!body!&gt;</dfn>是为子级模板预留的tpl插入位置。
  <dfn> [#=title#]</dfn>为<a href="/p/tool_tmpl">tmpl模板</a>语法，
  在<a href="/p/view_data">模板数据</a>内定义。用户向前端输出 js 变量或进行逻辑运算。</p>

<p>新建路径为<var>app/view/frame.js</var>的页面配置文件，文件内容如下：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  tpl:[
    {body:'frame/frame'},  //加载的文件：resource/tpl/frame/frame.tpl
    {header:'frame/header'}, //同上：resource/tpl/frame/header.tpl
    {footer:'frame/footer'}  //同上：resource/tpl/frame/footer.tpl
  ]
};

//继承父级页面 和 必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p>接着，在<var>app/resource/tpl</var>新建一个<var>frame/</var>目录，
并在其中新建文件<var>frame.tpl</var>、<var>header.tpl</var>和<var>footer.tpl</var></p>

<p><var>frame.tpl</var>内容如下：</p>

<pre><code>&lt;!--frame框架tpl模板--&gt;

&lt;div id="frame"&gt;

  &lt;!header!&gt;

  &lt;!content!&gt;

  &lt;!footer!&gt;

&lt;/div&gt;
</code></pre>

<p>你也许知道了，<dfn>&lt;!header!&gt;</dfn>符号表示名为<dfn>header</dfn>tpl模块插入的位置，
  即在<dfn>&lt;!header!&gt;</dfn>位置的上方插入<var>app/resource/tpl/frame/header.tpl</var>的内容。
  它对应<var>app/view/frame.js</var>文件中的<dfn>tpl</dfn>配置行：<code> {header:'frame/header'}</code>。</p>

<p><kbd>注意：</kbd><dfn>&lt;! !&gt;</dfn>包裹的名称是全局唯一的，不能重名，且需要符合变量命令规范，
  不能含有特殊字符(仅字符串数字和下划线)。</p>

<h3>前端预备tpl模板</h3>

<p>有时候，我们需要同过 ajax 异步获取 json 数据，然后解析成 html 显示到页面。模板引擎<a href="/p/tool_tmpl">tmpl</a>即可在前端通过<code>C.tmpl()</code>使用。更多关于框架js模块，<a href="/p/js">点这里</a>查看详情。</p>

<p>在页面的<var>stuff</var>配置中，<var>tplpre</var>配置项即为前端预备模板。这些定义的模板将被压缩成一个全局js对象<code>Tpls</code>，作为预备模板容器输出至前端。例如配置：<code>tplpre: [{tplname: 'tplpathname'}]</code>，前端js获取模板内容：<code>var tpl = Tpls.tplname;</code>。</p>

<p>修改配置文件中<var>app/config/define.js</var>的<code>exports.client_tpl_var = 'Tpls';</code>项目，来自定义前端模板容器js对象的名称。</p>


<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>







