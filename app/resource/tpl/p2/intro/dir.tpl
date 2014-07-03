
<h1>框架目录结构说明</h1>

<p>框架目录大致分为<var>app</var>、<var>framework</var>、<var>static</var>和其他，
  一般情况下，你只需要在<var>app</var>目录下添加修改文件，
  <var>framework</var>目录下存放的是框架核心文件，除非发现严重BUG等特殊情况，一般不应该修改或删除其中的文件，
  否则可能<b>导致框架无法使用！</b></p>

<pre><code>│
├─ app ┐ //程序文件夹,开发工作在此进行
│       ├─ config ┐  //配置文件夹
│       │          ├─ development ┐ //自定义配置文件夹
│       │          │
│       │          ├─ config.js  //常用配置文件（如监听端口、开启debug模式等）
│       │          ├─ define.js  //定义的一些常量 （如mysql或redis的key名称等）
│       │          ├─ database.js  //数据库配置文件夹
│       │          ├─ route.js   //url路由文件夹，定义或重定向url请求处理程序
│       │          ├─ log.js   //日志文件配置
│       │          ├─ email.js   //smtp 邮件发送配置
│       │          └─ website.js //网站信息，如名称、域名等
│       │
│       ├─ controller ┐  //请求处理控制器
│       ├─ lib ┐     //库模块文件夹，用来放置第三方的库或模块
│       ├─ tool ┐    //工具箱，放置自己写的常用工具或方法等
│       ├─ model ┐   //数据处理模块，一般和数据库操作相关
│       ├─ view ┐    //web页面配置(选择css、js、tpl模块，获取html模板数据)
│       ├─ websocket ┐   //websocket数据处理控制器
│       └─ resource ┐  //web页面素材
│                     ├─ js   //js前端页面模块
│                     ├─ css  //css前端页面模块
│                     └─ tpl  //html模板前端页面模块
│
├─ framework ┐
│             ├─ config ┐   //框架配置文件夹
│             ├─ core ┐  //框架核心
│             │        ├─ db ┐    //数据库支持核心
│             │        ├─ server ┐    //框架核心（服务器，路由等）
│             │        └─ view ┐  //web页面编译核心
│             ├─ lib ┐  //框架库
│             ├─ resource ┐ //框架资源
│             └─ tool ┐  //框架工具
│
├─ static ┐  //静态文件目录(放置所有的静态文件，比如图片、js库、favicon.ico等等)
│          ├─ css ┐     //css引用文件，codetank编译的css模块，组合压缩成一个文件，放置在此处
│          ├─ cssimg ┐  //css图片，在编写css时，<%cssimg%>将被编译程序替换成这里的路径
│          ├─ csslib ┐  //css第三方库文件 如 button.css 等
│          ├─ js ┐      //js引用文件，codetank编译的js模块，组合压缩成一个文件，放置在此处
│          ├─ jslib ┐   //js第三方库文件，如 JQuery.js 等
│          └─ webfont ┐ //web字体
│
├─ node_modules  //Node.js 第三方模块 比如node-mysql、mongoose等(可放置在其他node包处理器可索引的位置)
│
│
</code></pre>