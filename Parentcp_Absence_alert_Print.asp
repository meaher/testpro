<!-- #include file="portal_Header.asp"-->
<!-- #include file="portal_functions.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="../cp/styles/style.css">
			<script>
	window.print()
	</script>

</head>
<body style="background-color: #FFFFFF">
<div align="right">
<table border="0" width="90%">
						<tr>
							<td width="349">
							<p align="center">
							<b>
							<img border="0" src="cp/images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="469" rowspan="2">
							<p align="center">
							<b><font face="Impact" size="5">حمود الجابر الصباح الثانوية للبنين
</font></b>
						
							<%
							if request.querystring("SClass") = "" then
								Sclass=0
							Else
								sclass=request.querystring("SClass")
							End if
							
							if  sclass <> "0" then
								
								set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&cint(Sclass)&"")
								if not rss.eof then
									response.write rss("Class_Room")
								end if
								Rss.close
							End if
							
							
							%>
							<br>
							&nbsp;</font></b></td>
							<td align="right" valign="top" width="76">&nbsp;</td>
							<td align="right" valign="top" width="146">
							<p>&nbsp;<p><b>التاريخ: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="349">
							<p align="center"><b><font size="3" face="Impact">وزارة 
							التربية<br>
							إدارة الشؤون التعليمية<br>
							منطقة الفروانية التعليمية</font></b></td>
							<td>
							&nbsp;</td>
							<td width="76">&nbsp;</td>
							<td width="146">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" width="932">
				<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		الرقم 
									المدني</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									اسم الطالب</td>
									<td class="tdViewHead" width="18%" dir="rtl">
																		الصف</td>
									<td class="tdViewHead" width="14%" dir="rtl" align="center">
									بعذر</td>
									<td class="tdViewHead" width="10%" dir="rtl" align="center">
									بدون عذر</td>
									<td class="tdViewHead" width="6%" dir="rtl" align="center">
									إنذار</td>
									<td class="tdViewHead" width="13%" dir="rtl" align="center">
									عدد أيام الغياب الكلي</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="12%" dir="rtl">
								
									<%
									std_civil_id=request.queryString("std_civil_id")
									std_name=request.queryString("std_name")
									class_room=request.queryString("Class_room")
									
									%>
									
									<%=std_Civil_id%></td>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									&nbsp;<%=class_room%></td>
								
									<td class="tdView" width="14%" dir="rtl" align="center">
									<%
									i=0
									set Rst=conn.execute("Select * from Excused_absence where std_civil_id='"&std_civil_id&"'")
									while not rst.eof
												i=i+1
											rst.movenext
										Wend
									Rst.Close
									%>
									<%=i%></td>
									
									
									<td class="tdView" width="10%" dir="rtl" align="center">
									&nbsp;
									<%
										dd=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												dd=dd+1
											rss.movenext
										Wend
										Rss.close
									%>
									<%=dd-i%>
									</td>
									
									
									<td class="tdView" width="6%" dir="rtl" align="center">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii-i>4 and ii-i<10 then
										Response.write "إنذار أول"
									ElseIF ii-i>9 and ii-i<15 then
										Response.write "إنذار ثاني"
									ElseIf ii-i=15 then
										Response.write "إنذار ثالث"
									Elseif ii-i> 15 then
										Response.write "شطب"
									End if
									
									%>					
									</td>
									
									
									<td class="tdView" width="13%" dir="rtl" align="center">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
								</tr>
									<td colspan="7">&nbsp;</td>
								</tr>
								</table>
															
											<!-- Start Contents -->
			
				<div class="PageTitle">
					<p align=right><span lang="ar-kw">الصحيفة السلوكية 
					</span><br>
				&nbsp;</div>


				<div class="RecordAdd">
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' order by Department_ID,Class_Room_id,Report_date desc"
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955" dir="rtl">
								<thead>
									<td class="tdViewHead" width="8%">تاريخ
									<span lang="ar-kw">التقرير</span></td>
									<td class="tdViewHead" width="21%">
									<span lang="ar-kw">اسم الطالب</span></td>
									<td class="tdViewHead" width="5%">
									<span lang="ar-kw">القسم العلمي</span></td>
									<td class="tdViewHead" width="4%">
									<span lang="ar-kw">اسم المعلم</span></td>
									<td class="tdViewHead" width="21%" align="center">ملاحظات<span lang="ar-kw"> 
									الإدارة</span></td>
									<td class="tdViewHead" width="30%" align="center">المخالفة</td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw">عرض</span> </td>
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
									
									<td class="tdView" width="5%">
										<%
										if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Departments where Department_ID="&rs("Department_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Department_Name")%>
										<%				
											else
												response.write "الاشراف"	
											end if
										set rss=nothing
										Else
											response.write "الاشراف"
										End if

										%>
