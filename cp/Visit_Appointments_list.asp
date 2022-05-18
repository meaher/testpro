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
					<p align="right">‰Ÿ«„ «·„Ê«⁄Ìœ</div>
				
				<div class="RecordAdd">
				&nbsp;</div>
								
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
				pageName="Visit_Appointments_list.asp?q=0"
				
							
						
					sSql = "select * from Visit_Appointments order by Reg_Date"
													
	 
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
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
									<td class="tdViewHead" width="15%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ  ﬁœÌ„ 
									«·ÿ·»</td>
									<td class="tdViewHead" width="18%">«·«”„</td>
									<td class="tdViewHead" width="18%">—ﬁ„ 
									«·„Ê»«Ì·</td>
									<td class="tdViewHead" width="25%">
									<span lang="ar-kw">”»» «·“Ì«—…</span></td>
									<td class="tdViewHead" width="15%">
									<span lang="ar-kw">«· «—ÌŒ «·“»«—…</span></td>
									<td class="tdViewHead" width="38%">
									<span lang="ar-kw">«·”«⁄…</span></td>
									<td class="tdViewHead" width="38%">Õ«·…
									<span lang="ar-kw">«·ÿ·»</span></td>
									<td class="tdViewHead" width="8%">‰⁄œÌ·</td>
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
									<td class="tdView" width="15%"><%=Day(rs("Reg_Date"))&"/"&month(rs("Reg_Date"))&"/"&year(rs("Reg_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">
									&nbsp;	<%
											response.write rs("Full_name")
											%>
									</td>
									
									<td class="tdView" width="18%">
									<%=rs("mobile")%>
									
									</td>
									
									<td class="tdView" width="25%">&nbsp;<%=rs("visit_reason")%></td>
									
									<td class="tdView" width="15%"><%=rs("Day_Date")&"/"&rs("month_date")&"/"&rs("year_Date")%></td>
									
									<td class="tdView" width="38%"><%=rs("Visit_Time")%></td>
									
									<td class="tdView" width="38%">&nbsp;
									<%
									
									if rs("Accept")=0 then
										response.write(" „ «·—›÷")
									elseif rs("Accept")=1 then
										response.write(" „  «·„Ê«›ﬁ…")
									else 
										response.write("›Ì «·«‰ Ÿ«— ")
									End if
									%>
									
									</td>
									
									<td class="tdView" width="8%">
									
										<a href="Visit_Appointments_update.asp?id=<%=rs("id")%>"> ⁄œÌ·</a>
									
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