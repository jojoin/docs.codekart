

<h1>安装及配置</h1>


<h3>安装</h3>

<p><dfn>Codekart</dfn> 的安装非常简单，除了事先安装好 <dfn>Node.js</dfn> 外，不需要任何的配置。</p>

<p>推荐采用<dfn>npm</dfn>方式安装，这会自动安装最新版的<dfn>Codekart</dfn>以及相关的依赖库（mysql，redis，ws等），当然也可以下载源码（需要自己安装依赖库），<a href="https://github.com/yangjiePro/Codekart/archive/master.zip">点击下载</a></p>

<p><a href="https://nodei.co/npm/codekart/"><img src="https://nodei.co/npm/codekart.png?downloads=true&satr=true"></a></p>

<p>下面是在linux下示例：</p>

<pre><code>$ cd /home                                   #进入你的安装目录
$ npm install codekart                       #下载安装(安装框架文件及mysql等依赖库，时间较长，请耐心等待)
$ mv /home/node_modules/codekart /home       #移动框架文件
$ mv /home/codekart /home/webname            #框架更名(webname为你的网站名称)
</code></pre>

<p><var>/home/webname</var>目录下即为框架文件，详细目录结构及说明请看<a href="/p/intro_dir">这里</a>。</p>


<p><kbd>注意：</kbd>本框架与<dfn>Express</dfn>等有所区别，你不能通过<code>require('codekart');</code>来使用它，
  而是在框架的<var>app</var>目录下做开发， Codekart 已经为你做好目录结构定义和代码模块化。</p>

<h3>启动</h3>

<pre><code>$ node /home/webname/index.js</code></pre>

<p>你也可以用后台方式启动：</p>

<pre><code>$ nohup node /home/webname/index.js > output.log &</code></pre>

<p>之后浏览器里打开<a href="http://localhost:82">http://localhost/:82，</a>
  可以看到Codekart框架的<a href="http://codekart.jojoin.com/">主页面</a>，表示框架就已经运行。。
</p>

<h3>配置</h3>

<p>但是如果在生产环境下，你需要修改文件<var>app/config/config.js</var>，以配置合适的内容。文件内容如下：</p>

<pre>
<code>//配置对象（全局）
module.exports = {

  //端口监听
  port: {
    http: 82,
    websocket: 92           // 如果将此端口号设为0，则不开启websocket服务
  },

  version: '01100',            // 程序版本号 用于更新改版后的 js css 客户端缓存

  worker: 2,                        // 开启的worker工作者线程的数量，当值为0则与CPU核心数量相同
  forkdelay: 1000,             // 当worker错误退出时  fork子进程的延迟时间（毫秒）

  ...  //更多配置


 };</code></pre>


<p>修改配置文件后需要重新启动。</p>

<p>更多关于配置文件的详细说明请查看<a href="/p/config">框架配置</a>。</p>