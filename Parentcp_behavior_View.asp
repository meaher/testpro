<!-- #include file="portal_Header.asp"-->
<!-- #include file="portal_functions.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
ID=Request.querystring("id")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Student_Behavior where ID="&ID&" " , Conn,1,2
	if not Rs.eof then
		Std_Civil_ID=rs("Std_Civil_ID")
		Class_Room_ID=rs("Class_Room_ID")
		Lecture_Time_ID=rs("Lecture_Time_ID")
		Subject_id=rs("Subject_id")
		Employee_id=rs("Employee_id")
		Department_id=rs("Department_id")
		Smoking=rs("Smoking")
		sleeping=rs("sleeping")
		study_Tools=rs("study_Tools")
		not_care=rs("not_care")
		Get_out_of_Class=rs("Get_out_of_Class")
		Late_to_class=rs("Late_to_class")
		wrong_behavior=rs("wrong_behavior")
		refusal_instructions=rs("refusal_instructions")
		notes=rs("notes")
		report_file=rs("report_file")
		report_Date=rs("report_Date")
		Report_Day=rs("Report_Day")
		Report_month=rs("Report_month")
		Report_year=rs("Report_year")
		Event_Date=rs("Event_Date")
		Event_Day=rs("Event_Day")
		Event_Month=rs("Event_Month")
		Event_Year=rs("Event_Year")
		managment_notes=rs("managment_notes")
		
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	

%><head>
<style>
<!--
.auto-style1 {
	text-align: center;
}
-->
</style>
</head>
<%
		Sql="select * from students where std_Civil_ID='"&session("std_civil_id")&"'"
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open Sql, conn, 1, 2
		
		if not rs.eof then
			Std_Number=rs("Std_Number")
			std_name=rs("std_name")
			std_civil_id=rs("std_civil_id")
			Class_Room_ID=rs("Class_Room_ID")
		Else
			response.redirect "parentcp.asp"
		End if	
		rs.close	
%>
<body style="text-align: center">
<table class=" w3-left w3-hide-large w3-hover-cyan w3-large w3-theme" border="0" width="100%" id="table1"  style="border-style: solid; background-color: #FFFFFF !important">
				<tr>
					<td>
						
					<table style="width: 98%" cellspacing="0" cellpadding="0">
						
							<tr>
								<td  valign="top" background="images/defaul8.gif">
										<!--#include file="Banner_mobile.asp"-->
								</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" background="images/defaul8.gif">
									
					<div align="center">
					<table border="0" width="75%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="5" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
										</div>
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
<table border="0" cellpadding="0" cellspacing="0" width="95%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center" dir="rtl">


																				<!-- Start Contents -->
				<div class="PageTitle">
					<span lang="ar-kw">⁄—÷</span> <span lang="ar-kw"> ﬁ—Ì—</span>
					<span lang="ar-kw">«·ÿ«·»</span> <%=request.querystring("std_name")%> «·’›<%=request.querystring("Class_Room")%></div>
				<br>&nbsp;<div align="center">
				
										
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rs.eof then
										%>
												<%=Rs("Std_Name")%>
										<%					
											end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ ﬂ «»… «· ﬁ—Ì—</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Report_Day&"/"&Report_Month&"/"&Report_Year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„Œ«·›…</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Event_Day&"/"&Event_Month&"/"&Event_Year%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
																
										<%									
										set Rs=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&Lecture_Time_id&"")
										if not rs.eof then
										%>
													<%=Rs("Lecture_Time_name")%>
										<%
										end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR" width="74%">
									<%									
										set Rs=conn.execute("Select * from Employees where Employee_id="&Employee_id&"")
										if not rs.eof then
										%>
													<%=Rs("Employee_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%">
								<%									
										set Rs=conn.execute("Select * from Departments where Department_id="&Department_id&"")
										if not rs.eof then
										%>
													<%=Rs("Department_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„«œ… «·⁄·„Ì…</span></td>
								<td class="tdDataControlR" width="74%">
								<%									
										set Rs=conn.execute("Select * from Subjects where Subject_id="&Subject_id&"")
										if not rs.eof then
										%>
													<%=Rs("Subject_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> œŒÌ‰</span></td>
								<td class="tdDataControlR" width="74%">
								<%if Smoking= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if sleeping= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if study_Tools= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<%if not_care= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								 <%if Get_out_of_Class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if Late_to_class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<%if wrong_behavior= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								 <%if refusal_instructions= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">„·«ÕŸ«  
								«·„⁄·„</td>
								<td class="tdDataControlR" width="74%">
									<%=notes%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">

									<%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ «·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">ﬁ—«— «·≈œ«—…</span></td>
								<td class="tdDataControlR" width="74%">
									<%=Managment_notes%></td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
						
													</td>
												</tr>
							</table>
				</div>
				<!-- End Contents -->

						
</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>										</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="bottom" align="center">
						<!--#include file="Footer_mobile.asp"-->

								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>


<table class="w3-hide-medium w3-hide-small" border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
	<tr>
	<td>
										<!--#include file="Banner.asp"-->
	</td>
	</tr>
	


	<tr>
		<td align="center">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
									<table border="0" cellpadding="0" cellspacing="0" width="75%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center">


												<!-- Start Contents -->
				<div class="PageTitle">
					<span lang="ar-kw">⁄—÷</span> <span lang="ar-kw"> ﬁ—Ì—</span>
					<span lang="ar-kw">«·ÿ«·»</span> <%=request.querystring("std_name")%> «·’›<%=request.querystring("Class_Room")%></div>
				<br>&nbsp;<div align="center">
				
										
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rs.eof then
										%>
												<%=Rs("Std_Name")%>
										<%					
											end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ ﬂ «»… «· ﬁ—Ì—</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Report_Day&"/"&Report_Month&"/"&Report_Year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„Œ«·›…</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Event_Day&"/"&Event_Month&"/"&Event_Year%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
																
										<%									
										set Rs=conn.execute("Select * from Lectures_Time where Lecture_Time_id="&Lecture_Time_id&"")
										if not rs.eof then
										%>
													<%=Rs("Lecture_Time_name")%>
										<%
										end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR" width="74%">
									<%									
										set Rs=conn.execute("Select * from Employees where Employee_id="&Employee_id&"")
										if not rs.eof then
										%>
													<%=Rs("Employee_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%">
								<%									
										set Rs=conn.execute("Select * from Departments where Department_id="&Department_id&"")
										if not rs.eof then
										%>
													<%=Rs("Department_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„«œ… «·⁄·„Ì…</span></td>
								<td class="tdDataControlR" width="74%">
								<%									
										set Rs=conn.execute("Select * from Subjects where Subject_id="&Subject_id&"")
										if not rs.eof then
										%>
													<%=Rs("Subject_name")%>
										<%
										end if
										set rs=nothing
										%>
</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> œŒÌ‰</span></td>
								<td class="tdDataControlR" width="74%">
								<%if Smoking= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if sleeping= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if study_Tools= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<%if not_care= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								 <%if Get_out_of_Class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if Late_to_class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<%if wrong_behavior= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								 <%if refusal_instructions= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">„·«ÕŸ«  
								«·„⁄·„</td>
								<td class="tdDataControlR" width="74%">
									<%=notes%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">

									<%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ «·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">ﬁ—«— «·≈œ«—…</span></td>
								<td class="tdDataControlR" width="74%">
									<%=Managment_notes%></td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
						
													</td>
												</tr>
							</table>
				</div>
				<!-- End Contents -->

						
						</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
					<p>
											<br>
											<br>
&nbsp;
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

