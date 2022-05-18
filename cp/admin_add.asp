<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
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
					<span lang="en-us">Managment</span></a> &gt; <span lang="en-us">
					Add</span></div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtAdminUser=	document.frmData.txtAdminUser.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtAdminUser==""){
						document.frmData.txtAdminUser.style.borderColor="red"
						document.frmData.txtAdminUser.style.borderStyle="solid"
						document.frmData.txtAdminUser.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtAdminUser.style.clear	
						document.frmData.txtAdminUser.style.borderColor="lightgray"
						document.frmData.txtAdminUser.style.borderStyle="solid"
						document.frmData.txtAdminUser.style.borderWidth=1									
					}
						
					if (txtAdminPwd==""){
						document.frmData.txtAdminPwd.style.borderColor="red"
						document.frmData.txtAdminPwd.style.borderStyle="solid"
						document.frmData.txtAdminPwd.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtAdminPwd.style.borderColor="lightgray"
						document.frmData.txtAdminPwd.style.borderStyle="solid"
						document.frmData.txtAdminPwd.style.borderWidth=1
					}
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								<span lang="en-us">Add New Admin</span></td>
							</thead>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								User Name</span></td>
								<td class="tdDataControlR"><input type="text" name="txtAdminUser" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								Password</span></td>
								<td class="tdDataControlR">
								<input type="password" name="txtAdminPwd" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Add New" name="tbnSubmit" class="button">
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