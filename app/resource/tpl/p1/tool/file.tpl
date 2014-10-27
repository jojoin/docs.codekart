
<h1>Tool工具箱 - file文件操作</h1>

<pre><code>var file = load.tool('file');</code></pre>

<p>这里基于 Node.js 的<dfn>fs</dfn>模块，封装了一些跟“高级”的文件操作。</p>

<p><big>validPath(path,callback)</big></p>

<p>取出第一条存在的文件路径。参数<var>path</var>是一个文件的路径或路径数组，
  参数<var>callback</var>为验证完成后的回调，<var>callback</var>调用时会传入参数，
  路径验证成功参数为第一个成功的路径，否则传入<var>null</var>。如果不传入<var>callback</var>，
  则为<b>同步</b>版本，返回值为第一条验证成功的路径。</p>

<p><big>readFileList(pathAry,merger,callback)</big></p>

<p>按文件名数组读取文件并按顺序合并。参数<var>pathAry</var>是一个文件路径数组，
  参数<var>merger</var>为<var>true</var>则按路径顺序合并读取的文件内容，否则不合并返回按路径数组次序的文件内容数组。
  <var>callback</var>调用时会传入读取的文件内容，字符串或者数组。</p>
