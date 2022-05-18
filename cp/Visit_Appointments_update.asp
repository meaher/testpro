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
	</script>
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Department_ID=Request.querystring("ID")
%>
</head>

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
									
					<!-- #include file="Banner_Page_mob.asp"-->
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">
				<!-- #include file="portal_menu.asp"-->				
				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					<p>
					<span lang="ar-kw">‰Ÿ«„ «·„Ê«⁄Ìœ</span> &gt; «·„Ê›ﬁ…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				<div align="center">
				
				<%
					ID=request.queryString("ID")
					set Rs=conn.execute("Select * from visit_appointments where ID="&id&"")
					if not rs.eof then
				%>
					<form action="Visit_Appointments_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						
						<input type="hidden" name="id" value="<%=id%>">						

						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«·„Ê«›ﬁ…</td>
							</thead>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ  ﬁœÌ„ «·ÿ·»</td>
								<td class="tdDataControlR">
								<%=Day(rs("Reg_Date"))&"/"&month(rs("Reg_Date"))&"/"&year(rs("Reg_Date"))%>
											
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·«”„</span></td>
								<td class="tdDataControlR">
										&nbsp;	<%
											response.write rs("Full_name")
											%>
														
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								—ﬁ„ «·„Ê»«Ì·</span></td>
								<td class="tdDataControlR">
								
									<%=rs("mobile")%>
									
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								”»» «·“Ì«—…</span></td>
								<td class="tdDataControlR">
																						
																				&nbsp;<%=rs("visit_reason")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								‰«—ÌŒ «·“Ì«—…</span></td>
								<td class="tdDataControlR">
																								
										<%=rs("Day_Date")&"/"&rs("month_date")&"/"&rs("year_Date")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·”«⁄…</span></td>
								<td class="tdDataControlR">
								
								<%=rs("Visit_Time")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								Õ«·… «·ÿ·»</span></td>
								<td class="tdDataControlR">
																								
																		&nbsp;
									<%
									
									if rs("Accept")=0 then
										response.write(" „ «·—›÷")
									elseif rs("Accept")=1 then
										response.write(" „  «·„Ê«›ﬁ…")
									else 
										response.write("›Ì «·«‰ Ÿ«— ")
									End if
									%>
									
																	
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="radio" value="1" checked name="Status">„Ê<span lang="ar-kw">«</span>›ﬁ<span lang="en-us">
								</span>&nbsp;&nbsp;&nbsp; &nbsp;
								<input type="radio" name="Status" value="0">—›÷ </td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
								</td>
							</tr>
							</table>
					</form>
					<%End if%>
				</div>
				<!-- End Contents -->
</td>
			</tr>
		</table>										<p>&nbsp;</td>
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
		<!-- #include file="Banner_page.asp"-->				
		<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">			
				<!-- #include file="portal_menu.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					<p>
					<span lang="ar-kw">‰Ÿ«„ «·„Ê«⁄Ìœ</span> &gt; «·„Ê›ﬁ…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				<div align="center">
				
				<%
					ID=request.queryString("ID")
					set Rs=conn.execute("Select * from visit_appointments where ID="&id&"")
					if not rs.eof then
				%>
					<form action="Visit_Appointments_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						
						<input type="hidden" name="id" value="<%=id%>">						

						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«·„Ê«›ﬁ…</td>
							</thead>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ  ﬁœÌ„ «·ÿ·»</td>
								<td class="tdDataControlR">
								<%=Day(rs("Reg_Date"))&"/"&month(rs("Reg_Date"))&"/"&year(rs("Reg_Date"))%>
											
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·«”„</span></td>
								<td class="tdDataControlR">
										&nbsp;	<%
											response.write rs("Full_name")
											%>
														
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								—ﬁ„ «·„Ê»«Ì·</span></td>
								<td class="tdDataControlR">
								
									<%=rs("mobile")%>
									
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								”»» «·“Ì«—…</span></td>
								<td class="tdDataControlR">
																						
																				&nbsp;<%=rs("visit_reason")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								‰«—ÌŒ «·“Ì«—…</span></td>
								<td class="tdDataControlR">
																								
										<%=rs("Day_Date")&"/"&rs("month_date")&"/"&rs("year_Date")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·”«⁄…</span></td>
								<td class="tdDataControlR">
								
								<%=rs("Visit_Time")%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">
								Õ«·… «·ÿ·»</span></td>
								<td class="tdDataControlR">
																								
																		&nbsp;
									<%
									
									if rs("Accept")=0 then
										response.write(" „ «·—›÷")
									elseif rs("Accept")=1 then
										response.write(" „  «·„Ê«›ﬁ…")
									else 
										response.write("›Ì «·«‰ Ÿ«— ")
									End if
									%>
									
																	
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="radio" value="1" checked name="Status">„Ê<span lang="ar-kw">«</span>›ﬁ<span lang="en-us">
								</span>&nbsp;&nbsp;&nbsp; &nbsp;
								<input type="radio" name="Status" value="0">—›÷ </td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
								</td>
							</tr>
							</table>
					</form>
					<%End if%>
				</div>
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