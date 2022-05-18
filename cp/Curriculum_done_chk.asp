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
	Rs.open "select * from curriculum_done" , Conn,1,2

	rs.addnew	
	rs("Department_ID")=Upload.Form("txthdnDptID")
	rs("Employee_ID")=Upload.Form("txtEmployee_ID")
	
	'rs("Curriculum_id")=Upload.Form("")
	rs("Curriculum_Date")=Upload.Form("txtCurriculum_Date")
	
	rs("Curriculum_Day") = Day(Upload.Form("txtCurriculum_Date"))
	rs("Curriculum_Month") = Month(Upload.Form("txtCurriculum_Date"))
	rs("Curriculum_Year") = Year(Upload.Form("txtCurriculum_Date"))

	
	rs("Educational_level")=Upload.Form("txtEducational_level")
	rs("subject")=Upload.Form("txtsubject")

	rs("done")=Upload.Form("CDone")

	rs("Status")=Upload.Form("txtStatus")

	rs("notes")=Upload.Form("txtnotes")

	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "curriculum_done_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1" 
	
elseif procType="edit" then
	ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from curriculum_done where ID="&ID&" " , Conn,1,2

	'rs("Department_ID")=Upload.Form("txthdnDptID")
	rs("Employee_ID")=Upload.Form("txtEmployee_ID")
	
	'rs("Curriculum_id")=Upload.Form("")
	rs("Curriculum_Date")=Upload.Form("txtCurriculum_Date")

	rs("Curriculum_Day") = Day(Upload.Form("txtCurriculum_Date"))
	rs("Curriculum_Month") = Month(Upload.Form("txtCurriculum_Date"))
	rs("Curriculum_Year") = Year(Upload.Form("txtCurriculum_Date"))

	
	rs("Educational_level")=Upload.Form("txtEducational_level")
	rs("subject")=Upload.Form("txtsubject")

	rs("done")=Upload.Form("CDone")

	rs("Status")=Upload.Form("txtStatus")

	rs("notes")=Upload.Form("txtnotes")
	
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "curriculum_done_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"
	
elseif procType="delete" then	
	ID= Upload.Form("txtID")
	
	conn.execute "delete  from curriculum_done where ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "curriculum_done_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"	

end if
%>