<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.7/layui.all.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />

</head>
<style>
    .subTitleDiv1
    {
        padding: 20px 16px;
        font-weight: 500;
        color: #1f2533;
        line-height: 24px;
        font-size: 18px;
    }
    .assetNameAbbre, .assetAmount
    {
        font-size: 16px;
        font-weight: 500;
        color: #3f475a;
        line-height: 20px;
    }
    .assetNameCN
    {
        font-size: 12px;
        font-weight: 400;
        color: #7b8293;
        line-height: 16px;
    }
</style>
<body>

<div id="main" class="container">

    <div class="row" style="margin-top: 4rem;">
        <div class="col-10">
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px; margin-top: 2rem">
                <div class="subTitleDiv1">已绑定银行账号</div>
                <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                <div style="padding: 5px; margin-top: 1rem">银行名称</div>

                <div class="container-fluid" >
                    <div class="row" style="margin-top: 15px" v-for="item in addList">
                        <input type="hidden" :value="item.id"></input>
                        <div class="col-2">
                            <img src="" :src="item.imgSrc" style="border-radius: 40px" height="40px">
                        </div>
                        <div class="col-3">
                            <div class="row assetNameAbbre" >{{item.bank_cn_name }}</div>
                            <div class="row assetNameCN">{{ item.bank_eng_name }}</div>
                        </div>
                        <div class="col-2">
                            <div class="row">
                                <div class="col-1 assetAmount" style="padding: 1px">{{item.bankaccount}}</div>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="row">
                                <div class="col-1 assetAmount" style="padding: 1px">$</div>
                                <div class="col-5" style="padding: 2px"><p class="assetAmount">{{ item.checkingaccount }}</p></div>
                            </div>
                        </div>
                        <div class="col-2">
                            <button class="btn btn-sm btn-outline-dark" name="deleteAccount">解除绑定</button>
                        </div>
                        <div style="width: 90%; border: 1px solid #e9ebf2; margin-top: 7px"></div>
                    </div>
                </div>

            </div>

        </div>
        <div class="col-1 offset-1">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                绑定新的银行卡
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">添加新卡</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row" style="margin-top: 1rem;">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="subTitleDiv1">绑定星联(R)14位银行账号</div>
                                        <img src="/static/img/bank/starAlliance.png" style="width: 200px"/>
                                        <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                                        <div class="input-group mb-3" style="margin-top:10px">
                                            <img src="/static/img/bank/questionMark.jpg" id="bankImg" height="50px" style="border-radius: 50px; margin-right: 15px"/>
                                            <input type="text" class="form-control" aria-label="Text input with dropdown button"
                                                   id="bankInput" @keyon="checkBankValid()" @keydown="checkBankValid()" v-model="insertionInput">
                                        </div>
                                        <span class="badge rounded-pill bg-danger" v-show="failedTip">失败</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button class="btn btn-outline-success" id="addNew" @click="addBank()">绑定银行卡</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>
</body>
<script>
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app3.alreadyLogin = true;
            app3.userid = userid;
        } else {
            app3.alreadyLogin = false;
        }
    })
    $(function ()
    {
        app3.addToBankList();
    })

</script>
<script>
    var app3 = new Vue({
        el:"#main",
        data:{
            userid:"",
            bankList:"",
            insertionBankId:"",
            insertionBankImgSrc:"",
            insertionInput:"",
            addList:"",
            alreadyLogin:false,
            failedTip:false
        },
        methods:{
            addToBankList:function()
            {
                $.ajax({
                    url:"/bankAccountController/selectBankByUserId",
                    method:"post",
                    data:{"userid":this.userid},
                    success:function(list)
                    {
                        app3.addList = list;
                        $(function ()
                        {
                            $("button[name='deleteAccount']").click(
                                function ()
                                {
                                    let accountId = $(this).parent().parent().children(":first").val();
                                    $.ajax({
                                        url:"/bankAccountController/deleteByPrimaryKey",
                                        method:"post",
                                        data:{"id": accountId},
                                        success:function(effect)
                                        {
                                            if(effect == 1)
                                            {
                                                location.reload();
                                            }else
                                            {
                                                alert("Failed!");
                                            }
                                        }
                                    })
                                }
                            )
                        })
                    }
                })
            },
            checkBankValid:function()
            {
                $.ajax({
                    url:"/bankController/determineBank",
                    method:"post",
                    data:{"firstSixNumbers":this.insertionInput.substr(0,6)},
                    success:function(id)
                    {
                        if(id!=-1)
                        {
                            app3.insertionBankId = id;
                            app3.insertionBankImgSrc = "/static/img/bank/"+id+".jpg";
                            $("#bankImg").attr("src",app3.insertionBankImgSrc);
                        }else
                        {
                            app3.insertionBankId = -1;
                            $("#bankImg").attr("src","/static/img/bank/questionMark.jpg");
                        }
                    }
                })
            },
            addBank:function()
            {
                if(app3.insertionBankId!=-1 && app3.alreadyLogin == true && app3.insertionInput.length==14)
                {
                    let bankAccount = this.insertionInput;
                    let insertionBankId = this.insertionBankId;
                    $.ajax({
                        url:"/bankAccountController/insert",
                        method:"post",
                        data:{
                            "userid":app3.userid,
                            "bankid":insertionBankId,
                            "bankaccount": bankAccount,
                            "checkingAccount": 0.00
                        },
                        success:function(effect)
                        {
                            if(effect==1)
                            {
                                app3.insertionBankId = -1;
                                app3.insertionInput = "";
                                $("#bankImg").attr("src","/static/img/bank/questionMark.jpg");
                                $("#exampleModal").modal('hide');
                                location.reload();
                            }else
                            {
                                app3.failedTip = true;
                                setTimeout(function (){ app3.failedTip = false; }, 2000)
                            }
                        }
                    })
                }else
                {
                    app3.failedTip = true;
                    setTimeout(function (){ app3.failedTip = false; }, 2000)
                }

            }
        }
    })
</script>

</html>