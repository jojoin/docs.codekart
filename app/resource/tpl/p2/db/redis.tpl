
<h1>redis 数据库</h1>

<pre><code>var redis = load.db('redis');</code></pre>

<p><dfn>redis</dfn>数据库的配置文件<var>app/config/db/redis.js</var>，内容如下：</p>

<pre><code>//redis 数据库配置
module.exports = {
  //默认 redis 数据库
  default:{
    host:'127.0.0.1',
    port:'6379',
    select:1, //默认选择的库
    options:{
      auth_pass: ''
    }
  },
  //其他 redis 数据库，可定义多个数据库，自定义名称
  other:{
    host:'127.0.0.1',
    port:'6379',
    select:0, //默认选择的库
    options:{
      auth_pass: ''
    }
  }
  //此处添加数据库配置
};
</code></pre>

<p>你可以如上一样配置多个数据库，使用方法如下：</p>

<pre><code>  //mysql数据库使用示例
  var redis = load.db('redis')
  var defaulter = redis.getClient();  //获取默认default  redis 数据库连接
  var other = redis.getClient('other');  //获取其他 redis 数据库连接

  //开始使用，获取redis的key的值
  defaulter.get('redis_key',function(err,data){

  });

  //删除key
  defaulter.del('redis_key');

  //返回集合 key 中的所有成员
  other.smembers('redis_key',function(err,data){

  });
</code></pre>


<p>以上redis命令全部为小写，更多使用方法请访问<a target="_blank" href="http://redis.io/commands">redis命令手册</a>。</p>

