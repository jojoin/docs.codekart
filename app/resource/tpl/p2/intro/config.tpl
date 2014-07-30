
<h1>框架配置</h1>

<h3>配置加载</h3>

<p>通用配置文件存放在<var>app/config/</var>目录下，每一个配置文件的每一项都会有说明，可按需要修改这些配置。也可以在这个目录下添加自己的自定义配置文件，然后通过<a href="/p/core_global">全局函数</a>来加载配置：</p>

<pre><code>// name 为需要加载的配置名称
var config = load.config(name); //参数 name 默认为 'config' ，可不传</code></pre>

<h3>多目录配置</h3>

<p>如果你需要针对开发环境、测试环境和线上生产环境等等定义不同的配置（制定监听端口或缓存时间等），并且还有一些通用/共用的配置需要共享，这时就需要多目录配置了。在<var>app/config/</var>目录下添加<var>development/</var>、<var>test/</var>和<var>production/</var>三个目录，分别定义开发、测试和生产环境的不同配置，然后将<var>app/config/config.js</var>复制到<var>app/config/development/config.js</var>目录下（或者<var>test</var>/<var>production</var>），然后打开框架的入口文件<var>index.js</var>，找到下面这一行：</p>

<pre><code>//global.ENVIRONMENT = '';
//global.ENVIRONMENT = 'production';
//global.ENVIRONMENT = 'test';
global.ENVIRONMENT = 'development';</code></pre>

<p>在此处修改你的当前的配置路径，如果<var>ENVIRONMENT</var>为空，则使用<var>app/config/</var>目录而不是自定义的目录。</p>

<p>你只需要将需要针对不同环境定制的配置文件复制到自定义目录下，通用的配置则统一放置在<var>app/config/</var>目录即可。例如，当<var>config_path</var>为<var>development</var>时，框架会优先加载<var>app/config/development/</var>目录下的配置文件，如果不存在则去<var>app/config/</var>下寻找，仍然不存在则会报错。
</p>

<p>当然，你也可以不添加目录和文件，在配置文件内部做区分。例如<var>config.js</var>：</p>

<pre><code>//针对不同的环境定义不同的配置：

if(ENVIRONMENT=='development'){

  exports.debug = true; //是否为调试模式

}else if(ENVIRONMENT=='production'){

  exports.debug = false;

}else if(ENVIRONMENT=='test'){

  exports.debug = true;

}
</code></pre>

<p>两种方式各有优缺点，按需选择。</p>

<h3>配置文件格式</h3>

<p>如同普通的<dfn>Node.js</dfn>模块一样，配置文件在底层通过<code>require(model);</code>函数加载，可以在配置文件中填写任意js代码，只需要加入<code>exports</code>对外接口即可。如果需要，你可以在运行时修改配置内容。</p>
<p></p>
