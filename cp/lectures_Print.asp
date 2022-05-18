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
							<td width="501" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">
							الجدول المدرسي<br>
							<%
							if request.querystring("sDepartment") <> "" then
										set Rss=conn.execute("Select * from Departments where Department_id="&cint(request.querystring("sDepartment"))&"")
										if not rss.eof then
											response.write rss("Department_name")
										end if
										Rss.close
							End if
							
							
							%>
							<br>
							حمود الجابر الصباح الثانوية للبنين</font></b></td>
							<td align="right" valign="top" width="48">&nbsp;</td>
							<td align="right" valign="top" width="142"><b><br>
							&nbsp;</b><p><b>التاريخ: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="383">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
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
				nDisplayRecs =50000
				nRecRange = 15
				nRecPerRow = 1
				ii=1
				pageName="Lectures_print.asp?q=0"
				

				sMonth=request.queryString("SMonth")
				sDay=request.queryString("SDay")
				Department_id=request.queryString("SDepartment")
				if sMonth="" then
					smonth = 0
				End if
				
				if sDay = "" then
					sday = 0
				end if
				
				if Department_id= "" then
					Department_id= 0
				end if
				
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Department_id <> 0 then
								sSql = "select * from Lectures where Department_id ="& Department_id &" and Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by Department_ID, Lecture_Time_id "
						Else
							sSql = "select * from Lectures where Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by Department_id,Lecture_Time_id "
						End if		
					Else
						if Department_id <> 0 then
							smonth= month(Date())
								sSql = "select * from Lectures where Department_id="& Department_id &" and Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by Department_ID, Lecture_Time_id "
						Else
							smonth=month(Date())
								sSql = "select * from Lectures where Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by Department_ID, Lecture_Time_id "
						End if		
					End if
				Elseif smonth <> 0 then
					if Department_id <> 0 then
							sSql = "select * from Lectures where Department_id="&Department_ID&" and Lecture_Month="&smonth&" order by Department_ID, Lecture_Time_id "
					Else
							sSql = "select * from Lectures where Lecture_Month="&smonth&" order by Department_ID, Lecture_Time_id "
					End if
				ElseIF Department_id <> 0 then
					sSql = "select * from Lectures where Department_ID ="&Department_ID&" order by Department_ID, Lecture_Time_id "
				Else 
					sSql = "select * from Lectures order by Department_ID, Lecture_Time_id "
				End if
				
	 		'End if	
	 			'response.write ssql
	 			'response.end
				Set rss = Server.CreateObject("ADODB.Recordset")
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
									<td class="tdViewHead" width="19%">
									<span lang="en-us">&nbsp;</span>تاريخ الحصة</td>
									<td class="tdViewHead" width="12%">الصف</td>
									<td class="tdViewHead" width="18%">القسم</td>
									<td class="tdViewHead" width="16%">اسم 
									المعلم</td>
									<td class="tdViewHead" width="11%">وقت الحصة</td>
									<td class="tdViewHead" width="22%">الرقم 
									المدني</td>
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
									<td class="tdView" width="19%"><%=(WeekdayName(weekday(rs("Lecture_Date"))))%> - <%=DAY(rs("Lecture_Date"))&"/"&Month(rs("Lecture_Date"))&"/"&Year(rs("Lecture_Date"))%>
											
									</td>
									
									<td class="tdView" width="12%">
									&nbsp;<%
										DeptSql = "select * from Class_room where Class_room_id="&rs("Class_room_id")&" "
										rss.open DeptSql,conn, 1, 2
											response.write  rss("Class_Room")
										rss.close
									%></td>
									
									<td class="tdView" width="18%">
									<%
										DeptSql = "select * from Departments where Department_id="&rs("Department_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write "قسم " & rss("Department_Name")
										rss.close
									%>
									
									</td>
									
									<td class="tdView" width="16%">&nbsp;
									
									<%
										DeptSql = "select * from Employees where Employee_id="&rs("Employee_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Employee_Name")
											Civil_id = rss("Civil_id")
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="11%">&nbsp;
									
										<%
										DeptSql = "select * from Lectures_Time where Lecture_Time_id="&rs("Lecture_Time_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Lecture_Time_Name")
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="22%">&nbsp;<%=civil_id%></td>
									
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
									<td colspan="6">&nbsp;</td>
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