<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>琴麟加密货币交换所</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
            crossorigin="anonymous"></script>
    <link type="text/css" href="/css/headerFooter.css" rel="stylesheet">
</head>
<style>

</style>

<script>
    $(function () {
        let userid = ${userid};
        if(userid!=null && userid!="")
        {
            app3.userid = userid;
            $("#personalImg").attr("src", "/static/img/userImg/" + userid + ".jpg" + "?" + Math.random());
        }
    })
    $('#personalImg').on("error", function () {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
</script>
<body>

    <div class="container" id="main" >
        <div class="row" style="margin-top: 2rem">
            <div class="col-3 offset-1" style="border: 1px solid #e9ebf2">
                <div class="row" style="padding: 20px; margin:0 auto">
                    <img id="personalImg" src="/static/img/newone.jpg" style="border-radius: 200px; width: 300px">
                </div>
                <div class="row" style="margin-top: 1rem; padding: 20px;">
                    <input type="file" id="file" name="myfile">
                        <button class="btn btn-info" @click="changeImg" style="margin-top: 1rem">更改</button>
                </div>
            </div>
        </div>
    </div>

</body>
<script>
    var app3 = new Vue({
        el: "#main",
        data: {
            alreadyLogin: false,
            userid:""
        },
        methods: {
            changeImg:function()
            {
                if(this.userid!=null && this.userid!="")
                {
                    $("#personalImg").attr("src", "/static/img/userImg/" + this.userid + ".jpg" + "?" + Math.random());
                    var formData = new FormData();
                    formData.append("userImg",$("#file")[0].files[0]);
                    $.ajax({
                        url:"/userController/updateStuInfoImg",
                        datatype:"json",
                        method:"post",
                        cache: false,
                        data:formData,
                        processData : false, // 使数据不做处理
                        contentType : false,
                        success:function (index) {
                            if(index==0)
                            {
                                /*$("#personalImg").attr("src","http://yeyixuan.top/wp-content/uploads/stuInfo/"+stuId+".jpg"+"?"+Math.random());*/
                                $("#personalImg").attr("src","/static/img/userImg/"+app3.userid+".jpg"+"?"+Math.random());
                                let parentIframe = $("#onlyIframe",parent.document)
                                parentIframe.attr("src","/user/changeImg.jsp");
                            }
                        }
                    })
                }
            }
        }
    })
</script>
</html>