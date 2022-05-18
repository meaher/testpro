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
							<p align="center"><b><font face="Impact" size="5">الإحصائيات<br>
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
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				ii=1
				pageName="Statistics_print.asp?q=0"
				

				sMonth=request.queryString("SMonth")
				sDay=request.queryString("SDay")
				if sMonth="" then
					smonth = 0
				End if
				
				if sDay = "" then
					sday = 0
				end if
				
	 			if sday <> 0 then
	 				if smonth <> 0 then
							sSql = "select Absence_Date from Students_Absence where Absence_year="&year(Date())&" and Absence_Day="&sDay&" and Absence_Month="&sMonth&" and Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
					Else
						smonth= month(Date())
							sSql = "select Absence_Date from Students_Absence where Absence_year="&year(Date())&" and  Absence_Day="&sDay&" and Absence_Month="&sMonth&" and Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
					End if
				Else
					if smonth <> 0 then
							sSql = "select Absence_Date from Students_Absence where Absence_year="&year(Date())&" and  Absence_Month="&sMonth&" and Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
					Else
						sSql = "select Absence_Date from Students_Absence where Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
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
									<td class="tdViewHead">التاريخ</td>
									<td class="tdViewHead">عدد الحضور</td>
									<td class="tdViewHead">عدد الغياب</td>
									<td class="tdViewHead">نسبة الحضور</td>
									<td align="center" class="tdViewHead">
									نسبة الغياب</td>
									<td align="center" class="tdViewHead">
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
									<td class="tdView">&nbsp;<%=Day(rs("Absence_Date"))&"/"&month(rs("Absence_Date"))&"/"&year(rs("Absence_Date"))%></td>
									<td class="tdView">&nbsp;
										<%
										ii=0
										
										set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Absence_Day="&Day(rs("Absence_date"))&" Group by Std_civil_id")
										'response.write "Select * from Students_Absence where Absence_Day="&Day(rs("Absence_date"))&""
										while not rsx.eof 
											
											if rsx("std_Civil_id")<>"xxxx" then
												ii=ii+1
											End if
											rsx.movenext
											
										wend
										set rsx=nothing
										z=0
										set Rsx=conn.execute("Select * from Students")
										while not rsx.eof
											z=z+1
										
											rsx.movenext
										wend
										set rsx=nothing
										%>
									<%=z-ii%>
									</td>
									<td class="tdView">
									<%=ii%>
									
									</td>
									<td class="tdView">
									<%=100-Round(((ii/z)*100),1)%> %
									</td>
									<td class="tdView" align="center" width="70">
									&nbsp;<%=Round(((ii/z)*100),1)%> %</td>
									<td class="tdView" align="center" width="50">
									&nbsp;</td>
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
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
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