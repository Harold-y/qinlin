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
    <%--<script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.7/layui.all.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />--%>
</head>
<style>
    .titleDiv
    {
        font-size: 24px;
        font-weight: 500;
        color: #1f2533;
        line-height: 28px;
        padding-bottom: 20px;
    }
</style>
<body>

    <div class="container" id="main" style="margin-top: 3rem">
        <div class="row">
            <div class="col-3 titleDiv">
                系统交易记录
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="row">
                    <div class="col-6">起始时间
                    </div>

                </div>
                <div class="row" style="margin-top: 1rem">
                    <div class="col-6">
                        <input type="date" style="margin-left: 5px;padding: 6px" v-model="startTime">
                    </div>
                </div>


            </div>
            <div class="col-3">
                <div class="col-3">币种
                </div>
                <div class="row" style="margin-top: 1rem">
                    <div class="col-5">
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">币种</button>
                            <ul class="dropdown-menu dropdown-menu-end" id="appendCoin">
                            </ul>
                        </div>

                    </div>
                    <div class="col-sm-5" >
                        <span v-text="cointype"></span>
                        <img v-bind:src="coinSrc" style="border-radius: 20px; height: 35px" id="coinImg">
                    </div>
                </div>

            </div>

            <div class="col-6">
                <div class="row">
                    <div class="col-6">交易类型
                    </div>

                </div>
                <div class="row" style="margin-top: 1rem">
                    <div class="col-6">
                        <select class="form-select" aria-label="Type" id="typeSelection">
                            <option selected value="1">用户交易</option>
                            <option value="2">系统交易</option>
                        </select>
                    </div>
                </div>


            </div>
        </div>
        <div class="row" style="border-bottom: 1px solid #e9ebf5; padding-bottom: 20px">
            <div class="col-3">
                <div class="row">
                    <div class="col-6">结束时间
                    </div>

                </div>
                <div class="row" style="margin-top: 1rem">
                    <div class="col-6">
                        <input type="date" style="margin-left: 5px;padding: 6px" v-model="endTime">
                    </div>
                </div>


            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-6">查询
                    </div>
                </div>
                <div class="row" style="margin-top: 1rem">
                    <button class="btn btn-outline-primary" @click="queryInfo();setPaginationToZero()">查询</button>
                </div>

            </div>
        </div>

        <div class="row" id="recordDiv">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Transaction ID</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Total Charge</th>
                    <th scope="col" v-show="!transactionTypeUser">Service Charge</th>
                    <th scope="col" v-show="!transactionTypeUser">Type</th>
                    <th scope="col" v-show="transactionTypeUser">Type (True for buy, False for sell)</th>
                    <th scope="col">Time</th>
                </tr>
                </thead>
                <tbody>
                    <tr v-for="item in tableList">
                        <td> {{ item.settlementid }} {{ item.transactionid }}</td>
                        <td>{{ item.amount }}</td>
                        <td>$ {{ item.total_charge }}</td>
                        <td v-show="!transactionTypeUser">$ {{ item.service_charge_usd }}</td>
                        <td v-show="transactionTypeUser">{{ item.buyerid==userid }}</td>
                        <td v-show="!transactionTypeUser">{{ item.type }}</td>
                        <td>{{ item.transaction_time }} {{ item.settle_time }}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="row" id="pagingDiv" style="margin-top:2rem; padding:20px" v-show="isQuery">
            <div class="col-8 offset-3">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" @click="changePage(-1)">Previous</a></li>
                        <li class="page-item"><a class="page-link">共{{ totalPage+1 }}页</a></li>
                        <li class="page-item"><a class="page-link">当前{{ currentPagination+1 }}页</a></li>
                        <li class="page-item"><input class="form-control" id="jumpInput"></li>
                        <li class="page-item"><button class="btn btn-outline-warning" @click="jumpToPage">跳转</button></li>
                        <li class="page-item"><a class="page-link" @click="changePage(1)">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
