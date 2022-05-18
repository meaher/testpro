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
					<p>„ «»⁄… «·€Ì«» «·ÌÊ„Ì <%=request.querystring("Class_Room")%>
					</div>
				
				<div class="RecordAdd">
				<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>
					<a href="Students_absence_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">	≈÷«›… ÿ«·» ··€Ì«»</a>
				<%End if%>&nbsp;&nbsp;
					
					<a href="Students_absence_Admin_Details.asp?Class_room_id=<%=Request.QueryString("Class_room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>&start=1">
					€Ì«» «·’› »«· ›’Ì·
				</a>&nbsp;&nbsp;
					<a href="Students_Delay_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">	
				≈÷«›…<span lang="ar-kw"> 
				«· √ŒÌ—</span></a><form action="Students_absence_Admin_list.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
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
				
					
				<!--		<a target="_blank" href="Students_absence_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
					<a target="_blank" href="Students_absence_Admin_list_print.asp?Class_room_id=<%=Request.querystring("Class_room_ID")%>&Class_Room=<%=Request.querystring("Class_room")%>&SelectMonth=<%=Request.form("SelectMonth")%>&SelectDay=<%=Request.form("SelectDay")%>&SelectStdCivilID=<%=Request.form("SelectStdCivilID")%>&start=1"><font size="3">ÿ»«⁄…</font></a>
</p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_Admin_list.asp.asp?q=0"
				
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_absence order by Class_Room_id, absence_ID"
	 		Else

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
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
				'		sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
						sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' Group by Absence_Date order by Absence_Date Desc"
				Else 
					sSql = "select Absence_Date from Students_absence where Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
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
									<td class="tdViewHead" width="7%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="16%" dir="rtl">
																		«·—ﬁ„ 
																		«·„œ‰Ì&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		«”„ 
																		«·ÿ«·» </td>
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

									if 	Request.form("SelectStdCivilID") = "0" or Request.form("SelectStdCivilID") = "" then
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											'	response.write "Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id"
											while not rsx.eof 
												if rsx("std_Civil_id")<>"xxxx" then
													
													'›Ì Õ«· ﬂ«‰ «·ÿ«·» „Õ–Ê› „‰ «·”Ã·«  ·« ÌŸÂ— «·€Ì«»«  «·Œ«’… »Â
													set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
													if not rsn.eof then

														ii=ii+1
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
															set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
															if not Rst.eof then
																'	response.write rst("Std_name")&"</td><td class=tdView><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· √ﬂÀ—</a></td></tr>"
																	set RsC=conn.execute("select count(Std_civil_id) as xyz from Students_absence where Absence_Day ="&Day(rs("Absence_date"))&" and Absence_Month ="&month(rs("Absence_date"))&" and Std_civil_id='"&rsx("std_Civil_id")&"'")
																		response.write rst("Std_name")&"</td><td class=tdView > "& rsc("xyz") &"  &nbsp;</td><td class=tdView align=center><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· </a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=Students_absence_Admin_DeleteAll.asp?Class_room_id="&Class_Room_ID&"&Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&">Õ–›</a></td></tr>"
																rsc.close
																set rsc=nothing	
															End if
														Rst.close
													End if
													rsn.close
													
											End if
											rsx.movenext
											
										wend
										set rsx=nothing
									Else
								
										'	set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&"  Group by Std_civil_id")
											if not rsx.eof then 
												set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
												if not rsn.eof then

													response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
														'		response.write rst("Std_name")&"</td><td class=tdView><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· √ﬂÀ—</a></td></tr>"
																set RsC=conn.execute("select count(Std_civil_id) as xyz from Students_absence where Absence_Day ="&Day(rs("Absence_date"))&" and Absence_Month ="&month(rs("Absence_date"))&" and Std_civil_id='"&rsx("std_Civil_id")&"'")
																	response.write rst("Std_name")&"</td><td class=tdView>"& rsc("xyz") &"</td><td class=tdView align=center><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· </a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=Students_absence_Admin_DeleteAll.asp?Class_room_id="&Class_Room_ID&"&Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&">Õ–›</a></td></tr>"
															RsC.close
															set RsC=nothing

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
					<p>„ «»⁄… «·€Ì«» «·ÌÊ„Ì <%=request.querystring("Class_Room")%>
					</div>
				
				<div class="RecordAdd">
				<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>
					<a href="Students_absence_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">	≈÷«›… ÿ«·» ··€Ì«»</a>
				<%End if%>&nbsp;&nbsp;
					
					<a href="Students_absence_Admin_Details.asp?Class_room_id=<%=Request.QueryString("Class_room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>&start=1">
					€Ì«» «·’› »«· ›’Ì·
				</a>&nbsp;&nbsp;
					<a href="Students_Delay_Admin_Add.asp?Class_Room_ID=<%=Request.queryString("Class_Room_ID")%>&Class_Room=<%=Request.QueryString("Class_Room")%>">	
				≈÷«›…<span lang="ar-kw"> 
				«· √ŒÌ—</span></a><form action="Students_absence_Admin_list.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
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
				
					
				<!--		<a target="_blank" href="Students_absence_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
					<a target="_blank" href="Students_absence_Admin_list_print.asp?Class_room_id=<%=Request.querystring("Class_room_ID")%>&Class_Room=<%=Request.querystring("Class_room")%>&SelectMonth=<%=Request.form("SelectMonth")%>&SelectDay=<%=Request.form("SelectDay")%>&SelectStdCivilID=<%=Request.form("SelectStdCivilID")%>&start=1"><font size="3">ÿ»«⁄…</font></a>
