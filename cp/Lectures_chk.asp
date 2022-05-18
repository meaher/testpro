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
	Rs.open "select * from Lectures" , Conn,1,2

	rs.addnew	
	rs("Department_ID")=Upload.Form("txtDepartment_id")
	rs("Employee_ID")=Upload.Form("txtEmployee_ID")
	
	rs("Class_room_id")=Upload.Form("txtClass_room_id")
	rs("Lecture_Time_id")=Upload.Form("txtLecture_Time_id")
	rs("Lecture_Date") =Upload.Form("txtLecture_Date")
	
	rs("Lecture_Day") = Day(Upload.Form("txtLecture_Date"))
	rs("Lecture_Month") = Month(Upload.Form("txtLecture_Date"))
	rs("Lecture_Year") = Year(Upload.Form("txtLecture_Date"))

	
	'rs("Educational_level")=Upload.Form("txtEducational_level")
	rs("subject_id")=Upload.Form("txtsubject_id")

	'rs("done")=Upload.Form("CDone")

	'rs("Status")=Upload.Form("txtStatus")

	'rs("notes")=Upload.Form("txtnotes")

	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Lectures_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="edit" then
	ID = Upload.Form("txtLecture_id")

	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	Rs.open "select * from Lectures where Lecture_ID = "&ID&" " , Conn,1,2
		if not rs.eof then
				Rss.open "select * from Lectures where Lecture_ID = "&ID&" and Department_id="& Upload.Form("txtDepartment_id")&" and Subject_ID="&Upload.Form("txtSubject_id")&" and Employee_ID="&Upload.Form("txtEmployee_ID")&" and Class_room_ID="&Upload.Form("txtClass_room_ID")&" and Lecture_Time_id="&Upload.Form("txtLecture_time_ID")&" and Lecture_Day="&Day(Upload.Form("txtLecture_Date"))&" and Lecture_Month="&Month(Upload.Form("txtLecture_Date"))&" and Lecture_year="&year(Upload.Form("txtLecture_Date"))&"" , Conn,1,2
				if rss.eof then
					rs("Employee_ID")=Upload.Form("txtEmployee_ID")
					rs("Class_room_id")=Upload.Form("txtClass_room_id")
					rs("Lecture_Time_id")=Upload.Form("txtLecture_Time_id")
					rs("Lecture_Date") =Upload.Form("txtLecture_Date")
					rs("subject_id")=Upload.Form("txtsubject_id")
					rs("Lecture_Day") = Day(Upload.Form("txtLecture_Date"))
					rs("Lecture_Month") = Month(Upload.Form("txtLecture_Date"))
					rs("Lecture_Year") = Year(Upload.Form("txtLecture_Date"))
			
					rs.update
			
					session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
				Else
					session("ErrMsg")="áÇ íãßä ÊßÑÇÑ ÇáÈíÇäÇÊ"
				End if
		End if
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Lectures_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="delete" then	
	ID= Upload.Form("txtLecture_ID")
	
	conn.execute "delete  from Lectures where Lecture_ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Lectures_list.asp?id="&Upload.Form("txtDepartment_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 

end if
%>