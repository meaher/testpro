<!-- #include file="portal_Header.asp"-->
<!-- #include file="portal_functions.asp" -->

<head>
<style>
<!--
.auto-style1 {
	text-align: center;
}
-->
</style>
</head>
<%
		Sql="select * from students where std_Civil_ID='"&session("std_civil_id")&"'"
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open Sql, conn, 1, 2
		
		if not rs.eof then
			Std_Number=rs("Std_Number")
			std_name=rs("std_name")
			std_civil_id=rs("std_civil_id")
			Class_Room_ID=rs("Class_Room_ID")
		Else
			response.redirect "parentcp.asp"
		End if	
		rs.close	
%>
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
									
					<div align="center">
					<table border="0" width="75%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="5" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
										</div>
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
<table border="0" cellpadding="0" cellspacing="0" width="95%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center" dir="rtl">


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">Õ”«» «·ÿ«·»<span lang="en-us">:</span> <%=std_name%><span lang="en-us">&nbsp;
			</span>&nbsp;«·’›<span lang="en-us">:</span> 
			
			<%
										set Rssd=conn.execute("Select * from Class_Room where Class_Room_ID="&Class_room_id&"")
										if not rssd.eof then
											Class_Room = rssd("Class_Room")
											response.write Class_Room		
										End if
										rssd.close
										set rssd=nothing
			%>
			</font>
			<p style="text-align: right">
											<p>
											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdView" width="66%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									</tr>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		«”„ «·ÿ«·»</td>
									<td class="tdView" width="66%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
										</td>
									</tr>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		«·’›</td>
									<td class="tdView" width="66%" dir="rtl">
									<%=class_room%></td>
									</tr>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		»⁄–—</td>
									<td class="tdView" width="66%" dir="rtl">
									<%
									i=0
									set Rst=conn.execute("Select * from Excused_absence where std_civil_id='"&std_civil_id&"'")
									while not rst.eof
												i=i+1
											rst.movenext
										Wend
									Rst.Close
									%>
									<%=i%></td>
									</tr>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		»œÊ‰ ⁄–—</td>
									<td class="tdView" width="66%" dir="rtl">
									
									<%
										dd=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												dd=dd+1
											rss.movenext
										Wend
										Rss.close
									%>
									<%=dd-i%>
										</td>
									</tr>
									<tr>
									<td class="tdView" width="31%" dir="rtl">
																		≈‰–«—</td>
									<td class="tdView" width="66%" dir="rtl">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii-i>4 and ii-i<10 then
										Response.write "≈‰–«— √Ê·"
									ElseIF ii-i>9 and ii-i<15 then
										Response.write "≈‰–«— À«‰Ì"
									ElseIf ii-i=15 then
										Response.write "≈‰–«— À«·À"
									Elseif ii-i> 15 then
										Response.write "‘ÿ»"
									End if
									
									%>					
									</td>
									</tr>
									<td class="tdView" width="31%" dir="rtl">
																		⁄œœ √Ì«„ «·€Ì«» «·ﬂ·Ì</td>
									<td class="tdView" width="66%" dir="rtl">
										<%
									
										response.write ii
									%>
									</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="31%" dir="rtl">
									&nbsp;</td>
									
									<td class="tdView" width="66%" dir="rtl">
									
									&nbsp;</td>
									
									
								</tr>
									<td colspan="2">
														
					</td>
								</tr>
								</table>
								
																			<!-- Start Contents -->
			
				<div class="PageTitle">
					<p align=right><span lang="ar-kw">«·’ÕÌ›… «·”·ÊﬂÌ… 
					</span><br>
				&nbsp;</div>


				<div class="RecordAdd">
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' order by Department_ID,Class_Room_id,Report_date desc"
'response.write sSql 
				'	ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="98%" dir="rtl">
								<thead>
									<td class="tdViewHead" width="8%"> «—ÌŒ
									<span lang="ar-kw">«· ﬁ—Ì—</span></td>
									<td class="tdViewHead" width="21%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="5%">
									<span lang="ar-kw">«·ﬁ”„ «·⁄·„Ì</span></td>
									<td class="tdViewHead" width="4%">
									<span lang="ar-kw">«”„ «·„⁄·„</span></td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw">⁄—÷</span> </td>
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
									<td class="tdView" width="8%"><%=DAY(rs("report_Date"))&"/"&Month(rs("report_Date"))&"/"&Year(rs("report_Date"))%>
											
									</td>
									
									<td class="tdView" width="21%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="5%">
										<%
										if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Departments where Department_ID="&rs("Department_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Department_Name")%>
										<%				
											else
												response.write "«·«‘—«›"	
											end if
										set rss=nothing
										Else
											response.write "«·«‘—«›"
										End if

										%>
