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
		set RsChk=server.createobject("ADODB.Recordset")
		RsChk.open "select * from Std_affairs where std_civil_id = '"&Upload.Form("std_civil_ID")&"'" , Conn,1,2
		if RsChk.eof then
			Rs.open "select * from std_affairs" , Conn,1,2
			rs.addnew	
	
			rs("Std_Civil_ID") = Upload.Form("Std_Civil_ID") 
			rs("std_reg_Form") = Upload.Form("std_reg_Form")
			rs("Last_certificate") = Upload.Form("Last_certificate")
			rs("Nationality_pic") = Upload.Form("Nationality_pic")
			rs("ID_pic") = Upload.Form("ID_pic")
			rs("Fee_receipt") = Upload.Form("Fee_receipt")
			rs("passport_pic") = Upload.Form("passport_pic")
			rs("Birth_certificate") = Upload.Form("Birth_certificate")
			rs("school_syllabus") = Upload.Form("school_syllabus")
			rs("personal_pic") = Upload.Form("personal_pic")
			rs("leave_study") = Upload.Form("leave_study")
			rs("Re_enrollment_form") = Upload.Form("Re_enrollment_form")
			rs("mother_nationality") = Upload.Form("mother_nationality")
			
		rs.update
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
		rs.close
		set rs=nothing	
	Else
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÇáäæÇÞÕ ãä ÞÈá ááÊÚÏíá Çæ ÇáÇÖÇÝÉ ãä ÎáÇá ÇáÊÚÏíá"
	End if
RsChk.close
set rsChk=nothing	

	conn.close
	set conn=nothing
	response.redirect "std_affairs_Admin_list.asp?start=1&Class_Room_ID="&Upload.Form("Class_Room_ID")&"&Class_Room="&Upload.Form("Class_Room")&"" 
	
elseif procType="edit" then
	std_civil_ID= Upload.Form("std_civil_id")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from std_affairs where std_civil_id ='"&Std_civil_ID&"' " , Conn,1,2
	
			'rs("Std_Civil_ID") = Upload.Form("Std_Civil_ID") 
			rs("std_reg_Form") = Upload.Form("std_reg_Form")
			rs("Last_certificate") = Upload.Form("Last_certificate")
			rs("Nationality_pic") = Upload.Form("Nationality_pic")
			rs("ID_pic") = Upload.Form("ID_pic")
			rs("Fee_receipt") = Upload.Form("Fee_receipt")
			rs("passport_pic") = Upload.Form("passport_pic")
			rs("Birth_certificate") = Upload.Form("Birth_certificate")
			rs("school_syllabus") = Upload.Form("school_syllabus")
			rs("personal_pic") = Upload.Form("personal_pic")
			rs("leave_study") = Upload.Form("leave_study")
			rs("Re_enrollment_form") = Upload.Form("Re_enrollment_form")
			rs("mother_nationality") = Upload.Form("mother_nationality")
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "std_affairs_Admin_list.asp?start=1&Class_Room_ID="&Upload.Form("Class_Room_ID")&"&Class_Room="&Upload.Form("Class_Room")&"" 
	
elseif procType="delete" then	
	std_civil_ID= Upload.Form("std_civil_id")
	
	conn.execute "delete  from std_affairs where std_civil_ID='"&std_civil_ID&"' "
	session("ErrMsg")="Êã ÇáÍÐÝ ÈäÌÇÍ"
	conn.close
	set conn=nothing
	response.redirect "std_affairs_Admin_list.asp?start=1&Class_Room_ID="&Upload.Form("Class_Room_ID")&"&Class_Room="&Upload.Form("Class_Room")&"" 

end if
%>