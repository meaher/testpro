<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if session("Department_ID")<>"" then 

	Employee_ID=int(request.querystring("id"))

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Employees where Employee_ID="&Employee_ID&" " , Conn,1,2
	if not Rs.eof then
		Employee_ID=rs("Employee_ID")
		Employee_Name=rs("Employee_Name")
		File_Number=rs("File_Number")
		Employee_Mobile=rs("Employee_Mobile")
		Position=rs("Position")
		Employee_EMAIL=rs("Employee_EMAIL")
		Civil_ID=rs("Civil_ID")
		subject=rs("subject")
		Date_Start=rs("Date_Start")
		Certificate_description=rs("Certificate_description")
		Certificate_Type=rs("Certificate_Type")
		Certificate_Date=rs("Certificate_Date")
		Hiring_Date=rs("Hiring_Date")
		Teacher_Hiring_Date=rs("Teacher_Hiring_Date")
		Nationality=rs("Nationality")
		Career_Level=rs("Career_Level")
		Housing_Area=rs("Housing_Area")
		Employee_MOBILE2=rs("Employee_MOBILE2")
		
		
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if
%>
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
					<form action="EmployeeAdmin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=Employee_ID%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·«”„</td>
								<td class="tdDataControlR">&nbsp;<%=Employee_Name%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" height="27">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR" height="27">
								<%=Position%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·„·›</td>
								<td class="tdDataControlR">
								<%=File_Number%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<%=Civil_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ… </td>
								<td class="tdDataControlR">
								<%=subject%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·ÊŸÌ›…</td>
								<td class="tdDataControlR">
								<%=Date_Start%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								Ê’› «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_description%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">‰Ê⁄ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_Type%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰</td>
								<td class="tdDataControlR">
								<%=Hiring_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰ ﬂ„⁄·„</td>
								<td class="tdDataControlR">
								<%=Teacher_Hiring_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Ã‰”Ì…</td>
								<td class="tdDataControlR">
								<%=Nationality%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„” ÊÏ «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<%=Career_level%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„‰ÿﬁ… «·”ﬂ‰</td>
								<td class="tdDataControlR">
								<%=Housing_Area%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« ›</td>
								<td class="tdDataControlR">
								<%=Employee_Mobile%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« › «·À«‰Ì</td>
								<td class="tdDataControlR">
								<%=Employee_MOBILE2%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·»—Ìœ «·«·ﬂ —Ê‰Ì</td>
								<td class="tdDataControlR">
								<%=Employee_Email%></td>
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
					<form action="EmployeeAdmin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=Employee_ID%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·«”„</td>
								<td class="tdDataControlR">&nbsp;<%=Employee_Name%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<%=Position%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·„·›</td>
								<td class="tdDataControlR">
								<%=File_Number%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·—ﬁ„ «·„œ‰Ì</td>
								<td class="tdDataControlR">
								<%=Civil_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ… </td>
								<td class="tdDataControlR">
								<%=subject%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·ÊŸÌ›…</td>
								<td class="tdDataControlR">
								<%=Date_Start%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								Ê’› «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_description%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">‰Ê⁄ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_Type%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·‘Â«œ…</td>
								<td class="tdDataControlR">
								<%=Certificate_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰</td>
								<td class="tdDataControlR">
								<%=Hiring_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «· ⁄ÌÌ‰ ﬂ„⁄·„</td>
								<td class="tdDataControlR">
								<%=Teacher_Hiring_Date%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Ã‰”Ì…</td>
								<td class="tdDataControlR">
								<%=Nationality%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„” ÊÏ «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<%=Career_level%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„‰ÿﬁ… «·”ﬂ‰</td>
								<td class="tdDataControlR">
								<%=Housing_Area%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« ›</td>
								<td class="tdDataControlR">
								<%=Employee_Mobile%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">—ﬁ„ «·Â« › «·À«‰Ì</td>
								<td class="tdDataControlR">
								<%=Employee_MOBILE2%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·»—Ìœ «·«·ﬂ —Ê‰Ì</td>
								<td class="tdDataControlR">
								<%=Employee_Email%></td>
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