
<h1>前端 js 模块 - ajax 请求</h1>

<pre><code><dfn>C.ajax</dfn></code></pre>

<p>依赖模块：<dfn>json</dfn>，<dfn>url</dfn></p>

<p><dfn>AJAX</dfn>数据请求。</p>

<h4>setup(setting)</h4>

<p>前端使用：<code>C.ajax.setup(opt)</code>，下同。设置全局配置，参数见下方。</p>

<h4>send([setting])</h4>

<p>前端使用：<code>C.ajax.send(opt)</code>，下同。</p>

<p>发送<dfn>AJAX</dfn>请求。opt为一个对象，对象键作为参数，释义如下：</p>

<p><b>url</b>: 要求为String类型的参数，（默认为当前页地址）发送请求的地址。</p>

<p><b>type</b>: 要求为String类型的参数，请求方式（post或get）默认为get。注意其他http请求方法，例如put和
delete也可以使用，但仅部分浏览器支持。</p>

<p><b>timeout</b>: 要求为Number类型的参数，设置请求超时时间（毫秒）。此设置将覆盖C.ajax.setup()方法的全局设
置。</p>
<p><b>async</b>：要求为Boolean类型的参数，默认设置为true，所有请求均为异步请求。
如果需要发送同步请求，请将此选项设置为false。注意，同步请求将锁住浏览器，用户其他操作必须等
待请求完成才可以执行。</p>

<p><b>cache</b>：要求为Boolean类型的参数，默认为true（当dataType为script时，默认为false）。
设置为false将不会从浏览器缓存中加载请求信息。</p>

<p><b>data</b>: 要求为Object或String类型的参数，发送到服务器的数据。如果已经不是字符串，将自动转换为字符串格
式。get请求中将附加在url后。防止这种自动转换，可以查看processData选项。对象必须为key/value格
式，例如{foo1:"bar1",foo2:"bar2"}转换为&foo1=bar1&foo2=bar2。如果是数组，JQuery将自动为不同
值对应同一个名称。例如{foo:["bar1","bar2"]}转换为&foo=bar1&foo=bar2。</p>

<p><b>dataType</b>: 要求为String类型的参数，预期服务器返回的数据类型。如果不指定，JQuery将自动根据http包mime
信息返回responseXML或responseText，并作为回调函数参数传递。
可用的类型如下：<br>
xml：返回XML文档，可用JQuery处理。<br>
html：返回纯文本HTML信息；包含的script标签会在插入DOM时执行。<br>
script：返回纯文本JavaScript代码。不会自动缓存结果。除非设置了cache参数。注意在远程请求
时（不在同一个域下），所有post请求都将转为get请求。<br>
json：返回JSON数据。<br>
jsonp：JSONP格式。使用SONP形式调用函数时，例如myurl?callback=?，JQuery将自动替换后一个
“?”为正确的函数名，以执行回调函数。<br>
text：返回纯文本字符串。</p>

<p><b>beforeSend</b>：要求为Function类型的参数，发送请求前可以修改XMLHttpRequest对象的函数，例如添加自定义
HTTP头。在beforeSend中如果返回false可以取消本次ajax请求。XMLHttpRequest对象是惟一的参
数。<br>
function(XMLHttpRequest){<br>
  this;   //调用本次ajax请求时传递的options参数<br>
}
</p>
<p><b>complete</b>：要求为Function类型的参数，请求完成后调用的回调函数（请求成功或失败时均调用）。
参数：XMLHttpRequest对象和一个描述成功请求类型的字符串。<br>
function(XMLHttpRequest, textStatus){<br>
this;    //调用本次ajax请求时传递的options参数<br>
}</p>

<p><b>success</b>：要求为Function类型的参数，请求成功后调用的回调函数，有两个参数。<br>
(1)由服务器返回，并根据dataType参数进行处理后的数据。<br>
(2)描述状态的字符串。<br>
function(data, textStatus){<br>
//data可能是xmlDoc、jsonObj、html、text等等<br>
this;  //调用本次ajax请求时传递的options参数</p>

<p><b>error</b>：要求为Function类型的参数，请求失败时被调用的函数。该函数有3个参数，即XMLHttpRequest对象、错
误信息、捕获的错误对象(可选)。<br>
ajax事件函数如下：<br>
function(XMLHttpRequest, textStatus, errorThrown){<br>
//通常情况下textStatus和errorThrown只有其中一个包含信息<br>
this;   //调用本次ajax请求时传递的options参数<br>
}
</p>

<p><b>contentType</b>：要求为String类型的参数，当发送信息至服务器时，内容编码类型默认
为"application/x-www-form-urlencoded"。该默认值适合大多数应用场合。
dataFilter：要求为Function类型的参数，给Ajax返回的原始数据进行预处理的函数。
提供data和type两个参数。data是Ajax返回的原始数据，type是调用jQuery.ajax时提供的
dataType参数。函数返回的值将由jQuery进一步处理。<br>
function(data, type){<br>
//返回处理后的数据<br>
return data;<br>
}
</p>

<p><b>global</b>：要求为Boolean类型的参数，默认为true。表示是否触发全局ajax事件。设置为false将不会触发全局
ajax事件，ajaxStart或ajaxStop可用于控制各种ajax事件。</p>

<p><b>ifModified</b>：要求为Boolean类型的参数，默认为false。仅在服务器数据改变时获取新数据。
服务器数据改变判断的依据是Last-Modified头信息。默认值是false，即忽略头信息。</p>

<p><b>jsonp</b>：要求为String类型的参数，在一个jsonp请求中重写回调函数的名字。
该值用来替代在"callback=?"这种GET或POST请求中URL参数里的"callback"部分，例如
{jsonp:'onJsonPLoad'}会导致将"onJsonPLoad=?"传给服务器。</p>

<p><b>username</b>：要求为String类型的参数，用于响应HTTP访问认证请求的用户名。</p>

<p><b>password</b>：要求为String类型的参数，用于响应HTTP访问认证请求的密码。</p>

<p><b>processData</b>：要求为Boolean类型的参数，默认为true。默认情况下，发送的数据将被转换为对象（从技术角度
来讲并非字符串）以配合默认内容类型"application/x-www-form-urlencoded"。如果要发送DOM
树信息或者其他不希望转换的信息，请设置为false。</p>

<p><b>scriptCharset</b>：要求为String类型的参数，只有当请求时dataType为"jsonp"或者"script"，并且type是GET时
才会用于强制修改字符集(charset)。通常在本地和远程的内容编码不同时使用。</p>


<h4>get(url,data,callback)</h4>

<p>前端使用：<code>C.ajax.get()</code>，向服务端发送 get 请求。参数释义：<br>
  <b>url</b>：请求的url链接<br>
  <b>data</b>：请求的参数 (类型须为字典)<br>
  <b>callback</b>：请求数据返回的回调，<code>callback(err,data)</code>接受两个参数，第一个为错误消息，第二个为请求返回值。<br>
</p>

<p>此函数为对<code>C.ajax.send()</code>函数的封装。</p>

<h4>post(url,data,callback)</h4>

<p>前端使用：<code>C.ajax.post()</code>，向服务端发送 post 请求。参数释义：<br>
  <b>url</b>：请求的url链接<br>
  <b>data</b>：请求的参数 (类型须为字典)<br>
  <b>callback</b>：请求数据返回的回调，<code>callback(err,data)</code>接受两个参数，第一个为错误消息，第二个为请求返回值。<br>
</p>

<p>此函数为对<code>C.ajax.send()</code>函数的封装。</p>

