
<h1>web页面 - data模板数据</h1>

<p>在<a href="/p/view_tpl">tpl模板</a>中已经了解的模板的使用方法。现在可以为模板填充数据。</p>

<p>模板的语法，在<a href="/p/tool_tmpl">tmpl模板解析器</a>中说明，下面主要说明模板数据的获取方式。</p>

<p>首先我们新建一个文件<var>app/view/frame.js</var>，内容如下</p>

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

/**
* 页面模板数据获取
* 可以不定义此函数，程序将跳过本页面的数据获取
* @callback 必须调用 ，表示数据获取完成，进行子级页面数据获取，不调用则会一直等待不能进行下一步！！！
* 在callback中返回的变量可以在tpl模板中使用，在这里可以进行数据库的查询等等。
* 复杂的数据获取和运算，建议放在`app/model`中的模块中进行，在这里可以调用`require_model('model')`加载。
*/
exports.data = function(callback){
  var that = this  //this扩展对象
  , req = this.request  //Codekart扩展的request请求对象
  , rps = this.response;  //原生的response返回对象
  callback({
    title: website.name,
      time: req.time,
      website: website
    },{
      website: website
  });
};
</code></pre>

<p>模板数据的获取就是<var>exports.data</var>函数，你可以不定义它，程序将跳过此页面的数据获取。
如果定义，那么就必须调用它的参数<var>callback</var>，表示此页面的模板数据获取完成，开始解析页面。</p>

<p>其中，<var>exports.data</var>函数的本地<dfn>this</dfn>对象经过了强大的扩展，详细内容请<a href="/p/core_callthis">点这里</a>。 </p>

<p>数据获取回掉函数<var>callback(data,json_data)</var>其实包含两个参数，第一个参数为模板数据，
  第二个参数也会被组合，但最终它会被转换成一个<dfn>json</dfn>格式的字符串，
  并作为<var>data</var>的一个属性<var>json_str</var>，它的作用主要用来向前端输出js变量，
  使用方式<a href="/p/view_tpl#json_str">见这里</a>。内部执行了下面的代码：</p>

<pre><code>data.json_str = json.stringify(json_data);
</code></pre>

<p><var>exports.data</var>函数的<var>this</var>对象，包含一系列封装的属性：</p>

<p><big>this.request</big></p>

<p>原生的<dfn>Node.js request</dfn>请求对象。框架对它进行了比较简单的扩展，
  <a href="/p/core_request">点这里</a> 了解详情。</p>

<p><big>this.response</big></p>

<p>原生的<dfn>Node.js response</dfn>返回对象。</p>

<p><big>this.render(txt)</big></p>

<p>方便的向客户端返回文本。参数<var>txt</var>为返回的文本。</p>

<p><big>this.render302(url)</big></p>

<p>返回302重定向，参数<var>url</var>为重定向的地址。</p>

<p><big>this.renderJump(url)</big></p>

<p>返回一段js代码，跳转到其他页面，参数<var>url</var>为跳转的地址。</p>

<p><big>this.view(name)</big></p>

<p>重新选择视图处理程序，参数<var>name</var>为处理程序的路径名称。在客户端发过来的数据损坏或者不完整时，
就可以使用它返回错误、404或其他页面，例如<dfn>this.view('404')</dfn>即将当前页面交给404页面处理。</p>

<p><kbd>注意：</kbd>请在以上各个函数调用之前加上<dfn>return</dfn>，防止后面的代码执行进行无用的运算。</p>

<p>你可以在<var>exports.data</var>函数中，进行文件读取、数据库查找等耗时的工作，
  然后在数据返回后调用<var>callback</var>，例如：</p>

<pre><code>var fs = require('fs');
//获取模板数据
exports.data = function(callback){
  var filename = 'file.txt';
  fs.readFile(filename, 'utf8',function(err, data){
    callback(data);
  });
};
</code></pre>

<p>如果数据获取的逻辑比较复杂，建议将它封装成<dfn>model</dfn>模块，
  放在<dfn>app/model</dfn>目录下，
  使用<dfn>require_model()</dfn><a href="/p/core_global">全局函数</a>加载并使用。例如：</p>

<p>有时候，数据的获取流程太过于复杂，回调嵌套的层次太多，代码回变得难以维护，
  这是就可以使用<a href="/p/tool">Tool工具箱</a>中的<a href="/p/tool_step">step流程控制</a>工具，
    解决回调依赖的问题。</p>

<pre><code>var user = require_model('user');
  //获取模板数据
exports.data = function(callback){
  var uid = this.request.cookie.uid;
  user.getInfo(uid,function(data){
    callback(data);
  });
};
</code></pre>

<p><kbd>注意：</kbd>页面<a href="/p/view_inherit">继承</a>时，所有<var>callback(data)</var>中的<var>data</var>将会被合并成一个大对象，以解析tpl模板。
如果父级页面和子级页面的<var>data</var>存在相同的属性，那么父级页面的数据属性将被子级覆盖。</p>

<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>