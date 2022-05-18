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
									
					<!-- #include file="Banner_Page_mob.asp"-->
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">

				<p>&nbsp;</p>
				<p>&nbsp;<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" width="98%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><span lang="en-us">Management Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								pass=Trim(request.form("tPass"))
								
								user= replace (user, "'", "_")
								user= replace (user, "/", "_")
								user= replace (user, "\", "_")
								user= replace (user, "%", "_")
								user= replace (user, "$", "_")
								user= replace (user, "&", "_")
								user= replace (user, "(", "_")
								user= replace (user, ")", "_")
								user= replace (user, "[", "_")
								user= replace (user, "]", "_")
								user= replace (user, "-", "_")
								user= replace (user, ".", "_")
								user= replace (user, ">", "_")
								user= replace (user, "<", "_")
								user= replace (user, " ", "_")
								
								pass= replace (pass, "'", "_")
								pass= replace (pass, "/", "_")
								pass= replace (pass, "\", "_")
								pass= replace (pass, "%", "_")
								pass= replace (pass, "$", "_")
								pass= replace (pass, "&", "_")
								pass= replace (pass, "(", "_")
								pass= replace (pass, ")", "_")
								pass= replace (pass, "[", "_")
								pass= replace (pass, "]", "_")
								pass= replace (pass, "-", "_")
								pass= replace (pass, ".", "_")
								pass= replace (pass, ">", "_")
								pass= replace (pass, "<", "_")
								pass= replace (pass, " ", "_")								
								
								Sql="select * from ADMIN where ADMIN_USER='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">Wrong User Name .</font></p>
								<%
								else
									if not rs("ADMIN_PWD")= pass then 
								%>
									<font color="#FF0000">Wrong Password</font></p>
								<%
									else
											Session.Timeout=90
											session("ADMIN_USER")=user
											session("ADMIN_Name")=rs("FullName")
											session("ADMIN_ID")=rs("Admin_ID")
											session("ADMIN_LEVEL")= rs("ADMIN_LEVEL")
											session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
											
											response.redirect "portal_main.asp"										
									end if
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">Go Back</a>

							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div></td>
			</tr>
		</table>										<p>&nbsp;</td>
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
		<!-- #include file="Banner_page.asp"-->				
		<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">			

			<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" width="688" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><span lang="en-us">Management Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								pass=Trim(request.form("tPass"))
								
								user= replace (user, "'", "_")
								user= replace (user, "/", "_")
								user= replace (user, "\", "_")
								user= replace (user, "%", "_")
								user= replace (user, "$", "_")
								user= replace (user, "&", "_")
								user= replace (user, "(", "_")
								user= replace (user, ")", "_")
								user= replace (user, "[", "_")
								user= replace (user, "]", "_")
								user= replace (user, "-", "_")
								user= replace (user, ".", "_")
								user= replace (user, ">", "_")
								user= replace (user, "<", "_")
								user= replace (user, " ", "_")
								
								pass= replace (pass, "'", "_")
								pass= replace (pass, "/", "_")
								pass= replace (pass, "\", "_")
								pass= replace (pass, "%", "_")
								pass= replace (pass, "$", "_")
								pass= replace (pass, "&", "_")
								pass= replace (pass, "(", "_")
								pass= replace (pass, ")", "_")
								pass= replace (pass, "[", "_")
								pass= replace (pass, "]", "_")
								pass= replace (pass, "-", "_")
								pass= replace (pass, ".", "_")
								pass= replace (pass, ">", "_")
								pass= replace (pass, "<", "_")
								pass= replace (pass, " ", "_")								
								
								Sql="select * from ADMIN where ADMIN_USER='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">Wrong User Name .</font></p>
								<%
								else
									if not rs("ADMIN_PWD")= pass then 
								%>
									<font color="#FF0000">Wrong Password</font></p>
								<%
									else
											Session.Timeout=90
											session("ADMIN_USER")=user
											session("ADMIN_Name")=rs("FullName")
											session("ADMIN_ID")=rs("Admin_ID")
											session("ADMIN_LEVEL")= rs("ADMIN_LEVEL")
											session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
											
											response.redirect "portal_main.asp"										
									end if
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">Go Back</a>

							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div>			

				</td>
			</tr>
		</table>
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
<%
conn.close
set conn=nothing
%>