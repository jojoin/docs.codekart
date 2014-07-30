
<h1>web页面 - data模板数据</h1>

<p>在<a href="/p/view_tpl">tpl模板</a>中已经了解的模板的使用方法。现在可以为模板填充数据。</p>

<p>模板的语法，在<a href="/p/tool_tmpl">tmpl模板解析器</a>中说明，下面主要说明模板数据的获取方式。</p>

<h3>使用</h3>

<p>以下是框架<a href="http://codekart.jojoin.com/">主页面</a><var>framework/view/codekart.js</var>，内容如下：</p>

<pre><code>//web页面定义
var stuff = {
  tpl:{body:'codekart'},  //页面的tpl模板文件列表  app/resource/tpl
  less:'codekart'  //页面的css模板文件列表  app/resource/less
};

//【继承关键代码】
//继承父级页面 和 必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('html',stuff); //继承至html


//var website = load.config('website');


/**
* 页面模板数据获取
* 可以不定义此函数，程序将跳过本页面的数据获取
* 一旦定义数据获取函数，则 callback 必须调用 ，表示数据获取完成，进行子级页面数据获取，不调用则会一直等待不能进行下一步！下方的 predata() 与 aftdata()函数相同
* 在callback中返回的变量可以在tpl模板中使用，在这里可以进行数据库的查询等等。
* 复杂的数据获取和运算，建议放在`app/model`中的模块中进行，在这里可以调用`load.model('model')`加载。
*/

  exports.data = function(callback, data){
    callback({
      title: 'Codekart'
    });
  };

  /**
  * 预备数据获取
  */
  exports.predata = function(callback, data){
    callback({});
  };

  /**
  * 数据获取后续工作
  */
  exports.aftdata = function(callback, data){
    callback({});
  };

</code></pre>

<p>模板数据的获取就是<code>exports.data</code>，<code>exports.predata</code>，<code>exports.aftdata</code>函数，你可以不定义它们，或者定义其中一个或多个，程序将自动跳过未定义的项目。
如果定义，那么就必须调用它的参数<code>callback</code>，表示此页面的模板数据获取完成，开始解析页面。</p>

<p>其中，<code>data</code>，<code>predata</code>，<code>aftdata</code>函数的本地<dfn>this</dfn>对象经过了强大的扩展，包含一系列封装的属性，详细内容请<a href="/p/core_callthis">点这里</a>。 </p>

<p>你可以在<code>exports.data</code>函数中，进行文件读取、数据库查找等耗时的工作，
  然后在数据返回后调用<code>callback</code>，例如：</p>

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
  放在<var>app/model</var>目录下，
  使用<code>load.model()</code><a href="/p/core_global">全局函数</a>加载并使用。例如：</p>

<p>有时候，数据的获取流程太过于复杂，回调嵌套的层次太多，代码回变得难以维护，
  这是就可以使用<a href="/p/tool">Tool工具箱</a>中的<a href="/p/tool_step">step流程控制</a>工具，
    解决回调依赖的问题。</p>

<pre><code>var user = load.model('user');
  //获取模板数据
exports.data = function(callback){
  var uid = this.request.cookie.uid;
  user.getInfo(uid,function(data){
    callback(data);
  });
};
</code></pre>

<h3>调用顺序规则</h3>

<p>上面已经说明，每个页面可以包含<code>exports.data</code>，<code>exports.predata</code>，<code>exports.aftdata</code>三个数据获取函数，它们之间调用的顺序存在存在一系列规则：</p>

<p>一、调用最顶级页面的<code>predata</code>函数，等待 callback 回调表示完成，之后调用子级页面的<code>predata</code>函数，然后是子级的子级，依次类推下去，直到完成所有定义的<code>predata</code>函数的调用。此调用是按<a href="/p/view_inherit">继承</a>链从上到下顺序调用。</p>

<p>二、“并发”调用所有页面的<code>data</code>函数，等待所有调用完成。</p>

<p>三、调用最顶级页面的<code>aftdata</code>函数，等待 callback 回调表示完成。再按继承链调用子级，以此类推。</p>

<p>调用链如下：</p>

<pre><code>  predata() //顶级页面predata
  <dfn>↓</dfn>
  predata() //子级页面predata
  <dfn>↓</dfn>
  ...
  <dfn>↓</dfn>
  data() , data(), data() , data() ... //所有页面的 data   "并发"调用
  <dfn>↓</dfn>
  aftdata() //顶级页面 aftdata
  <dfn>↓</dfn>
  aftdata() //子级页面 aftdata
  <dfn>↓</dfn>
  ... //子级页面 aftdata
</code></pre>


<p><kbd>注意：</kbd>页面<a href="/p/view_inherit">继承</a>时，所有<var>callback(data)</var>中的<var>data</var>将会被合并成一个大对象，传给<a href="/p/view_tpl">>tpl模板</a>引擎处理。
如果父级页面和子级页面的<code>predata</code>或<code>aftdata</code>存在相同的属性，那么父级页面的数据属性将被子级覆盖。<code>data</code>函数由于其“并发”属性，相同的值取决于谁最后返回数据。</p>

<p>三个数据获取函数，接收两个参数：<var>callback</var>，<var>data</var>，其中<var>data</var>为<var>callback</var>函数传入的对象合并而成的大对象。可以在子级页面的<code>predata</code>中使用父级页面<code>predata</code>中获取的数据，可以在<code>data</code>中使用所有页面<code>predata</code>获取的数据，可以在<code>aftdata</code>中使用所有页面<code>predata</code>和<code>data</code>获取的数据。遵循调用链的顺序。</p>

<h3>中断调用链</h3>

<p>有时候，客户端可能传入错误的参数，导致页面无法查找到数据。这时需要返回404页面或者错误信息，此时可以中断数据获取调用链。</p>

<p>中断方法为在<var>callback()</var>调用中，传入<var>false</var>。中断调用链，返回404页面示例：</p>

<pre><code>//返回404页面
exports.data = function(callback, data){
  this.view(404); //返回404页面。
  callback(false); //中断调用链
};
</code></pre>


<p><kbd>注意：</kbd>请确保在中断前，已经向客户端返回了数据，否则客户端将一直处于等待状态，直到连接超时。</p>

<p>建议尽量少使用<code>predata</code>和<code>aftdata</code>，因为其调用是线性的，处理的时间为所有调用返回时间的总和。而所有<code>data</code>函数调用是“并发”的，其总时间大致与最慢的调用返回时间相等。</p>

<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>