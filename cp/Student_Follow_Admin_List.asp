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
					<p align=right><span lang="ar-kw">„ «»⁄… «·ÿ·»… «·„ „Ì“Ì‰ 
					Ê«·÷⁄«› ﬁ”„&nbsp; </span><%=request.querystring("DeptName")%><br>
				&nbsp;</div>


				<div class="RecordAdd">
				<form action="Student_Follow_Admin_list.asp?start=1&id=<%=Request.QueryString("id")%>&DeptName=<%=Request.QueryString("DeptName")%>" method="post" >
					
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectClassID">
						<option Value="0">«Œ — «·’›</option>
						<%									
										set Rs=conn.execute("Select * from Class_Room Order By Class_room_id asc")
										while not rs.eof
										%>
														<option value="<%=rs("Class_Room_id")%>" <%if Request.Form("SelectClassID") = rs("Class_Room_id") then%> selected <%End if%>><%=Rs("Class_Room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>		
						</select>
					<select size="1" name="SelectFollow_Type">
						<option Value="0">«Œ — ‰Ê⁄ «·„ «»⁄…</option>
						<option Value="1">«·ÿ·»… «·„ „Ì“Ì‰</option>
						<option Value="2">«·ÿ·»… «·÷⁄«›</option>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
						<a target="_blank" href="Student_Follow_Admin_List_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&Class_Room_ID=<%=Request.form("SelectClassID")%>&Follow_Type=<%=Request.form("SelectFollow_Type")%>">
					<font size="3">ÿ»«⁄…</font></a>
				
</p>
				</form>
				<br>
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
				pageName="student_Follow_admin_list.asp?q=0&id="&id=request.querystring("id")&"deptName="&id=request.querystring("DeptName")
				id=request.querystring("id")
				if id="" then
					id = Request.Form("id")
				End if
				DeptName=request.querystring("DeptName")
				if DeptName="" then
					DeptName=Request.form("DeptName")
				End if
	 			Class_Room_ID=Request.form("SelectClassID")
	 			If Class_Room_ID ="" then
	 				Class_Room_ID=0
	 			End if
	 			follow_Type=Request.form("SelectFollow_Type")
				if follow_Type="" then
					follow_Type=0
				End if
				
	 			if Class_Room_ID <> 0 then
	 				if follow_Type <> 0 then
	 				
								sSql = "select * from student_Follow where  Class_Room_ID ="&Class_Room_ID&" and follow_Type='"&follow_Type&"' and Department_id="&ID&" order by Employee_id,Report_date desc"
							
					Else
						
								sSql = "select * from student_Follow where Class_Room_ID ="&Class_Room_ID&" and Department_id="&ID&" order by follow_Type,Employee_id,Report_date desc"
								
					End if
				Else 
					if follow_Type <> 0 then
	 				
								sSql = "select * from student_Follow where follow_Type='"&follow_Type&"' and Department_id="&ID&" order by Employee_id,Report_date desc"
							
					Else
						
								sSql = "select * from student_Follow where  Department_id="&ID&" order by follow_Type,Class_Room_id,Employee_id,Report_date desc"
								
					End if
				End if
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955">
								<thead>
									<td class="tdViewHead" width="9%"> «—ÌŒ
									<span lang="ar-kw">«·„ «»⁄…</span></td>
									<td class="tdViewHead" width="8%">
									<span lang="ar-kw">‰Ê⁄ «·„ «»⁄…</span></td>
									<td class="tdViewHead" width="21%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="7%">
									
									<span lang="ar-kw">«·’›</span>
									</td>
									<td class="tdViewHead" width="7%" align="center">
									<span lang="ar-kw">«·„«œ… «·⁄·„Ì…</span></td>
									<td class="tdViewHead" width="11%" align="center">
									<span lang="ar-kw">«”„ «·„⁄·„</span></td>
									<td class="tdViewHead" width="24%" align="center">
									<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
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
									<td class="tdView" width="9%"><%=DAY(rs("report_Date"))&"/"&Month(rs("report_Date"))&"/"&Year(rs("report_Date"))%>
											
									</td>
									
									<td class="tdView" width="8%">&nbsp;
									<%if Rs("Follow_Type")="1" then
										Response.write "ÿ«·» „ „Ì“"
									Else
										Response.write "ÿ«·» ÷⁄Ì›"
									End if
									%>			
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
									
									<td class="tdView" width="7%">&nbsp;
									&nbsp;
										<%
											set Rss=conn.execute("Select * from Class_Room where Class_Room_ID="&rs("Class_Room_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Class_Room")%>
										<%					
											Class_Room=Rss("Class_Room")
											end if
										set rss=nothing
										%>
									
</td>
									
									<td class="tdView" width="7%">
									<%
																	
											set Rss=conn.execute("Select * from Subjects where Subject_ID="&rs("Subject_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Subject_Name")%>
										<%		
										'Std_Name=Rs("Std_Name")			
											end if
										set rss=nothing
										%></td>
									
									<td class="tdView" width="11%">
									&nbsp;
										<%
											set Rss=conn.execute("Select * from Employees where Employee_ID="&rs("Employee_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%					
											end if
										set rss=nothing
										%>

								</td>
									
									<td class="tdView" width="24%">
									<p align="center">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" align="center" width="8%">
									<%if Rs("Follow_Type")="1" then
										%>
										<a href="student_Follow_P_Admin_View.asp?id=<%=rs("ID")%>&Dept_ID=<%=ID%>&DeptName=<%=DeptName%>&std_name=<%=std_name%>&Class_Room=<%=Class_Room%>">
											«· ›«’Ì· </a>
										<%
									Else%>
									<a href="student_Follow_W_Admin_View.asp?id=<%=rs("ID")%>&Dept_ID=<%=ID%>&DeptName=<%=DeptName%>&std_name=<%=std_name%>&Class_Room=<%=Class_Room%>">
											«· ›«’Ì· </a>
									<%
									End if
									%>											
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