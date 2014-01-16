
<h1>controller 请求处理</h1>

<p>Codekart 是一个十分便捷的 MVC 框架。他已经帮你出色的完成了url请求处理程序的的路由。你只需要在
<var>app/controller/</var>目录下添加相应处理程序即可，示例如下：</p>

<p>* 访问地址：<a href="http://localhost/test">http://localhost/test</a>，控制器文件：<var>app/controller/test.js</var>，
  处理函数：<code>exports.index = function(){/*do ...*/};</code>，处理函数默认为<code>exports.index();</code></p>

<p>例如以上，要处理<var>http://localhost/test</var>请求，
  首先在<var>app/controller/</var>添加<var>text.js</var>文件，文件内容如下：</p>

<pre><code>//请求控制器
exports.index = function(){

    /*do something ...*/
    var that = this  //this对象，集成request、response和请求返回等，详细见下文。
       , req = this.request  //Codekart扩展的request对象
       , res = this.response;  //Node.js原生response对象

    //向浏览器返回json格式的数据
    that.renderJson({str:'i am action of controller'});

    //向浏览器返回请求到达的时间
    /*
    var time = req.time;
    that.render(time);
    */

    //你也可以通过 this.response 对象自定义返回内容
};
</code></pre>

<p>请求还可以路由到多层目录，例如：</p>

<p>* 访问地址：<a href="http://localhost/ctrl/test">http://localhost/ctrl/test</a>，
  控制器文件：<var>app/controller/ctrl.js</var>，
  处理函数：<code>exports.test = function(){/*do ...*/};</code></p>

<p>* 访问地址：<a href="http://localhost/ctrl/mytest">http://localhost/ctrl/mytest</a>，
  控制器文件：<var>app/controller/ctrl.js</var>，
  处理函数：<code>exports.mytest = function(){/*do ...*/};</code></p>

<p>* 访问地址：<a href="http://localhost/path/ctrl/test">http://localhost/path/ctrl/test</a>，
  控制器文件：<var>app/controller/path/ctrl.js</var>，
  处理函数：<code>exports.test = function(){/*do ...*/};</code></p>

<p>* 访问地址：<a href="http://localhost/area/path/ctrl/test">http://localhost/area/path/ctrl/test</a>，
  控制器文件：<var>app/controller/area/path/ctrl.js</var>，
  处理函数：<code>exports.test = function(){/*do ...*/};</code></p>

<p>* 访问地址：<a href="http://localhost/ctrl/test?para=value">http://localhost/ctrl/test?para=value</a>，
  控制器文件：<var>app/controller/ctrl.js</var>，
  处理函数：<code>exports.test = function(){/*do ...*/};</code></p>

<p>如果需要在<var>pathname</var>中附带参数，例如<var>http://localhost/user/12/info</var>
  与<var>http://localhost/user/25/info</var>采用同一个控制器<var>app/controller/user/info.js</var>处理，
  并且取得参数（用户id“12”），
则需要<a href="/p/core_route">配置</a>路由。</p>

<h3>view 页面请求路由</h3>

<p><a href="/p/view_index">web页面</a>可以模块化配置，请求的url也需要单独<a href="/p/core_route">配置</a>。</p>

<h3>controller 控制器处理程序<dfn>this</dfn>对象</h3>

<p>例如<var>app/controller/text.js</var>控制器的处理方法<var>exports.test</var>，它的<dfn>this</dfn>对象经过了框架的扩展，
  详细内容<a href="/p/core_callthis">点这里</a>。</p>
