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

%>
</head>

<body style="text-align: center">


<table border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
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
					€Ì«» «·ÿ«·» »«· ›«’Ì·</div>
				
				<div class="RecordAdd">&nbsp;</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_Admin_MoreDetails.asp.asp?q=0"
				
				
				sSql = "select * from Students_absence where Absence_Day ="&Day(Request.QueryString("Absence_date"))&" and Absence_Month ="&Month(Request.QueryString("Absence_date"))&" and Std_civil_id='"&Request.QueryString("Std_id")&"' order by Class_Room_ID, Absence_ID DESC"
				

				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				'response.write sSql 
				'response.end				
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
									<td class="tdViewHead" width="7%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="6%" dir="rtl">«·Õ’…</td>
									<td class="tdViewHead" width="7%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									«”„ «·„⁄·„</td>
									<td class="tdViewHead" width="19%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="16%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="6%" dir="rtl">
									«·ﬁ”„ «·⁄·„Ì</td>
									<td class="tdViewHead" width="6%" dir="rtl">
									ÿ—Ìﬁ… «·«œŒ«·</td>
									<td class="tdViewHead" width="4%" dir="rtl">
									⁄–—</td>
									<td class="tdViewHead" width="5%" dir="rtl">
									«·„‘—›</td>
									<td class="tdViewHead" width="7%" dir="rtl">
									&nbsp;</td>
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
									<td class="tdView" width="7%" dir="rtl"><%=rs("Absence_Day")&"/"&rs("Absence_month")&"/"&rs("Absence_year")%>
											
									</td>
									
									<td class="tdView" width="6%" dir="rtl">&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="7%" dir="rtl">
									
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									
									<td class="tdView" width="18%" dir="rtl">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%></td>
									
									<td class="tdView" width="19%" dir="rtl">
									
									<p align="center">
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
											response.write rss("std_name")
										Else
												response.write "·« √Õœ €«∆»"
										end if
										Rss.close
									%>
																		
									</td>
									<td class="tdView" width="16%" dir="rtl">
									&nbsp;<%=rs("std_Civil_id")%></td>
								

									<td class="tdView" width="6%" dir="rtl">
									&nbsp;
									<%
										set Rss=conn.execute("Select * from Departments where Department_id="&rs("Department_id")&"")
										if not rss.eof then
											response.write rss("Department_name")
										end if
										Rss.close
									%></td>
									
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="6%" dir="rtl">
									<%
									if rs("Managment")="yes" then
										response.write "«·≈œ«—…"
									Else
										response.write "„⁄·„ «·’›"
									End if
									%></td>
									
									
									<td class="tdView" width="4%" dir="rtl">
									<%
									if rs("Excuse") = 1 then
										response.write "⁄–— „ﬁ»Ê·"
									Else
										response.write "-"
									End if
									%>
									</td>
									
									
									<td class="tdView" width="5%" dir="rtl">
									<%
									if rs("Excuse") <> "" then
										response.write rs("Admin_id") &"-"& rs("Supervisor_Name")
									End if
									%>
									</td>
									
									
									<td class="tdView" width="7%" dir="rtl">
								<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>
			
															<a href="Students_absence_Admin_Details_chk.asp?id=<%=rs("Absence_ID")%>&Class_Room_id=<%=rs("Class_room_id")%>&Class_Room=<%=Request.queryString("Class_Room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
																	<br>
								<%End if%>	
									<a href="Students_absence_Admin_Details_chk.asp?	Excuse_id=<%=rs("Absence_ID")%>&Class_Room_id=<%=rs("Class_room_id")%>&Class_Room=<%=Request.queryString("Class_Room")%>&start=1">
																	⁄–— „ﬁ»Ê·</a>								
									</td>
									
									
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