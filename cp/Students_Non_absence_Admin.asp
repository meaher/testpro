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
					√”„«¡ «·ÿ·«» €Ì«» ’›—</div>
				
				<div class="RecordAdd">
				
<form action="Students_non_absence_Admin.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;<select size="1" name="SelectClass" class="select">
						<option Value="0">«Œ — «·’› «·œ—«”Ì</option>
										<%									
										set Rs=conn.execute("Select * from Class_Room order by Class_Room_id asc")
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
					<a target="_blank" href="Students_non_absence_admin_Print.asp?SClass=<%=Request.form("SelectClass")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_non_absence_Admin.asp?q=0"
				
				
		'	If Request.QueryString("Day")=1 then
	 	'	Else

	 			'deptname=Request.form("txtDepartmentName")
	 	'		sday=Request.form("SelectDay")
	 	'		smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.Form("SelectClass")
	 	'		if sday <> 0 then
	 	'			if smonth <> 0 then
	 	'				if Class_Room_ID <> 0 then
		'						sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" order by  Class_Room_ID, Absence_ID DESC"
		'				Else
		'					sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, absence_ID DESC"
		'				End if		
		'			Else
		'				if Class_Room_ID <> 0 then
		'					smonth= month(Date())
		'						sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'				Else
		'					smonth=month(Date())
		'					sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
		'				End if		
		'			End if
		'		Elseif smonth <> 0 then
		'			if Class_Room_ID <> 0 then
		'				sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'			Else
		''				sSql = "select * from Students_absence where Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'			End if
		'		ElseIF Class_Room_ID <> 0 then
		'			sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
		'		Else 
		'		End if
				
	 	'	End if
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
									„</td>
									<td class="tdViewHead" width="15%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="77%" dir="rtl">
									«”„ «·ÿ«·»</td>
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
					√”„«¡ «·ÿ·«» €Ì«» ’›—</div>
				
				<div class="RecordAdd">
				
<form action="Students_non_absence_Admin.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;<select size="1" name="SelectClass" class="select">
						<option Value="0">«Œ — «·’› «·œ—«”Ì</option>
										<%									
										set Rs=conn.execute("Select * from Class_Room order by Class_Room_id asc")
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
					<a target="_blank" href="Students_non_absence_admin_Print.asp?SClass=<%=Request.form("SelectClass")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_non_absence_Admin.asp?q=0"
				
				
		'	If Request.QueryString("Day")=1 then
	 	'	Else

	 			'deptname=Request.form("txtDepartmentName")
	 	'		sday=Request.form("SelectDay")
	 	'		smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.Form("SelectClass")
	 	'		if sday <> 0 then
	 	'			if smonth <> 0 then
	 	'				if Class_Room_ID <> 0 then
		'						sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" order by  Class_Room_ID, Absence_ID DESC"
		'				Else
		'					sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, absence_ID DESC"
		'				End if		
		'			Else
		'				if Class_Room_ID <> 0 then
		'					smonth= month(Date())
		'						sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'				Else
		'					smonth=month(Date())
		'					sSql = "select * from Students_absence where Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
		'				End if		
		'			End if
		'		Elseif smonth <> 0 then
		'			if Class_Room_ID <> 0 then
		'				sSql = "select * from Students_absence where Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'			Else
		''				sSql = "select * from Students_absence where Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
		'			End if
		'		ElseIF Class_Room_ID <> 0 then
		'			sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
		'		Else 
		'		End if
				
	 	'	End if
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
									„</td>
									<td class="tdViewHead" width="15%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="77%" dir="rtl">
									«”„ «·ÿ«·»</td>
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