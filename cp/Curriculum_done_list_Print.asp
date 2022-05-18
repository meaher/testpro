<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
			<script>
	window.print()
	</script>

</head>
<body style="background-color: #FFFFFF">
<div align="right">
<table border="0" width="89%">
						<tr>
							<td width="383">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="501">
							<p align="center"><b><font face="Impact" size="3">ما قطع من المنهج <br>
							<br>
							حمود الجابر الصباح الثانوية للبنين</font></b></td>
							<td align="right" valign="top" width="48">&nbsp;</td>
							<td align="right" valign="top" width="142"><b><br>
							التاريخ: <%=Date()%></b></td>
						</tr>
						<tr>
							<td width="383">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td width="501">
							<p align="center"><b><font size="3">&nbsp;</font><font size="3" face="Impact">
							<%					
							if request.querystring("id")="" then
								id = 0
							else
								id=request.querystring("id")
							End if	
										set Rssd=conn.execute("Select * from Departments where department_ID="&id&" ")
										if not rssd.eof then
											Depaertment_name = " قسم "& Rssd("Department_Name")
										End if
										set rssd=nothing
										%>

							<%=Depaertment_name %></font></b></td>
							<td width="48">&nbsp;</td>
							<td width="142">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" width="932">
				<!-- Start Contents -->
			
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
				ii=1
				pageName="curriculum_done_Admin_list_print.asp?q=0"
				
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				id=request.queryString("id")
				SelectMonth=request.queryString("SMonth")
				SelectMonth2=request.queryString("SMonth2")
				EmployeeID=request.queryString("EmployeeID")
				if selectMonth="" then
					selectMonth=0
				End if
				if selectMonth2="" then
					selectMonth=0
				End if
				if EmployeeID="" then
					EmployeeID=0
				End if
			
				if EmployeeID > 0 then
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
							sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"							
						else 
								sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month="& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					Else		
						sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" order by Curriculum_date,Educational_level"
					End if
				Else
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
						    	sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"
						else
							sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month= "& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					else
						sSql = "select * from Curriculum_done where Department_id = "& id &" order by Department_ID, Curriculum_date,Educational_level"
					End if
	 			End if
	 			
	 			'response.write ssql
	 			'response.end
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
									<td class="tdViewHead" width="4%" align="center">&nbsp;</td>
									<td class="tdViewHead" width="8%" align="center">
									<b><font color="#000000">التاريخ</font></b></td>
									<td class="tdViewHead" width="14%" align="center">
									<b><font color="#000000">المرحلة 
									الدراسية</font></b></td>
									<td class="tdViewHead" width="11%" align="center">
									<b><font color="#000000">عنوان 
									الدرس</font></b></td>
									<td class="tdViewHead" width="10%" align="center">
									<b><font color="#000000">اسم 
									المعلم</font></b></td>
									<td class="tdViewHead" width="10%" align="center">
									<b><font color="#000000">متفق</font></b></td>
									<td class="tdViewHead" width="10%" align="center">
									<b><font color="#000000">تم 
									التدريس</font></b></td>
									<td class="tdViewHead" width="25%" align="center">
									<b><font color="#000000">ملاحظات</font></b></td>
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
									<td class="tdView" width="4%" align="center">&nbsp;</td>
									
									<td class="tdView" width="8%" align="center">&nbsp;<%=DAY(rs("Curriculum_Date"))&"/"&Month(rs("Curriculum_Date"))&"/"&Year(rs("Curriculum_Date"))%></td>
									
									<td class="tdView" width="14%" align="center">&nbsp;<%=rs("Educational_level")%></td>
									
									<td class="tdView" width="11%" align="center">&nbsp;<%=rs("Subject")%></td>
									
									<td class="tdView" width="10%" align="center">&nbsp;
									<%
													Set rss = Server.CreateObject("ADODB.Recordset")
													rss.open "select employee_name from employees where employee_id="&rs("Employee_ID")&"",conn,2,1
									if not rss.eof then
									%>
									<%=rss("Employee_Name")%>
									<%end if
									rss.close
									set rss=nothing
									%>
									
									</td>
									
									<td class="tdView" width="10%" align="center">&nbsp;<%=rs("Status")%></td>
									
									<td class="tdView" width="10%" align="center">
							 <%if rs("done")="ON" then%>
								 تم التدريس
							<%Else%>
								لم يتم
							 <%end if%></td>
									
									<td class="tdView" width="25%" align="center">&nbsp;<%=rs("notes")%></td>
									
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
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>