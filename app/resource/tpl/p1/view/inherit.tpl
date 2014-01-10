
<h1>web页面 - 继承</h1>

<p>在<a href="/p/view_index">web页面模块化配置</a>中，你已经了解了最基本的页面模块化配置文件的使用。
  <var>html.js</var>给出的是一个“顶级”页面的配置。</p>

<p>在实际项目开发中，比如一个公司网站，我们经常需要一个全站统一的带有logo的页面头部，以及一个带有公司地址和联系方式的
页面底部，它们会出现在公司网站的任何一个页面，而开发者希望只需要在一个地方定义和修改，这时页面继承就显得十分必要。</p>

<p>使用 Codekart 可以方便的配置页面的继承关系，继承的内容包括
  <dfn>tpl模板</dfn>、<dfn>css</dfn>、<dfn>js</dfn>和<dfn>模板数据</dfn>。</p>

<p>下面是一个继承至<var>html.js</var>的页面<var>frame/view/home.js</var>，配置方法与顶级页面有所不同。</p>

<pre><code>//当前页面增加的配置
var stuff = {
  tpl:{body:'home'},
  less:'home'
};

//【继承关键代码】
//继承父级页面 和 必须给本模块加上对外接口，以便其他页面继承
exports.stuff = inheritView('html',stuff);  //继承至view/html.js
//exports.stuff = inheritView('html/frame',stuff);  //继承至view/html/frame.js


/**
* 页面模板数据获取
* 可以不定义此函数，程序将跳过本页面的数据获取
* @callback 必须调用 ，表示数据获取完成，进行子级页面数据获取，不调用则会一直等待不能进行下一步！！！
* 在callback中返回的变量可以在tpl模板中使用，在这里可以进行数据库的查询等等。
* 复杂的数据获取和运算，建议放在`app/model`中的模块中进行，在这里可以调用`require_model('model')`加载。
*/
exports.data = function(callback){
  callback({
    title: 'Codekart  欢迎使用Node.js前后端一体化开发框架 ！'
  });
};
</code></pre>


<p>你已经注意到，继承的页面使用<dfn>inheritView(parent,stuff)</dfn>继承函数，
  参数<var>parent</var>是被继承的父级页面，参数<var>stuff</var>是当前页面增加的配置。</p>


<p>在<a href="/p/view_inherit">页面继承</a>，
  <a href="/p/view_tpl">tpl模板</a>，<a href="/p/view_data">模板数据</a>，
  <a href="/p/view_css">css及库</a><a href="/p/view_js">js及库</a>，
  <a href="/p/view_other">统计代码及其它</a>文档内查看web页面配置最详细的使用方法。</p>









