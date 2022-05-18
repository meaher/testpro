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
	<script type="text/javascript">
	$(function () {
	$("#date4").datepicker();
	});
	$(function () {
	$("#date5").datepicker();
	});
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date6").datepicker();
	});
	$(function () {
	$("#date7").datepicker();
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
				<p style="text-align: right">				«÷«ﬁ… ÃœÌœ
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
					<form action="Employee_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						
						<input type="hidden" name="txtProcType" value="add">
						<input type="hidden" name="txthdnDeptName" value="<%=request.querystring("DeptName")%>">
						<input type="hidden" name="txthdnDeptID" value="<%=request.querystring("ID")%>">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·«”„</td>
								<td class="tdDataControlR"><input  type="text" name="txtEmployeeName" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input  type="text" name="txtPosition" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·„·›</td>
								<td class="tdDataControlR">
								<input type="text" name="txtFilenumber" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCivil_ID" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ… </td>
								<td class="tdDataControlR">
								<input type="text" name="txtsubject" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" height="26"> «—ÌŒ «·ÊŸÌ›…</td>
								<td class="tdDataControlR" height="26">
								<input id="date" type="text" name="txtDate_Start" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								Ê’› «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCertificate_description" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">‰Ê⁄ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCertificate_Type" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input id="date1" type="text" name="txtCertificate_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰</td>
								<td class="tdDataControlR">
								<input id="date2" type="text" name="txtHiring_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰ ﬂ„⁄·„</td>
								<td class="tdDataControlR">
								<input id="date3" type="text" name="txtTeacher_Hiring_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Ã‰”Ì…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtNationality" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„” ÊÏ «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCareer_Level" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„‰ÿﬁ… «·”ﬂ‰</td>
								<td class="tdDataControlR">
								<input type="text" name="txtHousing_Area" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« ›</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployeeMobile" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« › «·À«‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployee_MOBILE2" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·»—Ìœ «·«·ﬂ —Ê‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployeeEmail" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='Employee_list.asp?start=1'"></td>
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
				<p style="text-align: right">				«÷«ﬁ… ÃœÌœ
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
					<form action="Employee_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						
						<input type="hidden" name="txtProcType" value="add">
						<input type="hidden" name="txthdnDeptName" value="<%=request.querystring("DeptName")%>">
						<input type="hidden" name="txthdnDeptID" value="<%=request.querystring("ID")%>">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·«”„</td>
								<td class="tdDataControlR"><input  type="text" name="txtEmployeeName" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input  type="text" name="txtPosition" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·„·›</td>
								<td class="tdDataControlR">
								<input type="text" name="txtFilenumber" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCivil_ID" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ… </td>
								<td class="tdDataControlR">
								<input type="text" name="txtsubject" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" height="26"> «—ÌŒ «·ÊŸÌ›…</td>
								<td class="tdDataControlR" height="26">
								<input id="date4" type="text" name="txtDate_Start" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								Ê’› «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCertificate_description" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">‰Ê⁄ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCertificate_Type" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<input id="date5" type="text" name="txtCertificate_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰</td>
								<td class="tdDataControlR">
								<input id="date6" type="text" name="txtHiring_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰ ﬂ„⁄·„</td>
								<td class="tdDataControlR">
								<input id="date7" type="text" name="txtTeacher_Hiring_Date" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Ã‰”Ì…</td>
								<td class="tdDataControlR">
								<input type="text" name="txtNationality" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„” ÊÏ «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtCareer_Level" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„‰ÿﬁ… «·”ﬂ‰</td>
								<td class="tdDataControlR">
								<input type="text" name="txtHousing_Area" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« ›</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployeeMobile" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« › «·À«‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployee_MOBILE2" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·»—Ìœ «·«·ﬂ —Ê‰Ì</td>
								<td class="tdDataControlR">
								<input type="text" name="txtEmployeeEmail" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='Employee_list.asp?start=1'"></td>
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