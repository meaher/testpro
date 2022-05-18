<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<!-- #include file="portal_functions.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>

<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<meta http-equiv="Content-Language" content="ar-kw">
<link rel="stylesheet" type="text/css" href="style/style.css">

<title> .:: ثانوية حمود الجابر الصباح ::.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style/w3.css">
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-104794949-1', 'auto');
  ga('send', 'pageview');
</script>
<style>
.w3-theme {color:#fff !important;background-color:#398899 !important}
.w3-btn {background-color:#4CAF50;margin-bottom:4px}
.w3-code{border-left:4px solid #4CAF50}
.myMenu {margin-bottom:150px}
</style>
<style>
<!--
.auto-style1 {
	text-align: center;
}
-->
</style>
</head>
<body style="text-align: center">
<table class=" w3-left w3-hide-large w3-hover-cyan w3-large w3-theme" border="0" width="100%" id="table1"  style="border-style: solid; background-color: #FFFFFF !important">
				<tr>
					<td>
						
					<table style="width: 98%" cellspacing="0" cellpadding="0">
						
							<tr>
								<td  valign="top" background="images/defaul8.gif">
										<!--#include file="Banner_mobile.asp"-->
								</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" background="images/defaul8.gif">
									
					<div align="center">
					<table border="0" width="75%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="5" face="Akhbar MT" color="#0E0584">#<b>عودة_بالتزام</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
										</div>
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
<form action="teacher_loginCheck.asp" method=post onsubmit="return checkLoginData()" name="fLoginData">
				<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="right"><b>حساب المعلم</b></td>
						</tr>
						<tr>
							<td height="200" align="center">
							
								<table border="0" cellspacing="0" cellpadding="2" dir="rtl">
									<tr>
										<td align="right">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="left">
										<p>
										<span style="font-size: 8pt">اسم الدخول</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="text" name="tUser" size="30"></td>
									</tr>
									<tr>
										<td align="left">
										<p>
										<span style="font-size: 8pt">كلمة السر</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="password" name="tPass" size="30"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										<input type="submit" value="دخول" name="B2"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										&nbsp;</td>
									</tr>
									</table>
							
							
							
							
							
							
							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div>

				</form>
						</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="bottom" align="center">
						<!--#include file="Footer_mobile.asp"-->

								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>


<table class="w3-hide-medium w3-hide-small" border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
	<tr>
	<td>
										<!--#include file="Banner.asp"-->
	</td>
	</tr>
	


	<tr>
		<td align="center">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>عودة_بالتزام</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
									<form action="teacher_loginCheck.asp" method=post onsubmit="return checkLoginData()" name="fLoginData">
				<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" width="688" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="right"><b>حساب المعلم</b></td>
						</tr>
						<tr>
							<td height="200" align="center">
							
								<table border="0" width="600" cellspacing="0" cellpadding="2" dir="rtl">
									<tr>
										<td align="right" width="200">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="left">
										<p>
										<span style="font-size: 8pt">اسم الدخول</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="text" name="tUser" size="30"></td>
									</tr>
									<tr>
										<td align="left">
										<p>
										<span style="font-size: 8pt">كلمة السر</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="password" name="tPass" size="30"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										<input type="submit" value="دخول" name="B2"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										&nbsp;</td>
									</tr>
									</table>
							
							
							
							
							
							
							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div>

				</form><p>
											<br>
											<br>
&nbsp;
									&nbsp;<p>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<!--#include file="Footer.asp"-->
		</td>
	</tr>
</table>

</body>

</html>
<%session("ErrMsg")=""%>