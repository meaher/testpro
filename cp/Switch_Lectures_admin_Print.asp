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
			<script>
	window.print()
	</script>

</head>
<body style="background-color: #FFFFFF">
<div align="right">
<table border="0" width="89%">
						<tr>
							<td width="383">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="501">
							<p align="center"><b><font face="Impact" size="3">
							تبديل الحصص الدراسية<br>
							<br>
							حمود الجابر الصباح الثانوية للبنين</font></b></td>
							<td align="right" valign="top" width="48">&nbsp;</td>
							<td align="right" valign="top" width="142"><b><br>
							التاريخ: <%=Date()%></b></td>
						</tr>
						<tr>
							<td width="383">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td width="501">
							<p align="center"><b><font size="3">&nbsp;</font><font size="3" face="Impact">
							<%					
							if request.querystring("id")="" then
								id = 0
							else
								id=request.querystring("id")
							End if	
										set Rssd=conn.execute("Select * from Departments where department_ID="&id&" ")
										if not rssd.eof then
											Depaertment_name = " قسم "& Rssd("Department_Name")
										End if
										set rssd=nothing
										%>

							<%=Depaertment_name %></font></b></td>
							<td width="48">&nbsp;</td>
							<td width="142">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" width="932">
				<!-- Start Contents -->
			
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				ii=1
				pageName="Switch_Lectures_admin_Print.asp?q=0"
				


				id=request.queryString("id")
				SelectMonth=request.queryString("SMonth")
				SelectDay=request.queryString("sDay")

				if selectMonth="" then
					selectMonth=0
				End if
				if selectDay="" then
					selectDay=0
				End if
				if ID="" then
					ID=0
				End if
			
				if ID > 0 then
					if SelectDay > 0 then
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& month(Date()) &" Order By status='open' "							
						end if
					Else		
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" Order By status='open' "							
						end if
					End if
				Else
					if SelectDay > 0 then
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& month(Date()) &" Order By status='open' "							
						end if
					Else		
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 Order By status='open' "							
						end if
					End if
	 			End if
	 			
	 			'response.write ssql
	 			'response.end
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				rs.Open sSql , conn, 1, 2
				
				nTotalRecs = rs.RecordCount
				If nDisplayRecs <= 0 Then ' Display All Records
					nDisplayRecs = nTotalRecs
				End If
				nStartRec = 1
				SetUpStartRec() 
				%>
				
				<% If nTotalRecs > 0 Then %>
						<div>
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="7%">
									<span lang="en-us">&nbsp;</span>تاريخ الطلب</td>
									<td class="tdViewHead" width="11%">القسم 
									مقدم الطلب</td>
									<td class="tdViewHead" width="9%">المادة</td>
									<td class="tdViewHead" width="5%">المعلم</td>
									<td class="tdViewHead" width="4%">الصف</td>
									<td class="tdViewHead" width="5%">التاريخ</td>
									<td class="tdViewHead" width="4%">الحصة</td>
									<td class="tdViewHead" width="11%" align="center">القسم 
									المخاطب</td>
									<td class="tdViewHead" width="7%">المادة</td>
									<td class="tdViewHead" width="8%">المعلم</td>
									<td class="tdViewHead" width="7%">الصف</td>
									<td class="tdViewHead" width="7%">التاريخ</td>
									<td class="tdViewHead" width="3%">الحصة </td>
									<td class="tdViewHead" width="3%">الحالة</td>
									</thead>
								<%
								If CLng(nStartRec) > CLng(nTotalRecs) Then
									nStartRec = nTotalRecs
								End If
								
								nStopRec = nStartRec + nDisplayRecs - 1
								
								nRecCount = nStartRec - 1
								If Not rs.Eof Then
									rs.MoveFirst
									rs.Move nStartRec - 1
								End If
								nRecActual = 0
								Do While (Not rs.Eof) And (nRecCount < nStopRec)
									nRecCount = nRecCount + 1
									If CLng(nRecCount) >= CLng(nStartRec) Then
										nRecActual = nRecActual + 1
								%>
								<%	If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow < 2) Then %>
									
								<%	if className="tdViewChangeF" then className="tdViewChangeS" else className="tdViewChangeF" end if %>
								
								<tr  id="trRow" class="<%=className%>">
								<% End If %>
									<td class="tdView" width="7%"><%=DAY(rs("Order_Date"))&"/"&Month(rs("Order_Date"))&"/"&Year(rs("Order_Date"))%>
											
									</td>
									
									<td class="tdView" width="11%">
									
									<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("First_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									
									</td>
									
									<td class="tdView" width="9%">
									
									
									<%
									set Rst=conn.execute("Select * from Subjects where Subject_id="&rs("First_Subject_ID")&"")
										if not rst.eof then
											response.write rst("Subject_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									
									<td class="tdView" width="5%">
									<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("First_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>								
									</td>
									
									<td class="tdView" width="4%">
									
									<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									</td>
									
									<td class="tdView" width="5%">
									&nbsp;<%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%></td>
									
									<td class="tdView" width="4%">
									&nbsp;<%=rs("First_Lecture_Time_id")%></td>
									
									<td class="tdView" width="11%">
									
									<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("Second_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									
									</td>
									
									<td class="tdView" width="7%">
									
									
									<%
									set Rst=conn.execute("Select * from Subjects where Subject_id="&rs("Second_Subject_ID")&"")
										if not rst.eof then
											response.write rst("Subject_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									
									</td>
									<td class="tdView" width="8%">
									<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("Second_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>								
									</td>
									
									<td class="tdView" width="7%">
									
									<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									</td>
									
									<td class="tdView" width="7%">
									&nbsp;<%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%></td>
									
									<td class="tdView" width="3%">
									&nbsp;<%=rs("Second_Lecture_Time_id")%></td>
									
									<td class="tdView" width="3%">
									<%
									if rs("Status")="open" then
										response.write "تحت المراجعة"
									Elseif rs("Status")="no" then
										response.write "مرفوض"
									Elseif rs("Status")="ok" then
										response.write "تم التبديل"
									End if
									%></td>
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
								</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="11">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- #include file="portal_pagging.asp"-->

				<!-- End Contents -->
			</td>
		</tr>
		</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>