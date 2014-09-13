
<h1>扩展控制器处理程序<dfn>this</dfn>对象</h1>



<p><a href="/p/core_callthis">controller this对象</a>提供了常用的cookie处理、返回数据或json字符串等方法。
你可以自定义扩展此<var>this</var>对象，以获得更强大更全面的功能。</p>


<p>扩展方法很简单，修改文件<var>app/core/this.js</var>（不存在则新建一个），添加以下内容：</p>

<pre><code>/**
 * 扩展控制器处理程序 this 对象
 */
exports.return_str = function(str){

  // 在此处可以使用系统的核心功能
  
  log('response!');
  this.render('end by extend !!!  data: '+str);
  //this.response.end('end by extend !!!data: '+str);
}
 
</code></pre>


<p>在控制器中使用：修改文件<var>app/controller/index.js</var>，添加</p>

<pre><code>/**
 * 控制器
 */
exports.test_core_extend = function(){
  // 在此处调用你自定义的扩展程序
  this.return_str('my string !');
}
 
</code></pre>

<p>保存修改后重启Codekart，访问<a>http://yourdomain.com/index/test_core_extend</a>，即可在浏览器看到输出<code>end by extend !!!data: my string !</code></code></p>


<p>上面的内容只是简单的调用系统的返回数据方法，返回自定义的数据。你可以进行更复杂的封装。</p>

<p>这里的扩展内容，可以在所有控制器处理程序和<a href="/p/view_data">view页面数据</a>处理<var>this</var>对象中使用！。</p>

<p><dfn>注意：</dfn>自定义<var>this</var>对象扩展的方法，如果与框架提供的方法名相同，则框架的方法将被覆盖！</p>
