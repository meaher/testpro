<!-- #include file="portal_Header.asp"-->
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
<head>
<style>
<!--
.auto-style1 {
	text-align: center;
}
-->
</style>
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
<table border="0" cellpadding="0" cellspacing="0" width="95%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center">


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">‰Ÿ«„ <span lang="ar-kw">ÕÃ“ «·„Ê«⁄Ìœ</span><span lang="en-us">:</span> <%=std_name%>			
			</font>
				<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font></p>

											<p>
											
					<form action="visit_appointments_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
											

											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<td width="25%" dir="rtl" align="left">
																		«·«”„ 
																		«·À·«ÀÌ</td>
									<td  width="73%" dir="rtl">
									<input type="text" name="Full_name" size="20" class="textBox"></td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="25%" dir="rtl" align="left">
									—ﬁ„ «·„Ê»«Ì·</td>
									
									<td class="tdView" width="73%" dir="rtl">
									
									<p align="right">
									<input type="text" name="mobile" size="20" class="textBox"><%=std_Name%>
																		
									</td>
									
									
								</tr>
								<tr>
									<td align="left">”»» «·“Ì«—…</td>
									<td>
									<input type="text" name="visit_reason" size="20" class="textBox"></td>
								</tr>
								<tr>
									<td align="left">«· «—ÌŒ</td>
									<td>
														
								<input  id="date" type="text" name="Visit_Date" class="textBox"></td>
								</tr>
								<tr>
									<td align="left">«·”«⁄…</td>
									<td>
														
								<select size="1" name="Visit_Time" class="select">
																				
								<option>Ì—ÃÏ «Œ »«— «·”«⁄…</option>
									<option>8:00</option>
								<option>8:30</option>
								<option>9:00</option>
								<option>9:30</option>
								<option>10:00</option>
								<option>10:30</option>
								<option>11:00</option>
								<option>11:30</option>
								<option>12:00</option>
									</select></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<input type="submit" value="≈—”«·" name="B2"></tr>
								</table>
						</form></td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>										</td>
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
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
									<table border="0" cellpadding="0" cellspacing="0" width="75%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center">


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">‰Ÿ«„ <span lang="ar-kw">ÕÃ“ «·„Ê«⁄Ìœ</span>
						<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font></p>
			<%session("ErrMsg")=""%>

											<p>
											
					<form action="visit_appointments_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						

											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl" width="100%">
								<thead>
									<td width="25%" dir="rtl" align="left">
																		«·«”„ 
																		«·À·«ÀÌ</td>
									<td width="73%" dir="rtl">
									<input type="text" name="Full_name" size="20"></td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="25%" dir="rtl" align="left">
									—ﬁ„ «·„Ê»«Ì·</td>
									
									<td class="tdView" width="73%" dir="rtl">
									
									<p align="right">
									<input type="text" name="mobile" size="20"><%=std_Name%>
																		
									</td>
									
									
								</tr>
								<tr>
									<td align="left">”»» «·“Ì«—…</td>
									<td>
									<input type="text" name="visit_reason" size="63"></td>
								</tr>
								<tr>
									<td align="left">«· «—ÌŒ</td>
									<td>
														
								<input  id="date1" type="text" name="Visit_Date" class="textBox"></td>
								</tr>
								<tr>
									<td align="left">«·”«⁄…</td>
									<td>
														
								<select size="1" name="Visit_Time" class="select">
																				
								<option>Ì—ÃÏ «Œ »«— «·”«⁄…</option>
									<option>8:00</option>
								<option>8:30</option>
								<option>9:00</option>
								<option>9:30</option>
								<option>10:00</option>
								<option>10:30</option>
								<option>11:00</option>
								<option>11:30</option>
								<option>12:00</option>
									</select></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<input type="submit" value="«—”«·" name="B2"></tr>
								</table>
						</form>
						
						</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
					<p>
											<br>
											<br>
&nbsp;
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