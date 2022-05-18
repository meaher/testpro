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

if session("Department_ID")<>"" then 

	ID=int(request.querystring("id"))

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Students where ID="&ID&" " , Conn,1,2
	if not Rs.eof then
		Std_Number=rs("Std_Number")
		Std_Name=rs("Std_Name")
		Std_Civil_ID=rs("Std_Civil_ID")
		Class_Room_ID=rs("Class_Room_ID")
		
		
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if

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
				<p style="text-align: right">				Õ–› «·»Ì«‰«  &gt;
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtCivil_ID=	document.frmData.txtCivil_id.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtCivil_id==""){
						document.frmData.txtCivil_id.style.borderColor="red"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtCivil_id.style.clear	
						document.frmData.txtCivil_id.style.borderColor="lightgray"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=1									
					}
						
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="Students_data_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=ID%>">
						<input type="hidden" name="txtClass_Room" value="<%=request.querystring("Class_Room")%>">
						<input type="hidden" name="txtClass_Room_id" value="<%=request.querystring("Class_Room_id")%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="left">—ﬁ„ «·ÿ«·» ›Ì «·ﬂ‘›</td>
								<td class="tdDataControlR">&nbsp;<%=Std_Number%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«”„ «·ÿ«·»</td>
								<td class="tdDataControlR">
								&nbsp;<%=Std_Name%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								&nbsp;<%=Std_Civil_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·’›</td>
								<td class="tdDataControlR">
								&nbsp;<%=request.queryString("Class_Room")%></td>

							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ–› «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
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
				<p style="text-align: right">				Õ–› «·»Ì«‰«  &gt;
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtCivil_ID=	document.frmData.txtCivil_id.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtCivil_id==""){
						document.frmData.txtCivil_id.style.borderColor="red"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtCivil_id.style.clear	
						document.frmData.txtCivil_id.style.borderColor="lightgray"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=1									
					}
						
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="Students_data_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=ID%>">
						<input type="hidden" name="txtClass_Room" value="<%=request.querystring("Class_Room")%>">
						<input type="hidden" name="txtClass_Room_id" value="<%=request.querystring("Class_Room_id")%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="left">—ﬁ„ «·ÿ«·» ›Ì «·ﬂ‘›</td>
								<td class="tdDataControlR">&nbsp;<%=Std_Number%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«”„ «·ÿ«·»</td>
								<td class="tdDataControlR">
								&nbsp;<%=Std_Name%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								&nbsp;<%=Std_Civil_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="left">«·’›</td>
								<td class="tdDataControlR">
								&nbsp;<%=request.queryString("Class_Room")%></td>

							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ–› «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
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