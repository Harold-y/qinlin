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
    #subTitleDiv1, #subTitleDiv2, #subTitleDiv3
    {
        padding: 20px 16px;
        font-weight: 500;
        color: #1f2533;
        line-height: 24px;
        font-size: 18px;
    }
</style>
<body>

<div class="container">
    <div class="row" style="margin-top: 4rem;">
        <div class="col-sm-8">
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px">
                <div id="titleDiv">总资产</div>
                <div id="assetNumDiv">$10324,52</div>
            </div>
            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px; margin-top: 2rem">
                <div id="subTitleDiv1">资产分布</div>
                <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                <table class="layui-table" lay-skin="nob" style="margin-top: 1rem">
                    <div style="padding: 5px; margin-top: 1rem">账户</div>
                    <tbody id="onlyTbody">
                        <tr>

                                <td><img src="/static/img/icons/coin_wallet2.png"> </td>
                                <td>币币账户</td>
                                <td>$152.25</td>
                                <td>8.4%</td>

                        </tr>
                        <tr>

                                <td><img src="/static/img/icons/coin_wallet1.png"></td>
                                <td>资金账户</td>
                                <td>$1152.25</td>
                                <td>91.6%</td>

                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="row" style="border: 1px solid #e9ebf2; padding: 20px; margin-top: 2rem">
                <div id="subTitleDiv2">资产动态</div>
                <div style="width: 100%; border: 1px solid #e9ebf2"></div>
                <div id="transactionDiv">
                    <div class="row" style="padding: 25px; border-bottom: 1px solid #f4f5f8">
                        <div class="col-1">
                            <img src="/static/img/icons/in.png">
                        </div>
                        <div class="col-4">
                            从币币账户转入 USDT
                        </div>
                        <div class="col-4">
                            2021-03-04 19:23:34
                        </div>

                        <div class="col-3">
                            7.87066745 USDT
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 offset-1" style="border: 1px solid #e9ebf2;">
            <div class="row">
                <div id="subTitleDiv3">恰饭</div>
                <a class="btn btn-outline-info" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Show More
                </a>
            </div>

            <div style="width: 100%; border: 1px solid #e9ebf2"></div>

            <div class="collapse" id="collapseExample">
                <img src="/static/img/icons/qiafan1.jpg" height="400px">
                <img src="/static/img/icons/qiafan2.jpg" height="400px">
            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-4">

        </div>
    </div>
</div>
</body>
</html>