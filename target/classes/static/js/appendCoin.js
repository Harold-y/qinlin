
function addCoin(tbodyId)
{
    $("#"+tbodyId).empty();
    $.ajax({
        url:"/coinController/queryAllPartial",
        method:"post",
        datatype:"json",
        data:$("#userregister").serialize(),
        success(data) {
            for(var index in data)
            {
                var coinid = "";
                var  cn_name ="";
                var  eng_name ="";
                var  abbre_name ="";
                var  Price ="";
                var  Variation ="";
                var vari;
                for(var item in data[index])
                {
                    if(coinid=="" || coinid!=null)
                    {
                        coinid = data[index].coinid;
                    }
                    if(cn_name=="" ||cn_name!=null)
                    {
                        cn_name = data[index].cn_name;
                    }
                    if(eng_name=="" ||eng_name!=null)
                    {
                        eng_name = data[index].eng_name;
                    }
                    if(abbre_name=="" ||abbre_name!=null)
                    {
                        abbre_name = data[index].abbre_name;
                    }
                    if(Price=="" ||Price!=null)
                    {
                        Price = data[index].Price;
                    }
                    if(Variation=="" ||Variation!=null)
                    {
                        Variation = data[index].Variation;
                        vari = Variation.toString();
                    }
                }
                var control = "<tr height='80px'>\n" +
                    "                        <td>\n" +
                    "                            <a href=\"coindetail.jsp?coinid="+coinid+"\" name='trade_link' target='_blank'>\n" +
                    "                                <div class=\"row\">\n" +
                    "<div class=\"col-sm-1\"><input type='hidden' value='"+coinid+"'></div>"+
                    "                                    <div class=\"col-sm-1\"><img src=\"/static/img/coin/"+coinid+".jpg\" style=\"height: 30px; border-radius: 10px\"></div>\n" +
                    "                                    <div class=\"col-sm-2\" style=\"font-size: 25px\">"+abbre_name+"</div>\n" +
                    "                                    <div class=\"col-sm-2\" style=\"color: #5c636a; opacity: 0.7\">"+cn_name+"</div>\n" +
                    "                                    <div class=\"col-sm-2\">"+eng_name+"</div>\n" +
                    "                                </div>\n" +
                    "                            </a>\n" +
                    "                        </td>\n" +
                    "                        <td>$"+Price+"</td>\n" +
                    "                        <td style=\"color: #6BAD65\">+"+Variation+"%</td>\n" +
                    "                        <td><button class='btn btn-outline-primary' name='trade'>交易</button></td>\n" +
                    "                    </tr>";
                if(vari.charAt(0) == '-')
                {
                    control = "<tr height='80px'>\n" +
                        "                        <td>\n" +
                        "                            <a href=\"coindetail.jsp?coinid="+coinid+"\" name='trade_link' target='_blank'>\n" +
                        "                                <div class=\"row\">\n" +
                        "<div class=\"col-sm-1\"><input type='hidden' value='"+coinid+"'></div>"+
                        "                                    <div class=\"col-sm-1\"><img src=\"/static/img/coin/"+coinid+".jpg\" style=\"height: 30px; border-radius: 10px\"></div>\n" +
                        "                                    <div class=\"col-sm-2\" style=\"font-size: 25px\">"+abbre_name+"</div>\n" +
                        "                                    <div class=\"col-sm-2\" style=\"color: #5c636a; opacity: 0.7\">"+cn_name+"</div>\n" +
                        "                                    <div class=\"col-sm-2\">"+eng_name+"</div>\n" +
                        "                                </div>\n" +
                        "                            </a>\n" +
                        "                        </td>\n" +
                        "                        <td>$"+Price+"</td>\n" +
                        "                        <td style=\"color: #E55E5E\">"+Variation+"%</td>\n" +
                        "                        <td><button class='btn btn-outline-primary' name='trade'>交易</button></td>\n" +
                        "                    </tr>";
                }

                $("#"+tbodyId).append($(control))
            }
            $(function ()
            {
                $("button[name='trade']").click(function ()
                {
                    var coinid =$(this).parent().parent().children(":first").children(":first").children(":first").children(":first").children(":first").val();
                    window.open("/encryption/coindetail.jsp?coinid="+coinid);
                })
            })
        }
    })

}