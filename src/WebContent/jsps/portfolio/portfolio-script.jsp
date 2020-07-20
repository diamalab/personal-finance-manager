
<!DOCTYPE html>  
<html>  
    <head>  
        <title>script tag</title> 
        <style> 
            body { 
                text-align:center; 
            } 
        </style> 
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
		<script type="text/javascript" src="jquery-1.5.1.js">
    		function Geeks() {
    			System.out.println(data);
	            var symbol='goog';
	            var callback = function(data) {
	                    var price=data.query.results.span[0].content;
	                    //System.out.println('Stock Price: ' + price);
	                    alert('Stock Price: ' + price);
	                    
	                };
	
	            var url = 'http://query.yahooapis.com/v1/public/yql';
	            // this is the lovely YQL query (html encoded) which lets us get the stock price:
	            // select * from html where url="http://finance.yahoo.com/q?s=goog" and xpath='//span[@id="yfs_l10_goog"]'
	            var data = "q=select%20*%20from%20html%20where%20url%3D%22http%3A%2F%2Ffinance.yahoo.com%2Fq%3Fs%3D" + symbol + "%22%20and%20xpath%3D'%2F%2Fspan%5B%40id%3D%22yfs_l10_" + symbol + "%22%5D'&format=json";
	            $.getJSON(url, data, callback);
	            
   			 }
		</script>  
    </head>  
    <body>  
        <h1>Portfolio Script</h1>
        <h2>Tag</h2> 
        <button type="button" onclick="Geeks()"> 
            Hello GeeksforGeeks</button>  
    </body>  
</html> 
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>IGotMessage - Finances</title>
<link href="styles.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="Get stock quotes, research investments and read business news that help you manage your financial life." name="description">
<meta content="financial Information,investing,investor,market news,stock research,business news,economy,finance,personal finance,quote,loan,student loan,morgage loan,car loan" name="keywords">
<meta content="all" name="robots">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script language="JavaScript">
function start(){
    getData();
    document.getElementById('link1').click();
}
function getData() {
var url = "http://query.yahooapis.com/v1/public/yql";
var symbol = $("#symbol").val();
var data = encodeURIComponent("select * from yahoo.finance.quotes where symbol in ('" + symbol + "')");

$.getJSON(url, 'q=' + data + "&format=json&diagnostics=true&env=http://datatables.org/alltables.env")
    .done(function (data) {

         $("#name").text("Bid Price: " + data.query.results.quote.Symbol);
         $("#date").text("Bid Price: " + data.query.results.quote.Date);
         $("#time").text("Bid Price: " + data.query.results.quote.LastTradeTime);
         $("#result").text("Bid Price: " + data.query.results.quote.LastTradePriceOnly);
         $("#chg").text("Bid Price: " + data.query.results.quote.PercentChange);
         $("#bid").text("Bid Price: " + data.query.results.quote.LastTradePriceOnly);
         $("#ask").text("Bid Price: " + data.query.results.quote.Ask);
         $("#volume").text("Bid Price: " + data.query.results.quote.Volume);
         $("#high").text("Bid Price: " + data.query.results.quote.HighLimit);
         $("#low").text("Bid Price: " + data.query.results.quote.LowLimit);

         if(data.query.results.quote.PercentChange.indexOf("+") != -1){

            document.getElementById("chg").className = "greenText";
        }
         else{
            //alert(data.query.results.quote.PercentChange);

            document.getElementById("chg").className = "redText";
        }

}).fail(function (jqxhr, textStatus, error) {
    var err = textStatus + ", " + error;
        $("#result").text('Request failed: ' + err);
});
}
function SendRequest()
{

    getData();
    document.getElementById('link1').click();
}   

function CheckEnter(e)
{
    if ((e.keyCode && e.keyCode==13) || (e.which && e.which==13)) {
        return SendRequest();
    }
    return true;
}       

