

<h1>安装及配置</h1>

<p>Codekart 的安装非常简单，除了事先安装好 Node.js 外，不需要任何的配置。</p>

<p>以 Linux 为例，把整个框架拷贝至/home/codekart后，
  在shell命令行下执行node /home/codekart/index.js(把index.js文件地址换成实际位置)，
  然后再浏览器里打开<a href="http://localhost/:82">http://localhost/:82，</a>
  可以看到CodeTank框架的<a href="http://codekart.jojoin.com/">主页面</a>，表示框架就已经运行。。
</p>

<p>但是如果在生产环境下，你需要修改文件 app/config/config.js ，以配置合适的内容。文件内容如下：</p>

<pre>
<code>//配置对象（全局）
module.exports = {

    //端口监听
    port: {
        http: 83,            //线上环境修改为80
        websocket: 93
    },

    version: '12141',        //程序版本号 用于更新改版后的 js css 客户端缓存
    route: true,             //是否开启默认路由匹配（在未定义url处理程序的情况下，搜索文件位置查找处理程序）
    cluster: false,          //是否开启多核支持、守护进程
    worker: 1,               //开启的worker工作者线程的数量，需要开启上面的cluster才生效，当值为0则与CPU核心数量相同
    debug: true,             //是否为调试模式  调试会将错误抛出终止进程
    compiled: true,          //是否总是编译html、js、css等页面文件（比较耗时，debug时使用）
    compress: false,         //是否压缩js、css文件（比较耗时，debug时关闭）
    expires: 60*60*24        //静态文件客户端缓存时间，单位为秒

};</code></pre>