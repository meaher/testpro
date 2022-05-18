<!--#include file = "header.asp"-->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1256" />

<title>استماع</title>

<link rel="stylesheet" href="stylesheet.css" >

</head>



<body style="padding:5px; background-color:#000000">

<div align="center">



<h2><font color="#FFFFFF"></font></h2>

<FONT color="#FFFF00" face="tahoma" size="2">

<br />

  للاستماع للمحاضرة:</font> <br>

  <br>
<%
Section	= request.querystring("Section")
SName 	= request.querystring("SName")
%>

					<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" id="RealAudio1" width="300" height="300">
						<param name="AUTOSTART" value="0">
						<param name="src" value="Sections_Toturiels/<%=Section%>/<%=SName%>">
						<param name="SHUFFLE" value="0">
						<param name="PREFETCH" value="0">
						<param name="NOLABELS" value="0">
						<param name="LOOP" value="0">
						<param name="NUMLOOP" value="0">
						<param name="CENTER" value="0">
						<param name="MAINTAINASPECT" value="0">
						<param name="BACKGROUNDCOLOR" value="#000000">
							<embed  type="video/x-pn-realaudio-plugin"   SRC="Sections_Toturiels<%=Section%>/<%=SName%>>" height="60" width="320" nojava="true" name="25384" controls="ControlPanel,StatusBar" CONSOLE="25384" center="true" pluginspage="http://www.real.com/" AUTOSTART="true"></embed> 
					</object>
<!-- END GENERIC ALL BROWSER FRIENDLY HTML FOR WINDOWS MEDIA PLAYER --><br> 

  <a target=_blank href="http://www.download.com/RealPlayer/3000-2646_4-10073040.html?tag=lst-1&cdlPid=10782379">
<font size="1" color="#FFFF00">
تحميل برنامج الريل بلاير</font></a></p>

<font color="#99FF00" size="1">للحفظ اضغط على الرابط بيمين الفأرة واختر حفظ 
الهدف باسم أو <br>
Save target as </font>&nbsp;<hr />

<a href="Sections_Toturiels/<%=Section%>/<%=SName%>"><font color="#99FF00">
لحفظ المحاضرة</font></a>


</div>
