
<h1>框架初始化</h1>

<p>当框架启动的时候，需要完成一些例如目录检查等的初始化操作。</p>

<p>框架启动流程如下：</p>

<pre><code>  node index.js //启动入口
<dfn>↓</dfn>
  framework/function.js //加载全局对象及函数
<dfn>↓</dfn>
  framework/core/init.js //框架初始化
<dfn>↓</dfn>
  <kbd>app/core/init.js</kbd> //【用户代码初始化】
<dfn>↓</dfn>
  framework/core/route.js //加载路由规则
<dfn>↓</dfn>
  framework/core/server.js //启动http服务器
</code></pre>

<p>在<var>app/core/init.js</var>里添加你的初始化代码，例如完成日志文件的清理、数据库的连接、资源文件的检查等等工作。</p>

<p>当使用<dfn>cluster</dfn>模块开启多进程时，一些如路径检查的工作的只需要进行一次，而数据库连接等工作则需要每个 Worker 进程初始化一次，则<var>init.js</var>可以为：</p>

<pre><code>//启动初始化
var cluster = require('cluster');

/**
* master 进程初始化工作
*/
if(cluster.isMaster){

  // 仅在 master 进程下执行一次

/**
* worker 进程初始化工作
*/
}else if(cluster.isWorker){

  // 每个 worker 进程初始化一次

}

</code></pre>