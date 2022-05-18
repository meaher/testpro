<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<!-- #include file="portal_upload.asp" -->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Form Reader & Image setup
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Response.Expires = -1
Server.ScriptTimeout = 600

Dim Upload, fileName, fileSize, ks, i, fileKey
Set Upload = New FreeASPUpload
uploadsDirVar = server.mappath("/Excused_absence_file")
Upload.Save(uploadsDirVar)

ks = Upload.UploadedFiles.keys
dim ArrImg(3)
i=0

if (UBound(ks) <> -1) then
	for each fileKey in Upload.UploadedFiles.keys
	    ArrImg(i) = Upload.UploadedFiles(fileKey).FileName
	    i=i+1
	next
end if
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

procType= Upload.Form("txtProcType")
if procType="add" then
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Excused_absence" , Conn,1,2

	rs.addnew	
	rs("std_civil_id")=Upload.Form("std_civil_id")
	rs("class_room_id")=Upload.Form("class_room_id")
	
	rs("Excused_type")=Upload.Form("Excused_type")
	rs("Excused_date")=Upload.Form("Excused_date")
	
	rs("Excused_day")=Day(Upload.Form("Excused_Date"))
	rs("Excused_month")=month(Upload.Form("Excused_Date"))
	rs("Excused_year")=year(Upload.Form("Excused_Date"))
	
	rs("Excused_file")=ArrImg(0)
	
	rs("Reg_date")=session("MyDate")
	rs("Reg_Day")=Day(session("MyDate"))
	rs("Reg_month")=Month(session("MyDate"))
	rs("Reg_year")=year(session("MyDate"))
	
	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Excused_absence_list.asp?start=1" 
	
elseif procType="edit" then
	Excused_ID= Upload.Form("excused_id")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Excused_absence where Excused_ID="&Excused_ID&" " , Conn,1,2

	rs("std_civil_id")=Upload.Form("std_civil_id")
	
	rs("Excused_type")=Upload.Form("Excused_type")
	rs("Excused_date")=Upload.Form("Excused_date")
	
	rs("Excused_day")=Day(Upload.Form("Excused_Date"))
	rs("Excused_month")=month(Upload.Form("Excused_Date"))
	rs("Excused_year")=year(Upload.Form("Excused_Date"))
	
	
	rs("Reg_date")=session("MyDate")
	rs("Reg_Day")=Day(session("MyDate"))
	rs("Reg_month")=Month(session("MyDate"))
	rs("Reg_year")=year(session("MyDate"))
	
	if ArrImg(0)="" then 
		rs("Excused_file")=Upload.Form("txtHdnImg")
	else
		rs("Excused_file")=ArrImg(0)
	end if
	
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Excused_absence_list.asp?start=1"
	
elseif procType="delete" then	
	excused_id= Upload.Form("excused_id")
	
	conn.execute "delete  from excused_absence where excused_ID="&excused_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Excused_absence_list.asp?start=1"	

end if
%>