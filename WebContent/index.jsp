<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,Model.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
 <style type="text/css">
 #vintage{
font:25px Georgia;
background: #EEE repeat;
font-weight: bold;
text-shadow: 5px -5px black, 4px -4px white;
-webkit-text-fill-color: transparent;
-webkit-background-clip: text;
text-align:center;
} 
 #a{
    width:510px;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
    margin: auto;
    text-align:center;
}
    #header{
      width:500px;
      height:30px;
      background:#5B5B5B;
    }
  	#sign{
   	  float:left;
   	  width:200px;
   	  font: 20px Georgia, "Times New Roman", Times, serif;
   	  margin-left:20px;
   	  margin-top:3px;
   	}
   	#sign:hover{
   	
   	 background:white;
   	}
   	#register1{
   	 width:200px;
   	 float:left;
   	 font: 20px Georgia, "Times New Roman", Times, serif;
   	 margin-top:3px;
   	}
   	#register1:hover{
   	
   	 background:white;
   	}
   	#register{
   	 display:none;
   	 width:500px;
   	 height:240px;
   	 background: #EEE;
   	}
   	#signin{
   	 width:500px;
   	 height:200px;
   	 background: #EEE;
   	}
   	.inputWrap { 
    background: -webkit-gradient(linear, left top, left 24, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    background: -o-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    font: 20px Georgia, "Times New Roman", Times, serif;
    border-radius:3px; 
    border:1px solid #CCC; 
    margin:10px 10px 0; 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF'); 
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF')"; 
} 
   #table1{
   margin-left:auto;
    margin-right:auto;
    text-align:left;
     
   }
   #table2{
   margin-left:auto;
    margin-right:auto;
    text-align:left;
     
   }
 </style>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
 function showregister(){
	 //document.getElementById("signin").innerHTML="";
	 $('#register').show();
	 $('#signin').hide();
 }
 function showsignin(){
	 //document.getElementById("signin").appendChild("signin");
	 $('#register').hide();
	 $('#signin').show();
 }
 document.getElementById("register1").addEventListener('mouseenter',showregister,false);
 document.getElementById("sign").addEventListener('mouseenter',showsignin,false);
 }
function check(form) {

    if(form.userid.value=='') {
          alert("please input userid!");
          form.userId.focus();
          return false;
     }
 if(form.password.value==''){
          alert("please input password!");
          form.password.focus();
          return false;
   }
 if(!document.getElementById("role1").checked&&!document.getElementById("role2").checked&&!document.getElementById("role3").checked)
 {
	 alert("please choose a role!");
	 return false;
 } 
   return true;
   }
function check2(form) {

    if(form.userid.value=='') {
          alert("please input userid!");
          form.userId.focus();
          return false;
     }
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
 if(!document.getElementById("role11").checked&&!document.getElementById("role22").checked)
 {
	 alert("please choose a role!");
	 return false;
 } 
   return true;
   }
</script>
<div id="vintage">
<h1>Online Trading System</h1>
</div>
<div id="a">
 <div id="header">
  <div id="sign">&nbsp;&nbsp;Sign in&nbsp;&nbsp;</div>
  <div id="register1">&nbsp;&nbsp;Register&nbsp;&nbsp;</div>
</div>
<div id="signin">
<form action="Controller/servlet/LoginServlet" method="post"  onsubmit="return check(this)">
    <table id="table1">
        <tr>
            <td><label for="txtname">userid</label></td>
            
            <td><div class="inputWrap"><input type="text" id="userid" name="userid" /></div></td>
            
        </tr>
        <tr>
            <td><label for="txtpswd">password</label></td>
            <td><div class="inputWrap"><input type="text" id="password" name="password" /></div></td>
        </tr>
        <tr>
            <td><label for="role">role</label></td>
            <td><input type="radio" name="role" id="role1" value="customer">Customer<br>
           <input type="radio" name="role" id="role2" value="seller">Seller<br>
           <input type="radio" name="role" id="role3" value="administrator">Administrator</td>
        </tr>
        <tr>
            <td colspan=2>
                <input type="reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Sign in"/>
            </td>
        </tr>
    </table>
   <%
   String u=(String)session.getAttribute("user");
   %>
   <%if(u!=null&&u.equals("worry information")){ %>
   
   <h2><%=u %></h2>
   
   <%} %>
</form>
</div>

<div id="register">
  <form action="Controller/servlet/RegisterServlet" method="post" onsubmit="return check2(this)">
    <table id="table2">
        <tr>
            <td><label for="txtname">userid</label></td>
            <td><div class="inputWrap"><input type="text" id="userid" name="userid" /></div></td>
        </tr>
        <tr>
            <td><label for="txtpswd">password</label></td>
            <td><div class="inputWrap"><input type="text" id="password" name="password" /></div></td>
        </tr>
        <tr>
            <td><label for="txtaddress">username</label></td>
            <td><div class="inputWrap"><input type="text" id="username" name="username" /></div></td>
        </tr>
        <tr>
            <td><label for="txtaddress">address</label></td>
            <td><div class="inputWrap"><input type="text" id="address" name="address" /></div></td>
        </tr>
        <tr>
            <td><label for="role">role</label></td>
            <td><input type="radio" name="role" id="role11" value="customer">Customer<br>
           <input type="radio" name="role" id="role22" value="seller">Seller<br>
        </tr>
        <tr>
            <td colspan=2>
                <input type="reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Register"/>
            </td>
        </tr>
    </table>
</form>
</div>
</div>
</body>
</html>