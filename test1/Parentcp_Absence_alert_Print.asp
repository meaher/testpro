<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="../cp/styles/style.css">
			<script>
	window.print()
	</script>

</head>
<body style="background-color: #FFFFFF">
<div align="right">
<table border="0" width="90%">
						<tr>
							<td width="349">
							<p align="center">
							<b>
							<img border="0" src="../cp/images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="469" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">���� ������ ������ �������� ������
</font></b>
							<p align="center"><b><font face="Impact" size="4">���� ������ 
							������<br><br>
							<%
							if request.querystring("SClass") = "" then
								Sclass=0
							Else
								sclass=request.querystring("SClass")
							End if
							
							if  sclass <> "0" then
								
								set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&cint(Sclass)&"")
								if not rss.eof then
									response.write rss("Class_Room")
								end if
								Rss.close
							End if
							
							
							%>
							<br>
							&nbsp;</font></b></td>
							<td align="right" valign="top" width="76">&nbsp;</td>
							<td align="right" valign="top" width="146">
							<p>&nbsp;<p><b>�������: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="349">
							<p align="center"><b><font size="3" face="Impact">����� 
							�������<br>
							����� ������ ���������<br>
							����� ��������� ���������</font></b></td>
							<td>
							&nbsp;</td>
							<td width="76">&nbsp;</td>
							<td width="146">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" width="932">
				<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="12%" dir="rtl">
																		����� 
									������</td>
									<td class="tdViewHead" width="25%" dir="rtl">
									��� ������</td>
									<td class="tdViewHead" width="18%" dir="rtl">
																		����</td>
									<td class="tdViewHead" width="14%" dir="rtl">
									�����</td>
									<td class="tdViewHead" width="23%" dir="rtl">
									��� ���� ������</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;
									<%
									std_civil_id=request.queryString("std_civil_id")
									std_name=request.queryString("std_name")
									class_room=request.queryString("Class_room")
									
									%>
									
									<%=std_Civil_id%></td>
									
									<td class="tdView" width="25%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									&nbsp;<%=class_room%></td>
								
									<td class="tdView" width="14%" dir="rtl">
									<%
									ii=0
										set Rss=conn.execute("Select Absence_Date from Students_absence where std_Civil_id='"&std_Civil_id&"' Group by Absence_Date")
										while not rss.eof
												ii=ii+1
											rss.movenext
										Wend
										Rss.close
										
									IF ii>4 and ii<10 then
										Response.write "����� ���"
									ElseIF ii>9 and ii<15 then
										Response.write "����� ����"
									ElseIf ii=15 then
										Response.write "����� ����"
									Elseif ii> 15 then
										Response.write "���"
									End if
									set rss=nothing
									%>					
									</td>
									
									
									<td class="tdView" width="23%" dir="rtl">
														
									<%
									
										response.write ii
									%>
									
									
																	<p>
														
																	</td>
									
									
								</tr>
									<td colspan="5">&nbsp;</td>
								</tr>
								</table>
							
						<%
						set Rss=conn.execute("Select * from std_affairs where std_Civil_id='"&std_Civil_id&"'")
							if not rss.eof then
						%>
								&nbsp;<p>&nbsp;������� �������� ���� ������<br>
								</p>
								<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="27%" dir="rtl">
																		������� 
																		��������</td>
									<td class="tdViewHead" width="71%" dir="rtl">
									������</td>
									</thead>
									<%
									'std_civil_id=request.queryString("std_civil_id")
									'std_name=request.queryString("std_name")
									'class_room=request.queryString("Class_room")
									
									%>
							<%
							if rss("std_reg_Form")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp;
								
									
									������� ����� ����</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� �������� 							
									</td>
									
									
								</tr>
							<%End if%>
							<%
							if rss("Last_certificate")="no" then
							%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									&nbsp; ��� ����� ���� �����</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������
																		
									</td>
									
									
								</tr>
							<%end if%>
							
							<%if rss("Nationality_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									���� �������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
										���� ����� ���� ������  ������� ��������
														
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("ID_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									���� ������� �������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Fee_receipt")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									����� ������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("passport_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									���� ������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%End if%>
							<%if rss("Birth_certificate")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									���� ����� �������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("school_syllabus")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									����� ����� ��������</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("personal_pic")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									��� 4 ��� �����</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("leave_study")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									������� ��� �����</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("Re_enrollment_form")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									������� ����� ���</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
							<%if rss("mother_nationality")="no" then%>
								<tr>
								
									<td class="tdView" width="27%" dir="rtl">
									����� ���� (������ ����� ���������)</td>
									
									<td class="tdView" width="71%" dir="rtl">
									
									<p align="right">
									���� ����� ���� ������  ������� ��������																		
																		
									</td>
									
									
								</tr>
							<%end if%>
									<td colspan="2">&nbsp;</td>
								</tr>
								</table>
								
						<%
						End if
						rss.close
						%>
								</td>
		</tr>
		</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>