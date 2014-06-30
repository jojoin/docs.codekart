
<h1>web页面模块化配置服务</h1>

<p><dfn>Codekart</dfn>已经帮你完成了 web 页面的继承和模块化配置，
  你可以方便的把位于不同文件夹内的 html 模板、js 文件、css 文件等等组合成一个页面。
</p>

<p>在页面比较大的时候，js、css、html 的模块化就显得特别重要了，
  如果你的页面js超过一万行代码20几个模块，都放在一个文件里面开发，是不可想象的。</p>

<p>幸好，Codekart 可以为你把切分成模块的 js、css 和 html 组合起来，压缩并自动添加引用。我们将通过一个示例来详细讲解用法。</p>

<p>在<var>framework/view</var>文件夹下面包含四个文件<var>html.js</var>,<var>home.js</var>,<var>404.js</var>和<var>error.js</var>。
  这是框架自带的基础页面，你不需要修改它。如果需要自定义这几个页面，
  你可以在<var>app/view</var>下新建同名的文件，并按照配置自定义。框架会优先调用<dfn>app/view</dfn>下面的，
  而<var>framework/view</var>下的就会被“重载”。</p>

<p>它们就是四个基础web页面，其中其余三个页面都是从<var>html.js</var><a href="/p/view_inherit">继承</a>过来。</p>

<p><var>html.js</var>内容如下：</p>

<pre><code>//web页面顶级页面定义
exports.stuff = {
  tpl:{html:'html'},  //页面的tpl模板文件列表，模块位置： app/resource/tpl
  tplpre:[],  //待用的tpl文件列表 会被加入js文件里面待用  保存在app/resource/tpl文件夹 格式{note_list:'abc/abc'}
  less:'html',  //页面的css模板文件列表 ，模块位置： app/resource/less
  csslib:[],    //css库文件，在static/csslib目录下
  js:[  //js模块文件，模块位置： app/resource/js
    'functions',
    'json',
    'cookie',
    'jq-extend',
    'tmpl',
    'pro'
  ], //页面的js模板文件列表
  jslib: 'jquery-2.0.3.min'  //js库文件列表，在static/jslib目录下
};


var website = load.config('website');

/**
* tpl模板数据获取函数
* @param callback 返回模板数据
*/
exports.data = function(callback){
  var that = this
  , req = this.request;  //原生的request请求对象
  callback({
    title: website.name,
    time: req.time,
    website: website
  },{
    website: website
  });
};</code></pre>

<p><kdb>注意：</kdb>tpl ,  tpl_pre , less , csslib , js , jslib 配置变量可以是一个路径文件名称，也可以是一个文件名数组，并且省略后缀名。</p>

<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>