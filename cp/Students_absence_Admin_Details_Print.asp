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
<table border="0" width="90%">
						<tr>
							<td width="349">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="469" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">حمود الجابر الصباح الثانوية للبنين
</font></b>
							<p align="center"><b><font face="Impact" size="4">غياب 
							الطالب مفصل<br>
							<%
							if request.querystring("SelectStdCivilID") <> "" and request.querystring("SelectStdCivilID") <> 0 then
										set Rss=conn.execute("Select * from Students where std_civil_id='"&request.querystring("SelectStdCivilID")&"'")
										if not rss.eof then
											response.write rss("std_name")&" <br> "& request.queryString("Class_Room")
										end if
										Rss.close
							Else
								response.write request.queryString("Class_room")
							End if
							
							
							%>
							<br>
							&nbsp;</font></b></td>
							<td align="right" valign="top" width="76">&nbsp;</td>
							<td align="right" valign="top" width="146">
							<p>&nbsp;<p><b>التاريخ: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="349">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td width="76">&nbsp;</td>
							<td width="146">&nbsp;</td>
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
				pageName="Students_absence_Admin_Details_Print.asp?q=0"
				

	 			sday=Request.QueryString("SDay")
	 			smonth=Request.QueryString("SMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.QueryString("selectStdCivilId")
				
				
				if sMonth="" then
					smonth = 0
				End if
				
				if sDay = "" then
					sday = 0
				end if
				
				if Std_civil_id = "" then
					Std_civil_id = 0
				end if
				
				
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" order by Class_Room_ID, absence_id DESC"
						Else
								sSql = "select * from Students_absence where  Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, absence_ID DESC"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
						Else
							smonth=month(Date())
								sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
					Else
						sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
					End if
				ElseIF std_civil_ID <> 0 then
					sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
				Else 
					sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
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
									<td class="tdViewHead" width="7%" dir="rtl" align="center">
									<b><font size="2" color="#000000">تاريخ 
									الغياب</font></b></td>
									<td class="tdViewHead" width="6%" dir="rtl" align="center">
									<b><font size="2" color="#000000">الحصة</font></b></td>
									<td class="tdViewHead" width="7%" dir="rtl" align="center">
									<b><font size="2" color="#000000">الصف</font></b></td>
									<td class="tdViewHead" width="18%" dir="rtl" align="center">
									<b><font size="2" color="#000000">اسم المعلم</font></b></td>
									<td class="tdViewHead" width="20%" dir="rtl" align="center">
									<b><font size="2" color="#000000">اسم الطالب</font></b></td>
									<td class="tdViewHead" width="15%" dir="rtl" align="center">
																		<b>
																		<font size="2" color="#000000">
																		الرقم 
																		المدني</font></b></td>
									<td class="tdViewHead" width="10%" dir="rtl" align="center">
									<b><font size="2" color="#000000">القسم 
									العلمي</font></b></td>
									<td class="tdViewHead" width="9%" dir="rtl" align="center">
									<b><font size="2" color="#000000">طريقة 
									الادخال</font></b></td>
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
									<td class="tdView" width="7%" dir="rtl" align="center"><%=rs("Absence_Day")&"/"&rs("Absence_month")&"/"&rs("Absence_year")%>
											
									</td>
									
									<td class="tdView" width="6%" dir="rtl" align="center">&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="7%" dir="rtl" align="center">
									
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									
									<td class="tdView" width="18%" dir="rtl" align="center">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%></td>
									
									<td class="tdView" width="20%" dir="rtl" align="center">
									
									<p align="center">
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
											response.write rss("std_name")
										Else
												response.write "لا أحد غائب"
										end if
										Rss.close
									%>
																		
									</td>
									<td class="tdView" width="15%" dir="rtl" align="center">
									&nbsp;<%=rs("std_Civil_id")%></td>
								

									<td class="tdView" width="10%" dir="rtl" align="center">
									&nbsp;
									<%
										set Rss=conn.execute("Select * from Departments where Department_id="&rs("Department_id")&"")
										if not rss.eof then
											response.write rss("Department_name")
										end if
										Rss.close
									%></td>
									
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="9%" dir="rtl" align="center">
									<%
									if rs("Managment")="yes" then
										response.write "الإدارة"
									Else
										response.write "معلم الصف"
									End if
									%></td>
									
									
								</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="8">&nbsp;</td>
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