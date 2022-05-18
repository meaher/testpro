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
uploadsDirVar = server.mappath("/files")
Upload.Save(uploadsDirVar)

ks = Upload.UploadedFiles.keys
dim ArrImg(1)
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
	Rs.open "select * from Employees " , Conn,1,2

	rs.addnew	
	rs("ADMIN_USER")=Upload.Form("txtAdminUser")
	rs("ADMIN_PWD")=Upload.Form("txtAdminPwd")
	'rs("ADMIN_LEVEL")=Upload.Form("ddlAdminLevel")
	rs.update
	
	session("ErrMsg")="Successfully Add"
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	response.redirect "admin_list.asp?start=1" 
	
elseif procType="edit" then
	Lecture_Time_ID= Upload.Form("txtLecture_Time_ID")

	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	Rs.open "select * from Lectures_Time where Lecture_Time_ID="&Lecture_Time_ID&" " , Conn,1,2
		rs("Lecture_Time_name")=Upload.Form("txtLecture_Time_name")
		rs("Lecture_Time")=Upload.Form("txtLecture_Time")
		rs("Lecture_Start")=Upload.Form("txtLecture_Start")
		rs("Lecture_End")=Upload.Form("txtLecture_End")
		rs("Lecture_Close")=Upload.Form("txtLecture_Close")
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Lectures_time_List.asp?start=1"
	
elseif procType="delete" then	
	Admin_ID= Upload.Form("txtAdminID")

	set Rs=server.createobject("ADODB.Recordset")
	conn.execute "delete  from ADMIN where Admin_ID="&Admin_ID&" "
	session("ErrMsg")="Successfully Delete"
	conn.close
	set conn=nothing
	response.redirect "admin_list.asp?start=1"	

end if
%>