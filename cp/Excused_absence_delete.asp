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
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Excused_ID=Request.querystring("Excused_ID")

if Excused_ID <>"" then 
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Excused_absence where Excused_ID="&Excused_ID&" " , Conn,1,2
	if not Rs.eof then
		std_civil_id=rs("std_civil_id")
		class_room_id=rs("class_room_id")
		Excused_type=rs("Excused_type")
		Excused_date=rs("Excused_date")
		Excused_day=rs("Excused_day")
		Excused_month=rs("Excused_month")
		Excused_year=rs("Excused_year")
		Excused_file=rs("Excused_file")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if

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
					<span lang="ar-kw">€Ì«» »⁄–— „ﬁ»Ê·</span> &gt; Õ–›
					
					<form action="Excused_absence_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="delete">
						<input type="hidden" value="<%=request.querystring("Excused_id")%>" name="Excused_id">
						<input type="hidden" value="<%=request.querystring("Class_room")%>" name="Class_room">
						<input type="hidden" value="<%=Class_room_id%>" name="Class_room_id">
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">Õ–›</td>
							</thead>
							<tr>
								<td class="tdDataControlL" height="30"> «—ÌŒ 
								<span lang="ar-kw">«·€Ì«»</span></td>
								<td class="tdDataControlR" height="30">
								<%=Excused_day&"/"&Excused_month&"/"&Excused_year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·’›</span></td>
								<td class="tdDataControlR">
										<%=request.querystring("class_room")%>						
								
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«”„ 
								«·ÿ«·»</span></td>
								<td class="tdDataControlR">
																	<%									
										set Rs=conn.execute("Select * from students where std_civil_id ='"&std_civil_id&"'")
										if not rs.eof then
										%>
											<%=Rs("std_Name")%>
								
										<%
											else
												response.write " „ Õ–› »Ì«‰«  «·ÿ«·» "	
											
										End if
										set rs=nothing
										%></select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">‰Ê⁄ «·⁄–—</td>
								<td class="tdDataControlR">
																											
															<%if Excused_type = 1 then%>
																⁄–— ÿ»Ì
															<%Else%>
																⁄–— ≈œ«—Ì
															<%End if%>				
																			</td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">„·›
								«·⁄–—</td>
								<td class="tdDataControlR">
								<input type="hidden" value="<%=Excused_file%>" name="txtHdnImg">
								&nbsp;<%if Excused_file <> "" then%><a href="/Excused_absence_file/<%=Excused_file%>">⁄—÷ «·„·›</a><%End if%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="Õ–›" name="tbnSubmit" class="button">
								</td>
							</tr>
						</table>
					</form></div>
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
					<span lang="ar-kw">€Ì«» »⁄–— „ﬁ»Ê·</span> &gt;
					<span lang="ar-kw">Õ–›</span></div>
				
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
					<form action="Excused_absence_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="delete">
						<input type="hidden" value="<%=request.querystring("Excused_id")%>" name="Excused_id">
						<input type="hidden" value="<%=request.querystring("Class_room")%>" name="Class_room">
						<input type="hidden" value="<%=Class_room_id%>" name="Class_room_id">
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">Õ–›</td>
							</thead>
							<tr>
								<td class="tdDataControlL" height="30"> «—ÌŒ 
								<span lang="ar-kw">«·€Ì«»</span></td>
								<td class="tdDataControlR" height="30">
								<%=Excused_day&"/"&Excused_month&"/"&Excused_year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«·’›</span></td>
								<td class="tdDataControlR">
										<%=request.querystring("class_room")%>						
								
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="ar-kw">«”„ 
								«·ÿ«·»</span></td>
								<td class="tdDataControlR">
																	<%									
										set Rs=conn.execute("Select * from students where std_civil_id ='"&std_civil_id&"'")
										if not rs.eof then
										%>
											<%=Rs("std_Name")%>
								
										<%
											else
												response.write " „ Õ–› »Ì«‰«  «·ÿ«·» "	
											
										End if
										set rs=nothing
										%></select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">‰Ê⁄ «·⁄–—</td>
								<td class="tdDataControlR">
																											
															<%if Excused_type = 1 then%>
																⁄–— ÿ»Ì
															<%Else%>
																⁄–— ≈œ«—Ì
															<%End if%>				
																			</td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">„·›
								«·⁄–—</td>
								<td class="tdDataControlR">
								<input type="hidden" value="<%=Excused_file%>" name="txtHdnImg">
								&nbsp;<%if Excused_file <> "" then%><a href="/Excused_absence_file/<%=Excused_file%>">⁄—÷ «·„·›</a><%End if%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
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