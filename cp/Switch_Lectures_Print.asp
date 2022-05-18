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
<table border="0" width="90%">
						<tr>
							<td width="396">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="428" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">حمود الجابر الصباح الثانوية للبنين
</font></b>
							<p align="center"><b><font face="Impact" size="4">تبديل طارئ لحصة دراسية بين 
							الأقسام العلمية  <br>&nbsp;</font></b></td>
							<td align="right" valign="top" width="94">&nbsp;</td>
							<td align="right" valign="top" width="169">
							<p>&nbsp;<p><b><font size="3" face="Impact">العام الدراسي</font>
							<%if month(Date) > 9 and month(Date) < 1 then 
								response.write year(Date)&"/"& (year(Date)+1)
							Else
								response.write year(Date)-1 &"/"& year(Date)
							End if
							%></b><p><b><font size="3" face="Impact">التاريخ: 		</font>
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								
								</b></td>
						</tr>
						<tr>
							<td width="396">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td width="94">&nbsp;</td>
							<td width="169" valign="top"><b><font size="3" face="Impact">قسم <%=request.querystring("DeptName")%></font></b></td>
						</tr>
						
					</table>
</div>
<%	
		ii=6

		sSql = "select * from Switch_Lectures where Switch_lectures_ID = "&cint(Request.queryString("Switch_lectures_ID"))&""
		
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.CursorLocation = 3
		rs.Open sSql , conn, 1, 2
		if not rs.eof then
			
		
%>


<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" >
				<font size="3">السيد مدير المدرسة المحترم</font><p>
				<font size="3">نرجو السماح لنا بتبديل حصصنا 
				الدراسية اليوم&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				if weekday(rs("Order_Date"))=1 then
					response.write "الأحد"
				ElseIF weekday(rs("Order_Date"))=2 then
					response.write "الإثنين"
				ElseIF weekday(rs("Order_Date"))=3 then
					response.write "الثلاثاء"
				ElseIF weekday(rs("Order_Date"))=4 then
					response.write "الأربعاء"
				ElseIF weekday(rs("Order_Date"))=5 then
					response.write "الخميس"
				ElseIF weekday(rs("Order_Date"))=6 then
					response.write "الجمعة"
				ElseIF weekday(rs("Order_Date"))=7 then
					response.write "السبت"
				End if
				%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				الموافق&nbsp;&nbsp; <%=DAY(rs("order_Date"))&"/"&Month(rs("order_Date"))&"/"&Year(rs("order_Date"))%></font><span lang="en-us"><font size="3">&nbsp;&nbsp;
				</font>
				</span></p>
				<p><font size="3">وذلك بسبب حاجة العمل لتبديل الحصص</font></p>
				<p align="left"><font size="3">مع جزيل الشكر&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
				<table border="1" width="100%" style="border-collapse: collapse" bordercolor="#000000">
					<tr>
						<td align="center" rowspan="2"><b><font size="2">م</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">اسم المعلم</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">القسم العلمي</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">الفصل الدراسي</font></b></td>
						<td colspan="2" align="center"><b><font size="2">تغيير موعد الحصة</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">توقيع المعلم</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">توقيع رئيس القسم</font></b></td>
						<td align="center" rowspan="2"><b><font size="2">ملاحظات</font></b></td>
					</tr>
					<tr>
						<td align="center"><b><font size="2">إلى</font></b></td>
						<td align="center"><b><font size="2">من </font></b> </td>
					</tr>
					<tr>
						<td><b><font size="2">1</font></b></td>
						<td><b><font size="2">&nbsp;
						<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("First_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
						</font></b>
						</td>
						<td><b><font size="2">&nbsp;
						<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("First_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>

						</font></b>

						</td>
						<td><b><font size="2">&nbsp;
						<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
						</font></b>
						</td>
						<td dir="rtl"><b><font size="2"><%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%>
						الحصة&nbsp;<%=rs("Second_Lecture_Time_id")%>
						</font></b>
						</td>
						<td dir="rtl"><b><font size="2"><%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%>
						الحصة&nbsp;<%=rs("First_Lecture_Time_id")%>
						</font></b>
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><b><font size="2">2</font></b></td>
						<td><b><font size="2">&nbsp;<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("Second_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>		</font></b>		</td>
						<td><b><font size="2">&nbsp;<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("Second_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%>
									
</font></b>
									
</td>
						<td><b><font size="2">&nbsp;	<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "حصل خطأ"
										End if
									set rst=nothing
									%></font></b></td>
						<td dir="rtl"><b><font size="2"><%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%>
						الحصة&nbsp;<%=rs("First_Lecture_Time_id")%>
						</font></b>
						</td>
						<td dir="rtl"><b><font size="2"><%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%>
						الحصة&nbsp;<%=rs("Second_Lecture_Time_id")%>
						</font></b>
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<p><font size="3">رأي مدير المدرسة :-</font></p>
				<p><font size="3">لا مانع </font> </p>
				<p><font size="3">تحفظ هذه النسخة في سجل خاص بالأقسام العلمية التي قامت بإجراء 
				التبديل فيما بينها</font></p>
				<p align="left"><font size="3">يعتمد مدير المدرسة&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				</font> </p>
				<p align="left">&nbsp;</td>
		</tr>
		</table>
</div>
</body>
</html>
<%
Else
	response.write "حصل خطأ في استرجاع البيانات"
End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>