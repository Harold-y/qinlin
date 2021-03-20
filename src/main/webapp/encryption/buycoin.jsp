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
        $("#btn_login").click(function () {
            window.open("../user/login.jsp")
        });
        $("#btn_register").click(function () {
            window.open("../user/createAccount.jsp")
        });
    })
</script>
<script>
    $(function () {
        let userid = ${userid};
        $("#personalImg").attr("src", "/img/userImg/" + userid + ".jpg" + "?" + Math.random());
    })
    $('#personalImg').on("error", function () {
        $(this).attr('src', '/img/newone.jpg');  // 替换为默认图片
    });
    $(function () {
        let userid = ${userid};
        if (userid != null) {
            app3.alreadyLogin = true;
        } else {
            app3.alreadyLogin = false;
        }
    })
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
            <div class="container-fluid" >
                <div class="row">
                    <div class="col-sm-2 offset-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../user/index.jsp">主页</a></li>
                                <li class="breadcrumb-item active" aria-current="page">购币</li>
                            </ol>
                        </nav>

                    </div>
                </div>
            </div>
            <div class="container-fluid" style="margin-top: 2rem;background-color: #F5F6FA">
                <div class="row"></div>
                <div class="row" style="margin-top: 3rem">
                    <div class="col-sm-4 offset-2">
                        <div class="row">
                            <div class="col-sm-2">
                                <img v-bind:src="coinSrc" height="50px" style="border-radius: 20px">
                            </div>
                            <div class="col-sm-6" style="margin-left: 0px">
                                <h1 v-text="coincnName"></h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8" style="opacity: 0.65" v-text="coinintro">

                            </div>
                        </div>
                        <div class="row" style="margin-top: 2rem">
                            <div class="col-sm-4">
                                <a href="" id="learnMoreLink">了解更多...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-sm-6">
                                <a href="buy.jsp" target="onlyiframe"><button type="button" class="btn btn-primary" style="border-radius: 20px">购买</button></a>
                                <a href="sell.jsp" target="onlyiframe"><button type="button" class="btn btn-info" style="border-radius: 20px">出售</button></a>
                            </div>
                            <div class="col-sm-2 offset-3">
                                <span class="badge rounded-pill bg-success">${username} 欢迎您</span>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 2rem; border-radius: 50px">
                            <iframe src="buy.jsp" name="onlyiframe" height="500px"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" >
                <img class="img-fluid" src="/static/img/propa1.jpg">
            </div>
            <div class="container-fluid" style="background-color: #F5F6FA">
                <div class="row">
                    <div class="col-sm-8 offset-2">
                        <img class="img-fluid" src="/static/img/propa2.jpg">

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
            coinid:"1",
            coinintro:"霜逸币是由霜逸Official开发的区块链加密货币，此货币是一种P2P形式的数字货币。点对点的传输意味着一个去中心化的支付系统。 与大多数货币不同，霜逸币不依靠特定货币机构发行...",
            coincnName:"霜逸币",
            coinSrc:"/static/img/coin/1.jpg",
            learnMoreSrc:"coindetail.jsp?coinid="
        },
        methods: {
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
            update:function(coinid)
            {
                app3.coinid = coinid;
                app3.coinSrc = "/static/img/coin/"+coinid+".jpg";
                $.ajax({
                    url:"/coinController/queryCompleteInfoById",
                    method:"post",
                    data:{"coinid":coinid},
                    success:function(data)
                    {
                        app3.coinintro = data["coin_intro"].substring(0, 150)+"...";
                        app3.coincnName = data["cn_name"];
                        app3.learnMoreSrc = "coindetail.jsp?coinid="+coinid;
                        $("#learnMoreLink").attr("href", app3.learnMoreSrc);
                    }
                })
            }
        }
    })
</script>
</html>