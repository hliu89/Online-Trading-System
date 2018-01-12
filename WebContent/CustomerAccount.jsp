<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,Model.entities.*,Model.DaoImpl.*,Model.Dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">

 ul, li{
margin:0; padding:0;font-style: normal;font:12px/22px "\5B8B\4F53",Arial, Helvetica, sans-serif
} 

ol, ul ,li{list-style:none} 
img {border: 0; vertical-align:middle} 
body{color:#000000;background:#FFF; text-align:center} 
.clear{clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px} 
a{color:#000000;text-decoration:none}  
a:hover{color:#BA2636} 
 
.red ,.red a{ color:#F00} 
.lan ,.lan a{ color:#1E51A2} 
.pd5{ padding-top:5px} 
.dis{display:block} 
.undis{display:none} 
 
ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 20px; height:60px; line-height:60px; 
color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB} 
 #count{
	 margin:auto;
	 width:900px;
	 text-align:center;
	 float:center;
	}
	#header{	
	  width:890px;
	  font: 25px Georgia, "Times New Roman", Times, serif;
	  margin: auto;
	}
	#left{
	text-align:left;
	 float:left;
	 width:890px;
	}
	#left h1{
	 text-align:left;
	}
	#left2{
	
	float:left;
	width:500px;
	display:none; 
	}
#left2 table td, th { 
font: 20px Georgia, "Times New Roman", Times, serif; 
  padding: 6px;  
  border: 1px solid #ccc;
  height:40px;
  text-align: center;  
}
#left2 input{ 
font: 20px Georgia, "Times New Roman", Times, serif; 
  width:80px;
  height:30px;
  text-align: center;  
  margin-right:50px;
}
table {  
  width: 100%;  
  border-collapse: collapse;  
} 
tr:nth-of-type(odd) {  
  background: #eee;  
} 
th {  
  background: #333;  
  color: white;  
  font-weight: bold;  
} 
td, th {  
  padding: 6px;  
  border: 1px solid #ccc;  
  text-align: left;  
}
</style>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	 function showorder(){
		 $('#left').show();
		 $('#left2').hide();
	 }
	 function showupdate(){
		 $('#left').hide();
		 $('#left2').show();
	 }
	 document.getElementById("order").addEventListener('click',showorder,false);
	 document.getElementById("update").addEventListener('click',showupdate,false);
	 }
function check(form) {

 if(form.password.value==''){
          alert("please input password!");
          form.password.focus();
          return false;
   }
 if(form.username.value==''){
     alert("please input username!");
     form.username.focus();
     return false;
}
 if(form.address.value==''){
     alert("please input address!");
     form.address.focus();
     return false;
} 
   return true;
   }
</script>
 <%
   String u=(String)session.getAttribute("user");
 String uid=(String)session.getAttribute("userid");
   %>
<div id="count">
<div id="header">
 <h1><%=u %>'s account information</h1>
 <ul id="nav">

   <li id="order"><a>See your orders</a></li>
  
   <li id="update"><a>Update your information</a></li>
   <li><a href="indexCustomer.jsp">return to Goodslist</a></li>
   <li><a href="index.jsp">Sign Out</a></li>
 </ul>
</div>

 <div id="left">
  <h1><%=u %>'s order:</h1>
  <table>
  
  <tr>
   <th>Orderid</th>
   <th>Status</th>
   <th>Price</th>
   <th>Create date</th>
   <th>Payment status</th>
  </tr>
           <% 
         
           List<Order> orderlist=(List<Order>)session.getAttribute("orderlist");
           List<Float> pricelist=(List<Float>)session.getAttribute("pricelist");
               if(orderlist!=null&&orderlist.size()>0)
               {
	               for(int i=0;i<orderlist.size();i++)
	               {
	            	  float price=0;
	                  Order o=orderlist.get(i);
	                  price=pricelist.get(i);
           %>   
            <tr>
               <td>
                 <a href="Controller/servlet/orderServlet3?orderid=<%=o.getOrderid()%>">Orderid:<%=o.getOrderid()%>(click see detail)</a>
               </td>
               <td class="dq">status:<%=o.getStatus() %></td>
              <td> price$: <%=price %></td><td>create date: <%=o.getDate() %></td>
              <%if(!o.getStatus().equals("cancel")&&!o.getStatus().equals("paid")){ %>
               <td> <a href="Controller/servlet/orderServlet2?cancelorderid=<%=o.getOrderid()%>">Cancel</a>&nbsp;&nbsp;
                    <a href="Controller/servlet/orderServlet2?payorderid=<%=o.getOrderid()%>">pay for it</a></td>
               <% }else if(o.getStatus().equals("cancel")){%>
                <td>This order has been canceled.</td>
                <%}else{ %>
               <td> This order has been paid.</td>
                <% } %> 
             </tr>
        
          <%
                   }
              } 
          %>
 </table>
 </div>
 <div id="left2">
 <div id="update">
  <h1>Update <%=u %>'s account</h1>
  <form action="Controller/servlet/SelfUpdateServlet" method="post" onsubmit="return check(this)">
    <table>
        <tr>
            <td><label for="txtpswd">password</label></td>
            <td><input type="text" id="password" name="password" style="width:300px;height:22px"/></td>
        </tr>
        <tr>
            <td><label for="txtaddress">username</label></td>
            <td><input type="text" id="username" name="username" style="width:300px;height:22px"/></td>
        </tr>
        <tr>
            <td><label for="txtaddress">address</label></td>
            <td><input type="text" id="address" name="address" style="width:300px;height:22px"/></td>
        </tr>
        <tr>
            <td colspan=2>
                <input type="reset" />
                <input type="submit" value="Update"/>
            </td>
        </tr>
    </table>
</form>
</div>
 </div>
 </div>
</body>
</html>