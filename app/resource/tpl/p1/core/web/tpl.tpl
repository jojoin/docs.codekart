
<h1>web页面 - tpl模板</h1>

<p>Codekart 使用自建的<dfn>tmpl</dfn>解析器，简单而且高效，<a href="/p/tool_tmpl">点这里</a>了解它如何使用。</p>

<p>同一个页面的模板可以切分为不同的模块，它们保存在<dfn>app/resource/tpl</dfn>目录下。</p>

<p>例如，现在需要建立一个<var>frame</var>框架页面，它包含通用的<dfn>header</dfn>页头和<dfn>footer</dfn>页脚，
       之后所有的页面都从它<a href="/p/core_web_inherit">继承</a>，方法如下：</p>

<p>新建路径为<var>app/view/frame.js</var>的页面配置文件，文件内容如下：</p>

<pre><code>//frame框架页面增加的配置
var stuff = {
  tpl:[
    {body:'frame/frame'},  //加载的文件：app/resource/tpl/frame/frame.tpl
    {header:'frame/header'}, //同上：app/resource/tpl/frame/header.tpl
    {footer:'frame/footer'}  //同上：app/resource/tpl/frame/footer.tpl
  ]
};

//继承父级页面 和 必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
</code></pre>

<p>接着，在<dfn>app/resource/tpl</dfn>新建一个<dfn>frame</dfn>目录，
并在其中新建文件<var>frame.tpl</var>、<var>header.tpl</var>和<var>footer.tpl</var></p>

<p><var>frame.tpl</var>内容如下：</p>

<pre><code>&lt;!--frame框架tpl模板--&gt;

&lt;div id="frame"&gt;

  &lt;!header!&gt;

  &lt;!content!&gt;

  &lt;!footer!&gt;

&lt;/div&gt;
</code></pre>

<p>你也许知道了，<var>&lt;!header!&gt;</var>符号表示名为<dfn>header</dfn>tpl模块插入的位置，
  即在<var>&lt;!header!&gt;</var>位置的上方插入<var>app/resource/tpl/frame/header.tpl</var>的内容。
  它对应<var>app/view/frame.js</var>文件中的<dfn>tpl</dfn>配置行：<var> {header:'frame/header'}</var>。</p>

<p>如果你需要自定义顶级html页面，例如新建文件<dfn>app/resource/tpl/html.js</dfn>，内容如下：</p>

<a id="json_str"></a>
<pre><code>&lt;!--顶级html.tpl--&gt;
&lt;!DOCTYPE html&gt;
  &lt;html lang="zh-CN"&gt;
  &lt;head&gt;
    &lt;title&gt;[#=title#]&lt;/title&gt;
    &lt;!src_style!&gt;&lt;!--页面css文件的引用处--&gt;
  &lt;/head&gt;
  &lt;body&gt;

    &lt;!body!&gt;

    &lt;script type="text/javascript"&gt;
      global =  [#=json_str#];
    &lt;/script&gt;

    &lt;!src_script!&gt;&lt;!--页面js文件的引用处--&gt;

  &lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p>请注意上面的模板标签，<dfn>&lt;!src_style!&gt;</dfn>和<dfn>&lt;!src_script!&gt;</dfn>
是必须定义的，否则将无法添加页面css与js文件的引用。
  <dfn>&lt;!body!&gt;</dfn>标签也必须，否则继承的页面无处插入内容。
  <dfn>global = [#=json_str#];</dfn>为<a href="/p/tool_tmpl">tmpl模板</a>语法，
  其中的<dfn>json_str</dfn>是一个<dfn>json</dfn>格式的字符串，
  在<a href="/p/core_web_data">模板数据</a>内定义。用户向前端输出js变量。</p>

<p><kbd>注意：</kbd><dfn>&lt;! !&gt;</dfn>包裹的名称是全局唯一的，不能重名，且需要符合变量命令规范，
  不能含有特殊字符(仅字符串数字和下划线)。</p>

<p>在<a href="/p/core_web_inherit">页面继承</a>，
  <a href="/p/core_web_tpl">tpl模板</a>，<a href="/p/core_web_data">模板数据</a>，
  <a href="/p/core_web_css">css及库</a><a href="/p/core_web_js">js及库</a>，
  <a href="/p/core_web_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>







