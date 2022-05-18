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
uploadsDirVar = server.mappath("/PRODUCTS")
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
	set Rss=server.createobject("ADODB.Recordset")
	Rs.open "select * from Class_Room where Class_Room='"& Upload.Form("txtClass_Room") &"' " , Conn,1,2
	if Rs.eof then	
		rs.addnew	
			rs("Class_Room") = Upload.Form("txtClass_Room")
			rs("Class_Level") = Upload.Form("SClass_Level")
		rs.update
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
		
	Else
			session("ErrMsg")="ÇáÝÕá ãÖÇÝ ãä ÞÈá"
	End if
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Class_Room_list.asp" 
	
elseif procType="edit" then
	ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Class_Room where Class_Room_ID="&ID&" " , Conn,1,2
			rs("Class_Room") = Upload.Form("txtClass_Room")
			rs("Class_Level") = Upload.Form("SClass_Level")
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Class_Room_list.asp" 
	
elseif procType="delete" then	
	ID= Upload.Form("txtID")
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Students where Class_Room_ID = "&ID&" " , Conn,1,2
	if Rs.eof then
		conn.execute "delete  from Class_Room where Class_Room_ID ="&ID&" "
		session("ErrMsg")="Êã ÇáÍÐÝ ÈäÌÇÍ"
	Else
		session("ErrMsg")="íÌÈ ÍÐÝ ÇáØáÈÉ ãä ÇáÝÕá ÞÈá ÍÐÝ ÇáÝÕá"
	End if
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	response.redirect "Class_Room_list.asp" 

end if
%>