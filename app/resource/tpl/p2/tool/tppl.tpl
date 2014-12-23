
<h1>Tool工具箱 - tppl模板解析器</h1>

<p>你可以在你的项目中单独使用tppl，下载源码或查看更多使用教程和测试用例地址：</p>
<p><a href="https://github.com/yangjiePro/tppl" target="_black">https://github.com/yangjiePro/tppl</a></p>

<pre><code>var tppl = load.tool('!tppl');</code></pre>

<p>tppl 模板解析器前后端都可使用，后端tppl模块位于<var>framework/tool/tppl.js</var>，
  你可以采用<a href="/p/core_global">全局函数</a><dfn>load.tool('tppl');</dfn>来加载。
  前端tppl模块位于<var>framework/resource/js/tppl.ck.js</var>，在页面js中通过<dfn>C.tppl(str,data);</dfn>来使用。</p>

<p>变量的替换，使用示例：</p>

<pre><code>//tmpl模板使用示例
var tppl = load.tool('!tppl');

var div = tppl('&lt;div&gt;[=:name:]&lt;/div&gt;',{name:'abc'});

console.log(div); //&lt;div&gt;abc&lt;/div&gt;
</code></pre>

<p>在<dfn>[:</dfn>和<dfn>:]</dfn>之间的为js代码，你可以在其中做条件判断，循环，甚至定义变量和函数，
  也就是说，你可以在其中编写<dfn>javascript</dfn>的代码，类似<dfn>php</dfn>的<dfn>&lt;?php ?&gt;</dfn>包裹符。
  当使用<dfn>[=:</dfn>(加上等号)时，表示以字符串形式输出这个变量：</p>

<pre><code>//tmpl模板使用示例
var tppl = load.tool('tppl');

var tpl = '[: for(var k in ary){ var one=ary[k]; :]'
        + '&lt;p&gt;[=:one:]&lt;/p&gt;'
        + '[: } :]';
var data = {ary:[123,'abc']};

var div = tppl(tpl,data);

console.log(div); //&lt;p&gt;123&lt;/p&gt;&lt;p&gt;abc&lt;/p&gt;
</code></pre>

<p>如果在模板中使用了一个未定义的变量，解析过程就会报错。
  tmpl提供了一个<var>this</var>对象，它以属性的形式包含当前全部变量，
  你可以像下面这样使用它：</p>

<pre><code>
var tppl = load.tool('!tppl');

var tpl = '[: if(this.name!==undefined){ :]' //注意必须使用 this.name，直接使用name，如果未定义就会报错
+ '&lt;p&gt;[=:name:]&lt;/p&gt;'
+ '[: } :]';
var data = {name:'abc'};

var div = tppl(tpl,data);
</code></pre>

<p>你还可以这样方便地使用未定义的变量：<p>

<pre><code>
var tppl = load.tool('!tppl');

var tpl = '&lt;p&gt;name:[=:this.name||"默认值":]&lt;/p&gt;';
var data = {no:'abc'};
var div = tppl(tpl,data);

//name:默认值&lt;/p&gt;
</code></pre>

<p><dfn>[:if(this.name||""){}:]</dfn>表示在变量<var>name</var>未定义时，不抛出错误，而输出空字符串。
<dfn>[=:this.name||"默认值":]</dfn>表示在<var>name</var>未定义时，输出字符串：<dfn>默认值</dfn>。</p>


<p>如果需要多次解析同一个模板，则可以将模板编译的结果缓存起来，
使用时直接代入变量。tmpl模板解析分两步，第一步将tpl模板字符串编译成一个函数字符串，
这需要大量的正则替换，耗时较长；第二步执行<dfn>new Function()</dfn>将变量代入，返回最终结果。
缓存就是将第一步生成的函数字符串保存起来，避免多次正则替换，节省大部分运算。使用如下：</p>

<pre><code>
var tppl = load.tool('tppl');

var tpl = '[: for(var k in ary){ var one=ary[k]; :]'
+ '&lt;p&gt;[=:one:]&lt;/p&gt;'
+ '[: } :]';
var data = {ary:[123,'abc']};

var render = tppl(tpl); //不传入data，则生成缓存，多次使用缓存节约大量正则运算

var div = render(data); //传入data，代入变量，解析成最终结果

console.log(div); //&lt;p&gt;123&lt;/p&gt;&lt;p&gt;abc&lt;/p&gt;
</code></pre>

