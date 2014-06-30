
<h1>Tool工具箱 - doop计划任务</h1>

<pre><code>var doop = load.tool('doop');</code></pre>

<p>有时候我们需要定时完成一些任务，比如缓存更新、数据统计等工作，
  通常把这些工作放在每天用户访问最少的时候，比如凌晨4点。</p>

<p><dfn>doop</dfn>就是这样一个有用的定时执行任务的工具。使用非常简单：</p>

<p><h4>doop.set(option,callback);</h4></p>

<p>参数<var>option</var>有以下选项：</p>

<pre><code>//option参数
option = {
  time: '',                        //执行时间 24小时制   "00:00:00"   默认为当前时间，
  loop: 0,                       //执行次数  0表示执行无数次
  every: 'day',                //执行间隔 sec min hour day 前面加上数量
  prior: false                  //是否在定义的时候先执行一次
};
</code></pre>

<p>参数<var>callback</var>为需要定时执行的函数。<dfn>doop.set()</dfn>返回一个字符串key，
  是计划任务的全局唯一标识符，你可以通过它删除任务：</p>


<pre><code>//doop计划任务使用示例
var doop = load.tool('doop');

var tiomeout = doop.set({time:'4:30',every:'day'},function(){
console.log(new Date().getTime());
});

/**参数示例
  {time:'4:30',every:'7day'}  //4:30 , 每周执行一次
*/

//tiomeout为任务的全局标识符，通过它删除任务
doop.clear(tiomeout);
</code></pre>

<p>上面的代码，执行的是每天凌晨4:30，控制台输出当前的时间戳。</p>

