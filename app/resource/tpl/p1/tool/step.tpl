
<h1>Tool工具箱 - step流程控制服务</h1>

<pre><code>var step = require_tool('step');</code></pre>

<p>控制流程工具，解决回调嵌套层次过多等问题。
  适用于读文件、查询数据库等回调函数相互依赖，或者分别获取内容最后组合数据返回等应用情景。</p>

<p>使用示例：</p>

<p>回调函数顺序依赖、依次执行。适用于下一个回调函数依赖于上一个函数执行的结果。</p>

<p>使用方法：</p>

<pre><code>step.Step(func,[func,[func,[...]]]);</code></pre>

<p>函数参数为任意数量的回调函数。也可以是一个类、函数数组或者它们的组合。</p>

<p>当上一个回调执行完成返回<b>非</b><dfn>undefined</dfn>的结果时，或者在回调内部中调用<dfn>this.next()</dfn>时，
  表示这个回调执行完成， 并把其结果作为下一个回调的第一个参数，
  把所有执行结果按次序组成的的数组作为下一个回调的第二个参数。</p>

<p>示例代码：</p>

<pre><code>var step = require_tool('step');

step.Step(function(result,entire){

  console.log(result); // undefined
  console.log(entire); // []
  var that =this;
  setTimeout(function(){
   that.next('abc');
  },1000);

},function(result,entire){

  console.log(result); // 'abc'
  console.log(entire); // ['abc']
  return 123; //return ::返回一个非undefined的值，和调用this.step();效果相同
  /*注意：如果未返回数据，或者未调用this.step()，将会中断回调的执行，后面的回调都不会执行！！！*/

},function(result,entire){

  console.log(result); // 'abc'  ::此值为上一个回调执行的结果
  console.log(entire); // ['abc', 123]  ::此值为历史所有回调执行结果按次序组成的数组
  var that=this;
  setTimeout(function(){
    that.next({abc:123});
    console.log(that.index); //that.index为一个整数，代表回调被调用的次序，而不是返回结果的次序。
  },200);

},function(result,entire){

  console.log(result); // {abc:123}
  console.log(entire); // [ 'abc', 123, { abc: 123 } ]

});</code></pre>

<p>组装回调函数的结果，此方法不同于上面的依赖串联执行，
所有的回调是并行执行的， 只不过是在最后一个回调返回结果时，才调用最终处理函数。</p>

<p>使用方法：</p>

<pre><code>step.Assem(func,[func,[func,[...]]]);</code></pre>

<p>函数参数为任意数量的回调函数。也可以是一个类、函数数组或者它们的组合。</p>

<p>此方法的参数数量必须大于等于 2 个，函数才能被有效执行。</p>

<p>此方法传入的最后一个参数函数，将被作为最终的结果处理程序而不是单个获取数据的步骤。</p>

<p>示例代码：</p>

<pre><code>var step = require_tool('step');

step.Assem(function(step,index){

  var that =this;
  setTimeout(function(){
    that.next('abc'); //表示数据获取完毕
  },1000);

},function(){

  return 123; //return ::返回一个非undefined的值，和调用this.step();效果相同
  /*注意：如果未返回数据，或者未调用this.step()，将会导致最终的数据处理程序不被调用！！！*/

},function(){

  var that=this;
  setTimeout(function(){
    that.next({abc:123});
    console.log(that.index); //that.index为一个整数，代表回调被调用的次序，而不是返回结果的次序。
  },200);

},function(result){

  console.log(result); // [ 'abc', 123, { abc: 123 } ]

});</code></pre>


<p><big>Step(func,[func,[func,[...]]])</big></p>

<p>步骤次序、回调依赖、依次执行处理。函数参数被依次执行。</p>

<p><big>Assem(func,func,[func,[...]])</big></p>

<p>组装所有回调产生的结果，并把所有结果按调用次序组成数组，作为参数传给最后一个函数处理。</p>

<p>作为参数的回调函数内部 this ：</p>

<p><big>this.index</big></p>

<p>一个大于等于0的整数，表示这个函数被调用的次序，而不是返回结果的次序。</p>

<p><big>this.next(data)</big></p>

<p>表示一个步骤执行完成，可以把获取的数据作为参数传递给它。</p>

<p><big>this.stop(data)</big></p>

<p>终止所有步骤的执行。</p>

<p><big>this.end(data)</big></p>

<p>跳到最后一步执行，data作为最后一个函数的第一个参数传入。</p>