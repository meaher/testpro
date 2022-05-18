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
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
visit_ID=Request.querystring("visit_id")

if session("Department_ID")<>"" then 
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from supervisor_visits where visit_ID="&visit_ID&" " , Conn,1,2
	if not Rs.eof then
		Subject=rs("subject")
		visit_date=rs("visit_Date")
		visit_notes=rs("visit_notes")
		visit_file=rs("visit_file")
		visit_no=rs("visit_no")
		Department_ID=rs("Department_ID")
		Employee_id=rs("Employee_id")
		Class_Room_id=rs("Class_Room_id")
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
				<div class="PageTitle">
					<p>
					“Ì«—«  —∆Ì” «·ﬁ”„ &gt; 
					 ⁄œÌ·</div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
					<form action="supervisor_visits_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=visit_ID%>" name="txtvisitID">
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">—ﬁ„
								<span lang="ar-kw">«·“Ì«—…</span></td>
								<td class="tdDataControlR">
								<input type="text" name="visit_no" value="<%=visit_no%>" class="textBox">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">⁄‰Ê«‰
								<span lang="ar-kw">«·œ—”</span></td>
								<td class="tdDataControlR">
								<input type="text" name="subject" value="<%=subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Department_ID&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>" <%if rs("Employee_id") = Employee_id then%>selected<%End if%>><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·’›</span></td>
								<td class="tdDataControlR">
																																
								<select size="1" name="Class_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room order by class_room_id")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>" <%if Class_Room_id = rs("Class_room_id") then%> selected <%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ 
								<span lang="ar-kw">«·“Ì«—…</span></td>
								<td class="tdDataControlR">
								<input  id="date" type="text" name="Visit_Date" class="textBox" value="<%=day(Visit_Date)&"/"&month(Visit_Date)&"/"&year(Visit_Date)%>"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								„·«ÕŸ« </td>
								<td class="tdDataControlR">
									<textarea name="Visit_notes" id="txtDescEN" rows="9" cols="38"><%=visit_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">„·› «·«Ã „«⁄</td>
								<td class="tdDataControlR">
								
								<input type="hidden" value="<%=Visit_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35">
								<%if visit_file <> "" then%><a href="/visits_file/<%=visit_file%>">⁄—÷ «·„·›</a><%End if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value=" ⁄œÌ·" name="tbnSubmit" class="button">
								</td>
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
				<div class="PageTitle">
					<p>
					“Ì«—«  —∆Ì” «·ﬁ”„ &gt; 
					 ⁄œÌ·</div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
					<form action="supervisor_visits_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=visit_ID%>" name="txtvisitID">
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">—ﬁ„
								<span lang="ar-kw">«·“Ì«—…</span></td>
								<td class="tdDataControlR">
								<input type="text" name="visit_no" value="<%=visit_no%>" class="textBox">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">⁄‰Ê«‰
								<span lang="ar-kw">«·œ—”</span></td>
								<td class="tdDataControlR">
								<input type="text" name="subject" value="<%=subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Department_ID&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>" <%if rs("Employee_id") = Employee_id then%>selected<%End if%>><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·’›</span></td>
								<td class="tdDataControlR">
																																
								<select size="1" name="Class_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room order by class_room_id")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>" <%if Class_Room_id = rs("Class_room_id") then%> selected <%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ 
								<span lang="ar-kw">«·“Ì«—…</span></td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" name="Visit_Date" class="textBox" value="<%=day(Visit_Date)&"/"&month(Visit_Date)&"/"&year(Visit_Date)%>"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								„·«ÕŸ« </td>
								<td class="tdDataControlR">
									<textarea class="textarea" name="Visit_notes" id="txtDescEN" rows="1" cols="20"><%=visit_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">„·› «·«Ã „«⁄</td>
								<td class="tdDataControlR">
								
								<input type="hidden" value="<%=Visit_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35">
								<%if visit_file <> "" then%><a href="/visits_file/<%=visit_file%>">⁄—÷ «·„·›</a><%End if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value=" ⁄œÌ·" name="tbnSubmit" class="button">
								</td>
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