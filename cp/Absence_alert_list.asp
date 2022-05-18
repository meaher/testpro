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
					<p>≈‰–«—«  «·€Ì«»</div>
				
				<div class="RecordAdd">&nbsp;
				
<form action="absence_Alert_List.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectClass" class="select">
						<option Value="0">«Œ — «·’› «·œ—«”Ì</option>
										<%									
										set Rs=conn.execute("Select * from Class_Room")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_ID")%>" <%if cint(request.form("SelectClass")) = rs("Class_Room_id") then%> selected <%End if%>><%=Rs("Class_Room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				<!--		<a target="_blank" href="Students_absence_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
					<a target="_blank" href="Absence_alert_Print.asp?SClass=<%=Request.form("SelectClass")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="absence_Alert_list.asp?q=0"
				
				
			
	 			'deptname=Request.form("txtDepartmentName")
	 			
				Class_Room_ID=Request.Form("SelectClass")
	 			xx="xxxx"
				if Class_Room_ID <> 0 then
					sSql = "select Std_Civil_id from Students_absence where Class_Room_ID="&Class_Room_ID&" and std_civil_id <> '"& xx &"' Group by Std_Civil_id"
				Else				
					sSql = "select Std_Civil_id from Students_absence where std_civil_id <> '"& xx &"' Group by Std_Civil_id"
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
						<br>
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="9%" dir="rtl">
																		«·’›</td>
									<td class="tdViewHead" width="5%" dir="rtl" align="center">
																		»⁄–—</td>
									<td class="tdViewHead" width="9%" dir="rtl" align="center">
																		»œÊ‰ ⁄–—</td>
									<td class="tdViewHead" width="8%" dir="rtl" align="center">
									≈‰–«—</td>
									<td class="tdViewHead" width="27%" dir="rtl" colspan="2">
									⁄œœ √Ì«„ «·€Ì«» «·ﬂ·Ì</td>
									</thead>
									<%
									if warning >4 and warning<10 then
										set Rsw=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
										while not rsw.eof
												ii=ii+1
											rsw.movenext
										Wend
										Rsw.close
									End if
									%>
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
									'›Ì Õ«· ﬂ«‰ «·ÿ«·» „Õ–Ê› „‰ «·”Ã·«  ·« ÌŸÂ— «·€Ì«»«  «·Œ«’… »Â
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
											std_name = " „ Õ–› »Ì«‰«  «·ÿ«·» „‰ «·”Ã·"
										end if
										Rss.close
									%>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="9%" dir="rtl">
									&nbsp;<%
									set Rst=conn.execute("Select * from Class_room where Class_Room_id="&Class_room_id&"")
									if not Rst.eof then
										response.write Rst("Class_Room")
										class_room=Rst("Class_Room")
									End if
									Rst.Close
									%></td>
								

								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="5%" dir="rtl" align="center">
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
								

									<td class="tdView" width="9%" dir="rtl" align="center">
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
								

									<td class="tdView" width="8%" dir="rtl" align="center">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
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
									
									
									<td class="tdView" width="14%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	
											</td>
									
									
									<td class="tdView" width="13%" dir="rtl">
														
									
																	
											<a target="_blank" href="Students_absence_Admin_list_print.asp?Class_room_id=<%=Class_room_id%>&Class_Room=<%=class_room%>&SelectStdCivilID=<%=rs("std_Civil_id")%>&start=1"><font size="3">ÿ»«⁄…</font></a></td>
									
									
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
					<p>≈‰–«—«  «·€Ì«»</div>
				
				<div class="RecordAdd">&nbsp;
				
<form action="absence_Alert_List.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectClass" class="select">
						<option Value="0">«Œ — «·’› «·œ—«”Ì</option>
										<%									
										set Rs=conn.execute("Select * from Class_Room order by class_room_id asc")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_ID")%>" <%if cint(request.form("SelectClass")) = rs("Class_Room_id") then%> selected <%End if%>><%=Rs("Class_Room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select> &nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				<!--		<a target="_blank" href="Students_absence_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
					<a target="_blank" href="Absence_alert_Print.asp?SClass=<%=Request.form("SelectClass")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="absence_Alert_list.asp?q=0"
				
				
			
	 			'deptname=Request.form("txtDepartmentName")
	 			
				Class_Room_ID=Request.Form("SelectClass")
				warning=Request.Form("SelectWarning")
	 			xx="xxxx"
				if Class_Room_ID <> 0 then
					sSql = "select Std_Civil_id from Students_absence where Class_Room_ID="&Class_Room_ID&" and std_civil_id <> '"& xx &"' Group by Std_Civil_id"
				Else				
					sSql = "select Std_Civil_id from Students_absence where std_civil_id <> '"& xx &"' Group by Std_Civil_id"
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
						<div><br>
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl" height="26">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="25%" dir="rtl" height="26">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="9%" dir="rtl" height="26">
																		«·’›</td>
									<td class="tdViewHead" width="5%" dir="rtl" height="26" align="center">
																		»⁄–—</td>
									<td class="tdViewHead" width="9%" dir="rtl" height="26" align="center">
																		»œÊ‰ ⁄–—</td>
									<td class="tdViewHead" width="8%" dir="rtl" height="26" align="center">
									≈‰–«—</td>
									<td class="tdViewHead" width="27%" dir="rtl" colspan="2" height="26">
									⁄œœ √Ì«„ «·€Ì«» «·ﬂ·Ì</td>
									</thead>
									<%
									if warning >4 and warning<10 then
										set Rsw=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
										while not rsw.eof
												ii=ii+1
											rsw.movenext
										Wend
										Rsw.close
									End if
									%>
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
									'›Ì Õ«· ﬂ«‰ «·ÿ«·» „Õ–Ê› „‰ «·”Ã·«  ·« ÌŸÂ— «·€Ì«»«  «·Œ«’… »Â
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
											std_name = " „ Õ–› »Ì«‰«  «·ÿ«·» „‰ «·”Ã·"
										end if
										Rss.close
									%>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="9%" dir="rtl">
									&nbsp;<%
									set Rst=conn.execute("Select * from Class_room where Class_Room_id="&Class_room_id&"")
									if not Rst.eof then
										response.write Rst("Class_Room")
										class_room=Rst("Class_Room")
									End if
									Rst.Close
									%></td>
								

								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="5%" dir="rtl" align="center">
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
								

									<td class="tdView" width="9%" dir="rtl" align="center">
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
								

									<td class="tdView" width="8%" dir="rtl" align="center">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&rs("std_Civil_id")&"' Group by Absence_Date")
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
									
									
									<td class="tdView" width="14%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	
											</td>
									
									
									<td class="tdView" width="13%" dir="rtl">
														
									
																	
											<a target="_blank" href="Students_absence_Admin_list_print.asp?Class_room_id=<%=Class_room_id%>&Class_Room=<%=class_room%>&SelectStdCivilID=<%=rs("std_Civil_id")%>&start=1"><font size="3">ÿ»«⁄…</font></a></td>
									
									
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