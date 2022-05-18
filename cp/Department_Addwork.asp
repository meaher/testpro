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
Deptname=Request.querystring("DeptName")
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
					<span lang="en-us"><%=DeptName%> </span> &gt; 
					≈÷«›… «·œÊ«„ «·ÌÊ„Ì</div>
				
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
				<span lang="en-us"><b>	
									<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
 </b></span>
								<form action="Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
									
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
								
									<input type="hidden" value="<%=DeptName%>" name="txtHdnDptName">
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								≈÷«›… œÊ«„ „ÊŸ›</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="right">&nbsp;«· «—ÌŒ</td>
								<td class="tdDataControlR">
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								
								<input type="hidden" name="hdnWork_Date"  value="<%=idate%>">
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								
								
								<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Request.QueryString("ID")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«·ﬁ”„</td>
								<td class="tdDataControlR">&nbsp;<%=DeptName%></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">«·Õ÷Ê—</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbleave_IN" value="ON" ></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">
								«·«‰’—«›</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbLeave_Out"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ ’»«ÕÌ</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbMorning_Permission"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ „”«∆Ì</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbEvening_Permission">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ " name="tbnSubmit" class="button">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<p align="center">„⁄·„Ì‰  „  ”ÃÌ· »Ì«‰«  «·œÊ«„ 
								·Â„</td>
								<td class="tdDataControlR">
								&nbsp;
								
								
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
					<span lang="en-us"><%=DeptName%> </span> &gt; 
					≈÷«›… «·œÊ«„ «·ÌÊ„Ì</div>
				
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
				<span lang="en-us"><b>	
									<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
 </b></span>
								<form action="Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
									
									<input type="hidden" value="<%=Department_ID%>" name="txthdnDptID">
								
									<input type="hidden" value="<%=DeptName%>" name="txtHdnDptName">
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								≈÷«›… œÊ«„ „ÊŸ›</td>
							</thead>
							<tr>
								<td class="tdDataControlL" align="right">&nbsp;«· «—ÌŒ</td>
								<td class="tdDataControlR">
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								
								<input type="hidden" name="hdnWork_Date"  value="<%=idate%>">
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								
								
								<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Request.QueryString("ID")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">«·ﬁ”„</td>
								<td class="tdDataControlR">&nbsp;<%=DeptName%></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">«·Õ÷Ê—</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbleave_IN" value="ON" ></td>
							</tr>
							
							<tr>
								<td class="tdDataControlL" align="right">
								«·«‰’—«›</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbLeave_Out"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ ’»«ÕÌ</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbMorning_Permission"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" align="right">≈–‰ „”«∆Ì</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="cbEvening_Permission">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ " name="tbnSubmit" class="button">
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">
								<p align="center">„⁄·„Ì‰  „  ”ÃÌ· »Ì«‰«  «·œÊ«„ 
								·Â„</td>
								<td class="tdDataControlR">
								&nbsp;
								
								
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