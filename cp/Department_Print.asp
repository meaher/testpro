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
							<p align="center"><b><font size="3" face="Impact">كشف 
							الحضور الهيئة الإدارية والتدريسية <br>
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
							<p align="center"><b><font size="3">&nbsp;</font><font size="3" face="Impact">قسم <%=request.querystring("DeptName")%></font></b></td>
							<td width="48">&nbsp;</td>
							<td width="142">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain">
				
				<div class="RecordAdd">&nbsp;
				
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =50
				nRecRange = 15
				nRecPerRow = 1
				pageName="Department_print.asp?q=0&id="&request.querystring("id")&""
				id=request.querystring("id")
				
			If Request.QueryString("Day")=1 then
				'sSql = "select * from Work_Day where Department_ID ="&ID&" order by work_ID DESC"
	 		Else
	 			id=Request.querystring("id")

	 			deptname=Request.querystring("deptname")
	 			sday=Request.querystring("sday")
	 			smonth=Request.querystring("smonth")
				EmployeeID=Request.querystring("EmployeeID")
				if sday="" then sday=0 end if
				if smonth="" then smonth=0 end if
				if EmployeeID="" then EmployeeID=0 end if
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if EmployeeID <> 0 then
								sSql = "select * from Work_Day where Employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						Else
									sSql = "select * from Work_Day where Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						End if		
					Else
						if EmployeeID <> 0 then
							smonth= month(Date())
								sSql = "select * from Work_Day where employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						Else
								sSql = "select * from Work_Day where Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_Date DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Employeeid <> 0 then
						sSql = "select * from Work_Day where Employee_ID="&EmployeeID&" and Department_ID ="&ID&" and Work_Month="&smonth&" order by work_Date DESC"
					Else
						sSql = "select * from Work_Day where Department_ID ="&ID&" and Work_Month="&smonth&" order by work_Date DESC"
					End if
				ElseIF EmployeeID <> 0 then
					sSql = "select * from Work_Day where Employee_ID="&Employeeid&" and Department_ID ="&ID&" order by work_Date DESC"
				Else 
					sSql = "select * from Work_Day where Department_ID ="&ID&" order by work_ID DESC"
				End if
				
				
	 		End if
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
									<td class="tdViewHead" width="13%" dir="rtl">التاريخ</td>
									<td class="tdViewHead" width="21%" dir="rtl">اسم 
									الموظف</td>
									<td class="tdViewHead" width="12%" dir="rtl">القسم</td>
									<td class="tdViewHead" width="11%" dir="rtl" align="center">الحضور</td>
									<td class="tdViewHead" width="9%" dir="rtl" align="center">الانصراف</td>
									<td class="tdViewHead" width="12%" dir="rtl" align="center">اذن صباحي</td>
									<td align="center" class="tdViewHead" dir="rtl">
									اذن مسائي</td>
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
									<td class="tdView" width="13%" dir="rtl"><%=rs("Work_Day")&"/"&rs("Work_month")&"/"&rs("Work_year")%>
											
									</td>
									
									<td class="tdView" width="21%" dir="rtl">&nbsp;<%=rs("Employee_Name")%></td>
									
									<td class="tdView" width="12%" dir="rtl"><%=Request.querystring("DeptName")%></td>
									<td class="tdView" width="11%" dir="rtl" align="center">
									<p align="center"><%If rs("leave_in")=true then%>&#8730;<%End if%></td>
								

									<td class="tdView" width="9%" dir="rtl" align="center">
									<%If rs("leave_out")=true then%>&#8730;<%End if%>
									</td>
									
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%If rs("Morning_Permission")=true then%>اذن صباحي<%End if%></td>
									<td class="tdView" align="center" width="10%" dir="rtl">&nbsp;
									<%If rs("Evening_Permission")=true then%>اذن مسائي<%End if%></td>
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
									<td colspan="6">&nbsp;</td>
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
		<table border="0" width="89%">
							<tr>
								<td width="400">&nbsp;</td>
								<td>&nbsp;</td>
								<td width="357">&nbsp;</td>
							</tr>
							<tr>
								<td width="400">
								<p align="center"><b>
								<font size="4" face="Impact">رئيس القسم</font></b></td>
								<td>
								<p align="center">&nbsp;</td>
								<td width="357">
								<p align="center"><b>
								<font size="4" face="Impact">مدير المدرسة</font></b></td>
							</tr>
							<tr>
								<td width="400"><br>
								<br>
&nbsp;</td>
								<td>&nbsp;</td>
								<td width="357">&nbsp;</td>
							</tr>
						</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>