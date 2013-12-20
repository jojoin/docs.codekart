/**
 *  主页
 */


var mop = inheritView('html'); //继承父级页面
mop.name.push('frame');  //本页面名称赋值，用于递归调用 data() 函数

//tpl模板文件 id的值 必须在父级tpl内 有 <!body!> 格式的标签，在 app/resource/tpl 目录下
mop.tpl.push(
    {body:'frame/frame'},
    {footer:'frame/footer'}
);

//less样式文件，自动编译并组合成less文件，在 app/resource/less 目录下
mop.less.push(
    'frame/frame',
    'frame/highlight'
);

//js文件，在 app/stuff/js 目录下
mop.js.push(
    'frame/frame',
    'frame/highlight',
    'frame/hljs'
);


//必须给本模块加上对外接口，以便其他页面继承
exports.mop = mop;

var version = require_config('version');

exports.data = function(callback){
    var coo = this.request.cookie //用户选择过版本
        , num = coo?coo.version_num:0
        , list = version.list
        , num = (num>list.length)?list.length:num
        , ary = list.concat()
        , newn = num?ary.splice(num-1,1):[];
    if(num) newn = newn[0];
    ary.push(newn);
    ary.reverse();
    callback({
        title: 'Codekart - API文档 使用手册',
        version: ary
    });
};

