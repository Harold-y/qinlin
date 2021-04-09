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
    #titleDiv
    {
        font-size: 18px;
        font-weight: 500;
        color: #1f2533;
        line-height: 24px;
        margin-right: 12px;
    }
    #assetNumDiv
    {
        font-size: 30px;
        font-weight: 500;
        color: #1f2533;
        line-height: 32px;
        margin-top: 8px;
    }
    #subTitleDiv1, #subTitleDiv2
    {
        padding: 20px 16px;
        font-weight: 500;
        color: #1f2533;
        line-height: 24px;
        font-size: 18px;
    }
    .assetNameAbbre, .assetAmount, .assetPercent
    {
        font-size: 16px;
        font-weight: 500;
        color: #3f475a;
        line-height: 20px;
    }
    .assetNameCN, .assetDollar
    {
        font-size: 12px;
        font-weight: 400;
        color: #7b8293;
        line-height: 16px;
    }
</style>
<body>

<div id="main" class="container" >
    <div class="row" style="margin-top: 4rem;">
        <div class="col-sm-8">
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px">
                <div id="titleDiv">总计</div>
                <div id="assetNumDiv">$ {{ sum }}</div>
            </div>
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px; margin-top: 2rem">
                <div id="subTitleDiv1">币种分布</div>
                <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                <div style="padding: 5px; margin-top: 1rem">币种</div>
                <div id="coinTypeDiv" class="container-fluid">
                    <div class="row" v-for="item in listCoinInfo" style="padding: 20px">
                        <div class="col-1">
                            <img v-bind:src="item.coinImgSrc" style="border-radius: 40px" height="40px">
                        </div>
                        <div class="col-4">
                            <div class="row assetNameAbbre">{{item.abbre_name}}</div>
                            <div class="row assetNameCN">{{item.cn_name}}</div>
                        </div>
                        <div class="col-3">
                            <div class="row assetAmount">{{ item.amount }}</div>
                            <div class="row assetDollar">$ {{ item.total_worth }}</div>
                        </div>
                        <div class="col-4">
                            <div class="row assetPercent">{{ item.percentage*100 }}%</div>
                            <div class="row assetPercentBar">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" name="progressBarDiv" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-sm-3 offset-1" style="border: 1px solid #e9ebf2;">
            <div class="row">
                <div id="subTitleDiv2">转移至资金账户</div>
            </div>
            <div style="width: 100%; border: 1px solid #e9ebf2"></div>
            <div class="row" style="margin-top: 1rem">
                <div class="col-sm-5  offset-1" >
                    <span v-text="transferCoinType"></span>
                    <img v-bind:src="transferCoinSrc" style="border-radius: 20px; height: 35px" id="coinImg">
                </div>
                <div class="col-4">
                    <div class="input-group mb-3">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">币种</button>
                        <ul class="dropdown-menu dropdown-menu-end" id="appendCoin">
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-10 offset-1">
                    剩余{{transferUserOwnedCoinAmount}}个{{transferCoinType}}
                </div>

            </div>

            <div class="row" style="margin-top: 1rem">
                <div class="col-10 offset-1">
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">转换量</span>
                        <input type="text" class="form-control" placeholder="Amount" aria-label="Amount" aria-describedby="addon-wrapping" v-model="transferAmount">
                    </div>
                </div>

            </div>
            <div class="row" style="margin-top:10px">
                <span class="badge rounded-pill bg-info text-dark" v-show="questionShow">输入数额有误或余额不足</span>
                <span class="badge rounded-pill bg-success" v-show="successShow">成功</span>
            </div>

            <div class="row" style="padding: 14px;margin-top: 3rem">
                <button class="btn btn-outline-dark" @click="transferToAnotherAccount">转移</button>
            </div>

        </div>

    </div>

