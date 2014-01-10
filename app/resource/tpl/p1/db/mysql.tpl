
<h1>mysql 数据库</h1>

<pre><code>var mysql = load.db('mysql');</code></pre>

<p><dfn>mysql</dfn>数据库的配置文件<var>app/config/db/mysql.js</var>，内容如下：</p>

<pre><code>//mysql数据库配置
module.exports = {
    //默认mysql数据库
    default:{
      host:'127.0.0.1',
      database:'',
      user:'',
      password:''
    },
    //线上数据库
    online:{
      host:'127.0.0.1',
      database:'',
      user:'',
      password:''
    },
    //本地调试数据库
    local:{
      host:'127.0.0.1',
      database:'',
      user:'',
      password:''
    }
    //此处添加数据库配置
 };
</code></pre>

<p>你可以如上一样配置多个数据库，使用方法如下：</p>

<pre><code>  //mysql数据库使用示例
  var mysql = load.db('mysql')
    , sqlstr = 'SELECT * FROM user';


  //使用默认数据库，可省略default名称
  mysql.query(sqlstr,function(err,rows){
    //rows为数据库获取的结果
  });

  //使用online数据库
  mysql.query(sqlstr,'online',function(err,rows){
    //rows为数据库获取的结果
  });


</code></pre>