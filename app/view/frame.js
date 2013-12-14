/**
 *  主页
 */


var mop = inheritView('html'); //继承父级页面
mop.name.push('frame');  //本页面名称赋值，用于递归调用 data() 函数

//tpl模板文件 id的值 必须在父级tpl内 有 <!body!> 格式的标签，在 app/resource/tpl 目录下
mop.tpl.push(
    {body:'frame/frame'},
    {menu:'frame/menu'}
);

//less样式文件，自动编译并组合成less文件，在 app/resource/less 目录下
mop.less.push(
    'frame/frame',
    'frame/content',
    'frame/menu'
);

//js文件，在 app/stuff/js 目录下
mop.js.push(
    'frame/frame'
);


//必须给本模块加上对外接口，以便其他页面继承
exports.mop = mop;

exports.data = function(callback){
    callback({
        title: '' +
            'Codekart - API文档 使用手册'
    });
};

