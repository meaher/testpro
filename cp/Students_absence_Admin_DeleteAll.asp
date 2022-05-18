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
uploadsDirVar = server.mappath("/Meets")
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
	
if Request.QueryString("Std_id") <> "" then	
	ID = Request.querystring("std_ID")
	
		conn.execute "delete  from Students_absence where std_civil_ID='"&ID&"' and Absence_Day ="&Day(Request.QueryString("Absence_date"))&" and Absence_Month ="&Month(Request.QueryString("Absence_date"))&" and Absence_Year ="&Year(Request.QueryString("Absence_date"))&" "
	session("ErrMsg")="Êã ÊÍÖíÑ ÇáØÇáÈ "
	conn.close
	set conn=nothing

	response.redirect "Students_absence_Admin_list.asp?std_civil_ID="&ID&"&Class_Room_id="&Request.queryString("Class_Room_ID")&"&Class_room="&Request.queryString("Class_room")&"&start=1"	

end if
%>