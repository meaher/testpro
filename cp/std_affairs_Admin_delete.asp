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
	<script type="text/javascript">
	$(function () {
	$("#date2").datepicker();
	});
	$(function () {
	$("#date3").datepicker();
	});
	</script>
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
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
					 ”ÃÌ· «·‰Ê«ﬁ’ «·’› <%=request.querystring("Class_Room")%></div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
				
				
					<%
					set Rss=conn.execute("Select * from std_affairs Where std_civil_id = '"&Request.Querystring("std_civil_id")&"'")
					if not rss.eof then
						Std_Civil_ID=rss("Std_Civil_ID")
						std_reg_Form=rss("std_reg_Form")
						Last_certificate=rss("Last_certificate")
						Nationality_pic=rss("Nationality_pic")
						ID_pic=rss("ID_pic")
						Fee_receipt=rss("Fee_receipt")
						passport_pic=rss("passport_pic")
						Birth_certificate=rss("Birth_certificate")
						school_syllabus=rss("school_syllabus")
						personal_pic=rss("personal_pic")
						leave_study=rss("leave_study")
						Re_enrollment_form=rss("Re_enrollment_form")
						mother_nationality=rss("mother_nationality")
					Else
						session("ErrMsg")="·« ÌÊÃœ ‰Ê«ﬁ’ „”Ã·… ··ÿ«·» „‰ ﬁ»· - «–« «—œ   ”ÃÌ· ‰Ê«ﬁ’ ›„‰ Œ·«· «·«÷«›…"
						response.redirect "std_affairs_Admin_list.asp?start=1&Class_Room_ID="&request.querystring("Class_Room_ID")&"&Class_Room="&request.querystring("Class_Room")&"" 
					End if
					rss.close
					%>

					<form action="std_affairs_admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="delete">						
						<input type="hidden" name="Class_room_ID" value="<%=request.querystring("Class_Room_ID")%>">						
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_room")%>">						
						<input type="hidden" name="std_civil_id" value="<%=request.querystring("std_civil_id")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where std_Civil_id='"&request.querystring("std_civil_id")&"'")
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
								<td class="tdDataControlL" width="165">&nbsp;
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
								 <%if std_reg_form="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if Last_certificate="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·Ã‰”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if Nationality_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if ID_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">≈Ì’«· «·—”Ê„</td>
								<td class="tdDataControlR" width="74%">
							 <%if Fee_receipt="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·ÃÊ«“</td>
								<td class="tdDataControlR" width="74%">
								 <%if passport_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… ‘Â«œ… «·„Ì·«œ</td>
								<td class="tdDataControlR" width="74%">
								 <%if Birth_certificate="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ”·”· œ—«”Ì »«·„œ—”…</td>
								<td class="tdDataControlR" width="74%">
								 <%if school_syllabus="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if personal_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«” „«—…  —ﬂ œ—«”…</td>
								<td class="tdDataControlR" width="74%">
								 <%if leave_study="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«” „«—… «⁄«œ… ﬁÌœ</td>
								<td class="tdDataControlR" width="74%">
								 <%if Re_enrollment_form="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
								<td class="tdDataControlR" width="74%">
								 <%if mother_nationality="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
													<input type="hidden" name="txtStdCount" value="<%=ii%>">						
													<input type="submit" value="Õ–›" name="tbnSubmit" class="button">
													</td>
												</tr>
							</table>
					</form>
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
					 ”ÃÌ· «·‰Ê«ﬁ’ «·’› <%=request.querystring("Class_Room")%></div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
				
				
					<%
					set Rss=conn.execute("Select * from std_affairs Where std_civil_id = '"&Request.Querystring("std_civil_id")&"'")
					if not rss.eof then
						Std_Civil_ID=rss("Std_Civil_ID")
						std_reg_Form=rss("std_reg_Form")
						Last_certificate=rss("Last_certificate")
						Nationality_pic=rss("Nationality_pic")
						ID_pic=rss("ID_pic")
						Fee_receipt=rss("Fee_receipt")
						passport_pic=rss("passport_pic")
						Birth_certificate=rss("Birth_certificate")
						school_syllabus=rss("school_syllabus")
						personal_pic=rss("personal_pic")
						leave_study=rss("leave_study")
						Re_enrollment_form=rss("Re_enrollment_form")
						mother_nationality=rss("mother_nationality")
					Else
						session("ErrMsg")="·« ÌÊÃœ ‰Ê«ﬁ’ „”Ã·… ··ÿ«·» „‰ ﬁ»· - «–« «—œ   ”ÃÌ· ‰Ê«ﬁ’ ›„‰ Œ·«· «·«÷«›…"
						response.redirect "std_affairs_Admin_list.asp?start=1&Class_Room_ID="&request.querystring("Class_Room_ID")&"&Class_Room="&request.querystring("Class_Room")&"" 
					End if
					rss.close
					%>

					<form action="std_affairs_admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="delete">						
						<input type="hidden" name="Class_room_ID" value="<%=request.querystring("Class_Room_ID")%>">						
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_room")%>">						
						<input type="hidden" name="std_civil_id" value="<%=request.querystring("std_civil_id")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where std_Civil_id='"&request.querystring("std_civil_id")&"'")
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
								<td class="tdDataControlL" width="165">&nbsp;
								
									
									«” „«—…  ”ÃÌ· ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
								 <%if std_reg_form="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp; √Œ— ‘Â«œ… ‰Ã«Õ √’·Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if Last_certificate="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·Ã‰”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if Nationality_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·»ÿ«ﬁ… «·„œ‰Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if ID_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">≈Ì’«· «·—”Ê„</td>
								<td class="tdDataControlR" width="74%">
							 <%if Fee_receipt="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… «·ÃÊ«“</td>
								<td class="tdDataControlR" width="74%">
								 <%if passport_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">’Ê—… ‘Â«œ… «·„Ì·«œ</td>
								<td class="tdDataControlR" width="74%">
								 <%if Birth_certificate="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ”·”· œ—«”Ì »«·„œ—”…</td>
								<td class="tdDataControlR" width="74%">
								 <%if school_syllabus="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œœ 4 ’Ê— ‘Œ’Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if personal_pic="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«” „«—…  —ﬂ œ—«”…</td>
								<td class="tdDataControlR" width="74%">
								 <%if leave_study="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«” „«—… «⁄«œ… ﬁÌœ</td>
								<td class="tdDataControlR" width="74%">
								 <%if Re_enrollment_form="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">Ã‰”Ì… «·«„ (·√»‰«¡ Ê»‰«  «·ﬂÊÌ Ì« )</td>
								<td class="tdDataControlR" width="74%">
								 <%if mother_nationality="no" then%> €Ì— „ Ê›— <%End if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
													<input type="hidden" name="txtStdCount" value="<%=ii%>">						
													<input type="submit" value="Õ–›" name="tbnSubmit" class="button">
													</td>
												</tr>
							</table>
					</form>
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