</div>
</body>
<script>
    var app3 = new Vue({
        el:"#main",
        data:{
            userid:"",
            alreadyLogin:false,
            transferCoinId:1,
            transferCoinSrc:"/static/img/coin/1.jpg",
            transferCoinType:"FRO",
            transferUserOwnedCoinAmount:0.000,
            transferAmount:0.00,
            questionShow:false,
            successShow:false,


            listCoinInfo:"",
            sum:0.00,
        },
        methods:{
            changeCoin:function(coinid)
            {
                app3.transferCoinId = coinid;
                $.ajax({
                    url:"/coinController/queryCompleteInfoById",
                    method:"post",
                    data:{"coinid":coinid},
                    success:function(data)
                    {
                        app3.transferCoinType = data["abbre_name"];
                        app3.transferCoinSrc="/static/img/coin/"+app3.transferCoinId+".jpg";
                        app3.selectAmountById();
                    }
                });
            },
            listAllCoin:function()
            {
                if(app3.alreadyLogin)
                {
                    $.ajax({
                        url:"/tradeAccountController/selectAllCoinByUserId",
                        method:"post",
                        data:{
                            "userid":app3.userid
                        },
                        success:function (data)
                        {
                            app3.listCoinInfo = data;
                            var sum = 0.00;
                            for(j = 0; j < data.length; j++) {
                                sum+=parseFloat(data[j]['total_worth']);
                            }
                            sum = sum.toFixed(2);
                            app3.sum = app3.toThousands(sum);
                            $($("div[name='progressBarDiv']")).ready(function ()
                            {
                                $("div[name='progressBarDiv']").each(function () {
                                    $(this).css('width', $(this).parent().parent().parent().children(":first").html());
                                });
                            })

                        }
                    })
                }
            },
            toThousands:function (num) {
                var decimal = "";
                if(num.toString().split('.').length == 2)
                {
                    decimal = num.toString().split('.')[1];
                }
                var result = '', counter = 0;
                num = (num || 0).toString().split('.')[0];
                for (var i = num.length - 1; i >= 0; i--) {
                    counter++;
                    result = num.charAt(i) + result;
                    if (!(counter % 3) && i != 0) { result = ',' + result; }
                }
                return result + "." + decimal;
            },
            selectAmountById:function()
            {
                if(app3.userid!="" || app3.userid!=null)
                {
                    $.ajax({
                        url:"/tradeAccountController/selectAmountById",
                        method:"post",
                        data:{
                            "userid": app3.userid,
                            "coinid": app3.transferCoinId
                        },
                        success:function(result)
                        {
                            app3.transferUserOwnedCoinAmount = result.toFixed(6);
                        }
                    });
                }
            },
            transferToAnotherAccount:function ()
            {
                if(app3.transferAmount<=0)
                {
                    app3.questionShow = true;
                    setTimeout(function (){app3.questionShow=false}, 2000)
                }else
                {
                    $.ajax({
                        url:"/tradeAccountController/transferIntoCapitalAccount",
                        method:"post",
                        data:{
                            "userid":app3.userid,
                            "coinid":app3.transferCoinId,
                            "amount":"-"+app3.transferAmount
                        },
                        success:function (effect)
                        {
                            if(effect<=0)
                            {
                                app3.questionShow = true;
                                setTimeout(function (){app3.questionShow=false}, 2000)
                            }
                            else
                            {
                                app3.successShow = true;
                                setTimeout(function (){app3.successShow=false}, 2000)
                                app3.transferAmount = 0.00;
                                app3.selectAmountById();
                            }
                        }
                    })
                }
            }
        }
    })
</script>
<script>
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app3.alreadyLogin = true;
            app3.userid = userid;
            $("#userImg").attr("src", "/static/img/userImg/"+userid+".jpg")
            app3.listAllCoin();
        } else {
            app3.alreadyLogin = false;
        }
    })
    $(function ()
    {
        app3.changeCoin(1);
        app3.selectAmountById();
    })
</script>
<script>
    $(function ()
    {
        let appendCoin = "";
        $.ajax({
            url:"/coinController/queryAllPartial",
            method:"post",
            data:{},
            success:function(data)
            {
                for(var index in data)
                {
                    var coinid = "";
                    var  abbre_name ="";
                    for(var item in data[index])
                    {
                        if(coinid=="" || coinid!=null)
                        {
                            coinid = data[index].coinid;
                        }
                        if(abbre_name=="" ||abbre_name!=null)
                        {
                            abbre_name = data[index].abbre_name;
                        }
                    }
                    appendCoin = "<li><p hidden>"+coinid+"</p><a class='dropdown-item' name='linkChangeCoin'>"+abbre_name+"</a></li>";
                    $("#appendCoin").append($(appendCoin));
                }
                $("a[name='linkChangeCoin']").click(function(){app3.changeCoin($(this).parent().children(":first").text());});
            }
        })

    });
</script>

</html>