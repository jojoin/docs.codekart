

var object = require_tool('object');
var json = require_tool('json');
var config =  require_config();
var cpath =  require_config('!path');
var view =  require_core('view');

/**
 * 获取模板页面数据
 */

exports.ready = function(mop,request,response,callback){
    var dataAry = []
        , step = 0
        , leg = mop.name.length
        , tpldata = {};
    for(var i=0;i<leg;i++){ //文件名数组
        var name = mop.name[i]
            , dataFunc = require_view(name).data;
        merger(i,dataFunc);
    }
    //获取单一数据
    function merger(index,dataFunc){
        if(dataFunc){
            var This = new pageDataThis(request,response,tpldata);
            dataFunc.call(This,function(data,preData){
                ready(index,data,preData);
            });
        }else{
            ready(index,{})
        }
    }
    //数据获取完成
    function ready(index,data,pdata){
        dataAry[index] = data;
        //console.log(dataAry);
        if(pdata){ //准备的数据
            object.extend(tpldata,pdata,true);
        }
        step++;
        if(step==leg){ /*数据准备完成开始合并*/
            var reData = {};
            for(var i=0;i<leg;i++){
                object.extend(reData,dataAry[i],true);
            }
            reData.global = json.stringify(tpldata);
            //console.log(reData);
            callback(reData);
        }
    }
};


function pageDataThis(request,response,tpldata){
//返回内容
    this.request = request;
    this.response = response;
    this.tpldata = tpldata;
    this.render = function(context){
        var output = context+'';
        this.response.writeHead(200, { 'Content-Type': 'text/html', 'Content-Encoding':'UTF-8' });
        this.response.end(output);
    };
    this.render302 = function(url){
        var output = context+'';
        this.response.writeHead(302, { 'Content-Type': 'text/html', 'Content-Encoding':'UTF-8',
          Location:url});
        this.response.end(output);
    };
    //重定向视图
    this.view =  function(name){
        view.view(this.request,this.response,{name:name});
    };

}