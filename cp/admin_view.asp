<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if request.querystring("id")<>"" then 

	ADMIN_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from ADMIN where ADMIN_ID="&ADMIN_ID&" " , Conn,1,2
	if not Rs.eof then
		ADMIN_ID=rs("ADMIN_ID")
		ADMIN_USER=rs("ADMIN_USER")
		ADMIN_PWD=rs("ADMIN_PWD")
		ADMIN_LEVEL=rs("ADMIN_LEVEL")
	else
		response.write "<script>alert('حصل خطأ في عرض البيانات')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>

<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td colspan="2" align="center" class="tdMainHeader">
				<!-- #include file="portal_header.asp"-->
			</td>
		</tr>
		<tr>
			<td class="tdMainMenu" valign="top">
				<!-- #include file="portal_menu.asp"-->				
			</td>
			<td valign="top" class="tdMain">
				<!-- Start Contents -->
				<p style="text-align: left"><a href="admin_list.asp?start=1">
					<span lang="en-us">Managment</span></a> 
					&gt; View/Delete</div>
				
				<div align="center">

					<form action="admin_chk.asp" method="post" name="frmData" id="frmData"  enctype="multipart/form-data">
						<input type="hidden" name="txtAdminID" value="<%=ADMIN_ID%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="ltr">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								<span lang="en-us">Admin View/ Delete</span></td>
							</thead>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								User Name</span></td>
								<td class="tdDataControlR"><%=ADMIN_USER%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								Password</span></td>
								<td class="tdDataControlR"><%=ADMIN_PWD%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="button" value="Delete Date" name="tbnSubmit" class="button" onclick="if(confirm('Are You sure')){document.frmData.submit()}">
								<input type="button" value="Back" name="tbnBack" class="button" onclick="document.location='admin_list.asp?start=1'"></td>
							</tr>
							</table>
					</form>
				</div>
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