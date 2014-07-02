

<h1>安装及配置</h1>


<h3>安装</h3>

<p>Codekart 的安装非常简单，除了事先安装好 Node.js 外，不需要任何的配置。
  注意：本框架与<dfn>Express</dfn>等有所区别，你不能通过<code>require('codekart');</code>来使用它，
而是在它的目录下做开发（原因是 Codekart 已经为你做好目录结构定义和代码模块化等工作）。</p>

<p><a href="https://nodei.co/npm/codekart/"><img src="https://nodei.co/npm/codekart.png?downloads=true&satr=true"></a></p>

<p>通过<dfn>npm</dfn>方式安装，下面是在linux下示例：</p>

<pre><code>cd /home                                   #进入你的安装目录
npm install codekart                       #下载安装(安装框架文件及mysql等依赖库，时间较长，请耐心等待)
mv /home/node_modules/codekart /home       #移动框架文件
mv /home/codekart /home/webname            #框架更名(webname为你的网站名称)
</code></pre>

<p><var>/home/webname</var>目录下即为框架文件，详细目录结构及说明请看<a href="/p/dir">这里</a>。</p>

<h3>启动</h3>

<p>在shell命令行下执行<code>node /home/webname/index.js</code>(把index.js文件地址换成实际位置)，
  然后再浏览器里打开<a href="http://localhost/:82">http://localhost/:82，</a>
  可以看到Codekart框架的<a href="http://codekart.jojoin.com/">主页面</a>，表示框架就已经运行。。
</p>

<h3>配置</h3>

<p>但是如果在生产环境下，你需要修改文件<var>app/config/config.js</var>，以配置合适的内容。文件内容如下：</p>

<pre>
<code>//配置对象（全局）
module.exports = {

    //端口监听
    port: {
        http: 82,            //线上环境修改为80
        websocket: 92
    },

    version: '12141',        //程序版本号 用于更新改版后的 js css 客户端缓存
    cluster: false,          //是否开启多核支持、守护进程
    worker: 1,               //开启的worker工作者线程的数量，需要开启上面的cluster才生效，当值为0则与CPU核心数量相同
    debug: true,             //是否为调试模式  调试会将错误抛出终止进程
    compiled: true,          //是否总是编译html、js、css等页面文件（比较耗时，debug时使用）
    compress: false,         //是否压缩js、css文件（比较耗时，debug时关闭）
    expires: 60*60*24        //静态文件客户端缓存时间，单位为秒

};</code></pre>


<p>修改配置文件后需要重新启动。</p>