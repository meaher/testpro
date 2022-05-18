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
							<p align="center"><b><font face="Impact" size="4">أيام الغياب 
							لكل طالب<br><br>
							<%
							if request.querystring("SClass") = "" then
								Sclass=0
							Else
								sclass=request.querystring("SClass")
							End if
							
							if  sclass <> "0" then
								
								set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&cint(Sclass)&"")
								if not rss.eof then
									response.write rss("Class_Room")
								end if
								Rss.close
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
				pageName="Absence_alert_Print.asp?q=0"
				

	 			
				Class_Room_ID=Request.QueryString("sClass")
				
				
				if Class_Room_id="" then
					Class_Room_id = 0
				End if
				xx="xxxx"
				if Class_Room_ID <> 0 then
					sSql = "select Std_Civil_id from Students_absence where Class_Room_ID="&Class_Room_ID&" and std_civil_id <> '"& xx &"' Group by Std_Civil_id"
				Else				
					sSql = "select Std_Civil_id from Students_absence where std_civil_id <> '"& xx &"' Group by Std_Civil_id"
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="107%">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		الرقم 
									المدني</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									اسم الطالب</td>
									<td class="tdViewHead" width="14%" dir="rtl">
																		الصف</td>
									<td class="tdViewHead" width="15%" dir="rtl">
									بعذر</td>
									<td class="tdViewHead" width="8%" dir="rtl">
									بدون عذر</td>
									<td class="tdViewHead" width="5%" dir="rtl">
									إنذار</td>
									<td class="tdViewHead" width="17%" dir="rtl">
									عدد أيام الغياب الكلي</td>
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
								
									<%
									'في حال كان الطالب محذوف من السجلات لا يظهر الغيابات الخاصة به
									set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
									if not rsn.eof then
											
								%>

								
								<%	If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow < 2) Then %>
									
								<%	if className="tdViewChangeF" then className="tdViewChangeS" else className="tdViewChangeF" end if %>
								
								<tr  id="trRow" class="<%=className%>">
								<% End If %>
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=rs("std_Civil_id")%></td>
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
											std_name = rss("std_name")
											Class_Room_id=rss("Class_Room_id")
											
										Else
											std_name = "لا أحد غائب"
										end if
										Rss.close
									%>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="14%" dir="rtl">
									&nbsp;<%
									set Rst=conn.execute("Select * from Class_room where Class_Room_id="&Class_room_id&"")
									if not Rst.eof then
										response.write Rst("Class_Room")
									End if
									Rst.Close
									%></td>
								

								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="15%" dir="rtl">
								<%
									i=0
									set Rst=conn.execute("Select * from Excused_absence where std_civil_id='"&rs("std_civil_id")&"'")
									while not rst.eof
												i=i+1
											rst.movenext
										Wend
									Rst.Close
									%>
									<%=i%>
								</td>
									
									
									<td class="tdView" width="8%" dir="rtl">
									&nbsp;
									<%
										dd=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
										while not rss.eof
												dd=dd+1
											rss.movenext
										Wend
										Rss.close
									%>
									<%=dd-i%>
									</td>
									
									
									<td class="tdView" width="5%" dir="rtl">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii-i>4 and ii-i<10 then
										Response.write "إنذار أول"
									ElseIF ii-i>9 and ii-i<15 then
										Response.write "إنذار ثاني"
									ElseIf ii-i=15 then
										Response.write "إنذار ثالث"
									Elseif ii-i> 15 then
										Response.write "شطب"
									End if
									
									%>					
									</td>
									
									
									<td class="tdView" width="17%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
								</tr>
								
								<%
							end if
							Rsn.close

								%>
								
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="7">&nbsp;</td>
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