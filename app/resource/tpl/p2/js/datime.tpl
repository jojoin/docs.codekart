
<h1>前端 js 模块 - datime 时间格式化</h1>

<pre><code><dfn>C.datime</dfn></code></pre>

<p>此模块定义了<code>Date.prototype.format</code>函数，你可以方便的对时间进行格式化：</p>

<pre><code>
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") //==> 2006-07-02 08:09:04.423
(new Date()).Format("yyyy-M-d h:m:s.S")      //==> 2006-7-2 8:9:4.18

</code></pre>
<br>
<h4>diff(time)</h4>

<p><code>C.datime.diff()</code>获取如“3分钟前”，“一小时前”的时间提示。参数<var>time</var>为要格式化显示的时间戳。</p>

