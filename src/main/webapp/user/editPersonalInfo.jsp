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
    #basicInfo
    {
        font-weight: 600;
        color: #1f2533;
        line-height: 32px;
        font-size: 25px;
        padding: 10px;
    }
    .characteristics
    {
        font-size: 12px;
        color: #7b8293;
        line-height: 16px;
        margin-bottom: 4px;
    }
    .valueDiv
    {
        height: 20px;
        font-size: 16px;
        font-weight: 600;
        color: #1f2533;
        line-height: 20px;
        overflow: unset;
    }
</style>

<script>
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app3.alreadyLogin = true;
            app3.userid = userid;
            $("#userImg").attr("src", "/static/img/userImg/"+userid+".jpg")
        } else {
            app3.alreadyLogin = false;
        }
    })
    $(function ()
    {
        app3.queryUserInfo();
    })
</script>
<body>

    <div id="main">
        <div class="container" style="margin-top: 3rem">
            <div class="row" id="basicInfo">
                基本信息
            </div>

            <div class="row" style="margin-top: 1rem; padding:20px">
                <div class="col-2">
                    <img  src="/static/img/newone.jpg" id="userImg" style="width: 120px; border-radius: 100px;"/>
                </div>
                <div class="col-2">
                    <div class="characteristics">
                        Username

                    </div>
                    <div class="valueDiv">
                        {{ username }}
                    </div>
                </div>
                <div class="col-2">
                    <div class="characteristics">
                        Real Name

                    </div>
                    <div class="valueDiv">
                        {{ realname }}
                    </div>
                </div>
                <div class="col-3">
                    <div class="characteristics">
                        Phone

                    </div>
                    <div class="valueDiv">
                        {{ phone }}
                    </div>
                </div>
                <div class="col-3">
                    <div class="characteristics">
                        Email

                    </div>
                    <div class="valueDiv">
                        {{ email }}
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 1rem; padding:20px; border-bottom: 1px solid #e9ebf2;">
                <div class="col-4"><div>你于{{ timecreated }}加入</div></div>
                <div class="col-4"><span class="badge rounded-pill bg-success" v-show="successTip">Success</span></div>
            </div>
            <div class="row" style="margin-top: 1rem; padding:20px; border-bottom: 1px solid #e9ebf2;">
                <div class="col-2">更改昵称</div>
                <div class="col-2"><button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#nameModal">修改</button> </div>
            </div>
            <div class="row" style="margin-top: 1rem; padding:20px; border-bottom: 1px solid #e9ebf2;">
                <div class="col-2" >更改手机号</div>
                <div class="col-2"><button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#phoneModal">修改</button> </div>
            </div>
            <div class="row" style="margin-top: 1rem; padding:20px; border-bottom: 1px solid #e9ebf2;">
                <div class="col-2">更改密码</div>
                <div class="col-2"><button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#passwordModal">修改</button> </div>
            </div>
            <div class="row" style="margin-top: 1rem; padding:20px; border-bottom: 1px solid #e9ebf2;">
                <div class="col-2">更改实名</div>
                <div class="col-2"><button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#realNameModal">修改</button> </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="nameModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >修改昵称</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-top: 1rem;">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">变更为</span>
                                        <input type="text" class="form-control" placeholder="Username" aria-label="Username"
                                               aria-describedby="basic-addon1" id="nameInput" v-model="nameInput">
                                    </div>
                                    <span class="badge rounded-pill bg-danger" v-show="failedTip">失败</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-outline-success" @click="updateUsername()">修改</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="phoneModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >修改手机号</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-top: 1rem;">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon2">变更为</span>
                                        <input type="text" class="form-control" placeholder="Phone Number" aria-label="Username"
                                               aria-describedby="basic-addon1" id="phoneInput" v-model="phoneInput">
                                    </div>
                                    <span class="badge rounded-pill bg-danger" v-show="failedTip">失败</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-outline-success" @click="updatePhone()">修改</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >修改密码</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-top: 1rem;">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon3">原密码</span>
                                        <input type="text" class="form-control" placeholder="Username" aria-label="Password"
                                               aria-describedby="basic-addon1" id="orPasswordInput" v-model="orPasswordInput">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon4">更改密码</span>
                                        <input type="text" class="form-control" placeholder="Username" aria-label="Change Password"
                                               aria-describedby="basic-addon1" id="changedPasswordInput" v-model="changedPasswordInput">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon5">请再输入更改密码</span>
                                        <input type="text" class="form-control" placeholder="Username" aria-label="Change Password"
                                               aria-describedby="basic-addon1" id="repeatPasswordInput" v-model="repeatPasswordInput">
                                    </div>
                                    <span class="badge rounded-pill bg-danger" v-show="failedTip">失败</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-outline-success" @click="updatePassword()">修改</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="realNameModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >修改实名</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-top: 1rem;">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon7">变更为</span>
                                        <input type="text" class="form-control" placeholder="Real Name" aria-label="Name"
                                               aria-describedby="basic-addon1" id="realNameInput" v-model="realNameInput">
                                    </div>
                                    <span class="badge rounded-pill bg-danger" v-show="failedTip">失败</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-outline-success" @click="updateRealname()">修改</button>
                    </div>
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
            userid:"",
            nameInput:"",
            phoneInput:"",
            orPasswordInput:"",
            changedPasswordInput:"",
            repeatPasswordInput:"",
            realNameInput:"",

            username:"",
            realname:"",
            phone:"",
            email:"",
            timecreated:"",

            failedTip:false,
            successTip:false,
        },
        methods: {
            queryUserInfo:function()
            {
                if(this.userid!=null && this.userid!="")
                {
                    $.ajax({
                        url:"/userController/selectByPrimaryKey",
                        method:"post",
                        data:{"userid":this.userid},
                        success:function(data)
                        {
                            app3.username = data["username"];
                            app3.realname = data["realname"];
                            app3.phone = data["phone"];
                            app3.email = data["email"];
                            app3.timecreated = data["timecreated"];
                        }
                    })
                }
            },
            updateUsername:function()
            {
                if(this.nameInput!=null && this.nameInput!="" && this.nameInput.length >= 2)
                {
                    $.ajax({
                        url:"/userController/updateUsername",
                        method:"post",
                        data:{"userid":this.userid, "username":this.nameInput},
                        success:function(effect)
                        {
                            if(effect == 1)
                            {
                                app3.successTip = true;
                                $("#nameModal").modal('hide');
                                setTimeout(function(){app3.successTip = false; location.reload()}, 2000)
                            }else
                            {
                                app3.failedTip = true;
                                setTimeout(function(){app3.failedTip = false;}, 2000)
                            }
                        }
                    })
                }else
                {
                    app3.failedTip = true;
                    setTimeout(function(){app3.failedTip = false;}, 2000)
                }
            },
            updatePhone:function()
            {
                if(this.phoneInput!=null && this.phoneInput!="" && this.phoneInput.length >= 8)
                {
                    $.ajax({
                        url:"/userController/updatePhone",
                        method:"post",
                        data:{"userid":this.userid, "phone":this.phoneInput},
                        success:function(effect)
                        {
                            if(effect == 1)
                            {
                                app3.successTip = true;
                                $("#phoneModal").modal('hide');
                                setTimeout(function(){app3.successTip = false; location.reload()}, 2000)
                            }else
                            {
                                app3.failedTip = true;
                                setTimeout(function(){app3.failedTip = false;}, 2000)
                            }
                        }
                    })
                }else
                {
                    app3.failedTip = true;
                    setTimeout(function(){app3.failedTip = false;}, 2000)
                }
            },
            updatePassword:function()
            {
                if(this.orPasswordInput!=null && this.orPasswordInput!="" && this.orPasswordInput.length >= 5 && this.changedPasswordInput!=null
                &&this.changedPasswordInput!="" && this.changedPasswordInput.length >= 5 && this.changedPasswordInput!=this.orPasswordInput
                    && this.changedPasswordInput==this.repeatPasswordInput)
                {
                    $.ajax({
                        url:"/userController/updatePassword",
                        method:"post",
                        data:{"userid":this.userid,
                            "originalPassword":this.orPasswordInput,
                            "newPassword":this.changedPasswordInput,
                        },
                        success:function(effect)
                        {
                            if(effect == 1)
                            {
                                app3.successTip = true;
                                $("#passwordModal").modal('hide');
                                setTimeout(function(){app3.successTip = false; location.reload()}, 2000)
                            }else
                            {
                                app3.failedTip = true;
                                setTimeout(function(){app3.failedTip = false;}, 2000)
                            }
                        }
                    })
                }else
                {
                    app3.failedTip = true;
                    setTimeout(function(){app3.failedTip = false;}, 2000)
                }
            },
            updateRealname:function()
            {
                if(this.realNameInput!=null && this.realNameInput!="" && this.realNameInput.length >= 2)
                {
                    $.ajax({
                        url:"/userController/updateRealname",
                        method:"post",
                        data:{"userid":this.userid, "realname":this.realNameInput},
                        success:function(effect)
                        {
                            if(effect == 1)
                            {
                                app3.successTip = true;
                                $("#realNameModal").modal('hide');
                                setTimeout(function(){app3.successTip = false; location.reload()}, 2000)
                            }else
                            {
                                app3.failedTip = true;
                                setTimeout(function(){app3.failedTip = false;}, 2000)
                            }
                        }
                    })
                }else
                {
                    app3.failedTip = true;
                    setTimeout(function(){app3.failedTip = false;}, 2000)
                }
            }

        }
    })
</script>
</html>