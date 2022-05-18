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
meeting_ID=Request.querystring("meeting_id")

if session("Department_ID")<>"" then 
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from meeting where meeting_ID="&meeting_ID&" " , Conn,1,2
	if not Rs.eof then
		meeting_Subject=rs("meeting_subject")
		meeting_date=rs("meeting_Date")
		Meeting_notes=rs("Meeting_notes")
		meeting_file=rs("Meeting_file")
		meeting_no=rs("Meeting_no")
		Department_ID=rs("Department_ID")
	else
		response.write "<script>alert('ÍÕá ÎØÃ İí ÚÑÖ ÇáÈíÇäÇÊ')</script>"
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
					ÇáÇÌÊãÇÚÇÊ &gt; 
					ÊÚÏíá</div>
				
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
					<form action="meeting_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=Meeting_ID%>" name="txtmeetingID">
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								ÊÚÏíá</td>
							</thead>
							<tr>
								<td class="tdDataControlL">ÑŞã ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectMeeting_no" class="select">
										<option value="ÇáÅÌÊãÇÚ ÇáÃæá " <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÃæá" then%> selected <%end if%>>ÇáÅÌÊãÇÚ ÇáÃæá </option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí">ÇáÅÌÊãÇÚ ÇáËÇäí</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇáË" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË">ÇáÅÌÊãÇÚ ÇáËÇáË</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä">ÇáÅÌÊãÇÚ ÇáËÇãä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ">ÇáÅÌÊãÇÚ ÇáÚÇÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä</option>
										<option <%if meeting_no="áÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËáÇËæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËáÇíæä">ÇáÅÌÊãÇÚ ÇáËáÇËæä</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÚäæÇä ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input type="text" name="txtmeeting_subject" value="<%=meeting_subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÊÇÑíÎ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input  id="date" type="text" value="<%=meeting_Date%>" name="txtMeeting_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								ãáÇÍÙÇÊ</td>
								<td class="tdDataControlR">
									<textarea  name="txtmeeting_notes" id="txtMeeting_Notes" rows="4" cols="20"><%=meeting_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">ãáİ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
																	<input type="hidden" value="<%=meeting_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><a href="<%=meeting_file%>">ÚÑÖ Çáãáİ</a></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="ÊÚÏíá" name="tbnSubmit" class="button">
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
					ÇáÇÌÊãÇÚÇÊ &gt; 
					ÊÚÏíá</div>
				
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
					<form action="meeting_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=Meeting_ID%>" name="txtmeetingID">
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								ÊÚÏíá</td>
							</thead>
							<tr>
								<td class="tdDataControlL">ÑŞã ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectMeeting_no0" class="select">
										<option value="ÇáÅÌÊãÇÚ ÇáÃæá " <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÃæá" then%> selected <%end if%>>ÇáÅÌÊãÇÚ ÇáÃæá </option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí">ÇáÅÌÊãÇÚ ÇáËÇäí</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇáË" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË">ÇáÅÌÊãÇÚ ÇáËÇáË</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä">ÇáÅÌÊãÇÚ ÇáËÇãä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÚÇÔÑ">ÇáÅÌÊãÇÚ ÇáÚÇÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÍÇÏí ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇäí ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇáË ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÎÇãÓ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÓÇÈÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ">ÇáÅÌÊãÇÚ ÇáËÇãä ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ ÚÔÑ</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÍÇÏí æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇäí æÇáÚÔÑæä</option>
										<option <%if meeting_no="áÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇáË æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÑÇÈÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÎÇãÓ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇÏÓ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÓÇíÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáËÇãä æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä">ÇáÅÌÊãÇÚ ÇáÊÇÓÚ æÇáÚÔÑæä</option>
										<option <%if meeting_no="ÇáÅÌÊãÇÚ ÇáËáÇËæä" then%> selected <%end if%> value="ÇáÅÌÊãÇÚ ÇáËáÇíæä">ÇáÅÌÊãÇÚ ÇáËáÇËæä</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÚäæÇä ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input type="text" name="txtmeeting_subject" value="<%=meeting_subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ÊÇÑíÎ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" value="<%=meeting_Date%>" name="txtMeeting_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								ãáÇÍÙÇÊ</td>
								<td class="tdDataControlR">
									<textarea class="textarea" name="txtmeeting_notes" id="txtMeeting_Notes" rows="1" cols="20"><%=meeting_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">ãáİ ÇáÇÌÊãÇÚ</td>
								<td class="tdDataControlR">
																	<input type="hidden" value="<%=meeting_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><a href="<%=meeting_file%>">ÚÑÖ Çáãáİ</a></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="ÊÚÏíá" name="tbnSubmit" class="button">
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