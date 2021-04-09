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
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.0.1/echarts.common.js"></script>
</head>
<style>

</style>

<script>
    $(function () {
        $("#btn_login").click(function () {
            window.open("../login.jsp")
        });
        $("#btn_register").click(function () {
            window.open("../createAccount.jsp")
        });
    })
</script>
<script>
    $(function () {
        let userid = ${userid};
        $("#personalImg").attr("src", "/static/img/userImg/" + userid + ".jpg" + "?" + Math.random());
    })
    $('#personalImg').on("error", function () {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app3.alreadyLogin = true;
            app3.userid = userid;
        } else {
            app3.alreadyLogin = false;
        }
    });
</script>
<script>
    $(function () {
        var Ohref=window.location.href;
        var result=Ohref.split("?coinid=");
        app3.coinid = result[1];
    });
</script>
<body>
    <div id="generalDiv">
        <header id="headerDiv">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid" id="headerInnerDiv">
                    <a class="navbar-brand" href="/user/index.jsp">Qinlin Exchange Market</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown" href="../encryption/buycoin.jsp" id="buycoin" role="button"
                                   aria-expanded="false">
                                    购币
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown" href="../encryption/cointype.jsp" id="cointype" role="button"
                                   aria-expanded="false">
                                    币种/行情
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="d2" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    交易
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                    <li><a class="dropdown-item" href="../encryption/coinMarket.jsp">币币交易</a></li>
                                    <li><a class="dropdown-item" href="#">杠杆交易</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="输入查询内容" aria-label="content"
                                   aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon"
                                    style="color:hsla(0,0%,100%,.85)">搜索
                            </button>
                        </div>
                    </div>
                    <div class="col-sm-3" style="margin-left: 10rem">
                        <button type="button" class="btn btn-outline-info" style="color:hsla(0,0%,100%,.85)" id="btn_login"
                                v-show="!alreadyLogin">登录
                        </button>
                        <button type="button" class="btn btn-outline-success" style="color:hsla(0,0%,100%,.85)"
                                id="btn_register" v-show="!alreadyLogin">注册
                        </button>
                        <a href="../user/usercenter.jsp" target="_blank"><img src="/img/.jpg" id="personalImg" onerror="this.src='/img/newone.jpg'"
                                                      v-show="alreadyLogin" style="height: 50px; border-radius: 30px"></a>
                        <span style="color:hsla(0,0%,100%,.85)" v-show="alreadyLogin">${username}</span>
                        <a href="../user/usercenter.jsp" target="_blank">
                            <button type="button" class="btn btn-outline-primary" v-show="alreadyLogin">个人中心</button>
                        </a>
                        <a href="usercenter.jsp">
                            <button type="button" class="btn btn-outline-warning" v-show="alreadyLogin" @click="logOut">登出
                            </button>
                        </a>
                    </div>
                </div>
            </nav>
        </header>
        <div id="main" style="margin-top: 5rem; margin-bottom: 5rem">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../user/index.jsp">主页</a></li>
                                <li class="breadcrumb-item"><a href="../encryption/cointype.jsp">币种/行情</a></li>
                                <li class="breadcrumb-item active" aria-current="page">币种细节</li>
                            </ol>
                        </nav>

                    </div>
                </div>
                <div class="row" style="margin-top: 1rem;">
                    <div class="col-sm-1">
                        <img v-bind:src="coinImgSrc" style="height:60px">
                    </div>
                    <div class="col-sm-3" style="font-size: 36px">
                        <div class="row">
                            {{coinCnName}}价格
                            <div class="col-sm-1" style="font-size: 28px; color: #9AA1B1">{{coinAbbreName}}</div>
                        </div>

                    </div>

                </div>
                <div class="row" style="font-size: 30px; font-weight:600;margin-top: 1rem">
                    <div class="col-sm-8 offset-1">
                        $ {{coinPriceFormated}}
                    </div>
                    <div class="col-sm-3">
                        <a href="../encryption/buycoin.jsp"><button class="btn btn-outline-primary">立即购买/兑币</button></a>
                    </div>

                </div>
                <div class="row" style="font-size: 14px; font-weight: 500">
                    <div class="col-sm-3 offset-1" style="color: #6BAD65" id="variationText">
                        {{coinVariation}}%
                    </div>
                </div>
                <div class="row" style="border:1px solid #e9ebf2">
                    <div class="col-sm-12">
                        <%--<div class="row"  id="chart" style="height:300px; width: 1300px;">

                        </div>--%>
                        <div class="row"  id="chart2" style="height:500px; width: 1300px;">

                        </div>
                        <div class="row" style="font-size: 16px; color: #3f475a; font-weight: 500; line-height: 20px; text-align: center">
                                <span>24小时最高价格</span>
                                <span>$ {{highestPrice}}</span>
                        </div>
                        <div class="row" style="margin-top: 1rem; font-size: 16px; color: #3f475a; font-weight: 500; line-height: 20px; text-align: center">
                            <span>24小时交易额</span>
                            <span>$ {{totalTransaction}}</span>
                        </div>
                    </div>

                </div>
                <div class="row" style="margin-top: 2rem">
                    <h2 style="font-size: 24px; font-weight: 500; color:#1f2533; line-height: 28px">关于{{coinCnName}}（{{coinAbbreName}}）</h2>

                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <p style="font-size: 14px; color: #7b8293;margin-top:10px;">{{coinIntro}}</p>
                        <hr>
                    </div>
                </div>

                <div class="row" style="margin-top: 2rem">
                    <h2 style="font-size: 24px; font-weight: 500; color:#1f2533; line-height: 28px">团队成员</h2>

                </div>

                <div class="row" style="margin-top: 2rem" v-for="item in founders">
                    <div class="col-sm-1">
                        <img class="member-avatar" style="height: 80px; border-radius: 60px" :src="item.imgSrc" alt="">
                    </div>
                    <div class="col-sm-7">
                        <div class="row">
                            <span style="font-size: 18px; font-weight: 500; line-height: 24px">{{item.founder_name}}</span>
                            <span style="font-size: 14px; font-weight: 500; line-height: 20px; color: #9aa1b1">{{item.position}}</span>
                        </div>
                        <div class="row" style="margin-top:5px; font-weight: 400; font-size: 14px; color: #7b8293; line-height: 20px">
                            <p>{{item.intro}}
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <footer id="footerFooter">
            <div class="container-fluid">
                <div class="container">
                    <div class="row" style="padding-top: 2rem; padding-bottom: 2rem;">
                        <div class="col-sm-3">
                            <h4 style="margin-bottom: 2rem;">关于琴麟交易所</h4>
                            <p><a href='#'>关于我们</a></p>
                            <p><a href='#'>职业机会</a></p>
                        </div>
                        <div class="col-sm-3">
                            <h4 style="margin-bottom: 2rem;">法律和隐私</h4>
                            <p><a href='#'>服务条款</a></p>
                            <p><a href='#'>隐私保护</a></p>
                            <p><a href='#'>免责声明</a></p>
                        </div>
                        <div class="col-sm-3">
                            <h4 style="margin-bottom: 2rem;">支持</h4>
                            <p><a href='#'>帮助中心</a></p>
                            <p><a href='#'>在线客服</a></p>
                            <p><a href='#'>问题反馈</a></p>
                        </div>
                        <div class="col-sm-3">
                            <h4 style="margin-bottom: 2rem;">接收免费的订阅邮件</h4>
                            <p>请输入您的邮件地址：</p>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Email地址" aria-label="Recipient's username"
                                       aria-describedby="button-addon2">
                                <button class="btn btn-outline-secondary btn-outline-info" type="button" id="button-addon2">订阅
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" id="mediaDiv">
                <div class="container">
                    <div class="row" style="padding-top: 2rem; padding-bottom: 2rem;">
                        <div class="col-sm-7" style="color:white"><h5>媒体</h5>
                        </div>
                        <div class="col-sm-5" style="">
                            <ul id="mediaUl">
                                <li><a href=""><img src="/static/img/media/Icon_Connect_Facebook.png"></a></li>
                                <li><a href=""><img src="/static/img/media/Icon_Connect_Twitter.png"></a></li>
                                <li><a href=""><img src="/static/img/media/Icon_Connect_Youtube.png"></a></li>
                                <li><a href=""><img src="/static/img/media/Icon_Connect_Email.png"></a></li>
                                <li><a href=""><img src="/static/img/media/Icon_Connect_Instragram.png"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="container-fluid" style="background: #333333; color: #FFFFFF;">
            <div class="container">
                <div class="row" style="padding-top: 2rem; padding-bottom: 1rem;">
                    <div class="col-sm-12">
                        <p>此网站是琴麟交易所官方网址之一</p>
                        <p>Qinlin Exchange Ltd. (c) 特别鸣谢：Harold</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<script>
    var app3 = new Vue({
        el: "#generalDiv",
        data: {
            alreadyLogin: false,
            userid:"",
            coinid:"",
            coinCnName:"",
            coinAbbreName:"",
            coinPrice:"",
            coinVariation:"",
            coinIntro:"",
            founders:"",
            coinImgSrc:"",
            coinPriceFormated:"",
            highestPrice:"",
            totalTransaction:"",
            weekPriceList:"",
            graphDate:"",
            graphHighest:"",
            graphLowest:""
        },
        methods: {
            queryInfo:function()
            {
              $.ajax({
                  url: "/coinController/queryCompleteInfoById",
                  method: "post",
                  data:{"coinid":app3.coinid},
                  success: function (data) {
                          app3.coinCnName = data.cn_name;
                          app3.coinAbbreName = data.abbre_name;
                          app3.coinPrice = data.Price;
                          app3.coinVariation = data.Variation;
                          app3.coinIntro = data.coin_intro;
                          app3.coinImgSrc = "/static/img/coin/"+app3.coinid+".jpg";
                          app3.highestPrice = app3.toThousands(data.highestPrice);
                          app3.totalTransaction = app3.toThousands(data.tradeAmount);
                      app3.coinPriceFormated = app3.toThousands(app3.coinPrice);
                      let vari = data.Variation.toString();
                      if(vari.charAt(0) == '-')
                      {
                          $("#variationText").attr('style','color:#E55E5E');
                      }
                  }
              });
                $.ajax({
                    url: "/founderController/selectFounderByCoinId",
                    method: "post",
                    data:{"coinid":app3.coinid},
                    success: function (data) {
                        app3.founders = data;
                        app3.queryGraphicalInfo2();
                    }
                });
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
            logOut: function () {
                $.ajax({
                    url: "/userController/removeSession",
                    method: "post",
                    success: function (index) {
                        if (index == 1) {
                            window.location.reload();
                        }
                    }
                });
            },
            queryGraphicalInfo2:function()
            {
                    $.ajax({
                        url:"/statisticsController/selectWeekPriceList",
                        method:"post",
                        data:{"coinid":app3.coinid},
                        success:function(data)
                        {
                            var list1 = [];
                            let indexL = 0;
                            var max = 0;
                            var low = 0;
                            for(item in data)
                            {
                                var smallList = [];
                                smallList[1] = data[item]["price"];
                                smallList[0] = data[item]["stat_time"];
                                list1[indexL] = smallList;
                                indexL++;

                                if(data[item]["price"] > max)
                                {
                                    max = data[item]["price"];
                                }
                                if(data[item]["price"] < low)
                                {
                                    low = data[item]["price"];
                                }
                            }
                            app3.graphLowest = low;
                            app3.graphHighest = max;
                            var chartDom = document.getElementById('chart2');
                            var myChart = echarts.init(chartDom);
                            var option;
                            var dateList = list1.map(function (item) {
                                return item[0];
                            });
                            var valueList = list1.map(function (item) {
                                return item[1];
                            });

                            option = {

                                // Make gradient line here
                                visualMap: [{
                                    show: false,
                                    type: 'continuous',
                                    seriesIndex: 0,
                                    min: app3.graphLowest,
                                    max: app3.graphHighest,
                                }],
                                title: [{
                                    left: 'center',
                                    text: 'Gradient along the y axis'
                                }],
                                tooltip: {
                                    trigger: 'axis',
                                    extraCssText:'width:130px;height:80px;'
                                },
                                xAxis: [{
                                    data: dateList
                                }],
                                yAxis: [{
                                }],
                                grid: [{
                                    bottom: '10%',
                                }],
                                series: [{
                                    type: 'line',
                                    showSymbol: false,
                                    data: valueList
                                }]
                            };

                            option && myChart.setOption(option);
                        }
                    })
            }
        }
    })
</script>
<script>
    $(function(){
        app3.queryInfo();
        setInterval(app3.queryInfo, 1000)
    })
</script>
</html>