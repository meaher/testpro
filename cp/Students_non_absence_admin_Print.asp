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
							<p align="center"><b><font face="Impact" size="5">أسماء الطلاب غياب صفر
<br>
							<%
							if request.querystring("sClass") <> "" then
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&cint(request.querystring("sClass"))&"")
										if not rss.eof then
											response.write rss("Class_room")
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
				pageName="Students_non_absence_admin_print.asp?q=0"
				

				'sMonth=request.queryString("SMonth")
				'sDay=request.queryString("SDay")
				Class_Room_id=request.queryString("SClass")
				'if sMonth="" then
				'	smonth = 0
				'End if
				
				'if sDay = "" then
				'	sday = 0
				'end if
				
				if Class_Room_ID = "" then
					Class_Room_id = 0
				end if
				
	 '		if sday <> 0 then
	 '				if smonth <> 0 then
	 '					if Class_Room_ID <> 0 then
	'							sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" order by Class_Room_ID, absence_id DESC"
	'					Else
	'						sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, absence_ID DESC"
	'					End if		
	'				Else
	'					if Class_Room_ID <> 0 then
	'						smonth= month(Date())
	'							sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
	'					Else
	'						smonth=month(Date())
	'						sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
	'					End if		
	'				End if
	'			Elseif smonth <> 0 then
	'				if Class_Room_ID <> 0 then
	'					sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
	'				Else
	'					sSql = "select * from Students_absence where Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
	'				End if
	'			ElseIF Class_Room_ID <> 0 then
	'				sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
	'			Else 
	'				sSql = "select * from Students_absence order by Class_Room_ID, Absence_ID DESC"
	'			End if
	'			
	 		'End if	
	 			'response.write ssql
	 			'response.end
				Set rs = Server.CreateObject("ADODB.Recordset")
				if Class_Room_ID = "" then
					Class_Room_ID="0"
				End if
				if Class_Room_ID <> "0" then
					sSql = "select * from Students where Class_Room_ID="&Class_Room_ID&" order by ID asc"
				Else
					sSql = "select * from Students order by Class_Room_ID asc"
				End if
				ii=0
				rs.CursorLocation = 3
				'response.write sSql &"---"& class_room_id
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
									<td class="tdViewHead" width="6%" dir="rtl">
									م</td>
									<td class="tdViewHead" width="15%" dir="rtl">
									الصف</td>
									<td class="tdViewHead" width="77%" dir="rtl">
									اسم الطالب</td>
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
									
									set Rst=conn.execute("Select * from Students_absence where Std_Civil_ID = '"&rs("Std_Civil_ID")&"'")
									if rst.eof then 
									'response.end
									
									nRecCount = nRecCount + 1
									If CLng(nRecCount) >= CLng(nStartRec) Then
										nRecActual = nRecActual + 1
								%>
								<%	If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow < 2) Then %>
									
								<%	if className="tdViewChangeF" then className="tdViewChangeS" else className="tdViewChangeF" end if %>

									
								<tr  id="trRow" class="<%=className%>">
								<% End If %>
							
									<td class="tdView" width="6%" dir="rtl">&nbsp;
									<%
									ii=ii+1
									%>
									<%=ii%></td>
									
									<td class="tdView" width="15%" dir="rtl">
									
									<%
										
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									
									<td class="tdView" width="77%" dir="rtl">
									
									<p align="right">
									
									<%
											response.write rs("std_name")
										
									%>
																		
									</td>
									
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									</tr>
							
								<% 
									End If 
									End If
								
								End if
								Rst.close
								set Rst=nothing
								
									rs.MoveNext
										
							
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="3">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							

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