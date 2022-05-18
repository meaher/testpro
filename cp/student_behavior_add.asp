<!-- #include file="portal_Header_teacher.asp"-->
	
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
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top"><!-- #include file="portal_menu_teacher.asp"-->				

				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					 ”ÃÌ· <span lang="ar-kw"> ﬁ—Ì—</span> «·’› <%=request.querystring("Class_Room")%></div>
				
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
					<form action="student_behavior_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="Class_room_ID" value="<%=request.querystring("Class_ID")%>">						
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_room")%>">						
						<input type="hidden" name="subject_ID" value="<%=request.querystring("subject_ID")%>">						
						<input type="hidden" name="subject_name" value="<%=request.querystring("subject_name")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								<select size="1" name="Std_Civil_ID" class="select">
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_id")&"")
											while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_ID")%>"><%=Rs("Std_Name")%> </option>
										<%					
											rs.movenext
											wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„Œ«·›…</span></td>
								<td class="tdDataControlR" width="74%">
								<input  id="date" type="text" name="Event_Date" class="textBox">mm/dd/yyyy</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
																
								<select size="1" name="Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> œŒÌ‰</span></td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Smoking" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="sleeping" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="study_Tools" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="not_care" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Get_out_of_Class" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Late_to_class" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="wrong_behavior" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="refusal_instructions" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">„·«ÕŸ«  
								«·„⁄·„</td>
								<td class="tdDataControlR" width="74%">
									<textarea  name="notes" rows="2"  ></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">—›⁄  ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">
								<input type=file  name="txtImg" class="textBox" ></td>
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
													<input type="submit" value="≈÷«›…" name="tbnSubmit" class="button">
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
				<!-- #include file="portal_menu_teacher.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					 ”ÃÌ· <span lang="ar-kw"> ﬁ—Ì—</span> «·’› <%=request.querystring("Class_Room")%></div>
				
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
					<form action="student_behavior_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="Class_room_ID" value="<%=request.querystring("Class_ID")%>">						
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_room")%>">						
						<input type="hidden" name="subject_ID" value="<%=request.querystring("subject_ID")%>">						
						<input type="hidden" name="subject_name" value="<%=request.querystring("subject_name")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								<select size="1" name="Std_Civil_ID" class="select">
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_id")&"")
											while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_ID")%>"><%=Rs("Std_Name")%> </option>
										<%					
											rs.movenext
											wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„Œ«·›…</span></td>
								<td class="tdDataControlR" width="74%">
								<input  id="date1" type="text" name="Event_Date" class="textBox">mm/dd/yyyy</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
																
								<select size="1" name="Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> œŒÌ‰</span></td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Smoking" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="sleeping" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="study_Tools" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="not_care" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Get_out_of_Class" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Late_to_class" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="wrong_behavior" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="refusal_instructions" value="yes"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">„·«ÕŸ«  
								«·„⁄·„</td>
								<td class="tdDataControlR" width="74%">
									<textarea class="textarea" name="notes" id="txtDescEN" rows="1" cols="20"></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">—›⁄  ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">
								<input type=file  name="txtImg" class="textBox" size="35"></td>
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
													<input type="submit" value="≈÷«›…" name="tbnSubmit" class="button">
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