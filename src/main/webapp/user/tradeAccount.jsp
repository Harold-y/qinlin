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

<div class="container">
    <div class="row" style="margin-top: 4rem;">
        <div class="col-sm-8">
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px">
                <div id="titleDiv">总计</div>
                <div id="assetNumDiv">$1034,52</div>
            </div>
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px; margin-top: 2rem">
                <div id="subTitleDiv1">币种分布</div>
                <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                <div style="padding: 5px; margin-top: 1rem">币种</div>
                <div id="coinTypeDiv" class="container-fluid">
                    <div class="row">
                        <div class="col-1">
                            <img src="/static/img/coin/1.jpg" style="border-radius: 40px" height="40px">
                        </div>
                        <div class="col-4">
                            <div class="row assetNameAbbre">FRO</div>
                            <div class="row assetNameCN">霜逸币</div>
                        </div>
                        <div class="col-3">
                            <div class="row assetAmount">1.52325</div>
                            <div class="row assetDollar">$1425.32</div>
                        </div>
                        <div class="col-4">
                            <div class="row assetPercent">100%</div>
                            <div class="row assetPercentBar">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 25%;"aria-valuemin="0" aria-valuemax="100"></div>
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
            <div class="input-group mb-3">
                <input type="text" class="form-control" aria-label="Text input with dropdown button" v-model="coinAmount"
                       id="coinInput">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">购入币种</button>
                <ul class="dropdown-menu dropdown-menu-end" id="appendCoin">
                </ul>
            </div>
            <div class="row">
                <div class="col-5 offset-1">
                    剩余1.254个FRO
                </div>

            </div>
            <div class="row" style="margin-top: 3rem">
                <button class="btn btn-outline-dark">转移</button>
            </div>

        </div>

    </div>

</div>
</body>
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
                var coinid = $(this).parent().children(":first").text();
            }
        })

    });
</script>

</html>