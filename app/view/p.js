/**
 *  主页
 */


var mop = inheritView('frame'); //继承父级页面
mop.name.push('p');  //本页面名称赋值，用于递归调用 data() 函数

//tpl模板文件 id的值 必须在父级tpl内 有 <!body!> 格式的标签，在 app/resource/tpl 目录下
mop.tpl.push(
    {content:'content'},
    {menu:'menu'}
);

//less样式文件，自动编译并组合成less文件，在 app/resource/less 目录下
mop.less.push(
    'content',
    'menu'
);

//js文件，在 app/stuff/js 目录下
mop.js.push(
    //'home/home'
);


//必须给本模块加上对外接口，以便其他页面继承
exports.mop = mop;


var conf =require_config();
var cache = {};  //页面缓存
var navchche = {}; //导航缓存

var version = require_config('version');

exports.data = function(callback){
    var that = this
        , coo = that.request.cookie //用户选择过版本
        , num = coo?coo.version_num:0
        , key = that.request.msg.key
        , content = (key&&key.content)?key.content:'intro'
        , ck = 'v'+num+'_'+content
        , pat = num?num:version.cur_num
        , file = content.replace(/_/g,'/');

    //检测是否有缓存
    if(conf.debug || !cache[ck]){
        var con = load.resource('tpl/p'+pat+'/'+file+'.tpl');
        if(con===null) return that.view('404');
        var nav = load.resource('tpl/p'+pat+'/menu.tpl');
        cache[ck] = con+''; //缓存
        navchche[ck] = nav+''; //缓存
    }
    callback({ content: cache[ck],connav:navchche[ck]  });
};




