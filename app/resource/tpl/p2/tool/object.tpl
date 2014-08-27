
<h1>Tool工具箱 - object对象支持</h1>

<pre><code>var object = load.tool('object');</code></pre>

<p><dfn>javascript</dfn>对象的扩展操作。</p>

<h4>isNumber(stuff)</h4>

<p>判断<var>stuff</var>是否为数值类型。</p>

<h4>isString(stuff)</h4>

<p>判断<var>stuff</var>是否为字符串类型。</p>

<h4>isArray(stuff)</h4>

<p>判断<var>stuff</var>是否为数组类型。</p>

<h4>isObject(stuff)</h4>

<p>判断<var>stuff</var>是否为字典类型。</p>

<h4>extend(tObj,sObj,override)</h4>
<p>深层次合并两个对象。参数<var>tObj</var>为被<b>合并修改</b>的对象，<var>sObj</var>为扩展的对象。
  <var>override</var>表示是否深层次递归合并，而不是<var>sObj</var>的属性覆盖<var>Obj</var>的。</p>

<h4>clone(obj)</h4>

<p>拷贝（深拷贝）对象，并返回它的副本（一个新的对象，而不是引用）。</p>

<h4>verifyAttr(obj,param,strict)</h4>

<p>验证对象是否存在列出的所有属性。参数<var>obj</var>要验证的属性名字符串数组，或逗号隔开的字符串。
参数<var>strict</var>表示是否以严格模式验证（非严格模式只判断是否存在属性，
严格模式将所有属性为 0、null、undefined、false、'' (空字符串)、NaN 验证为不存在）。</p>


