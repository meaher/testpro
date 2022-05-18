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
	<script type="text/javascript">
	$(function () {
	$("#date1").datepicker();
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
				<div >
					<p>
					ÇáÇÌÊãÇÚÇÊ ÇáÅÏÇÑÉ &gt; ÇÖÇİÉ</div>
				
				<div align="center">
				
						<form action="Managment_Meeting_admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" width="182">
							<thead>
								<td class="tdHeadDataControl">
								ÇÖÇİÉ</td>
							</thead>
							<tr>
								<td class="tdDataControlL">ÑŞã ÇáÇÌÊãÇÚ</td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<select size="1" name="SelectMeeting_no" class="select">
										<option value="ÇáÅÌÊãÇÚ ÇáÃæá ">ÇáÅÌÊãÇÚ 
										ÇáÃæá </option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí">ÇáÅÌÊãÇÚ 
										ÇáËÇäí</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË">ÇáÅÌÊãÇÚ 
										ÇáËÇáË</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ">ÇáÅÌÊãÇÚ 
										ÇáÑÇÈÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ">ÇáÅÌÊãÇÚ 
										ÇáÎÇãÓ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ">ÇáÅÌÊãÇÚ 
										ÇáÓÇÏÓ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ">ÇáÅÌÊãÇÚ 
										ÇáÓÇÈÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä">ÇáÅÌÊãÇÚ 
										ÇáËÇãä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ">ÇáÅÌÊãÇÚ 
										ÇáÊÇÓÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ">ÇáÅÌÊãÇÚ 
										ÇáÚÇÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ">
										ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä">
										ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËáÇíæä">
										ÇáÅÌÊãÇÚ ÇáËáÇËæä</option>
								</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÚäæÇä ÇáÇÌÊãÇÚ</td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<input type="text" name="txtmeeting_subject" class="textBox" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÊÇÑíÎ ÇáÇÌÊãÇÚ</td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								<input  id="date" type="text" name="txtMeeting_Date" class="textBox" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								ãáÇÍÙÇÊ</td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">
									<textarea name="txtmeeting_notes" id="txtDescEN" rows="3" cols="24"></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">ãáİ ÇáÇÌÊãÇÚ</td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<input type=file  name="txtImg" class="textBox" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<input type="submit" value="ÅÖÇİÉ" name="tbnSubmit" class="button">
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
					<p>
					ÇáÇÌÊãÇÚÇÊ ÇáÅÏÇÑÉ &gt; ÇÖÇİÉ</div>
				
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
					<form action="Managment_Meeting_admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								ÇÖÇİÉ</td>
							</thead>
							<tr>
								<td class="tdDataControlL">ÑŞã ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectMeeting_no" class="select">
										<option value="ÇáÅÌÊãÇÚ ÇáÃæá ">ÇáÅÌÊãÇÚ ÇáÃæá </option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí">ÇáÅÌÊãÇÚ ÇáËÇäí</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË">ÇáÅÌÊãÇÚ ÇáËÇáË</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä">ÇáÅÌÊãÇÚ ÇáËÇãä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ">ÇáÅÌÊãÇÚ ÇáÚÇÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä</option>
										<option value="ÇáÅÌÊãÇÚ ÇáËáÇíæä">ÇáÅÌÊãÇÚ ÇáËáÇËæä</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÚäæÇä ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input type="text" name="txtmeeting_subject" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÊÇÑíÎ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" name="txtMeeting_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								ãáÇÍÙÇÊ</td>
								<td class="tdDataControlR">
									<textarea class="textarea" name="txtmeeting_notes" id="txtDescEN" rows="1" cols="20"></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">ãáİ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input type=file  name="txtImg" class="textBox" size="35"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="ÅÖÇİÉ" name="tbnSubmit" class="button">
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