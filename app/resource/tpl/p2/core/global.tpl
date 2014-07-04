
<h1>全局函数</h1>

<p>Codekart 包含很少一部分全局函数和对象，作为对整个框架的基础性支持，
  可以在框架的任意地方很方便的使用他们 。在<var>framework/function.js</var>里面定义。</p>

<h3><b>load对象</b> - 模块加载</h3>

<p>load 对象用来加载一些特定的模块，是全局函数<code>require</code>的封装。它包含一些方法：</p>

<h4>load.core(name,ext);</h4>

<p>加载位于<var>framework/core/</var>下的框架核心模块，<var>name</var>为文件名，
  可以是一个路径，比如<var>name</var>为<var>view/data</var>，即加载<var>framework/core/view/data.js</var>文件，下同。
  <var>ext</var>为文件类型后缀，不传默认为<var>js</var>，注意不需要点号，
  比如正确的是<code>load.core('file','js')</code>而不是<code>load.core('file','.js')</code>，下同。</p>


<h4>load.db(name,ext);</h4>

<p>加载位于<var>framework/core/db</var>下的数据库支持模块。</p>

<h4>load.model(name,ext);</h4>

<p>加载位于<var>app/model/</var>下的<dfn>model</dfn>模块。</p>

<h4>load.lib(name,ext);</h4>

<p>首先搜索<var>app/lib/</var>目录，按顺序查看是否存在<var>name.js</var>或<var>name/index.js</var>或<var>name/name.js</var>文件，
  如果不存在则按同样方式搜索<var>framework/lib</var>目录，仍然不存在则会报错，
  注意：最先搜索的的模块将被默认使用，比如在存在<var>framework/lib</var>下已存在<dfn>less</dfn>模块，
  如果<var>app/lib</var>下也存在一个同名的<dfn>less</dfn>模块，程序只会加载<var>framework/lib</var>下的。
  <code>load.tool()</code>和<code>load.config()</code>按相同的方式处理。</p>

<h4>load.tool(name,ext);</h4>

<p>首先搜索<var>app/tool/</var>目录，如果不存在则搜索<var>framework/tool</var>目录，仍然不存在则会报错。</p>

<p>关于<var>framework</var>目录中，<var>lib</var>和<var>tool</var>的存放模块的类型，
遵循如下规则：<var>lib</var>放置外部第三方模块，例如一些开源的库，
不需要修改它们的代码，只是直接拿来使用的。<var>tool</var>目录下的模块，
是在开发过程中提炼出来可被重用的工具和方法，作为一个工具箱归类保存。
      <var>app</var>目录下的<dfn>lib</dfn>和<dfn>tool</dfn>模块，建议使用同样的分类方式。</p>

<h4>load.config(name,ext);</h4>

<p>首先搜索<var>app/config/</var>目录，如果不存在则搜索<var>framework/config</var>目录，
  它们是一些配置文件，或者数据结构定义，或者常量等等。</p>

<p><code>load.lib()</code>、<code>load.tool()</code>、<code>load.config()</code>三个函数，
  都是默认优先加载<var>app</var>路径下的对应模块，
  如果需要优先加载<var>framework</var>下的模块，则在name参数前加一个!感叹号，
  比如<var>app/tool</var>和<var>framework/tool</var>下都存在<var>array.js</var>文件，
    <code>load.tool('array')</code>会加载<var>app/tool</var>下面的，
  而<code>load.tool('!array')</code>会加载<var>framework/tool</var>下面的。
  <kbd>注意：</kbd><b>由于这种模式，新建文件和文件夹类不能带有<var>!</var>感叹号，否则会引起冲突。</b></p>

<h4>load.view(name,ext);</h4>

<p>加载<var>app/view</var>或<var>framework/view</var>下的<a href="/p/core_view">web页面配置</a>模块。</p>

<h3><b>read对象</b> - 资源文件读取</h3>

<p>read 对象用来读取一些资源文件等等。它包含一些方法。</p>

<h4>read.resource(filename,opt,callback)</h4>

<p>加载<var>app/resource</var>下或者<var>framework/resource</var>下的文件，
  参数<var>filename</var>为文件路径，必须带扩展名。加载方式跟<code>load.config()</code>等相似，
  只不过返回的内容不是模块对象，而是磁盘文件的内容。
  <var>callback</var>是回调函数，如果定义了<var>callback</var>，则以异步方式加载，
  并在<code>callback(err,data)</code>回调中传入错误信息和文件内容。
  如果为传入<var>callback</var>则以同步方式加载，则在<code>read.resource(...)</code>同步返回文件内容。
  <kbd>注意：</kbd><var>filename</var>参数前加!感叹号，也表示优先加载<var>framework</var>下的。</p>

<h4>read.config(filename,opt,callback)</h4>

<p>与<code>read.resource</code>相同，但是加载<var>config</var>目录下的文件。</p>

<h4>read.app(filename,opt,callback)</h4>

<p><code>read.app()</code>为<dfn>read</dfn>加载的父级方法，通过<var>filename</var>参数，
  你可以加载<var>app</var>目录下的任意文件，
  比如<code>read.app('lib/user.js')</code>就会读取并返回<var>app/lib/user.js</var>的文件内容，
  如果不存在文件，就会返回<var>null</var>。</p>

<h3>其他</h3>

<h4>inheritView(parent,stuff)</h4>

<p>继承web页面，在<a href="/p/view_inherit">web页面继承</a>下有说明。</p>

<p><h4>time(ms)</h4>

<p>返回当前的时间戳(秒)，如果参数ms为真，则返回毫秒。</p>













