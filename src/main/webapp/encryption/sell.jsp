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
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.7/layui.all.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
</head>
<script>
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app1.alreadyLogin = true;
            app1.userid = userid;
        } else {
            app1.alreadyLogin = false;
        }
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
                $("a[name='linkChangeCoin']").click(function(){app1.changeCoin($(this).parent().children(":first").text());});
            }
        })

    });
    $(function ()
    {
        let appendCurrency = "";
        $.ajax({
            url:"/currencyController/selectAllCurrency",
            method:"post",
            data:{},
            success:function(data)
            {
                for(var index in data)
                {
                    var currencyid = "";
                    var  currency_abbre_name ="";
                    for(var item in data[index])
                    {
                        if(currencyid=="" || currencyid!=null)
                        {
                            currencyid = data[index].currencyid;
                        }
                        if(currency_abbre_name=="" ||currency_abbre_name!=null)
                        {
                            currency_abbre_name = data[index].currency_abbre_name;
                        }
                    }
                    appendCurrency = "<li><p hidden>"+currencyid+"</p><a class='dropdown-item' name='linkChangeCurrency'>"+currency_abbre_name+"</a></li>";
                    $("#appendCurrency").append($(appendCurrency));
                }
                $("a[name='linkChangeCurrency']").click(function(){app1.changeCurrency($(this).parent().children(":first").text());});
            }
        })

    })
</script>
<body style="background-color: #F5F6FA">
<div class="container-fluid" style="background-color: white" id="generalDiv">
    <div class="row" style="font-size: 12px; opacity: 0.7; margin-left: 20px" v-text="display1">
    </div>
    <div class="row" style="font-size: 23px; margin-left: 20px; margin-top:10px" v-text="display2">

    </div>
    <div class="row" style="margin-top:20px">
        <div class="col-sm-10">
            <span style="font-size: 10px; opacity: 0.65">我要出售</span>
            <div class="input-group mb-3">
                <input type="text" class="form-control" aria-label="Text input with dropdown button" v-model="coinAmount"
                       id="coinInput" @keyup="calculateCurrencyAccordingCoin" @keyup.delete="calculateCurrencyAccordingCoin">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">出售币种</button>
                <ul class="dropdown-menu dropdown-menu-end" id="appendCoin">
                    <%--<li><a class="dropdown-item" @click="changeCoin(1)">FRO</a></li>
                    <li><a class="dropdown-item" @click="changeCoin(2)">QYC</a></li>
                    <li><a class="dropdown-item" @click="changeCoin(3)">LMC</a></li>
                    <li><a class="dropdown-item" @click="changeCoin(4)">DFY</a></li>
                    <li><a class="dropdown-item" @click="changeCoin(5)">GP</a></li>--%>
                </ul>
            </div>
            <span style="opacity: 0.75">我资金账户剩余：{{userOwnedCoinAmount}}个{{cointype}}</span>
        </div>
        <div class="col-sm-2" style="margin-top:15px">
            <span v-text="cointype"></span>
            <img v-bind:src="coinSrc" style="border-radius: 20px; height: 35px" id="coinImg">
        </div>
    </div>
    <div class="row" style="margin-top:20px">
        <div class="col-sm-10">
            <span style="font-size: 10px; opacity: 0.65">我将受到</span>
            <div class="input-group mb-3">
                <input type="text" class="form-control" aria-label="Text input with dropdown button" v-model="currencyAmount"
                       id="currencyInput" @keyup="calculateCoinAccordingCurrency" @keyup.delete="calculateCoinAccordingCurrency">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" >入账币种</button>
                <ul class="dropdown-menu dropdown-menu-end" id="appendCurrency">
                    <%--<li><a class="dropdown-item" @click="changeCurrency(1)">USD</a></li>
                    <li><a class="dropdown-item" @click="changeCurrency(2)">CNY</a></li>--%>
                </ul>
            </div>
        </div>
        <div class="col-sm-2" style="margin-top:15px">
            <span v-text="currencyAbbre"></span>
            <img v-bind:src="currencySrc" style="border-radius: 20px; height: 35px" id="currencyImg">
        </div>
    </div>

    <div class="row" >
        <div class="col-sm-10">
            <span style="font-size: 10px; opacity: 0.65">收账方式</span>
            <div class="input-group mb-3">
                <select class="form-select" id="inputGroupSelect02">
                    <option selected>星联银行卡</option>
                    <%--<option value="1">Wechat微信支付</option>
                    <option value="2">Alipay支付宝</option>
                    <option value="3">Visa/Mastercard</option>--%>
                </select>
                <label class="input-group-text" for="inputGroupSelect02">收账方式</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10">
            <span style="font-size: 10px; opacity: 0.65">请选择一张银行卡</span>
            <div class="input-group mb-3">
                <select class="form-select" id="inputGroupSelect03">
                    <option v-bind:value="item.bankid" v-for="item in bankList">{{item.bankaccount}} ({{item.bank_cn_name}})</option>
                </select>
                <label class="input-group-text" for="inputGroupSelect02">银行卡</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <span class="badge rounded-pill bg-success" v-show="badgeSuccess">操作成功</span>
            <span class="badge rounded-pill bg-warning text-dark" v-show="badgeWarning">请先登录</span>
            <span class="badge rounded-pill bg-danger" v-show="badgeDanger">操作失败</span>
        </div>
        <div class="col-sm-4">

        </div>
        <div class="col-sm-4">

        </div>
    </div>
    <div class="row" style="margin-top:20px">
        <button class="btn btn-primary" @click="sell">出售</button>
    </div>
