<!-- #include file="portal_Header_teacher.asp"-->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
ID=Request.querystring("id")

if session("Department_ID")<>"" then 
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Student_Follow where ID="&ID&" " , Conn,1,2
	if not Rs.eof then
		Std_Civil_ID=rs("Std_Civil_ID")
		Class_Room_ID=rs("Class_Room_ID")
		Subject_id=rs("Subject_id")
		Employee_id=rs("Employee_id")
		Department_id=rs("Department_id")
		Follow_type=rs("Follow_type")
		Class_Degree=rs("Class_Degree")
		Exam_Degree=rs("Exam_Degree")
		sleeping=rs("sleeping")
		study_Tools=rs("study_Tools")
		not_care=rs("not_care")
		Get_out_of_Class=rs("Get_out_of_Class")
		Late_to_class=rs("Late_to_class")
		wrong_behavior=rs("wrong_behavior")
		refusal_instructions=rs("refusal_instructions")
		Class_Participation=rs("Class_Participation")
		Home_work=rs("Home_work")
		Absence=rs("Absence")
		Teamwork=rs("Teamwork")
		Preparing_lessons=rs("Preparing_lessons")
		share=rs("share")
		Responsiveness=rs("Responsiveness")
		Discussion=rs("Discussion")
		Flexibility=rs("Flexibility")
		care_learn=rs("care_learn")
		style=rs("style")
		Care_Study_Tools=rs("Care_Study_Tools")
		notes=rs("notes")
		Managment_Notes=rs("Managment_Notes")
		report_file=rs("report_file")
		report_Date=rs("report_Date")
		Report_Day=rs("Report_Day")
		Report_month=rs("Report_month")
		Report_year=rs("Report_year")
		Event_Date=rs("Event_Date")
		Event_Day=rs("Event_Day")
		Event_Month=rs("Event_Month")
		Event_Year=rs("Event_Year")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if

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
							<td width="501" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">Õ„Êœ «·Ã«»— «·’»«Õ «·À«‰ÊÌ…&nbsp; »‰Ì‰<br>
							&nbsp;„ «»⁄… ÿ«·» ÷⁄Ì›<br>
							<br></font>
							<font face="Impact" size="4">
							<%
							
											response.write Request.queryString("std_name") 
							
							
							%>
							&nbsp;
							<%= request.querystring("class_room")%></font>
							<br>
							</b></td>
							<td align="right" valign="top" width="48">&nbsp;</td>
							<td align="right" valign="top" width="142"><b><br>
							&nbsp;</b><p><b>«· «—ÌŒ: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="383">
							<p align="center"><b><font size="3" face="Impact">Ê“«—… 
							«· —»Ì…<br>
							≈œ«—… «·‘ƒÊ‰ «· ⁄·Ì„Ì…<br>
							„‰ÿﬁ… «·›—Ê«‰Ì… «· ⁄·Ì„Ì…</font></b></td>
							<td>
							&nbsp;</td>
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
				
				<div align="center">
				
		
				
															
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="139">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="78%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rs.eof then
										%>
												<%=Rs("Std_Name")%>
										<%		
										std_name=Rs("Std_name")			
											end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">
								<span lang="ar-kw"> «—ÌŒ «·„ «»⁄…</span></td>
								<td class="tdDataControlR" width="78%">
								<%=Event_Day&"/"&Event_Month&"/"&Event_Year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«⁄„«·</span></td>
								<td class="tdDataControlR" width="78%">
																
								<%=Class_Degree%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«Œ »«—</span></td>
								<td class="tdDataControlR" width="78%">
																
									<%=Exam_Degree%>
								
								
								</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="139">&nbsp;</td>
								<td class="tdDataControlR" width="78%">
																
								&nbsp;</td>
							</tr>
					
									
										
							<tr>
								<td class="tdDataControlL" width="139">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="78%">
								<%if sleeping= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="78%">
								 <%if study_Tools= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="78%">
								<%if not_care= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="78%">
								 <%if Get_out_of_Class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="78%">
								<%if Late_to_class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="78%">
								<%if wrong_behavior= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139" height="26">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="78%" height="26">
								 <%if refusal_instructions= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·„‘«—ﬂ… 
								«·’›Ì…</td>
								<td class="tdDataControlR" width="78%">
								 <%if Class_Participation= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Ê«Ã»«  
								«·„‰“·Ì…</td>
								<td class="tdDataControlR" width="78%">
								 <%if Home_work= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">ﬂÀ—… «·€Ì«»</td>
								<td class="tdDataControlR" width="78%">
								<%if Absence= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">
								<span lang="ar-kw">«·≈Ã—«¡ «·„ Œ–</span></td>
								<td class="tdDataControlR" width="78%">
									<%=notes%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139"> ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="78%">

									<%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ «·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="139">
								<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
								<td class="tdDataControlR" width="78%">
								&nbsp;<%=Managment_Notes%></td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="139">&nbsp;</td>
													<td class="tdDataControlR" width="78%">
																		
													&nbsp;</td>
												</tr>
							</table>
				</div>
				<!-- End Contents -->
			</td>
		</tr>
		</table>
</div>
<table border="0" width="89%">
							<tr>
								<td width="489">&nbsp;</td>
								<td>&nbsp;</td>
								<td width="319">&nbsp;</td>
							</tr>
							<tr>
								<td width="489">
								<p align="center"><b>
								<font size="4" face="Impact">—∆Ì” «·ﬁ”„</font></b></td>
								<td>
								<p align="center">&nbsp;</td>
								<td width="319">
								<p align="center"><b>
								<font size="4" face="Impact">„œÌ— «·„œ—”…</font></b></td>
							</tr>
							<tr>
								<td width="489"><br>
								<br>
&nbsp;</td>
								<td>&nbsp;</td>
								<td width="319">&nbsp;</td>
							</tr>
						</table>
</body>
</html>
<%
conn.close
set conn=nothing
%>