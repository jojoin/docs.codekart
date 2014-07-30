
<h1>前端 js 模块 - url 解析</h1>

<pre><code><dfn>C.url</dfn></code></pre>

<br>

<h4>parse(urlstr)</h4>

<p><code>C.url.parse()</code>解析 url 字符串为对象： </p>

<p>不同的 URL 字符串解析后返回的对象会有一些额外的字段信息，仅当该部分出现在 URL 中才会有。以下是一个 URL 例子：


'http://user:pass@host.com:8080/p/a/t/h?query=string#hash'</p>


<p><b>href</b>: 所解析的完整原始 URL。协议名和主机名都已转为小写。例如: `'http://user:pass@host.com:8080/p/a/t/h?query=string#hash'`</p>

<p><b>protocol</b>: 请求协议，小写，例如: `'http:'`</p>

<p><b>host</b>: URL主机名已全部转换成小写, 包括端口信息，例如: `'host.com:8080'`</p>

<p><b>auth</b>:URL中身份验证信息部分，例如: `'user:pass'`</p>

<p><b>hostname</b>:主机的主机名部分, 已转换成小写，例如: `'host.com'`</p>

<p><b>port</b>: 主机的端口号部分，例如: `'8080'`</p>

<p><b>pathname</b>: URL的路径部分,位于主机名之后请求查询之前, including the initial slash if present.，例如: `'/p/a/t/h'`</p>

<p><b>search</b>: URL 的“查询字符串”部分，包括开头的问号。例如: `'?query=string'`</p>

<p><b>path</b>: pathname 和 search 连在一起。例如: `'/p/a/t/h?query=string'`</p>

<p><b>query</b>: 解析后返回的对象。例如: `'query=string'` or `{'query':'string'}`</p>

<p><b>hash</b>: URL 的 “#” 后面部分（包括 # 符号）例如: `'#hash'`</p>