<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<!-- #include file="portal_functions.asp" -->
<!-- #include file="portal_upload.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Control Panel 1.0</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>

<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="ltr">
		<tr>
			<td colspan="2" align="center" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- #include file="portal_header.asp"-->
			</td>
		</tr>
		<tr>
			<td class="tdMainMenu" valign="top">
				<!-- #include file="portal_menu.asp"-->				
			</td>
			<td valign="top" class="tdMain">
				<!-- Start Contents -->
			
				<p style="text-align: left">الاحصائيات</div>
				

				<!-- End Contents -->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- #include file="portal_footer.asp"-->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="10"></td>
		</tr>
	</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>