</td>
									
									<td class="tdView" width="4%">
									<%
										'if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Employees where Employee_ID="&rs("Employee_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%				
											else
												response.write "الاشراف"	
											end if
										set rss=nothing
										'Else
										'	response.write "الاشراف"
										'End if

										%></td>
									
									<td class="tdView" width="21%">
									<p align="center">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="30%">
									<table border="1" width="100%" style="border-collapse: collapse">
										<tr>
											<td align="center">تدخين</td>
										<td align="center">النوم</td>
										<td align="center">الأدوات </td>
										<td align="center">الانتباه</td>
										<td align="center">خروج</td>
										<td align="center">تأخير</td>
										<td align="center">سلوك</td>
										<td align="center">التعليمات</td>
									</tr>
									<tr>
										<td align="center">
								<%if rs("Smoking")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								<%if rs("sleeping")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								 <%if rs("study_Tools")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								<%if rs("not_care")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								 <%if rs("Get_out_of_Class")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								<%if rs("Late_to_class")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								<%if rs("wrong_behavior")= "yes" then%> نعم<%end if%></td>
										<td align="center">
								 <%if rs("refusal_instructions")= "yes" then%> نعم<%end if%></td>
									</tr>
								</table>
								</td>
									
									<td class="tdView" align="center" width="8%">
											<a href="parentcp_behavior_view.asp?id=<%=rs("ID")%>&std_name=<%=std_name%>&Class_Room=<%=Class_Room%>&page=0">
											التفاصيل </a>
									
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
									<td colspan="7">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
	
								
			
				<div class="PageTitle">
					&nbsp;</div>


				<div class="RecordAdd">
				<br>
				</div>
								
				<div class="ErrMsg">
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="parentcp_main.asp?q=0&id="&id=request.querystring("id")
				

	 		
				'Std_civil_id = request.Form("selectStdCivilId")
				
					sSql = "select * from Students_Delay where Std_civil_id='"& Std_Civil_id &"' order by Delay_Date Desc"
					'response.write sSql 
					'ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955" dir="rtl">
								<thead>
									<td class="tdViewHead" width="10%">تاريخ
									<span lang="ar-kw">التأخير</span></td>
									<td class="tdViewHead" width="22%">
									<span lang="ar-kw">اسم الطالب</span></td>
									<td class="tdViewHead" width="66%">
									<span lang="ar-kw">وقت التأخير</span></td>
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
									<td class="tdView" width="10%"><%=Day(rs("Delay_Date"))&"/"&month(rs("Delay_Date"))&"/"&year(rs("Delay_Date"))%>
											
								
											
									</td>
									
									<td class="tdView" width="22%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="66%">
								
											<%	if rs("Delay_Time_ID")=0 then
														delay_time = "طابور الصباح"
													Elseif rs("Delay_time_id")=1 then
														Delay_time = "الحصة الأولى"
													Elseif rs("Delay_time_id")=2 then
														Delay_time ="الحصة الثانية"
													Elseif rs("Delay_time_id")=3 then
														Delay_time = "الحصة الثالثة"
													Elseif rs("Delay_time_id")=4 then
														Delay_time ="الحصة الرابعة"
													Elseif rs("Delay_time_id")=5 then
														Delay_time ="الحصة الخامسة"
													Elseif rs("Delay_time_id")=6 then
														Delay_time ="الحصة السادسة"
													Elseif rs("Delay_time_id")=7 then
														Delay_time ="الحصة السابعة"
													End if
													%>
<%=Delay_time%>
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
									<td colspan="3">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- End Contents -->
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;النواقص المطلوبة لملف الطالب<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		الأوراق 
																		المطلوبة</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									الحالة</td>
									</thead>
									<%
									'std_civil_id=request.queryString("std_civil_id")
									'std_name=request.queryString("std_name")
									'class_room=request.queryString("Class_room")
									
									%>
							<%
							if rss("std_reg_Form")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp;
								
									
									استمارة تسجيل طالب</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; أخر شهادة نجاح أصلية</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									صورة الجنسية</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									صورة البطاقة المدنية</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									إيصال الرسوم</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									صورة الجواز</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									صورة شهادة الميلاد</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									تسلسل دراسي بالمدرسة</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									عدد 4 صور شخصية</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									استمارة ترك دراسة</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									استمارة اعادة قيد</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									جنسية الام (لأبناء وبنات الكويتيات)</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									يرجى تسليم شؤؤن الطلبة  الاوراق المطلوبة																		
																		
									</td>
									
									
								</tr>
							<%end if%>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								
						<%
						End if
						rss.close
						%>
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