</td>
									
									<td class="tdView" width="4%">
									<%
										'if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Employees where Employee_ID="&rs("Employee_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%				
											else
												response.write "«·«‘—«›"	
											end if
										set rss=nothing
										'Else
										'	response.write "«·«‘—«›"
										'End if

										%></td>
									
									<td class="tdView" align="center" width="8%">
											<a href="parentcp_behavior_view.asp?id=<%=rs("ID")%>&std_name=<%=std_name%>&Class_Room=<%=Class_Room%>&page=0">
											«· ›«’Ì· </a>
									
									</td>
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
									<td colspan="5">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
								
			
				<div class="PageTitle">
					&nbsp;</div>


				<div class="RecordAdd">
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from Students_Delay where Std_civil_id='"& Std_Civil_id &"' order by Delay_Date Desc"
					'response.write sSql 
					'ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955" dir="rtl">
								<thead>
									<td class="tdViewHead" width="10%"> «—ÌŒ
									<span lang="ar-kw">«· √ŒÌ—</span></td>
									<td class="tdViewHead" width="22%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="66%">
									<span lang="ar-kw">Êﬁ  «· √ŒÌ—</span></td>
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
									<td class="tdView" width="10%"><%=Day(rs("Delay_Date"))&"/"&month(rs("Delay_Date"))&"/"&year(rs("Delay_Date"))%>
											
								
											
									</td>
									
									<td class="tdView" width="22%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="66%">
								
											<%	if rs("Delay_Time_ID")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rs("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rs("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rs("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rs("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rs("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rs("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rs("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													%>
<%=Delay_time%>
</td>
									
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
									<td colspan="3">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
									
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;«·‰Ê«ﬁ’ «·„ÿ·Ê»… ·„·› «·ÿ«·»<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView" width="90%">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		«·√Ê—«ﬁ 
																		«·„ÿ·Ê»…</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									«·Õ«·…</td>
									</thead>
									<%
									'std_civil_id=request.queryString("std_civil_id")
									'std_name=request.queryString("std_name")
									'class_room=request.queryString("Class_room")
									
									%>
							<%
							if rss("std_reg_Form")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp;
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»… 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·Ã‰”Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									≈Ì’«· «·—”Ê„</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·ÃÊ«“</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… ‘Â«œ… «·„Ì·«œ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									 ”·”· œ—«”Ì »«·„œ—”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—…  —ﬂ œ—«”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—… «⁄«œ… ﬁÌœ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								
						<%
						End if
						rss.close
						%></td>
						</tr>
						<tr>
							<td>
							<a target="_blank" href="Parentcp_Absence_alert_Print.asp?std_civil_id=<%=std_civil_id%>&std_Name=<%=std_Name%>&Class_room=<%=class_room%>"><font size="3">ÿ»«⁄…</font></a></td>
						</tr>
					</table>										</td>
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
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
									<table border="0" cellpadding="0" cellspacing="0" width="75%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center">


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">Õ”«» «·ÿ«·»<span lang="en-us">:</span> <%=std_name%><span lang="en-us">&nbsp;
			</span>&nbsp;«·’›<span lang="en-us">:</span> 
			
			<%
										set Rssd=conn.execute("Select * from Class_Room where Class_Room_ID="&Class_room_id&"")
										if not rssd.eof then
											Class_Room = rssd("Class_Room")
											response.write Class_Room		
										End if
										rssd.close
										set rssd=nothing
			%>
			</font>
			<p style="text-align: right">
											<p>
											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="18%" dir="rtl">
																		«·’›</td>
									<td class="tdViewHead" width="6%" dir="rtl" align="center">
									»⁄–—</td>
									<td class="tdViewHead" width="14%" dir="rtl" align="center">
									»œÊ‰ ⁄–—</td>
									<td class="tdViewHead" width="7%" dir="rtl" align="center">
									≈‰–«—</td>
									<td class="tdViewHead" width="16%" dir="rtl" align="center">
									⁄œœ √Ì«„ «·€Ì«» «·ﬂ·Ì</td>
									<td class="tdViewHead" width="4%" dir="rtl">
									&nbsp;</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									&nbsp;<%=class_room%></td>
								
									<td class="tdView" width="6%" dir="rtl" align="center">
									<%
									i=0
									set Rst=conn.execute("Select * from Excused_absence where std_civil_id='"&std_civil_id&"'")
									while not rst.eof
												i=i+1
											rst.movenext
										Wend
									Rst.Close
									%>
									<%=i%></td>
									
									
									<td class="tdView" width="14%" dir="rtl" align="center">
								&nbsp;
									<%
										dd=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												dd=dd+1
											rss.movenext
										Wend
										Rss.close
									%>
									<%=dd-i%>
									</td>
									
									
									<td class="tdView" width="7%" dir="rtl" align="center">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii-i>4 and ii-i<10 then
										Response.write "≈‰–«— √Ê·"
									ElseIF ii-i>9 and ii-i<15 then
										Response.write "≈‰–«— À«‰Ì"
									ElseIf ii-i=15 then
										Response.write "≈‰–«— À«·À"
									Elseif ii-i> 15 then
										Response.write "‘ÿ»"
									End if
									
									%>					
									</td>
									
									
									<td class="tdView" width="16%" dir="rtl" align="center">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
									<td class="tdView" width="4%" dir="rtl">
														
					</td>
									
									
								</tr>
									<td colspan="8">&nbsp;</td>
								</tr>
								</table>
								
											<!-- Start Contents -->
			
				<div class="PageTitle">
					<p align=right><span lang="ar-kw">«·’ÕÌ›… «·”·ÊﬂÌ… 
					</span><br>
				&nbsp;</div>


				<div class="RecordAdd">
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' order by Department_ID,Class_Room_id,Report_date desc"
'response.write sSql 
				'	ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955" dir="rtl">
								<thead>
									<td class="tdViewHead" width="8%"> «—ÌŒ
									<span lang="ar-kw">«· ﬁ—Ì—</span></td>
									<td class="tdViewHead" width="21%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="5%">
									<span lang="ar-kw">«·ﬁ”„ «·⁄·„Ì</span></td>
									<td class="tdViewHead" width="4%">
									<span lang="ar-kw">«”„ «·„⁄·„</span></td>
									<td class="tdViewHead" width="21%" align="center">„·«ÕŸ« <span lang="ar-kw"> 
									«·≈œ«—…</span></td>
									<td class="tdViewHead" width="30%" align="center">«·„Œ«·›…</td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw">⁄—÷</span> </td>
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
									<td class="tdView" width="8%"><%=DAY(rs("report_Date"))&"/"&Month(rs("report_Date"))&"/"&Year(rs("report_Date"))%>
											
									</td>
									
									<td class="tdView" width="21%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="5%">
										<%
										if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Departments where Department_ID="&rs("Department_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Department_Name")%>
										<%				
											else
												response.write "«·«‘—«›"	
											end if
										set rss=nothing
										Else
											response.write "«·«‘—«›"
										End if

										%>
</td>
									
									<td class="tdView" width="4%">
									<%
										'if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Employees where Employee_ID="&rs("Employee_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%				
											else
												response.write "«·«‘—«›"	
											end if
										set rss=nothing
										'Else
										'	response.write "«·«‘—«›"
										'End if

										%></td>
									
									<td class="tdView" width="21%">
									<p align="center">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="30%">
									<table border="1" width="100%" style="border-collapse: collapse">
										<tr>
											<td align="center"> œŒÌ‰</td>
										<td align="center">«·‰Ê„</td>
										<td align="center">«·√œÊ«  </td>
										<td align="center">«·«‰ »«Â</td>
										<td align="center">Œ—ÊÃ</td>
										<td align="center"> √ŒÌ—</td>
										<td align="center">”·Êﬂ</td>
										<td align="center">«· ⁄·Ì„« </td>
									</tr>
									<tr>
										<td align="center">
								<%if rs("Smoking")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("sleeping")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("study_Tools")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("not_care")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("Get_out_of_Class")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("Late_to_class")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("wrong_behavior")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("refusal_instructions")= "yes" then%> ‰⁄„<%end if%></td>
									</tr>
								</table>
								</td>
									
									<td class="tdView" align="center" width="8%">
											<a href="parentcp_behavior_view.asp?id=<%=rs("ID")%>&std_name=<%=std_name%>&Class_Room=<%=Class_Room%>&page=0">
											«· ›«’Ì· </a>
									
									</td>
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
									<td colspan="7">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
	
								<div class="PageTitle">


				<div class="RecordAdd">
				<br>
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from Students_Delay where Std_civil_id='"& Std_Civil_id &"' order by Delay_Date Desc"
					'response.write sSql 
					'ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955" dir="rtl">
								<thead>
									<td class="tdViewHead" width="10%"> «—ÌŒ
									<span lang="ar-kw">«· √ŒÌ—</span></td>
									<td class="tdViewHead" width="22%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="66%">
									<span lang="ar-kw">Êﬁ  «· √ŒÌ—</span></td>
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
									<td class="tdView" width="10%"><%=Day(rs("Delay_Date"))&"/"&month(rs("Delay_Date"))&"/"&year(rs("Delay_Date"))%>
											
								
											
									</td>
									
									<td class="tdView" width="22%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="66%">
								
											<%	if rs("Delay_Time_ID")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rs("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rs("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rs("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rs("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rs("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rs("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rs("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													%>
<%=Delay_time%>
</td>
									
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
									<td colspan="3">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
	
								
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;«·‰Ê«ﬁ’ «·„ÿ·Ê»… ·„·› «·ÿ«·»<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		«·√Ê—«ﬁ 
																		«·„ÿ·Ê»…</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									«·Õ«·…</td>
									</thead>
									<%
									'std_civil_id=request.queryString("std_civil_id")
									'std_name=request.queryString("std_name")
									'class_room=request.queryString("Class_room")
									
									%>
							<%
							if rss("std_reg_Form")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp;
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»… 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·Ã‰”Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									≈Ì’«· «·—”Ê„</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·ÃÊ«“</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… ‘Â«œ… «·„Ì·«œ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									 ”·”· œ—«”Ì »«·„œ—”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—…  —ﬂ œ—«”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—… «⁄«œ… ﬁÌœ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒÊ‰ «·ÿ·»…  «·√Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
									<td colspan="2"></td>
								</tr>
								</table>
								
						<%
						End if
						rss.close
						%>
						
						</td>
						</tr>
						<tr>
							<td>
							<a target="_blank" href="Parentcp_Absence_alert_Print.asp?std_civil_id=<%=std_civil_id%>&std_Name=<%=std_Name%>&Class_room=<%=class_room%>"><font size="3">
									ÿ»«⁄…</font></a></td>
						</tr>
					</table>
					<p>
											<br>
											<br>
&nbsp;
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