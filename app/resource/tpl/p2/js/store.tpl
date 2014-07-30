
<h1>前端 js 模块 - store 本地储存</h1>

<pre><code><dfn>C.store</dfn></code></pre>

<p>store 是一个兼容所有浏览器的 LocalStorage 包装器，不需要借助 Cookie 或者 Flash。store.js 会根据浏览器自动选择使用 localStorage、globalStorage 或者 userData 来实现本地存储功能。</p>

<h4>set(name,value)</h4>

<p><code>C.store.set()</code>保存值。</p>

<h4>get(name)</h4>

<p>获取设置的值。</p>

<h4>remove(name)</h4>

<p>删除指定本地储存值。</p>

<h4>clear()</h4>

<p>清除所有本地储存。</p>