</div>
</body>
<script>
    var app1 = new Vue({
        el:'#generalDiv',
        data:{
            alreadyLogin: false,
            cointype:"FRO",
            coinid:1,
            coinPriceUSD:0,
            currencyid:1,
            currencyAbbre:"USD",
            currencyExchangeRate:0,
            coinPriceLocal:0,
            currencySrc:"/static/img/coin/1.jpg",
            coinSrc:"/static/img/coin/1.jpg",
            display1:"",
            display2:"",
            badgeSuccess: false,
            badgeWarning:false,
            badgeDanger:false,
            coinAmount:"",
            currencyAmount:"",
            userid:"",
            bankid:"",
            bankaccount:"",
            bankList:"",
            userOwnedCoinAmount:""
        },
        methods:{
            selectAmountById:function()
            {
                if(app1.userid!="" || app1.userid!=null)
                {
                    $.ajax({
                        url:"/capitalAccountController/selectAmountById",
                        method:"post",
                        data:{
                            "userid": app1.userid,
                            "coinid": app1.coinid
                        },
                        success:function(result)
                        {
                            app1.userOwnedCoinAmount = result;
                        }
                    });
                }
            },
            queryBankInfo:function()
            {
                if(app1.userid!="" || app1.userid!=null)
                {
                    $.ajax({
                        url:"/bankAccountController/selectBankByUserId",
                        method:"post",
                        data:{
                            "userid": app1.userid,
                        },
                        success:function(result)
                        {
                            app1.bankList = result;
                        }
                    });
                }
            },
            calculateLocalPrice:function()
            {
                this.coinPriceLocal = this.coinPriceUSD * this.currencyExchangeRate;
            },
            queryInfo:function ()
            {
                this.changeCoin(1);
                this.changeCurrency(1);
            },
            updateInfo:function()
            {
                app1.calculateLocalPrice();
                app1.display1 = "1 "+app1.cointype+" 价值约";
                app1.display2 = app1.coinPriceLocal+" "+app1.currencyAbbre;
                app1.coinAmount = 0;
                app1.currencyAmount = 0;
                $(window.parent.app3.update(app1.coinid));
            },
            changeCoin:function(coinid)
            {
                app1.coinid = coinid;
                $.ajax({
                    url:"/priceController/selectPriceById",
                    method:"post",
                    data:{"id":coinid},
                    success:function(data)
                    {
                        app1.coinPriceUSD = data;
                        app1.coinSrc="/static/img/coin/"+app1.coinid+".jpg";
                        app1.updateInfo();
                    }
                });
                $.ajax({
                    url:"/coinController/queryCompleteInfoById",
                    method:"post",
                    data:{"coinid":coinid},
                    success:function(data)
                    {
                        app1.cointype = data["abbre_name"];
                    }
                });
                app1.selectAmountById();
            },
            changeCurrency:function(currencyid)
            {
                app1.currencyid = currencyid;
                $.ajax({
                    url:"/currencyController/queryById",
                    method:"post",
                    data:{"currencyid":currencyid},
                    success:function(data)
                    {
                        app1.currencyAbbre = data["currency_abbre_name"];
                        app1.currencyExchangeRate = data["exchangerate_usd"];
                        app1.currencySrc="/static/img/currency/"+app1.currencyid+".png";
                        app1.updateInfo();
                    }
                })
            },
            calculateCurrencyAccordingCoin:function()
            {
                app1.currencyAmount = (app1.coinAmount * app1.coinPriceLocal).toFixed(2);
            },
            calculateCoinAccordingCurrency:function()
            {
                app1.coinAmount = (app1.currencyAmount / app1.coinPriceLocal).toFixed(6);
            },
            sell:function()
            {
                if(!app1.alreadyLogin)
                {
                    app1.badgeWarning = true;
                    setTimeout(function(){app1.badgeWarning = false;}, 2000)
                    return;
                };
                if(app1.coinAmount <= 0 || app1.currencyAmount<=0)
                {
                    app1.badgeDanger = true;
                    setTimeout(function(){app1.badgeDanger = false;}, 2000)
                    return;
                };
                /*app1.queryBankInfo();*/
                app1.bankid = $("#inputGroupSelect03 option:selected").val();
                app1.bankaccount = $("#inputGroupSelect03 option:selected").text().split("(")[0];
                $.ajax({
                    url:"/capitalAccountController/transferOut",
                    method:"post",
                    data:{
                        "userid": app1.userid,
                        "coinid": app1.coinid,
                        "amount": app1.coinAmount,
                    },
                    success:function(result)
                    {
                        if(result == 1)
                        {
                            $.ajax({
                                url:"/bankAccountController/transferIn",
                                method:"post",
                                data:{
                                    "userid": app1.userid,
                                    "bankid": app1.bankid,
                                    "bankaccount": app1.bankaccount,
                                    "amount": (app1.currencyAmount / app1.currencyExchangeRate).toFixed(4),
                                },
                                success:function(result)
                                {
                                    if(result == 1)
                                    {
                                        $.ajax({
                                            url:"/settlementController/sell",
                                            method:"post",
                                            data:{
                                                "userid": app1.userid,
                                                "coinid": app1.coinid,
                                                "amount": app1.coinAmount,
                                                "price": app1.coinPriceUSD,
                                                "totalCharge": (app1.coinPriceUSD * app1.coinAmount).toFixed(4)
                                            },
                                            success:function(result)
                                            {
                                                if(result == 1)
                                                {
                                                    app1.badgeSuccess = true;
                                                    setTimeout(function(){app1.badgeSuccess = false;}, 2000)
                                                    app1.selectAmountById();
                                                    app1.coinAmount = "";
                                                    app1.currencyAmount = "";
                                                }else
                                                {
                                                    app1.badgeDanger = true;
                                                    setTimeout(function(){app1.badgeDanger = false;}, 2000)
                                                }
                                            }
                                        });
                                    }else
                                    {
                                        app1.badgeDanger = true;
                                        setTimeout(function(){app1.badgeDanger = false;}, 2000)
                                    }
                                }
                            });

                        }else
                        {
                            app1.badgeDanger = true;
                            setTimeout(function(){app1.badgeDanger = false;}, 2000)
                        }
                    }
                });



            }
        }
    })
</script>
<script>
    $(function ()
    {
        app1.queryInfo();
        app1.queryBankInfo();
        app1.selectAmountById();
    })
</script>
</html>