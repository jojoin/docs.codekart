
<h1>控制处理程序<dfn>this</dfn>对象</h1>

<p>在<a href="/p/core_controller">controller</a>控制器处理方法和<a href="/p/view_index">web页面</a>的模板数据获取函数处理
  <a href="/p/view_data">data方法</a>中，它们的本地<dfn>this</dfn>对象经过了框架的扩展，
  可以很方便的访问数据以及调用封装的函数。</p>


<p>例如<var>app/controller/text.js</var>控制器的处理方法<var>exports.test</var>，它的<dfn>this</dfn>对象内容如下：</p>

<big>this.request</big>
<p>Codekart<a href="/p/core_request">扩展的request</a>对象。</p>

<big>this.response</big>
<p>Node.js原生response对象。</p>

<big>this.render(str)</big>
<p>向浏览器返回字符串内容。</p>

<big>this.renderJson(jsonStr)</big>
<p>向浏览器返回<dfn>JSON</dfn>格式的字符串内容。</p>


<big>this.renderApi(code,msg,data)</big>
<p>向浏览器返回特定的<dfn>JSON</dfn>格式的字符串内容，格式如下：</p>

<pre><code>//api返回的json格式
  {
    code: 200,
    msg: 'your msg str',
    data: {
      user_id: 123
    }
  }
</code></pre>

<p></p>

<big>this.render302(url)</big>
<p>返回302页面重定向，参数<var>url</var>为将要跳转过去的页面url地址。</p>

<big>this.renderJump(url)</big>
<p>通过页面javascript方式跳转页面，参数<var>url</var>为将要跳转过去的页面url地址。</p>

<big>this.view(path)</big>
<p>重定向视图处理程序，<var>path</var>为页面配置文件路径，
  例如<var>path</var>为<var>"home"</var>时，对应配置文件为<var>app/view/home.js</var>。</p>



<big>this.setCookie(name, value, expires, path, domain)</big>
<p>设置cookie。</p>

<big>this.setCookie(name, value, expires, path, domain)</big>
<p>设置cookie。</p>

<big>this.delCookie(name)</big>
<p>删除cookie。</p>