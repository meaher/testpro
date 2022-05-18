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
							<p align="center"><b><font face="Impact" size="5">حمود الجابر الصباح الثانوية&nbsp; بنين<br>
&nbsp;الغياب اليومي<br>
							<br></font>
							<font face="Impact" size="4">
							<%
							if request.querystring("SelectStdCivilID") <> "" then
										set Rss=conn.execute("Select * from students where std_civil_id='"&request.querystring("SelectStdCivilID")&"'")
										if not rss.eof then
											response.write rss("std_name") 
										end if
										Rss.close
							End if
							
							
							%>
							&nbsp;
							<%= request.querystring("class_room")%></font>
							<br>
							</b></td>
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
				pageName="Students_absence_Admin_list_print.asp.asp?q=0"
				
				
		'	If Request.QueryString("Day")=1 then
		'		sSql = "select * from Sudents_absence order by Class_Room_id, absence_ID"
	 	'	Else

	 			'deptname=Request.queryString("txtDepartmentName")
	 			sday=Request.QueryString("SelectDay")
	 			if sday = "" then
	 				sday=0
	 			End if
	 			
	 			smonth=Request.QueryString("SelectMonth")
				if smonth="" then
					smonth=0
				end if
				
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.QueryString("selectStdCivilId")
				if std_civil_id = "" then
					std_civil_id=0
				end if
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
						Else
								sSql = "select Absence_Date from Students_absence where  Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
						Else
							smonth=month(Date())
								sSql = "select Absence_Date from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
					Else
						sSql = "select Absence_Date from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_Month="&smonth&" Group by Absence_Date order by Absence_Date Desc"
					End if
				ElseIF std_civil_ID <> 0 then
					'	sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
					sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' Group by Absence_Date order by Absence_Date Desc"

				Else 
					sSql = "select Absence_Date from Students_absence where Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
				End if
				
	 	'	End if
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
									<td class="tdViewHead" width="7%" dir="rtl">تاريخ الغياب</td>
									<td class="tdViewHead" width="16%" dir="rtl">
																		الرقم 
																		المدني&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		اسم 
																		الطالب </td>
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
									<td class="tdView" width="7%" dir="rtl"><%=Day(rs("Absence_Date"))&"/"&month(rs("Absence_Date"))&"/"&year(rs("Absence_Date"))%>
											
									</td>
									
									<td class="tdView" width="16%" dir="rtl">
									
									<table class="tblView">
										<%
										ii=0

									if 	Request.queryString("SelectStdCivilID") = "0" or Request.queryString("SelectStdCivilID") = "" then
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											'	response.write "Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.queryString("SelectStdCivilID")&"' Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id"
											while not rsx.eof 
												if rsx("std_Civil_id")<>"xxxx" then
													
													'في حال كان الطالب محذوف من السجلات لا يظهر الغيابات الخاصة به
													set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
													if not rsn.eof then

														ii=ii+1
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
															set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
															if not Rst.eof then
																	response.write rst("Std_name")&"</td><td class=tdView></td></tr>"
															End if
														Rst.close
													End if
													rsn.close
													
											End if
											rsx.movenext
											
										wend
										set rsx=nothing
									Else
								
										'	set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.queryString("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.queryString("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&"  Group by Std_civil_id")
											if not rsx.eof then 
												set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
												if not rsn.eof then

													response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
																response.write rst("Std_name")&"</td><td class=tdView></td></tr>"
														End if
													Rst.close
												End if
												Rsn.close	
											End if
										set rsx=nothing	
									End if
									%>
											</table></td>
								

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
									<td colspan="2">&nbsp;</td>
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