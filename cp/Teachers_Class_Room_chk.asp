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

procType= Upload.Form("txtProcType")
if procType="add" then
	set Rs=server.createobject("ADODB.Recordset")
		Rs.open "select * from Teachers_Class_Room where Employee_ID ="&Upload.Form("txtEmployee_ID")&" and Class_room_id ="&Upload.Form("txtClass_room_id")&" and subject_id ="&Upload.Form("txtsubject_id")&" " , Conn,1,2
	if rs.eof then
		rs.addnew	
		rs("Department_ID")=Upload.Form("txtDepartment_id")
		rs("Employee_ID")=Upload.Form("txtEmployee_ID")
		rs("Class_room_id")=Upload.Form("txtClass_room_id")
		rs("subject_id")=Upload.Form("txtsubject_id")

		rs.update	
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	Else
			session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ãä ÞÈá"
	End if
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Teachers_Class_Room_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="edit" then
	ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	Rs.open "select * from Teachers_Class_Room where ID="&ID&" " , Conn,1,2
	if not Rs.eof then
			Rss.open "select * from Teachers_Class_Room where Employee_ID ="&Upload.Form("txtEmployee_ID")&" and Class_room_id ="&Upload.Form("txtClass_room_id")&" and subject_id ="&Upload.Form("txtsubject_id")&" " , Conn,1,2
		if rss.eof then
			rs.update	
			'rs("Department_ID")=Upload.Form("txtDepartment_id")
			rs("Employee_ID")=Upload.Form("txtEmployee_ID")
			rs("Class_room_id")=Upload.Form("txtClass_room_id")
			rs("subject_id")=Upload.Form("txtsubject_id")
	
			rs.update	
			session("ErrMsg")="Êã ÇáÊÚÏÈá ÈäÌÇÍ"
		Else
				session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ãä ÞÈá"
		End if
	end if	
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Teachers_Class_Room_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="delete" then	
	ID= Upload.Form("txtID")
	
	conn.execute "delete  from Teachers_Class_Room where ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Teachers_Class_Room_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 

end if
%>