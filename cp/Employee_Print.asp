<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="ltr">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
		<script>
	window.print()
	</script>

</head>
<body>

<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" style="width: 100%" dir="rtl">

		<tr>
			<td colspan="2" align="center" class="tdMainHeader">
<table border="0" width="100%">
						<tr>
							<td width="141">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td>
							<p align="center"><b><font size="3" face="Impact">كشف 
							بيانات الهيئة الإدارية والتدريسية <br>
							نموذج </font><font size="3" face="Goudy Old Style">
							(1)</font><font size="3" face="Impact"><br>
							حمود الجابر الصباح الثانوية للبنين</font></b></td>
							<td align="right" valign="top">&nbsp;</td>
							<td align="right" valign="top" width="146"><b>التاريخ: <%=Date()%></b></td>
						</tr>
						<tr>
							<td width="141">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td>
							<p align="center"><b><font size="3">&nbsp;</font><font size="3" face="Impact">قسم <%=request.querystring("DeptName")%></font></b></td>
							<td>&nbsp;</td>
							<td width="146">&nbsp;</td>
						</tr>
						
					</table>			</td>
		</tr>
		<tr>
						<td valign="top" class="tdMain" style="width: 100%">
				<!-- Start Contents -->
			
				<%
				nDisplayRecs =150
				nRecRange = 15
				nRecPerRow = 1
				pageName="Employee_list.asp?q=0"
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
									<font face="Impact" size="2" color="#000000">
									م</font></b></td>
									<td class="tdViewHead" width="14%" rowspan="2" style="background-color: #FFFFFF" align="center">
									<b>
									<font face="Impact" size="2" color="#000000">الاسم</font></b></td>
									<td class="tdViewHead" width="9%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="2" color="#000000">الرقم 
									المدني</font></b></td>
									<td class="tdViewHead" width="6%" rowspan="2" style="background-color: #FFFFFF" align="center">
									<b>
									<font face="Impact" size="2" color="#000000">المادة</font></b></td>
									<td class="tdViewHead" width="8%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="2" color="#000000">الوظيفة</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">وصف الشهادة</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">نوع الشهادة</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">تاريخ الشهادة</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">تاريخ التعيين</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">الجنسية</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">المستوى الوظيفي</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">الهاتف الاول</font></b></td>
									<td align="center" class="tdViewHead" rowspan="2" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">التوقيع</font></b></td>
									<tr>
									<td class="tdViewHead" width="9%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="2" color="#000000">رقم الملف</font></b></td>
									<td class="tdViewHead" width="8%" style="background-color: #FFFFFF" align="center"><b>
									<font face="Impact" size="2" color="#000000">تاريخ 
									الوظيفة</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">تاريخ التعيين كمعلم</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">منطقة السكن</font></b></td>
									<td align="center" class="tdViewHead" style="background-color: #FFFFFF">
									<b>
									<font face="Impact" size="2" color="#000000">الهاتف الثاني</font></b></td>
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
						<div>
						<table border="0" width="100%">
							<tr>
								<td width="303">&nbsp;</td>
								<td>&nbsp;</td>
								<td width="287">&nbsp;</td>
							</tr>
							<tr>
								<td width="303">
								<p align="center"><b>
								<font size="4" face="Impact">رئيس القسم</font></b></td>
								<td>
								<p align="center">&nbsp;</td>
								<td width="287">
								<p align="center"><b>
								<font size="4" face="Impact">مدير المدرسة</font></b></td>
							</tr>
							<tr>
								<td width="303"><br>
								<br>
&nbsp;</td>
								<td>&nbsp;</td>
								<td width="287">&nbsp;</td>
							</tr>
						</table>
						</div>
				<% End If %>	
							

				<!-- End Contents -->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="10"></td>
		</tr>
	</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>