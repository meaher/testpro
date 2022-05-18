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
	Rs.open "select * from ADMIN " , Conn,1,2

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
	Admin_ID= Upload.Form("txtAdminID")

	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	Rs.open "select * from ADMIN where Admin_ID="&Admin_ID&" " , Conn,1,2

	if rs("ADMIN_USER")=Upload.Form("txtAdminUser") then
		rs("ADMIN_PWD")=Upload.Form("txtAdminPwd")
		'rs("ADMIN_LEVEL")=Upload.Form("ddlAdminLevel")
		rs("FullName")=Upload.Form("txtFullName")
		rs("Position")=Upload.Form("txtPosition")
		'rs("Note")=Upload.Form("txtNote")	
	Else
		Rss.open "select * from ADMIN where Admin_User='"& Upload.Form("txtAdminUser") &"' " , Conn,1,2
		if not rss.eof then
			session("ErrMsg")=" ÇÓã ÇáÏÎæá ãÓÊÎÏã ãä ÞÈá"
			response.redirect "portal_main.asp?start=1"
		Else
			rs("ADMIN_USER")=Upload.Form("txtAdminUser") 
			rs("ADMIN_PWD")=Upload.Form("txtAdminPwd")
			'rs("ADMIN_LEVEL")=Upload.Form("ddlAdminLevel")
			rs("FullName")=Upload.Form("txtFullName")
			rs("Position")=Upload.Form("txtPosition")
		End if
		rss.close
	End if
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "portal_main.asp?start=1"
	
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