</p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_Admin_list.asp.asp?q=0"
				
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_absence order by Class_Room_id, absence_ID"
	 		Else

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
				if Std_civil_id="" then
					Std_civil_id=Request.QueryString("std_civil_id")
				End if
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
				'		sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
						sSql = "select Absence_Date from Students_absence where Std_civil_id='"& Std_Civil_id &"' Group by Absence_Date order by Absence_Date Desc"
				Else 
					sSql = "select Absence_Date from Students_absence where Class_Room_ID ="&Class_Room_ID&" Group by Absence_Date order by Absence_Date Desc"
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
									<td class="tdViewHead" width="7%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="16%" dir="rtl">
																		«·—ﬁ„ 
																		«·„œ‰Ì&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		«”„ 
																		«·ÿ«·» </td>
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

									if 	Request.form("SelectStdCivilID") = "0" or Request.form("SelectStdCivilID") = "" then
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											'	response.write "Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id"
											while not rsx.eof 
												if rsx("std_Civil_id")<>"xxxx" then
													
													'›Ì Õ«· ﬂ«‰ «·ÿ«·» „Õ–Ê› „‰ «·”Ã·«  ·« ÌŸÂ— «·€Ì«»«  «·Œ«’… »Â
													set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
													if not rsn.eof then

														ii=ii+1
														response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
															set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
															if not Rst.eof then
																	set RsC=conn.execute("select count(Std_civil_id) as xyz from Students_absence where Absence_Day ="&Day(rs("Absence_date"))&" and Absence_Month ="&month(rs("Absence_date"))&" and Std_civil_id='"&rsx("std_Civil_id")&"'")
																		response.write rst("Std_name")&"</td><td class=tdView>"& rsc("xyz") &" </td><td class=tdView><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· √ﬂÀ—</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=Students_absence_Admin_DeleteAll.asp?Class_room_id="&Class_Room_ID&"&Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&">Õ–›</a></td></tr>"
																rsc.close
																set rsc=nothing														
															End if
														
													Rst.close
													End if
													rsn.close
													
											End if
											rsx.movenext
											
										wend
										set rsx=nothing
									Else
								
										'	set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&" and Class_room_id="&Request.queryString("Class_room_id")&"  Group by Std_civil_id")
											set Rsx=conn.execute("Select Std_civil_id from Students_Absence where Std_civil_id='"&Request.form("SelectStdCivilID")&"' and Absence_Day="&Day(rs("Absence_date"))&" and Absence_Month="&Month(rs("Absence_date"))&"  Group by Std_civil_id")
											if not rsx.eof then 
												set Rsn=conn.execute("Select * from Students where std_Civil_id='"&rsx("std_Civil_id")&"'")
												if not rsn.eof then

													response.write "<tr class=trView><td class=tdView>"&Rsx("Std_Civil_id")&"</td><td class=tdView>"
														set Rst=conn.execute("Select * from Students where Std_Civil_id='"&Rsx("Std_Civil_id")&"'")
														if not Rst.eof then
																			
																set RsC=conn.execute("select count(Std_civil_id) as xyz from Students_absence where Absence_Day ="&Day(rs("Absence_date"))&" and Absence_Month ="&month(rs("Absence_date"))&" and Std_civil_id='"&rsx("std_Civil_id")&"'")
																	
																response.write rst("Std_name")&"</td><td class=tdView>"& rsc("xyz") &"</td><td class=tdView><a href=Students_absence_Admin_MoreDetails.asp?Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&"> ›«’Ì· √ﬂÀ—</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=Students_absence_Admin_DeleteAll.asp?Class_room_id="&Class_Room_ID&"&Absence_Date="&rs("Absence_date")&"&Std_id="&rsx("std_Civil_id")&">Õ–›</a></td></tr>"
															RsC.close
															set RsC=nothing
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