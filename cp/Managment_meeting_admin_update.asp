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

meeting_ID=Request.querystring("meeting_id")

if session("Department_ID")<>"" then 

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Managment_meeting where meeting_ID="&meeting_ID&" " , Conn,1,2
	if not Rs.eof then
		meeting_Subject=rs("meeting_subject")
		meeting_date=rs("meeting_Date")
		Meeting_notes=rs("Meeting_notes")
		meeting_file=rs("Meeting_file")
		meeting_no=rs("Meeting_no")
	else
		response.write "<script>alert('��� ��� �� ��� ��������')</script>"
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
					�������� ������� &gt; 
					�����</div>
				
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
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=Meeting_ID%>" name="txtmeetingID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								�����</td>
							</thead>
							<tr>
								<td class="tdDataControlL">��� ��������</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectMeeting_no" class="select">
										<option value="�������� ����� ">�������� ����� </option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� �������">�������� �������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ��������">�������� ��������</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">����� ��������</td>
								<td class="tdDataControlR">
								<input type="text" name="txtmeeting_subject" value="<%=meeting_subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">����� ��������</td>
								<td class="tdDataControlR">
								<input  id="date" type="text" value="<%=meeting_Date%>" name="txtMeeting_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								�������</td>
								<td class="tdDataControlR">
									<textarea  name="txtmeeting_notes" id="txtMeeting_Notes" rows="1" cols="20"><%=meeting_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">��� ��������</td>
								<td class="tdDataControlR">
																	<input type="hidden" value="<%=meeting_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><a href="<%=meeting_file%>">��� �����</a></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="�����" name="tbnSubmit" class="button">
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
					�������� ������� &gt; 
					�����</div>
				
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
						<input type="hidden" name="txtProcType" value="edit">						
									<input type="hidden" value="<%=Meeting_ID%>" name="txtmeetingID">
									
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								�����</td>
							</thead>
							<tr>
								<td class="tdDataControlL">��� ��������</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectMeeting_no" class="select">
										<option value="�������� ����� ">�������� ����� </option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������">�������� ������</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� ������ ���">�������� ������ ���</option>
										<option value="�������� �������">�������� �������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ������ ��������">�������� ������ ��������</option>
										<option value="�������� ��������">�������� ��������</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">����� ��������</td>
								<td class="tdDataControlR">
								<input type="text" name="txtmeeting_subject" value="<%=meeting_subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">����� ��������</td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" value="<%=meeting_Date%>" name="txtMeeting_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								�������</td>
								<td class="tdDataControlR">
									<textarea class="textarea" name="txtmeeting_notes" id="txtMeeting_Notes" rows="1" cols="20"><%=meeting_notes%></textarea></td>
							</tr>
							<tr class="tdDataControlR">
								<td class="tdDataControlL">��� ��������</td>
								<td class="tdDataControlR">
																	<input type="hidden" value="<%=meeting_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><a href="<%=meeting_file%>">��� �����</a></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="�����" name="tbnSubmit" class="button">
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