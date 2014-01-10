
<h1>Tool工具箱 - tmpl模板解析器</h1>

<pre><code>var tmpl = load.tool('tmpl');</code></pre>

<p>tmpl模板解析器前后端都可使用，后端tmpl模块位于<var>framework/tool/tmpl.js</var>，
  你可以采用<a href="/p/core_global">全局函数</a><dfn>var tmpl = load.tool('tmpl');</dfn>来加载。
  前端tmpl模块位于<var>app/resource/js/tmpl.js</var>，通过<dfn>CK.tmpl(str,data);</dfn>来使用。</p>

<p>变量的替换，使用示例：</p>

<pre><code>//tmpl模板使用示例
var tmpl = load.tool('tmpl');

var div = tmpl('&lt;div&gt;[#=name#]&lt;/div&gt;',{name:'abc'});

console.log(div); //&lt;div&gt;abc&lt;/div&gt;
</code></pre>

<p>在<dfn>[#</dfn>和<dfn>#]</dfn>之间的为js代码，你可以在其中做条件判断，循环，甚至定义变量和函数，
  也就是说，你可以在其中编写<dfn>javascript</dfn>的代码，类似<dfn>php</dfn>的<dfn>&lt;?php ?&lt;</dfn>包裹符。
  当使用<dfn>[#=</dfn>(加上等号)时，表示已字符串形式输出这个变量：</p>

<pre><code>//tmpl模板使用示例
var tmpl = load.tool('tmpl');

var tpl = '[#for(var k in ary){ var one=ary[k];#]'
        + '&lt;p&gt;[#=one#]&lt;/p&gt;'
        + '[#}#]';
var data = {ary:[123,'abc']};

var div = tmpl(tpl,data);

console.log(div); //&lt;p&gt;123&lt;/p&gt;&lt;p&gt;abc&lt;/p&gt;
</code></pre>

<p><kbd>注意：</kbd>如果在模板中使用了一个未定义的变量，解析过程就会报错。
  tmpl提供了一个<dfn>this</dfn>对象，它以属性的形式包含当前全部变量，
  你可以像下面这样使用它：</p>

<pre><code>
var tmpl = load.tool('tmpl');

var tpl = '[#if(this.name!==undefined){#]' //注意必须使用 this.name，直接使用name，如果未定义就会报错
+ '&lt;p&gt;[#=name#]&lt;/p&gt;'
+ '[#}#]';
var data = {name:'abc'};

var div = tmpl(tpl,data);
</code></pre>

<p>如果需要多次解析同一个模板，则可以将模板编译的结果缓存起来，
使用时直接代入变量。tmpl模板解析分两步，第一步将tpl模板字符串编译成一个函数字符串，
这需要大量的正则替换，耗时较长；第二步执行<dfn>new Function()</dfn>将变量代入，返回最终结果。
缓存就是将第一步生成的函数字符串保存起来，避免多次正则替换，节省大部分运算。使用如下：</p>

<pre><code>
var tmpl = load.tool('tmpl');

var tpl = '[#for(var k in ary){ var one=ary[k];#]'
+ '&lt;p&gt;[#=one#]&lt;/p&gt;'
+ '[#}#]';
var data = {ary:[123,'abc']};

var render = tmpl(tpl); //不传入data，则生成缓存，多次使用缓存节约大量正则运算

var div = render(data); //传入data，代入变量，解析成最终结果

console.log(div); //&lt;p&gt;123&lt;/p&gt;&lt;p&gt;abc&lt;/p&gt;
</code></pre>

<p><kbd>注意：</kbd>模板字符串不能出现<dfn>'</dfn>单引号，否则将会报错。
  你可以使用转义，即加一个反斜杠<dfn>\'</dfn>。</p>
