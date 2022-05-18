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
					<p align=right>“Ì«—«  —∆Ì” «·ﬁ”„<span lang="en-us"> </span></div>
				
				<div class="RecordAdd">&nbsp;<a href="supervisor_visits_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">“Ì«—… 
					ÃœÌœ…</a></div>
								
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
				pageName="supervisor_visits_list.asp?q=0&id="&id=request.querystring("id")
				id=request.querystring("id")

									
				sSql = "select * from supervisor_visits where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="8%"> «—ÌŒ 
									«·“Ì«—…</td>
									<td class="tdViewHead" width="7%">—ﬁ„ 
									«·“Ì«—…</td>
									<td class="tdViewHead" width="19%">⁄‰Ê«‰ 
									«·œ—”</td>
									<td class="tdViewHead" width="7%">«·’›</td>
									<td class="tdViewHead" width="17%">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="17%">„·«ÕŸ« </td>
									<td class="tdViewHead" width="3%">«·„·›</td>
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
									<td class="tdView" width="8%"><%=DAY(rs("visit_Date"))&"/"&Month(rs("visit_Date"))&"/"&Year(rs("visit_Date"))%>
											
									</td>
									
									<td class="tdView" width="7%">&nbsp;<%=rs("visit_no")%></td>
									
									<td class="tdView" width="19%">&nbsp;<%=rs("Subject")%></td>
									
									<td class="tdView" width="7%">
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
</td>
									
									<td class="tdView" width="17%">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%>
									</td>
									
									<td class="tdView" width="17%">&nbsp;<%=rs("visit_notes")%></td>
									
									<td class="tdView" width="3%"><%if rs("visit_file") <> "" then%><a href="/visits_file/<%=rs("visit_file")%>"> Õ„Ì·</a><%End if%></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="supervisor_visits_delete.asp?visit_id=<%=rs("visit_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="supervisor_visits_update.asp?visit_id=<%=rs("visit_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									 ⁄œÌ·</a></td>
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