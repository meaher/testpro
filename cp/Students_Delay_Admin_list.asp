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
									
					<!-- #include file="Banner_Page_mob.asp"-->
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">
				<!-- #include file="portal_menu.asp"-->				
				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
								<!-- Start Contents -->
			
				<div class="PageTitle">
					<p>„ «»⁄… <span lang="ar-kw">«· √Œ—</span> ⁄‰ «·Õ’’ <%=request.querystring("Class_Room")%>
					</div>
				<form action="Students_Delay_Admin_list.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("Class_Romm_id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<%for i=1 to 31%>
							<option Value="<%=i%>" <%if cint(request.form("SelectDay")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select> <br>
					<select size="1" name="SelectMonth">
						<option Value="0">«Œ — «·‘Â—</option>
						<%for i=1 to 12%>
							<option Value="<%=i%>" <%if cint(request.form("SelectMonth")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select><br>
					<select size="1" name="SelectStdCivilID">
						<option Value="0">«Œ — «·ÿ«·»</option>
										<%									
										set Rs=conn.execute("Select * from Students where Class_Room_id="&Request.queryString("Class_room_id")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_id")%>" <%if Request.Form("SelectStdCivilID") = rs("std_civil_id") then%> selected <%End if%>><%=Rs("std_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select><br>
					&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				<!--		<a target="_blank" href="Students_Delay_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
</p>
				</form>
				<div class="RecordAdd">
					&nbsp;<a href="Students_delay_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">≈÷«›… ÿ«·» 
				·”Ã· «· √Œ—</a>
										
				</div>
								
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					'session("Errmsg")=""
				end if
				%>	</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_Delay_Admin_list.asp.asp?q=0"
				
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_Delay order by Class_Room_id, Delay_ID"
	 		Else

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						Else
								sSql = "select Delay_Date from Students_Delaywhere  Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Delay_day="&sDay&" and delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						Else
							smonth=month(Date())
								sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
					Else
						sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
					End if
				ElseIF std_civil_ID <> 0 then
					sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" Group by Delay_Date order by Delay_Date Desc"
				Else 
					sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" Group by Delay_Date order by Delay_Date Desc"
				End if
				
	 		End if
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
									<td class="tdViewHead" width="16%" dir="rtl">
									 «—ÌŒ <span lang="ar-kw"> ”ÃÌ· «· √ŒÌ—</span></td>
									<td class="tdViewHead" width="83%" dir="rtl">
																		<table border="0" width="100%">
																			<tr>
																				<td width="25%"><font color="#FFFFFF">«·—ﬁ„ «·„œ‰Ì</font></td>
																				<td width="25%"><font color="#FFFFFF">«”„ «·ÿ«·»</font></td>
																				<td width="25%"><font color="#FFFFFF">Êﬁ  «· √Œ—</font></td>
																				<td width="25%"><font color="#FFFFFF">«·„‘—›</font></td>
																				<td width="20%">&nbsp;</td>
																			</tr>
																		</table>
									</td>
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
									<td class="tdView" width="16%" dir="rtl"><%=Day(rs("Delay_Date"))&"/"&month(rs("Delay_Date"))&"/"&year(rs("Delay_Date"))%>
											
									</td>
									
									<td class="tdView" width="83%" dir="rtl">
									
									<table class="tblView">
										<%
										ii=0

									if 	Request.form("SelectStdCivilID") = "0" or Request.form("SelectStdCivilID") = "" then
											set Rsx=conn.execute("Select * from Students_Delay where Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Std_civil_id,Delay_time_id asc")
											'	response.write "Select Std_civil_id from Students_Delay where Std_civil_id='"&Request.form("SelectStdCivilID")&"' Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Delay_time_id"
											while not rsx.eof 
													ii=ii+1
													if rsx("Delay_time_id")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rsx("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rsx("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rsx("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rsx("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rsx("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rsx("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rsx("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
																response.write rst("Std_name")&"</td><td class=tdView width='20%'>"&Delay_Time&"</td><td class=tdView width='20%'>"&rsx("Supervisor_Name")&"</td><td class=tdView><a href=Students_Delay_Admin_chk.asp?id="&rsx("Delay_id")&"&Class_Room="&Request.queryString("Class_Room")&"&Class_Room_id="&Rsx("Class_Room_id")&">Õ–› «· √Œ—</a></td></tr>"
														End if
													Rst.close
													
											rsx.movenext
											
										wend
										set rsx=nothing
									Else
								
											set Rsx=conn.execute("Select * from Students_Delay where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Std_civil_id,Delay_time_id asc")
										
											while not rsx.eof 
												
													if rsx("Delay_time_id")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rsx("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rsx("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rsx("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rsx("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rsx("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rsx("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rsx("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
																response.write rst("Std_name")&"</td><td class=tdView width='20%'>"&Delay_Time&"</td><td class=tdView width='20%'>"&rsx("Supervisor_Name")&"</td><td class=tdView><a href=Students_Delay_Admin_chk.asp?id="&rsx("Delay_id")&"&Class_Room="&Request.queryString("Class_Room")&"&Class_Room_id="&Rsx("Class_Room_id")&">Õ–› «· √Œ—</a></td></tr>"
														End if
													Rst.close
												rsx.movenext		
											wend
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
		</table>										<p>&nbsp;</td>
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
		<!-- #include file="Banner_page.asp"-->				
		<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">			
				<!-- #include file="portal_menu.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
			
				<div class="PageTitle">
					<p>„ «»⁄… <span lang="ar-kw">«· √Œ—</span> ⁄‰ «·Õ’’ <%=request.querystring("Class_Room")%>
					</div>
				
				<div class="RecordAdd">
					&nbsp;<a href="Students_delay_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">≈÷«›… ÿ«·» 
				·”Ã· «· √Œ—</a>
				<%classx=Request.QueryString("Class_Room")%>
					<form action="Students_Delay_Admin_list.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("Class_Romm_id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay" class="select">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<%for i=1 to 31%>
							<option Value="<%=i%>" <%if cint(request.form("SelectDay")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select>
					<select size="1" name="SelectMonth" class="select">
						<option Value="0">«Œ — «·‘Â—</option>
						<%for i=1 to 12%>
							<option Value="<%=i%>" <%if cint(request.form("SelectMonth")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select><select size="1" name="SelectStdCivilID" class="select">
						<option Value="0">«Œ — «·ÿ«·»</option>
										<%									
										set Rs=conn.execute("Select * from Students where Class_Room_id="&Request.queryString("Class_room_id")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_id")%>" <%if Request.Form("SelectStdCivilID") = rs("std_civil_id") then%> selected <%End if%>><%=Rs("std_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				<!--		<a target="_blank" href="Students_Delay_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
</p>
				</form>					
				</div>
								
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
				pageName="Students_Delay_Admin_list.asp.asp?q=0"
				
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_Delay order by Class_Room_id, Delay_ID"
	 		Else

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						Else
								sSql = "select Delay_Date from Students_Delaywhere  Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Delay_day="&sDay&" and delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						Else
							smonth=month(Date())
								sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" and Delay_day="&sDay&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
					Else
						sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" and Delay_Month="&smonth&" Group by Delay_Date order by Delay_Date Desc"
					End if
				ElseIF std_civil_ID <> 0 then
					sSql = "select Delay_Date from Students_Delay where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" Group by Delay_Date order by Delay_Date Desc"
				Else 
					sSql = "select Delay_Date from Students_Delay where Class_Room_ID ="&Class_Room_ID&" Group by Delay_Date order by Delay_Date Desc"
				End if
				
	 		End if
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
									<td class="tdViewHead" width="16%" dir="rtl">
									 «—ÌŒ <span lang="ar-kw"> ”ÃÌ· «· √ŒÌ—</span></td>
									<td class="tdViewHead" width="83%" dir="rtl">
																		«·—ﬁ„ 
																		«·„œ‰Ì&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		«”„ 
																		«·ÿ«·»&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		Êﬁ  
																		«· √Œ—&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		«·„‘—›</td>
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
									<td class="tdView" width="16%" dir="rtl"><%=Day(rs("Delay_Date"))&"/"&month(rs("Delay_Date"))&"/"&year(rs("Delay_Date"))%>
											
									</td>
									
									<td class="tdView" width="83%" dir="rtl">
									
									<table class="tblView">
										<%
										ii=0

									if 	Request.form("SelectStdCivilID") = "0" or Request.form("SelectStdCivilID") = "" then
											set Rsx=conn.execute("Select * from Students_Delay where Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Std_civil_id,Delay_time_id asc")
											'	response.write "Select Std_civil_id from Students_Delay where Std_civil_id='"&Request.form("SelectStdCivilID")&"' Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Delay_time_id"
											while not rsx.eof 
													ii=ii+1
													if rsx("Delay_time_id")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rsx("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rsx("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rsx("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rsx("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rsx("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rsx("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rsx("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
															
																response.write rst("Std_name")&"</td><td class=tdView width='20%'>"&Delay_Time&"</td><td class=tdView width='20%'>"&rsx("Supervisor_Name")&"</td><td class=tdView><a href=Students_Delay_Admin_chk.asp?id="&rsx("Delay_id")&"&Class_Room_id="&Rsx("Class_Room_id")&">Õ–› «· √Œ—</a></td></tr>"
														End if
													Rst.close
													
											rsx.movenext
											
										wend
										set rsx=nothing
									Else
								
											set Rsx=conn.execute("Select * from Students_Delay where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Delay_Day="&Day(rs("Delay_date"))&" and Delay_Month="&Month(rs("Delay_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  order by Std_civil_id,Delay_time_id asc")
										
											while not rsx.eof 
												
													if rsx("Delay_time_id")=0 then
														delay_time = "ÿ«»Ê— «·’»«Õ"
													Elseif rsx("Delay_time_id")=1 then
														Delay_time = "«·Õ’… «·√Ê·Ï"
													Elseif rsx("Delay_time_id")=2 then
														Delay_time ="«·Õ’… «·À«‰Ì…"
													Elseif rsx("Delay_time_id")=3 then
														Delay_time = "«·Õ’… «·À«·À…"
													Elseif rsx("Delay_time_id")=4 then
														Delay_time ="«·Õ’… «·—«»⁄…"
													Elseif rsx("Delay_time_id")=5 then
														Delay_time ="«·Õ’… «·Œ«„”…"
													Elseif rsx("Delay_time_id")=6 then
														Delay_time ="«·Õ’… «·”«œ”…"
													Elseif rsx("Delay_time_id")=7 then
														Delay_time ="«·Õ’… «·”«»⁄…"
													End if
													
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
																response.write rst("Std_name")&"</td><td class=tdView width='20%'>"&Delay_Time&"</td><td class=tdView width='20%'>"&rsx("Supervisor_Name")&"</td><td class=tdView><a href=Students_Delay_Admin_chk.asp?id="&rsx("Delay_id")&"&Class_Room="&Request.queryString("Class_Room")&"&Class_Room_id="&Rsx("Class_Room_id")&">Õ–› «· √Œ—</a></td></tr>"
														End if
													Rst.close
												rsx.movenext		
											wend
										set rsx=nothing	
									End if
									%>
											</table>
											
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