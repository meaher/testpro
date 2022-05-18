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
					<p align="right"><span lang="ar-kw">„ «»⁄… «·ÿ·»… «·÷⁄«›</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
<form action="Student_Follow_w_Department_list.asp?id=<%=Request.queryString("id")%>&DeptName=<%=Request.queryString("DeptName")%>&start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;
					<select size="1" name="SelectEmployeeID" class="select">
						<option Value="0">Ã„Ì⁄ «·„⁄·„Ì‰</option>
										<%									
										set Rssd=conn.execute("Select * from Employees where Department_ID="&request.querystring("ID")&" order by Employee_id")
										while not rssd.eof
										%>
														<option value="<%=rssd("Employee_id")%>"><%=Rssd("Employee_name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1">&nbsp;&nbsp;&nbsp; 	<a target="_blank" href="Student_Follow_w_Department_list_Print.asp?id=<%=Request.queryString("id")%>&DeptName=<%=Request.queryString("DeptName")%>&EID=<%=Request.Form("SelectEmployeeID")%>">
					<font size="3">ÿ»«⁄…</font></a></p>
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
				pageName="Student_Follow_w_Department_list.asp?q=0&id="&id=request.querystring("id")
				
				Eid=request.Form("SelectEmployeeID")
				if Eid="" then
					Eid = 0
				end if
				if EID > 0 then		
						ssql="select * from student_Follow where Employee_id="&Eid&" and Follow_Type='2' and Department_ID="&request.querystring("ID")&" order by Class_Room_ID,Std_civil_id,Report_date desc"
				Else
						ssql="select * from student_Follow where Follow_Type='2' and Department_ID="&request.querystring("ID")&" order by Class_Room_ID,Std_civil_id,Report_date desc"
	 			End if
									
				'	ssql="select * from student_Follow where Follow_Type='2' and Department_ID="&request.querystring("ID")&" order by Class_Room_ID,Std_civil_id,Report_date desc"

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
									<td class="tdViewHead" width="8%"> «—ÌŒ
									<span lang="ar-kw">«·„ «»⁄…</span></td>
									<td class="tdViewHead" width="14%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="7%">
									<span lang="ar-kw">«·’›</span></td>
									<td class="tdViewHead" width="6%">
									<span lang="ar-kw">«”„ «·„⁄·„</span></td>
									<td class="tdViewHead" width="18%" align="center">
									<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
									<td class="tdViewHead" width="38%" align="center">
									<span lang="ar-kw">„Ã«·«  «·÷⁄›</span></td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw">⁄—÷</span> </td>
									<td align="center" class="tdViewHead">
									ÿ»«⁄…</td>
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
									<td class="tdView" width="8%"><%=DAY(rs("report_Date"))&"/"&Month(rs("report_Date"))&"/"&Year(rs("report_Date"))%>
											
									</td>
									
									<td class="tdView" width="14%">&nbsp;
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
									
									<td class="tdView" width="7%">
									<%
											set Rss=conn.execute("Select * from Class_Room where Class_Room_ID="&rs("Class_Room_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Class_Room")%>
										<%			
												Class_Room=	Rss("Class_Room")	
											end if
										set rss=nothing
										%>

									
									</td>
									
									<td class="tdView" width="6%">&nbsp;
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
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="38%">
									<table border="1" width="100%" style="border-collapse: collapse">
										<tr>
										<td>«·‰Ê„</td>
										<td>«·√œÊ«  </td>
										<td>«·«‰ »«Â</td>
										<td>Œ—ÊÃ</td>
										<td width="31"> √ŒÌ—</td>
										<td width="33">”·Êﬂ</td>
										<td><span lang="ar-kw">«·„‘«—ﬂ…</span></td>
										<td><span lang="ar-kw">«·Ê«Ã»« </span></td>
										<td><span lang="ar-kw">«·€Ì«»</span></td>
										<td width="48">«· ⁄·Ì„« </td>
									</tr>
									<tr>
										<td>
								<%if rs("sleeping")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("study_Tools")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("not_care")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("Get_out_of_Class")= "yes" then%> ‰⁄„<%end if%></td>
										<td width="31">
								<%if rs("Late_to_class")= "yes" then%> ‰⁄„<%end if%></td>
										<td width="33">
								<%if rs("wrong_behavior")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("Class_Participation")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("Home_work")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("Absence")= "yes" then%> ‰⁄„<%end if%></td>
										<td width="48">
								 <%if rs("refusal_instructions")= "yes" then%> ‰⁄„<%end if%></td>
									</tr>
								</table>
								</td>
									
									<td class="tdView" align="center" width="3%">
											<a href="student_Follow_w_Department_Edit.asp?id=<%=rs("ID")%>&Deptid=<%=request.querystring("id")%>&Dept_name=<%=request.querystring("deptname")%>&Class_Room=<%=Class_Room%>&std_name=<%=std_name%>">
											«· ›«’Ì· </a>
									
									</td>
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																	
									<td class="tdView" align="center" width="3%">
											<a href="student_Follow_w_Department_View.asp?id=<%=rs("ID")%>&Deptid=<%=request.querystring("id")%>&Dept_name=<%=request.querystring("deptname")%>&Class_Room=<%=Class_Room%>&std_name=<%=std_name%>">
											ÿ»«⁄…</a></td>
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
			<tr>
				<td valign="top">			
				&nbsp;</td>
				<td width="80%" valign="top">
				&nbsp;</td>
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