$(function(){
    var navItem1 = ['手机/配件','游戏设备','电脑主机','相机摄像','生活厨电','影音/智能','个护健康'];
    var navItem0 = [[["国内品牌","华为","荣耀","小米","OPPO","VIVO","RedMi","一加","魅族"],
                    ["国际品牌","苹果","三星"],
                    ["手机配件","手机壳","耳机","充电器","数据线","充电宝","车载充电器"]],

                    [["电脑硬件","CPU","显卡","显示器","硬盘","主板","机箱","水冷套件"],
                    ["电玩游戏","PS4","Switch","XBOX","Wii","3Ds","PSV","3DSLL"],
                    ["游戏外设","鼠标","键盘","机械键盘","游戏手柄","VR眼睛","游戏耳机"]],

                    [["笔记本","ThinkPad","联想","Macbook","戴尔笔记本","惠普","神州","外星人","宏基","华硕"],
                    ["DIY电脑","办公主机","游戏主机","发烧主机","MOD定制","水冷主机","设计专用","网吧游戏"],
                    ["平板电脑","iPad","Surface","华为平板电脑","小米平板电脑","荣耀平板电脑","三星平板电脑","平板电脑"]],

                    [["单反相机","单反相机","尼康","佳能","索尼","富士","徕卡","宾得"],
                    ["微单相机","佳能微单","索尼微单","尼康微单","微单","徕卡微单","富士微单","宾得微单"],
                    ["其他设备","单反镜头","运动相机","拍立得","摄像机","单反配件","相机脚架","相机清洗"]],

                    [["生活电器","风扇","空气净化器","扫地机器人","吸尘器","抽湿加湿器","对讲机电话","干衣挂烫机","取暖器"],
                    ["厨房电器","净水设备","电饭煲","榨汁料理破壁机","电烤箱","电热水壶","电磁炉"],
                    ["智能清扫","空气健康","夏季清凉","冬季取暖","智能烹饪","必备烤箱","营养果汁"]],

                    [["耳机音箱","耳机","蓝牙耳机","手机耳机","Hifi音箱","蓝牙音箱","户外音响","智能音箱"],
                    ["家庭影院","网络高清播放器","舞台设备","家庭影院","黑胶唱片机","数字电视机顶盒","麦克风","话筒"],
                    ["智能设备","智能手环","智能手表","AppleWatch","智能家居","大疆无人机","航拍无人机","智能摄像头"]],

                    [["美容美体","洁面仪","剃须刀","美容仪","电动牙刷","冲牙器"],
                    ["按摩护理","按摩椅","按摩器","护腰带","护膝","体重秤"],
                    ["美发造型","吹风机","卷发棒","理发器"]]];
    var type1Box = '';
    var type2Box = '';
    var type3Box = '';
    for(var i=0;i<navItem1.length;i++){
        type1Box+='<option>'+ navItem1[i] +'</option>';
    }
    $('#sel1').append(type1Box);
    type1Box = '';
    var type1_index = 0;
    var type2_index = 0;
    for(var j=0;j<navItem0[type1_index].length;j++){
        type2Box+='<option>'+ navItem0[type1_index][j][0] +'</option>'
    }
    $('#sel2').append(type2Box);
    type2Box = '';
    for(var k=1;k<navItem0[type1_index][type2_index].length;k++){
        type3Box+='<option>'+ navItem0[type1_index][type2_index][k] +'</option>'
    }
    $('#sel3').append(type3Box);
    type3Box = '';
    $('#sel1').change(function(){
        $('#sel2').html(' ');
        $('#sel3').html(' ');
        var type1 = $(this).children('option:selected').val();
        for(var i=0;i<navItem1.length;i++){
            if(navItem1[i]==type1){
                type1_index = i;
                break;
            }
        }
        for(var j=0;j<navItem0[type1_index].length;j++){
            type2Box+='<option>'+ navItem0[type1_index][j][0] +'</option>'
        }
        $('#sel2').append(type2Box);
        type2Box = '';
        type2_index = $('#sel2').children('option:selected').index();
        for(var k=1;k<navItem0[type1_index][type2_index].length;k++){
            type3Box+='<option>'+ navItem0[type1_index][type2_index][k] +'</option>'
        }
        $('#sel3').append(type3Box);
        type3Box = '';
    })
    $('#sel2').change(function(){
        $('#sel3').html(' ');
        type2_index = $(this).children('option:selected').index();
        var type3Box = '';
        for(var k=1;k<navItem0[type1_index][type2_index].length;k++){
            type3Box+='<option>'+ navItem0[type1_index][type2_index][k] +'</option>'
        }
        $('#sel3').append(type3Box);
        type3Box = '';
    })
})