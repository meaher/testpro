<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString


%>
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
				<!-- Start Contents -->
			
				<div class="PageTitle">
					<p style="text-align: left"><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				<script>
function goBack() {
  window.history.back();
}
</script>

				<div class="RecordAdd">&nbsp;<button onclick="goBack()">Go Back</button> 
					<span lang="en-us">&nbsp;&nbsp;&nbsp; </span> 
					<a target="_blank" href="Employee_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">ÿ»«⁄…</a></div>
								
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =150
				nRecRange = 15
				nRecPerRow = 1
				pageName="Employee_View.asp?q=0"
				id=request.querystring("id")
			'	response.write id
				'response.end
			'	sSql= "SELECT Departments.Department_id, Departments.Department_Name, Employees.Employee_ID, Employees.Full_Name, Work_Day.Work_ID, Work_Day.Work_Date, Work_Day.clock_In, Work_Day.clock_Out, Work_Day.Morning_Permission,
			'	 Work_Day.Evening_Permission 	FROM (Departments INNER JOIN Employees ON Departments.Department_id = Employees.Department_ID) INNER JOIN Work_Day ON Employees.Employee_ID = Work_Day.Employee_id
			'			WHERE (((Departments.Department_id) ="& id &"))"

				
				'sSql = "select Departments.*,Employees.*  from Departments,Employees where Department_ID=Departments.Department_ID order by Date_ID DESC"
				
			IF id <> "" then
				sSql = "select * from Employees where Department_ID ="&ID&" "
			Else
				sSql = "select * from Employees order by Department_id"
	 		End if
	 		
	 		
	 		
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				rs.Open sSql , conn, 1, 2
				ii=0
				nTotalRecs = rs.RecordCount
				If nDisplayRecs <= 0 Then ' Display All Records
					nDisplayRecs = nTotalRecs
				End If
				nStartRec = 1
				SetUpStartRec() 
				%>
				
				<% If nTotalRecs > 0 Then %>
						<div>
							<table cellpadding="3" bordercolorlight="#000000" bordercolordark="#000000" style="border-collapse: collapse" border="1" >
								<thead>
									<td class="tdViewHead" width="2%" rowspan="2" style="background-color: #FFFFFF" align="center">
									<b>
									<font face="Impact" size="3" color="#000000">
									„</font></b></td>
									<td class="tdViewHead" width="14%" rowspan="2" style="background-color: #FFFFFF" align="center">
									<b>
									<font face="Impact" size="3" color="#000000">«·«”„</font></b></td>
									<td class="tdViewHead" width="9%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="3" color="#000000">«·—ﬁ„ 
									«·„œ‰Ì</font></b></td>
									<td class="tdViewHead" width="6%" rowspan="2" style="background-color: #FFFFFF" align="center">
									<b>
									<font face="Impact" size="3" color="#000000">«·„«œ…</font></b></td>
									<td class="tdViewHead" width="8%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="3" color="#000000">«·ÊŸÌ›…</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">Ê’› «·‘Â«œ…</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">‰Ê⁄ «·‘Â«œ…</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000"> «—ÌŒ «·‘Â«œ…</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000"> «—ÌŒ «· ⁄ÌÌ‰</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">«·Ã‰”Ì…</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">«·„” ÊÏ «·ÊŸÌ›Ì</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">«·Â« › «·«Ê·</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">«· ÊﬁÌ⁄</font></b></td>
									<tr>
									<td class="tdViewHead" width="9%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="3" color="#000000">—ﬁ„ «·„·›</font></b></td>
									<td class="tdViewHead" width="8%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="3" color="#000000"> «—ÌŒ 
									«·ÊŸÌ›…</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000"> «—ÌŒ «· ⁄ÌÌ‰ ﬂ„⁄·„</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">„‰ÿﬁ… «·”ﬂ‰</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="3" color="#000000">«·Â« › «·À«‰Ì</font></b></td>
									</tr>
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
									<td class="tdView" width="2%" rowspan="2" align="center">
									<font face="Arial" size="2" color="#000000">
									<%ii=ii+1%>
										<%=ii%>	
									</font>	
									</td>
									
									<td class="tdView" width="14%" rowspan="2">
									<p align="right">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("Employee_Name")%></font></td>
									<td class="tdView" width="9%" align="center">
									<font face="Arial" size="2" color="#000000"><%=rs("Civil_ID")%></font></td>
									<td class="tdView" width="6%" rowspan="2" align="center">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("subject")%></font></td>
								

									<td class="tdView" width="8%" align="center">
									 <font face="Arial" size="2" color="#000000">
									 <%=rs("Position")%></font></td>
									
									<td class="tdView" align="center" width="11%" rowspan="2">
									<font face="Arial" size="1" color="#000000">&nbsp;<%=rs("Certificate_description")%></font></td>
									<td class="tdView" align="center" width="5%" rowspan="2">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("Certificate_Type")%></font></td>
									<td class="tdView" align="center" width="7%" rowspan="2">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("Certificate_Date")%></font></td>
									<td class="tdView" align="center" width="11%">
									
									<font face="Arial" size="2" color="#000000">
									
									<%=rs("Hiring_Date")%>
									</font>
									</td>
									<td class="tdView" align="center" width="2%" rowspan="2">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("Nationality")%></font></td>
									<td class="tdView" align="center" width="10%">
									<font face="Arial" size="2" color="#000000">&nbsp;
									<%=rs("Career_Level")%>
									</font>
									</td>
									<td class="tdView" align="center" width="8%">
									
									<font face="Arial" size="2" color="#000000">
									
									<%=rs("Employee_MOBILE")%>
									</font>
									</td>
									<td class="tdView" align="center" width="8%" rowspan="2">
									&nbsp;</td>
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
								</tr>
								
								<tr  id="trRow" class="<%=className%>">
									
									<td class="tdView" width="9%" align="center">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("File_Number")%></font></td>
								

									<td class="tdView" width="8%" align="center">
									 <font face="Arial" size="2" color="#000000">
									 <%=rs("Date_Start")%> </font> </td>
									
									<td class="tdView" align="center" width="11%">
									<font face="Arial" size="2" color="#000000">&nbsp;<%=rs("Teacher_Hiring_Date")%></font></td>
									<td class="tdView" align="center" width="10%">
									<font face="Arial" size="2" color="#000000">
									<%=rs("Housing_Area")%></font></td>
									<td class="tdView" align="center" width="8%">
									<font face="Arial" size="2" color="#000000">
									<%=rs("Employee_MOBILE2")%></font></td>
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