<script>
    var app3 = new Vue({
        el:"#main",
        data:{
            alreadyLogin:false,
            userid:"",

            coinSrc:"/static/img/coin/1.jpg",
            coinid:1,
            cointype:"FRO",
            startTime:"",
            endTime:"",
            typeOfTransaction:"",

            count:"",
            totalPage:"",
            currentPagination:0,

            tableList:"",
            transactionTypeUser:true,
            isQuery:false,
        },
        methods:{
            changeCoin:function(coinid)
            {
                app3.coinid = coinid;
                $.ajax({
                    url:"/coinController/queryCompleteInfoById",
                    method:"post",
                    data:{"coinid":coinid},
                    success:function(data)
                    {
                        app3.cointype = data["abbre_name"];
                        app3.coinSrc="/static/img/coin/"+app3.coinid+".jpg";
                    }
                });
            },
            setPaginationToZero()
            {
              app3.count = 0;
              app3.currentPagination = 0;
            },
            queryInfo:function()
            {
                app3.isQuery = true;
                this.typeOfTransaction = $("#typeSelection").val();
                if(this.typeOfTransaction == 1 && this.alreadyLogin && this.startTime!=null && this.endTime!=null)
                {
                    app3.transactionTypeUser = true;
                    $.ajax({
                        url:"/transactionController/queryInfoByUseridCount",
                        method:"post",
                        data:{
                            "coinid":app3.coinid,
                            "userid": app3.userid,
                            "startTime":app3.startTime,
                            "endTime":app3.endTime,
                        },
                        success:function(count)
                        {
                            app3.count = count;
                            app3.totalPage = parseInt(count / 15);
                        }
                    });
                    $.ajax({
                        url:"/transactionController/queryInfoByUserid",
                        method:"post",
                        data:{
                            "coinid":app3.coinid,
                            "userid": app3.userid,
                            "startTime":app3.startTime,
                            "endTime":app3.endTime,
                            "startIndex":app3.currentPagination * 15,
                            "endIndex": app3.currentPagination * 15 + 15,
                        },
                        success:function(data)
                        {
                            app3.tableList = data;
                        }
                    });
                }else if(this.typeOfTransaction == 2  && this.alreadyLogin && this.startTime!=null && this.endTime!=null)
                {
                    app3.transactionTypeUser = false;
                    $.ajax({
                        url:"/settlementController/queryInfoByIdCount",
                        method:"post",
                        data:{
                            "coinid":app3.coinid,
                            "userid": app3.userid,
                            "startTime":app3.startTime,
                            "endTime":app3.endTime,
                        },
                        success:function(count)
                        {
                            app3.count = count;
                            app3.totalPage = parseInt(count / 15);
                        }
                    });
                    $.ajax({
                        url:"/settlementController/queryInfoById",
                        method:"post",
                        data:{
                            "coinid":app3.coinid,
                            "userid": app3.userid,
                            "startTime":app3.startTime,
                            "endTime":app3.endTime,
                            "startIndex":app3.currentPagination * 15,
                            "endIndex": app3.currentPagination * 15 + 15,
                        },
                        success:function(data)
                        {
                            app3.tableList = data;
                        }
                    });
                }
            },
            changePage:function(value)
            {
                if(value==1 && app3.currentPagination+1 <= app3.count/15)
                {
                    app3.currentPagination += 1;
                    app3.queryInfo();
                }else if(value == -1 && app3.currentPagination - 1 >= 0)
                {
                    app3.currentPagination -= 1;
                    app3.queryInfo();
                }
            },
            jumpToPage:function()
            {
                let input = $("#jumpInput").val();
                if(input>0 && input<=app3.totalPage+1)
                {
                    app3.currentPagination = input-1;
                    app3.queryInfo();
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
        } else {
            app3.alreadyLogin = false;
        }
    })
    $(function ()
    {
        app3.changeCoin(1);
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
