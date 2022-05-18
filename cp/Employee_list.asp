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

<table border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
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
					<p style="text-align: right"><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd">&nbsp;<a href="Employee_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a>| 
					<a href="Employee_View.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">«·„‘€Ê· «·›⁄·Ì</a></div>
								
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =50
				nRecRange = 15
				nRecPerRow = 1
				pageName="Employee_list.asp?q=0"
				id=request.querystring("id")
				if id="" then
					id = session("Departmet_ID")
				end if
				sSql = "select * from Employees where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="15%">«”„ 
									«·„ÊŸ›</td>
									<td class="tdViewHead" width="18%">«·„”„Ï 
									«·ÊŸÌ›Ì</td>
									<td class="tdViewHead" width="12%">—ﬁ„ «·„·›</td>
									<td class="tdViewHead" width="11%">—ﬁ„ 
									«·Â« ›</td>
									<td class="tdViewHead" width="13%">«·»—Ìœ 
									«·«·ﬂ —Ê‰Ì</td>
									<td align="center" class="tdViewHead">
									Õ–› «·»Ì«‰« </td>
									<td align="center" class="tdViewHead">
									 ⁄œÌ· </td>
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
									<td class="tdView" width="15%"><%=rs("Employee_Name")%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Position")%></td>
									
									<td class="tdView" width="12%"><%=rs("File_Number")%></td>
									<td class="tdView" width="11%">&nbsp;<%=rs("Employee_MOBILE")%></td>
								

									<td class="tdView" width="13%">
									<%=rs("Employee_EMAIL")%></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="Employee_Delete.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us">Õ–›</span></a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Employee_update.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us"> ⁄œÌ·</span></a></td>
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