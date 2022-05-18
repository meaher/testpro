<!-- #include file="portal_Header.asp"-->

<head>
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


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">Õ”«»«·ÿ«·»<span lang="en-us">:</span> <%=std_name%><span lang="en-us">&nbsp;
			</span>&nbsp;«·’›<span lang="en-us">:</span> 
			
			<%
										set Rssd=conn.execute("Select * from Class_Room where Class_Room_ID="&Class_room_id&"")
										if not rssd.eof then
											Class_Room = rssd("Class_Room")
											response.write Class_Room		
										End if
										rssd.close
										set rssd=nothing
			%>
			</font>
			<p style="text-align: right">
											<p>
											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl" width="90%">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="18%" dir="rtl">
																		«·’›</td>
									<td class="tdViewHead" width="14%" dir="rtl">
									≈‰–«—</td>
									<td class="tdViewHead" width="23%" dir="rtl">
									⁄œœ √Ì«„ «·€Ì«»</td>
									<td class="tdViewHead" width="4%" dir="rtl">
									&nbsp;</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									&nbsp;<%=class_room%></td>
								
									<td class="tdView" width="14%" dir="rtl">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii>4 and ii<10 then
										Response.write "≈‰–«— √Ê·"
									ElseIF ii>9 and ii<15 then
										Response.write "≈‰–«— À«‰Ì"
									ElseIf ii=15 then
										Response.write "≈‰–«— À«·À"
									Elseif ii> 15 then
										Response.write "‘ÿ»"
									End if
									
									%>					
									</td>
									
									
									<td class="tdView" width="23%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
									<td class="tdView" width="4%" dir="rtl">
														
					<a target="_blank" href="Parentcp_Absence_alert_Print.asp?std_civil_id=<%=std_civil_id%>&std_Name=<%=std_Name%>&Class_room=<%=class_room%>"><font size="3">ÿ»«⁄…</font></a></td>
									
									
								</tr>
									<td colspan="6">&nbsp;</td>
								</tr>
								</table>
								
								
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;«·‰Ê«ﬁ’ «·„ÿ·Ê»… ·„·› «·ÿ«·»<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView" width="90%">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		«·√Ê—«ﬁ 
																		«·„ÿ·Ê»…</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									«·Õ«·…</td>
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
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»… 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·Ã‰”Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									≈Ì’«· «·—”Ê„</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·ÃÊ«“</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… ‘Â«œ… «·„Ì·«œ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									 ”·”· œ—«”Ì »«·„œ—”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—…  —ﬂ œ—«”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—… «⁄«œ… ﬁÌœ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								
						<%
						End if
						rss.close
						%></td>
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


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">Õ”«» Ê·Ì √„— «·ÿ«·»<span lang="en-us">:</span> <%=std_name%><span lang="en-us">&nbsp;
			</span>&nbsp;«·’›<span lang="en-us">:</span> 
			
			<%
										set Rssd=conn.execute("Select * from Class_Room where Class_Room_ID="&Class_room_id&"")
										if not rssd.eof then
											Class_Room = rssd("Class_Room")
											response.write Class_Room		
										End if
										rssd.close
										set rssd=nothing
			%>
			</font>
			<p style="text-align: right">
											<p>
											<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="18%" dir="rtl">
																		«·’›</td>
									<td class="tdViewHead" width="14%" dir="rtl">
									≈‰–«—</td>
									<td class="tdViewHead" width="23%" dir="rtl">
									⁄œœ √Ì«„ «·€Ì«»</td>
									<td class="tdViewHead" width="4%" dir="rtl">
									&nbsp;</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									&nbsp;<%=class_room%></td>
								
									<td class="tdView" width="14%" dir="rtl">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii>4 and ii<10 then
										Response.write "≈‰–«— √Ê·"
									ElseIF ii>9 and ii<15 then
										Response.write "≈‰–«— À«‰Ì"
									ElseIf ii=15 then
										Response.write "≈‰–«— À«·À"
									Elseif ii> 15 then
										Response.write "‘ÿ»"
									End if
									
									%>					
									</td>
									
									
									<td class="tdView" width="23%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
									<td class="tdView" width="4%" dir="rtl">
														
					<a target="_blank" href="Parentcp_Absence_alert_Print.asp?std_civil_id=<%=std_civil_id%>&std_Name=<%=std_Name%>&Class_room=<%=class_room%>"><font size="3">ÿ»«⁄…</font></a></td>
									
									
								</tr>
									<td colspan="6">&nbsp;</td>
								</tr>
								</table>
								
								
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;«·‰Ê«ﬁ’ «·„ÿ·Ê»… ·„·› «·ÿ«·»<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		«·√Ê—«ﬁ 
																		«·„ÿ·Ê»…</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									«·Õ«·…</td>
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
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»… 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·Ã‰”Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									≈Ì’«· «·—”Ê„</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… «·ÃÊ«“</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									’Ê—… ‘Â«œ… «·„Ì·«œ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									 ”·”· œ—«”Ì »«·„œ—”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—…  —ﬂ œ—«”…</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									«” „«—… «⁄«œ… ﬁÌœ</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									Ì—ÃÏ  ”·Ì„ ‘ƒƒ‰ «·ÿ·»…  «·«Ê—«ﬁ «·„ÿ·Ê»…																		
																		
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