function changeChart(select, item, url, symbol)
{   
    url = url.replace('yhoo',$("#symbol").val());
    symbol = symbol.replace('YHOO',$("#symbol").val());
    var div1d=document.getElementById("div1d_"+item);
    var div5d=document.getElementById("div5d_"+item);
    var div3m=document.getElementById("div3m_"+item);
    var div6m=document.getElementById("div6m_"+item);
    var div1y=document.getElementById("div1y_"+item);
    var div2y=document.getElementById("div2y_"+item);
    var div5y=document.getElementById("div5y_"+item);
    var divMax=document.getElementById("divMax_"+item);
    var divChart=document.getElementById("imgChart_"+item);
    if(div1d==null || div5d==null || div3m==null || div6m==null || div1y==null || div2y==null || div5y==null || divMax==null || divChart==null)
        return;
    div1d.innerHTML="1d";
    div5d.innerHTML="5d";
    div3m.innerHTML="3m";
    div6m.innerHTML="6m";
    div1y.innerHTML="1y";
    div2y.innerHTML="2y";
    div5y.innerHTML="5y";
    divMax.innerHTML="Max";
    var rand_no = Math.random();
    rand_no = rand_no * 100000000;
    switch(select)
    {
    case 0:
        div1d.innerHTML ="<b>1d</b>";
        divChart.src = "http://ichart.finance.yahoo.com/b?s="+symbol+"&"+rand_no;
        break;
    case 1:
        div5d.innerHTML="<b>5d</b>";
        divChart.src = "http://ichart.finance.yahoo.com/w?s="+symbol+"&"+rand_no;
        break;
    case 2:
        div3m.innerHTML="<b>3m</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/3m/"+url+"?"+rand_no;
        break;
    case 3:
        div6m.innerHTML="<b>6m</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/6m/"+url+"?"+rand_no;
        break;
    case 5:
        div2y.innerHTML="<b>2y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/2y/"+url+"?"+rand_no;
        break;
    case 6:
        div5y.innerHTML="<b>5y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/5y/"+url+"?"+rand_no;
        break;
    case 7:
        divMax.innerHTML="<b>msx</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/my/"+url+"?"+rand_no;
        break;
    case 4:
    default:
        div1y.innerHTML="<b>1y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/1y/"+url+"?"+rand_no;
        break;
    }
}
</script>
</head>

<body style="margin: 0px;" bgcolor="#678fc2" onload="start();">

<div align="center" style="background:url(stock_chart_yahoo_finance/main_body.jpg); width:900px; margin:50px auto; padding:20px;">

<table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
<tbody>
  <tr valign="top">
    <td class="normalText" align="left">
        <input name="txtQuote" id="symbol" onkeypress="return CheckEnter(event);" value="YHOO" type="text" />
        <input name="button" type="button" id="btnQuote" onclick="return SendRequest();" value="Get Quotes" />
        <br />
        <span class="smallText">e.g. &quot;YHOO or YHOO GOOG&quot;</span>

        <div id="service" style="padding:10px 0;">
            <table style="border: 1px solid black;" width="770">
              <tbody>
                <tr style="font-size: 14px; font-family: Arial,Helvetica,sans-serif; font-weight: bold;">
                    <td>Symbol</td>
                    <td>Date</td>
                    <td>Time</td>
                    <td>Trade</td>
                    <td>% Chg</td>
                    <td>Bid</td>
                    <td>Ask</td>
                    <td>Volume</td>
                    <td>High</td>
                    <td>Low</td>
                </tr>
                <tr style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; padding: 0px 2px;">
                    <td id="name">YHOO</td>
                    <td id="date">3/11/2011</td>
                    <td id="time">5:00pm</td>
                    <td id="result">$17.42</td>
                    <td id="chg"><span id="colorText" class="greenText">+0.36(+2.11%)</span></td>
                    <td id="bid">17.30</td>
                    <td id="ask">17.77</td>
                    <td id="volume">19,455,986</td>
                    <td id="high">17.54</td>
                    <td id="low">17.00</td>
                </tr>
            </tbody>
          </table>
          <br />
          <img id="imgChart_0" src="stock_chart_yahoo_finance/yhoo.png" border="0" /><br />
          <a class="linkText" href='javascript:changeChart(0,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div1d_0">1d</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(1,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div5d_0">5d</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(2,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div3m_0">3m</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(3,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div6m_0">6m</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(4,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div1y_0">1y</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(5,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div2y_0">2y</span></a>&nbsp;&nbsp;
          <a class="linkText" href='javascript:changeChart(6,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div5y_0">5y</span></a>&nbsp;&nbsp;
          <a id="link1" class="linkText" href='javascript:changeChart(7,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="divMax_0"><b>msx</b></span></a>
          <br />
        </div>
    </td>
</tr>
</tbody>
 -->
