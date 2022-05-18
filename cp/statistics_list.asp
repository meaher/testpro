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
					<p>«·≈Õ’«∆Ì« </div>
				
				<!--<div class="RecordAdd"><a href="admin_add.asp">Add</a></div>-->
					<form action="statistics_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p style="text-align: right">
					<select size="1" name="SelectDay" class="select">
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
					</select>
					&nbsp;
					&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1">
					<span lang="en-us">&nbsp;</span>
					<a target="_blank" href="Statistics_Print.asp?smonth=<%=Request.form("SelectMonth")%>&sDay=<%=Request.form("SelectDay")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>			
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>		
				
				
				</div>
				
				<%
				nDisplayRecs =5000
				nRecRange = 15
				nRecPerRow = 1
				pageName="Statistics_list.asp?q=0"
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
	 			if sday <> 0 then
	 				if smonth <> 0 then
							sSql = "select Absence_Date from Students_Absence where Absence_year="&year(Date())&" and  Absence_Day="&sDay&" and Absence_Month="&sMonth&" and Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
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
				Set rs = Server.CreateObject("ADODB.Recordset")
				set rsp = Server.CreateObject("ADODB.Recordset")

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
									<td class="tdViewHead">«· «—ÌŒ</td>
									<td class="tdViewHead">⁄œœ «·Õ÷Ê—</td>
									<td class="tdViewHead">⁄œœ «·€Ì«»</td>
									<td class="tdViewHead">‰”»… «·Õ÷Ê—</td>
									<td align="center" class="tdViewHead">
									‰”»… «·€Ì«»</td>
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
					<p>«·≈Õ’«∆Ì« </div>
				
				<!--<div class="RecordAdd"><a href="admin_add.asp">Add</a></div>-->
					<form action="statistics_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p style="text-align: right">
					<select size="1" name="SelectDay" class="select">
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
					</select>
					&nbsp;
					&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1">
					<span lang="en-us">&nbsp;</span>
					<a target="_blank" href="Statistics_Print.asp?smonth=<%=Request.form("SelectMonth")%>&sDay=<%=Request.form("SelectDay")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>			
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>		
				
				
				</div>
				
				<%
				nDisplayRecs =5000
				nRecRange = 15
				nRecPerRow = 1
				pageName="Statistics_list.asp?q=0"
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
	 			if sday <> 0 then
	 				if smonth <> 0 then
							sSql = "select Absence_Date from Students_Absence where Absence_year="&year(Date())&" and  Absence_Day="&sDay&" and Absence_Month="&sMonth&" and Std_Civil_id <> '"&xxxx&"' Group by Absence_Date"
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
				Set rs = Server.CreateObject("ADODB.Recordset")
				set rsp = Server.CreateObject("ADODB.Recordset")

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
									<td class="tdViewHead">«· «—ÌŒ</td>
									<td class="tdViewHead">⁄œœ «·Õ÷Ê—</td>
									<td class="tdViewHead">⁄œœ «·€Ì«»</td>
									<td class="tdViewHead">‰”»… «·Õ÷Ê—</td>
									<td align="center" class="tdViewHead">
									‰”»… «·€Ì«»</td>
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