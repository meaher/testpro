<!-- #include file="portal_Header.asp"-->
	
<head>
	<link type="text/css" rel="Stylesheet" href="style/jquery-ui.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" >
	</script>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js" >
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date").datepicker();
	});
	$(function () {
	$("#date1").datepicker();
	});
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date2").datepicker();
	});
	$(function () {
	$("#date3").datepicker();
	});
	</script>
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString


%>
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
				<!-- #include file="portal_menu.asp"-->				
				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
				<!-- Start Contents -->
				<p style="text-align: right">				«÷«ﬁ… ÿ«·» ÃœÌœ
				<%=request.querystring("DeptName")%>
				<div align="center"> 
				
				<script>
				function ValidateData(){
				
					var txtAdminUser=	document.frmData.txtCivil_ID.value;
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
					<form action="Students_data_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						
						<input type="hidden" name="txtProcType" value="add">
						<input type="hidden" name="txtClass_Room" value="<%=request.querystring("Class_Room")%>">
						<input type="hidden" name="txtClass_Room_id" value="<%=request.querystring("Class_Room_id")%>">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="left">—ﬁ„ «·ÿ«·» ›Ì «·ﬂ‘›</td>
								<td class="tdDataControlR"><input  type="text" name="txtStd_Number" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«”„ «·ÿ«·»</td>
								<td class="tdDataControlR">
								<input  type="text" name="txtStd_Name" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtStd_Civil_ID" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·’›</td>
								<td class="tdDataControlR">
								&nbsp;<%=request.queryString("Class_Room")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
							</tr>
							</table>
					</form>
				</div>
				<!-- End Contents -->
</td>
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
				<!-- #include file="portal_menu.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				<p style="text-align: right">				«÷«ﬁ… ÿ«·» ÃœÌœ
				<%=request.querystring("DeptName")%>
				<div align="center"> 
				
				<script>
				function ValidateData(){
				
					var txtAdminUser=	document.frmData.txtCivil_ID.value;
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
					<form action="Students_data_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						
						<input type="hidden" name="txtProcType" value="add">
						<input type="hidden" name="txtClass_Room" value="<%=request.querystring("Class_Room")%>">
						<input type="hidden" name="txtClass_Room_id" value="<%=request.querystring("Class_Room_id")%>">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="left">—ﬁ„ «·ÿ«·» ›Ì «·ﬂ‘›</td>
								<td class="tdDataControlR"><input  type="text" name="txtStd_Number" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«”„ «·ÿ«·»</td>
								<td class="tdDataControlR">
								<input  type="text" name="txtStd_Name" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtStd_Civil_ID" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·’›</td>
								<td class="tdDataControlR">
								&nbsp;<%=request.queryString("Class_Room")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
							</tr>
							</table>
					</form>
				</div>
				<!-- End Contents -->
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