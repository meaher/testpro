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
					 »œÌ· «·Õ’’ &gt; «·„Ê›ﬁ…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
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
					Switch_lectures_ID=request.queryString("Switch_lectures_ID")
					Department_id=request.queryString("ID")
					set Rs=conn.execute("Select * from Switch_Lectures where Switch_lectures_ID="&Switch_lectures_id&"")
					if not rs.eof then
				%>
					<form action="Switch_Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="Second_Department_id" value="<%=Department_id%>">
						<input type="hidden" name="Switch_Lectures_id" value="<%=Switch_Lectures_id%>">						
						<input type="hidden" name="First_Lecture_ID" value="<%=rs("First_Lecture_ID")%>">						
						<input type="hidden" name="Second_Lecture_ID" value="<%=rs("Second_Lecture_ID")%>">						
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«·„Ê«›ﬁ…</td>
							</thead>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ  ﬁœÌ„ «·ÿ·»</td>
								<td class="tdDataControlR">
								&nbsp;<%=DAY(rs("Order_Date"))&"/"&Month(rs("Order_Date"))&"/"&Year(rs("Order_Date"))%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ „ﬁœ„ «·ÿ·»</td>
								<td class="tdDataControlR">
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_ID="&Rs("First_Department_id")&"")
										if not rssd.eof then
										%>
											<%=Rssd("Department_Name")%>
										<%end if
										set rssd=nothing
										%>
					
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
								
										<%									
										set Rssd=conn.execute("Select * from Subjects where Subject_ID="&rs("First_Subject_id")&"")
										if not rssd.eof then
										%>
													<%=Rssd("Subject_Name")%>
										<%
										end if
										set rssd=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																						
										<%									
										set Rssd=conn.execute("Select * from Employees Where Employee_ID="&rs("First_Employee_id")&"")
										if not rssd.eof then
										%>
														<%=Rssd("Employee_Name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
										<%									
										set Rssd=conn.execute("Select * from Class_room where Class_Room_id="&rs("First_Class_room_ID")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Class_room")%>
										<%
										End if
										set rssd=nothing
										%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								
								<%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																								
									<%									
										set Rssd=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&rs("First_Lecture_Time_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Lecture_Time_name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ «·„Œ«ÿ»</td>
								<td class="tdDataControlR">
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_ID="&Rs("Second_Department_id")&"")
										if not rssd.eof then
										%>
											<%=Rssd("Department_Name")%>
										<%end if
										set rssd=nothing
										%>
					
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
																														
								
										<%									
										set Rssd=conn.execute("Select * from Subjects where Subject_ID="&rs("Second_Subject_id")&"")
										if not rssd.eof then
										%>
													<%=Rssd("Subject_Name")%>
										<%
										End if
										set rssd=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																														
								
										<%									
										set Rssd=conn.execute("Select * from Employees Where Employee_ID="&rs("Second_Employee_id")&"")
										if not rssd.eof then
										%>
														<%=Rssd("Employee_Name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
										<%									
										set Rssd=conn.execute("Select * from Class_room where Class_Room_id="&rs("First_Class_Room_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Class_room")%>
										<%
										End if
										set rssd=nothing
										%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																																
									<%									
										set Rssd=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&rs("Second_Lecture_Time_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Lecture_Time_name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">„Ê«›ﬁ ⁄·Ï  »œÌ· «·Õ’…</td>
								<td class="tdDataControlR">
								<input type="radio" value="ok" checked name="Status">„Ê›ﬁ<span lang="en-us">
								</span>⁄·Ï «· »œÌ·&nbsp;&nbsp;&nbsp; &nbsp;
								<input type="radio" name="Status" value="no">—›÷ 
								«· »œÌ·</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
								</td>
							</tr>
							</table>
					</form>
					<%End if%>
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
					 »œÌ· «·Õ’’ &gt; «·„Ê›ﬁ…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
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
					Switch_lectures_ID=request.queryString("Switch_lectures_ID")
					Department_id=request.queryString("ID")
					set Rs=conn.execute("Select * from Switch_Lectures where Switch_lectures_ID="&Switch_lectures_id&"")
					if not rs.eof then
				%>
					<form action="Switch_Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="Second_Department_id" value="<%=Department_id%>">
						<input type="hidden" name="Switch_Lectures_id" value="<%=Switch_Lectures_id%>">						
						<input type="hidden" name="First_Lecture_ID" value="<%=rs("First_Lecture_ID")%>">						
						<input type="hidden" name="Second_Lecture_ID" value="<%=rs("Second_Lecture_ID")%>">						
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«·„Ê«›ﬁ…</td>
							</thead>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ  ﬁœÌ„ «·ÿ·»</td>
								<td class="tdDataControlR">
								&nbsp;<%=DAY(rs("Order_Date"))&"/"&Month(rs("Order_Date"))&"/"&Year(rs("Order_Date"))%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ „ﬁœ„ «·ÿ·»</td>
								<td class="tdDataControlR">
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_ID="&Rs("First_Department_id")&"")
										if not rssd.eof then
										%>
											<%=Rssd("Department_Name")%>
										<%end if
										set rssd=nothing
										%>
					
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
								
										<%									
										set Rssd=conn.execute("Select * from Subjects where Subject_ID="&rs("First_Subject_id")&"")
										if not rssd.eof then
										%>
													<%=Rssd("Subject_Name")%>
										<%
										end if
										set rssd=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																						
										<%									
										set Rssd=conn.execute("Select * from Employees Where Employee_ID="&rs("First_Employee_id")&"")
										if not rssd.eof then
										%>
														<%=Rssd("Employee_Name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
										<%									
										set Rssd=conn.execute("Select * from Class_room where Class_Room_id="&rs("First_Class_room_ID")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Class_room")%>
										<%
										End if
										set rssd=nothing
										%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								
								<%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																								
									<%									
										set Rssd=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&rs("First_Lecture_Time_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Lecture_Time_name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ «·„Œ«ÿ»</td>
								<td class="tdDataControlR">
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_ID="&Rs("Second_Department_id")&"")
										if not rssd.eof then
										%>
											<%=Rssd("Department_Name")%>
										<%end if
										set rssd=nothing
										%>
					
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
																														
								
										<%									
										set Rssd=conn.execute("Select * from Subjects where Subject_ID="&rs("Second_Subject_id")&"")
										if not rssd.eof then
										%>
													<%=Rssd("Subject_Name")%>
										<%
										End if
										set rssd=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																														
								
										<%									
										set Rssd=conn.execute("Select * from Employees Where Employee_ID="&rs("Second_Employee_id")&"")
										if not rssd.eof then
										%>
														<%=Rssd("Employee_Name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
										<%									
										set Rssd=conn.execute("Select * from Class_room where Class_Room_id="&rs("First_Class_Room_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Class_room")%>
										<%
										End if
										set rssd=nothing
										%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																																
									<%									
										set Rssd=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&rs("Second_Lecture_Time_id")&"")
										if not rssd.eof then
										%>
												<%=Rssd("Lecture_Time_name")%>
										<%
										End if
										set rssd=nothing
										%>
										
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">„Ê«›ﬁ ⁄·Ï  »œÌ· «·Õ’…</td>
								<td class="tdDataControlR">
								<input type="radio" value="ok" checked name="Status">„Ê›ﬁ<span lang="en-us">
								</span>⁄·Ï «· »œÌ·&nbsp;&nbsp;&nbsp; &nbsp;
								<input type="radio" name="Status" value="no">—›÷ 
								«· »œÌ·</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
								</td>
							</tr>
							</table>
					</form>
					<%End if%>
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