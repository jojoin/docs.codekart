
<h1>数据库支持</h1>

<p>Codekart对数据库如下：</p>

<p>
1. <a href="/p/db_mysql">mysql</a><br/>
2. <a href="/p/db_redis">redis</a><br/>
</p>

<p>你可以在<var>app/config/db/mysql.js</var>等配置文件中方便的定义数据库配置。然后通过：</p>

<pre><code>var mysql = load.db('mysql');
</code></pre>

<p>加载<dfn>mysql</dfn>数据库支持。<dfn>redis</dfn>等数据库同理。</p>














