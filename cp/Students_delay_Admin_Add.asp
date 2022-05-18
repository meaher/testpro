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
					 ”ÃÌ· <span lang="ar-kw"> √ŒÌ—</span> «·’› <%=request.querystring("Class_Room")%></div>
				
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
					<form action="Students_Delay_Admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="txtClass_room_ID" value="<%=request.querystring("Class_Room_ID")%>">						
						<input type="hidden" name="txtClass_room" value="<%=request.querystring("Class_room")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="3" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" width="99">«· «—ÌŒ </td>
								<td class="tdDataControlR" width="83%" colspan="2">
								<input  id="date2" type="text" value=<%=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%> name="Delay_date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">Êﬁ  «·Õ’…</td>
								<td class="tdDataControlR" width="83%" colspan="2">
																								
								<select size="1" name="Delay_Time_id" class="select">
									<option value="0">ÿ«»Ê— «·’»«Õ</option>
									<option value="1">«·Õ’… «·√Ê·Ï</option>
									<option value="2">«·Õ’… «·À«‰Ì…</option>
									<option value="3">«·Õ’… «·À«·À…</option>
									<option value="4">«·Õ’… «·—«»⁄…</option>
									<option value="5">«·Õ’… «·Œ«„”…</option>
									<option value="6">«·ÕÀ… «·”«œ”…</option>
									<option value="7">«·Õ’…«·”«»⁄…</option>
								</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
					<%
					ii=1									
					set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_Room_id")&"")
					while not rs.eof
					
					%>
									
										
							<tr>
								<td class="tdDataControlL" width="99"><%=Rs("std_number")%></td>
								<td class="tdDataControlR" width="42%"><%=Rs("std_name")%> </td>
								<td class="tdDataControlR" width="41%">&nbsp;„ √Œ—<span lang="en-us"><input type="checkbox" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>">
								</span></td>
							</tr>
					<%
						ii=ii+1
						rs.movenext
					wend
					set rs=nothing
					%>
							<tr>
								
							</tr>
							<tr>
								<td class="tdDataControlL" width="99">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="99">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
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
				<!-- #include file="portal_menu.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					 ”ÃÌ· <span lang="ar-kw"> √ŒÌ—</span> «·’› <%=request.querystring("Class_Room")%></div>
				
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
					<form action="Students_Delay_Admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="txtClass_room_ID" value="<%=request.querystring("Class_Room_ID")%>">						
						<input type="hidden" name="txtClass_room" value="<%=request.querystring("Class_room")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="3" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" width="99">«· «—ÌŒ </td>
								<td class="tdDataControlR" width="83%" colspan="2">
								<input  id="date1" type="text" value=<%=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%> name="Delay_date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">Êﬁ  «·Õ’…</td>
								<td class="tdDataControlR" width="83%" colspan="2">
																								
								<select size="1" name="Delay_Time_id" class="select">
									<option value="0">ÿ«»Ê— «·’»«Õ</option>
									<option value="1">«·Õ’… «·√Ê·Ï</option>
									<option value="2">«·Õ’… «·À«‰Ì…</option>
									<option value="3">«·Õ’… «·À«·À…</option>
									<option value="4">«·Õ’… «·—«»⁄…</option>
									<option value="5">«·Õ’… «·Œ«„”…</option>
									<option value="6">«·ÕÀ… «·”«œ”…</option>
									<option value="7">«·Õ’…«·”«»⁄…</option>
								</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
					<%
					ii=1									
					set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_Room_id")&"")
					while not rs.eof
					
					%>
									
										
							<tr>
								<td class="tdDataControlL" width="99"><%=Rs("std_number")%></td>
								<td class="tdDataControlR" width="42%"><%=Rs("std_name")%> </td>
								<td class="tdDataControlR" width="41%">&nbsp;„ √Œ—<span lang="en-us"><input type="checkbox" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>">
								</span></td>
							</tr>
					<%
						ii=ii+1
						rs.movenext
					wend
					set rs=nothing
					%>
							<tr>
								
							</tr>
							<tr>
								<td class="tdDataControlL" width="99">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="99">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
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