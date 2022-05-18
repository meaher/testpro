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
	set Rss=server.createobject("ADODB.Recordset")
	Rss.open "select * from Departments where Department_Name='"&Upload.Form("txtDepartName") &"' " , Conn,1,2
	set RsAdmin=server.createobject("ADODB.Recordset")
	if rss.eof then
		Rs.open "select * from Departments" , Conn,1,2
		rs.addnew	
		rs("Department_Name")=Upload.Form("txtDepartName")
		rs.update
		Rs.close
		Rs.open "select * from Departments where Department_name='"&Upload.Form("txtDepartName")&"'" , Conn,1,2
		RsAdmin.open "select * from Admin", Conn,1,2
		RsAdmin.addnew
			RsAdmin("FullName")=Upload.Form("txtFullName")
			RsAdmin("Department_ID")=rs("Department_ID")
			RsAdmin("Admin_user")=Upload.Form("txtAdminuser")
			RsAdmin("Admin_Pwd")=Upload.Form("txtAdminPWD")
			rsAdmin("ADMIN_LEVEL")=Upload.Form("SelectAdminLEVEL")
		RsAdmin.update
		RsAdmin.close
		set RsAdmin=nothing
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ"
		rs.close
		set rs=nothing
	Else
		session("ErrMsg")="ÇáÞÓã ãÖÇÝ ãä ÞÈá"
	End if
		rss.close
		set rss=nothing
	conn.close
	set conn=nothing
	response.redirect "Depart_list.asp?start=1" 
	
elseif procType="edit" then
	Depart_ID= Upload.Form("txtDepartID")

	set Rss=server.createobject("ADODB.Recordset")
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Departments where Department_ID="&Depart_ID&" " , Conn,1,2
	
	DeparN = Upload.Form("txtDepartName")
	
		Rss.open "select * from Departments where Department_Name = '"& DeparN &"' " , Conn,1,2
		if not rss.eof then
			session("ErrMsg")=" ÇÓã ÇáÞÓã ãÓÊÎÏã ãä ÞÈá"
			response.redirect "Depart_List.asp?start=1"
		Else
			rs("Department_Name")=Upload.Form("txtDepartName")
			rs.update
			session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
		End if
		rs.close
		rss.close
	set rss=nothing	
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Depart_list.asp?start=1"
	
elseif procType="Delete" then	
	Depart_ID= Upload.Form("txtDepartID")
	set Rss=server.createobject("ADODB.Recordset")
	set Rs=server.createobject("ADODB.Recordset")

	Rss.open "select * from Employees where Department_ID = "& Depart_ID &" " , Conn,1,2
	if not rss.eof then
		session("ErrMsg")=" áÇ íãßä ÍÐÝ ÇáÞÓã áÇÍÊæÇÆå Úáì ãæÙÝíä"
		response.redirect "Depart_List.asp?start=1"
		Rss.close
		set Rss=nothing
	Else
		conn.execute "delete  from Departments where Department_ID="&Depart_ID&" "
		conn.execute "delete  from Admin where Department_ID="&Depart_ID&" "
		
		session("ErrMsg")="Êã ÇáÍÐÝ ÈäÌÇÍ"
	End if
	conn.close
	set conn=nothing
	response.redirect "Depart_list.asp?start=1"	

end if
%>