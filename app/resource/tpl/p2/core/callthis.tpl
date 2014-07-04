
<h1>控制处理程序<dfn>this</dfn>对象</h1>

<p>在<a href="/p/core_controller">controller</a>控制器处理方法和<a href="/p/view_index">web页面</a>的模板数据获取函数处理
  <a href="/p/view_data">data方法</a>中，它们的本地<dfn>this</dfn>对象经过了框架的扩展，
  可以很方便的访问数据以及调用封装的函数。</p>


<p>例如<var>app/controller/text.js</var>控制器的处理方法<var>exports.test</var>，它的<dfn>this</dfn>对象内容如下：</p>

<h4>this.request</h4>
<p>Codekart<a href="/p/core_request">扩展的request</a>对象。</p>

<h4>this.response</h4>
<p>Node.js原生response对象。</p>

<h3>向客户端返回数据</h3>

<h4>this.render(str)</h4>
<p>向浏览器返回字符串内容。</p>

<h4>this.renderJson(jsonStr)</h4>
<p>向浏览器返回<dfn>JSON</dfn>格式的字符串内容。</p>


<h4>this.renderApi(code,msg,data)</h4>
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

<h4>this.render302(url)</h4>
<p>返回302页面重定向，参数<var>url</var>为将要跳转过去的页面url地址。</p>

<h4>this.renderJump(url)</h4>
<p>通过页面javascript方式跳转页面，参数<var>url</var>为将要跳转过去的页面url地址。</p>

<h4>this.view(path)</h4>
<p>重定向视图处理程序，<var>path</var>为页面配置文件路径，
  例如<var>path</var>为<var>"home"</var>时，对应配置文件为<var>app/view/home.js</var>。</p>


<h3>处理cookie</h3>

<h4>this.setCookie(name, value, expires, path, domain)</h4>
<p>设置cookie。</p>

<h4>this.delCookie(name)</h4>
<p>删除cookie。</p>

<h3>其他</h3>

<h4>this.formdata(callback)</h4>
<p>处理提交表单数据。<var>callback</var>接收三个参数：</p>
<pre><code>//表单数据处理回调
function(err, fields, files){
  // @err 是否出现错误
  // @fields 表单的普通文本字段数据
  // @files 表单的文件上传
}
</code></pre>
<p>其中<var>files</var>参数格式如下：</p>
<pre><code>{
  upload:{ // &lt;input&gt; 标签的 name 值
    domain: null,
    _events: {},
    _maxListeners: 10,
    size: 307905,  // 文件大小
    path: '/tmp/46212f78b8ce64721d57b83111d3e829',  // 上传文件的临时文件
    name: '1.jpg', // 源文件名
    type: 'image/jpeg',
    hash: null,
    lastModifiedDate: Fri Jul 04 2014 15:51:32 GMT+0800 (...),
    _writeStream: [Object]
  },
  ... // 更多上传的文件
}</code></pre>

<p><dfn>注意：</dfn>如果你仅仅想</p>


