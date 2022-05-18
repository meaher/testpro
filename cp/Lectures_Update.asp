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
Department_ID=Request.querystring("ID")

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
					ÃœÊ· «·Õ’’ &gt;  ⁄œÌ·</div>
				
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
				
																				
								<%
								set Rss=conn.execute("Select * from Lectures Where Lecture_ID = "&Request.Querystring("Lecture_id")&"")
								if not rss.eof then
									Lecture_Date=rss("Lecture_Date")
									Subject_ID=rss("Subject_ID")
									Employee_ID=rss("Employee_ID")
									Class_room_ID=rss("Class_room_ID")
									Lecture_Time_id=rss("Lecture_Time_id")
								End if
								rss.close
								%>

					<form action="Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="txtDepartment_ID" value="<%=request.querystring("deptID")%>">						
						<input type="hidden" name="txtDepartment_Name" value="<%=request.querystring("DeptName")%>">						
						<input type="hidden" name="txtLecture_id" value="<%=request.querystring("Lecture_id")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«· «—ÌŒ </td>
								<td class="tdDataControlR">
								<input  id="date" type="text" value=<%=Lecture_Date%> name="txtLecture_date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„</td>
								<td class="tdDataControlR">
								<%=Request.querystring("DeptName")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„«œ…</td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="txtsubject_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Subjects Where Department_ID="&Request.Querystring("Deptid")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Subject_ID")%>" <%if subject_id=rs("Subject_id") then%> selected<%End if%>><%=Rs("Subject_Name")%></option>
										<%
											'Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„⁄·„</td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees Where Department_ID="&Request.Querystring("Deptid")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>" <%if Employee_id = rs("Employee_id") then%>Selected<%End if%>><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtClass_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>" <%if Class_room_id = rs("Class_room_id") then%>Selected<%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">Êﬁ  «·Õ’…</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtLecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>" <%if Lecture_Time_id = rs("Lecture_Time_id") then%>Selected<%End if%>><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
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
					ÃœÊ· «·Õ’’ &gt;  ⁄œÌ·</div>
				
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
				
																				
								<%
								set Rss=conn.execute("Select * from Lectures Where Lecture_ID = "&Request.Querystring("Lecture_id")&"")
								if not rss.eof then
									Lecture_Date=rss("Lecture_Date")
									Subject_ID=rss("Subject_ID")
									Employee_ID=rss("Employee_ID")
									Class_room_ID=rss("Class_room_ID")
									Lecture_Time_id=rss("Lecture_Time_id")
								End if
								rss.close
								%>

					<form action="Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="txtDepartment_ID" value="<%=request.querystring("deptID")%>">						
						<input type="hidden" name="txtDepartment_Name" value="<%=request.querystring("DeptName")%>">						
						<input type="hidden" name="txtLecture_id" value="<%=request.querystring("Lecture_id")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«· «—ÌŒ </td>
								<td class="tdDataControlR">
								<input  id="date" type="text" value=<%=Lecture_Date%> name="txtLecture_date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„</td>
								<td class="tdDataControlR">
								<%=Request.querystring("DeptName")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„«œ…</td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="txtsubject_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Subjects Where Department_ID="&Request.Querystring("Deptid")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Subject_ID")%>" <%if subject_id=rs("Subject_id") then%> selected<%End if%>><%=Rs("Subject_Name")%></option>
										<%
											'Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„⁄·„</td>
								<td class="tdDataControlR">
																
								
								<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees Where Department_ID="&Request.Querystring("Deptid")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>" <%if Employee_id = rs("Employee_id") then%>Selected<%End if%>><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtClass_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>" <%if Class_room_id = rs("Class_room_id") then%>Selected<%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">Êﬁ  «·Õ’…</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtLecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>" <%if Lecture_Time_id = rs("Lecture_Time_id") then%>Selected<%End if%>><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
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