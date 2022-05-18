<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Department_ID=Request.querystring("ID")
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<script src="js/nicEdit.js" type="text/javascript"></script>
	<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		//new nicEditor({fullPanel : true}).panelInstance('txtDesc');
		//new nicEditor({fullPanel : true}).panelInstance('txtDescEN');
	});
	</script>
	<link type="text/css" rel="Stylesheet" href="styles/jquery-ui.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" >
	</script>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js" >
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date").datepicker();
	});
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date1").datepicker();
	});
	</script>
</head>
<body>

<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0">

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
				<div class="PageTitle">
					<p>
					تبديل الحصص &gt; حذف الطلب</div>
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
					set Rs=conn.execute("Select * from Switch_Lectures where Switch_lectures_ID="&Switch_lectures_id&"")
					if not rs.eof then
				%>
					<form action="Switch_Lectures_Admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="delete">						
						<input type="hidden" name="Switch_Lectures_id" value="<%=Switch_Lectures_id%>">						
						<input type="hidden" name="First_Lecture_ID" value="<%=rs("First_Lecture_ID")%>">						
						<input type="hidden" name="Second_Lecture_ID" value="<%=rs("Second_Lecture_ID")%>">						
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								حذف الطلب</td>
							</thead>
							<tr>
								<td class="tdDataControlL">تاريخ تقديم الطلب</td>
								<td class="tdDataControlR">
								&nbsp;<%=DAY(rs("Order_Date"))&"/"&Month(rs("Order_Date"))&"/"&Year(rs("Order_Date"))%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">القسم مقدم الطلب</td>
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
								<td class="tdDataControlL">المادة</td>
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
								<td class="tdDataControlL">المعلم</td>
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
								<td class="tdDataControlL">الصف</td>
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
								<td class="tdDataControlL">تاريخ الحصة</td>
								<td class="tdDataControlR">
								
								<%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL">الحصة</td>
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
								<td class="tdDataControlL">القسم المخاطب</td>
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
								<td class="tdDataControlL">المادة</td>
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
								<td class="tdDataControlL">المعلم</td>
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
								<td class="tdDataControlL">الصف</td>
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
								<td class="tdDataControlL">تاريخ الحصة</td>
								<td class="tdDataControlR">
								<%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">الحصة</td>
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
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="حذف طلب التبديل" name="tbnSubmit" class="button">
								</td>
							</tr>
							</table>
					</form>
					<%End if%>
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