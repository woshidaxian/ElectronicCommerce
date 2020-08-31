$(function(){
    var i = 1
    $('.inp-box').change(function(){
        if(i==1){
            $('.formDo').attr("action","checklogin2.jsp");
            i = 2;
        }else if(i==2){
            $('.formDo').attr("action","checklogin1.jsp");
            i = 1;
        }
    })
})