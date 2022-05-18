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
if request.querystring("id")<>"" then 

	Work_ID=int(request.querystring("id"))
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Work_Day where Work_ID="&Work_ID&" " , Conn,1,2
	if not Rs.eof then
		'PC_ID=rs("PC_ID")
		Work_ID=rs("Work_ID")
		Work_Date=rs("Work_Date")
		Employee_Name=rs("Employee_Name")
		DeptName=Request.Querystring("DeptName")
		Department_ID=rs("Department_ID")
		leave_IN=rs("leave_IN")
		leave_out=rs("leave_out")
		Time_IN=rs("Time_IN")
		Time_Out=rs("Time_Out")
		Morning_Permission=rs("Morning_Permission")
		Evening_Permission=rs("Evening_Permission")
		Morning_Permission_Time=rs("Morning_Permission_Time")
		Evening_Permission_Time=rs("Evening_Permission_Time")

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
					 <span lang="en-us"> ⁄œÌ·</span></div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
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
					
					
					if (Validate==false){
						return false;
					}
*/
					var Validate=	true;		
				}
				</script>

					<form action="Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
									
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
								
									<input type="hidden" value="<%=DeptName%>" name="txtHdnDptName">
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtID" value="<%=Work_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="right">&nbsp;«· «—ÌŒ</td>
								<td class="tdDataControlR">
								<%=work_date%>
								<!--
								<input type="text" name="txtWork_Date" class="textBox"  value="<%=work_date%>">
								-->
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								<%=Employee_Name%>
								<!--<input type="text" name="txtEmployee_Name" class="textBox" value="">
								-->
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«·ﬁ”„</td>
								<td class="tdDataControlR">&nbsp;<%=DeptName%></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">«·Õ÷Ê—</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbleave_IN" value="ON"  <%if leave_IN then %> checked <%end if%>></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">
								«·«‰’—«›</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbLeave_Out" value="ON"  <%if leave_Out then %> checked <%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ ’»«ÕÌ</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbMorning_Permission" value="ON"  <%if Morning_Permission then %> checked <%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ „”«∆Ì</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbEvening_Permission" value="ON"  <%if Evening_Permission then %> checked <%end if%>>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ «· ⁄œÌ·« " name="tbnSubmit" class="button">
								<input type="button" value="—ÃÊ⁄ ··Œ·›" name="tbnBack" class="button" onclick="document.location='products_list.asp?start=1'"></td>
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
					 <span lang="en-us"> ⁄œÌ·</span></div>
				
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
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
					
					
					if (Validate==false){
						return false;
					}
*/
					var Validate=	true;		
				}
				</script>

					<form action="Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
									
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
								
									<input type="hidden" value="<%=DeptName%>" name="txtHdnDptName">
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtID" value="<%=Work_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="right">&nbsp;«· «—ÌŒ</td>
								<td class="tdDataControlR">
								<%=work_date%>
								<!--
								<input type="text" name="txtWork_Date" class="textBox"  value="<%=work_date%>">
								-->
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								<%=Employee_Name%>
								<!--<input type="text" name="txtEmployee_Name" class="textBox" value="">
								-->
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«·ﬁ”„</td>
								<td class="tdDataControlR">&nbsp;<%=DeptName%></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">«·Õ÷Ê—</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbleave_IN" value="ON"  <%if leave_IN then %> checked <%end if%>></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">
								«·«‰’—«›</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbLeave_Out" value="ON"  <%if leave_Out then %> checked <%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ ’»«ÕÌ</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbMorning_Permission" value="ON"  <%if Morning_Permission then %> checked <%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ „”«∆Ì</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbEvening_Permission" value="ON"  <%if Evening_Permission then %> checked <%end if%>>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ «· ⁄œÌ·« " name="tbnSubmit" class="button">
								<input type="button" value="—ÃÊ⁄ ··Œ·›" name="tbnBack" class="button" onclick="document.location='products_list.asp?start=1'"></td>
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