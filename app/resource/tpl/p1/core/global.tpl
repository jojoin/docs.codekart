
<h1>全局函数</h1>

<p>Codekart 包含很少一部分全局函数，作为对整个框架的基础性支持，
  可以在框架的任意地方很方便的使用他们 。在<var>framework/function.js</var>里面定义。</p>

<h3>模块加载</h3>

<p><big>require_core(name,ext);</big></p>

<p>加载位于<dfn>framework/core/</dfn>下的框架核心模块，<var>name</var>为文件名，
  可以是一个路径，比如<var>name</var>为<dfn>view/data</dfn>，即加载<var>framework/core/view/data.js</var>文件，下同。
  <var>ext</var>为文件类型后缀，不传默认为<var>js</var>，注意不需要点号，
  比如正确的是<dfn>require_core('file','js')</dfn>而不是<dfn>require_core('file','.js')</dfn>，下同。</p>

<p><big>require_model(name,ext);</big></p>

<p>加载位于<dfn>app/model/</dfn>下的<var>model</var>模块。</p>

<p><big>require_lib(name,ext);</big></p>

<p>首先搜索<dfn>app/lib/</dfn>目录，按顺序查看是否存在<var>name.js</var>或<var>name/index.js</var>或<var>name/name.js</var>文件，
  如果不存在则按同样方式搜索<dfn>framework/lib</dfn>目录，仍然不存在则会报错，
  注意：最先搜索的的模块将被默认使用，比如在存在<dfn>framework/lib</dfn>下已存在<var>less</var>模块，
  如果<dfn>app/lib</dfn>下也存在一个同名的<var>less</var>模块，程序只会加载<dfn>framework/lib</dfn>下的。
  <dfn>require_tool</dfn>和<dfn>require_config</dfn>按相同的方式处理。</p>

<p><big>require_tool(name,ext);</big></p>

<p>首先搜索<dfn>app/tool/</dfn>目录，如果不存在则搜索<dfn>framework/tool</dfn>目录，仍然不存在则会报错。</p>

<p>关于<dfn>framework</dfn>目录中，<dfn>lib</dfn>和<dfn>tool</dfn>的存放模块的类型，
遵循如下规则：<dfn>lib</dfn>放置外部第三方模块，例如一些开源的库，
不需要修改它们的代码，只是直接拿来使用的。<dfn>tool</dfn>目录下的模块，
是在开发过程中提炼出来可被重用的工具和方法，作为一个工具箱归类保存。
      <dfn>app</dfn>目录下的<dfn>lib</dfn>和<dfn>tool</dfn>模块，建议使用同样的分类方式。</p>

<p><big>require_config(name,ext);</big></p>

<p>首先搜索<dfn>app/config/</dfn>目录，如果不存在则搜索<dfn>framework/config</dfn>目录，
  它们是一些配置文件，或者数据结构定义，或者常量等等。</p>

<p><dfn>require_lib</dfn>、<dfn>require_tool</dfn>、<dfn>require_config</dfn>三个函数，
  都是默认优先加载<dfn>app</dfn>路径下的对应模块，
  如果需要优先加载<dfn>framework</dfn>下的模块，则在name参数前加一个!感叹号，
  比如<dfn>app/tool</dfn>和<dfn>framework/tool</dfn>下都存在<var>array.js</var>文件，
    <dfn>require_tool('array')</dfn>会加载<dfn>app/tool</dfn>下面的，
  而<dfn>require_tool('!array')</dfn>会加载<dfn>framework/tool</dfn>下面的。
  <kbd>注意：</kbd><b>由于这种模式，新建文件和文件夹类不能带有<dfn>!</dfn>感叹号，否则会引起冲突。</b></p>

<p><big>require_view(name,ext);</big></p>

<p>加载<dfn>app/view</dfn>或<dfn>framework/view</dfn>下的<a href="/p/core_view">web页面配置</a>模块。</p>

<h3><b>load对象</b> - 资源文件加载</h3>

<p>load对象用来加载一些资源文件等等。它包含一些方法。</p>

<p><big>load.resource(filename,opt,callback)</big></p>

<p>加载<dfn>app/resource</dfn>下或者<dfn>framework/resource</dfn>下的文件，
  参数<var>filename</var>为文件路径，必须带扩展名。加载方式跟<dfn>require_config</dfn>等相似，
  只不过返回的内容不是模块对象，而是磁盘文件的内容。
  <var>callback</var>是回调函数，如果定义了<var>callback</var>，则以异步方式加载，
  并在<dfn>callback(err,data)</dfn>回调中传入错误信息和文件内容。
  如果为传入<var>callback</var>则以同步方式加载，则在<dfn>load.resource(...)</dfn>同步返回文件内容。
  <kbd>注意：</kbd><var>filename</var>参数前加!感叹号，也表示优先加载<dfn>framework</dfn>下的。</p>

<p><big>load.config(filename,opt,callback)</big></p>

<p>与<dfn>load.resource</dfn>相同，但是加载<dfn>config</dfn>目录下的文件。</p>

<p><big>load.ex(filename,opt,callback)</big></p>

<p><dfn>load.ex</dfn>为<dfn>load</dfn>加载的父级方法，通过<var>filename</var>参数，
  你可以加载<dfn>app</dfn>或者<dfn>framework</dfn>任意目录下的文件，
  比如<dfn>load.ex('lib/user.js')</dfn>就会读取并返回<dfn>app/lib/user.js</dfn>的文件内容，
  如果不存在文件，就会返回<var>null</var>。</p>


<h3>其他</h3>

<p><big>inheritView(parent,stuff)</big></p>

<p>继承web页面，在<a href="/p/core_web_inherit">web页面继承</a>下有说明。</p>

<p><big>time(ms)</big></p>

<p>返回当前的时间戳(秒)，如果参数ms为真，则返回毫秒。</p>













