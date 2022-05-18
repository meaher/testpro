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
	set Rss=server.createobject("ADODB.Recordset")
	
	Rs.open "select * from Students_absence" , Conn,1,2
	
	for ii = 1 to 32 
		if Upload.Form("txtStd_Civil_id"&ii) <> "" then
				Rss.open "select * from Students_absence where std_civil_id='"&Upload.Form("txtStd_Civil_id"&ii)&"' and Absence_Day="&Day(DateAdd("h",11,now()))&" and Absence_month="&month(DateAdd("h",11,now()))&" and Absence_year="&year(DateAdd("h",11,now()))&" and Lecture_Time_ID="&Upload.Form("txtLecture_Time_ID")&" " , Conn,1,2
				if rss.eof then
					rs.addnew	
					rs("Absence_Date")=DateAdd("h",11,now())
					rs("Absence_Day") = Day(DateAdd("h",11,now()))
					rs("Absence_Month") = Month(DateAdd("h",11,now()))
					rs("Absence_Year") = Year(DateAdd("h",11,now()))
					rs("Lecture_Time_ID")=Upload.Form("txtLecture_Time_ID")
					rs("Class_room_id")=Upload.Form("txtClass_room_id")
					rs("Subject_id") = Upload.Form("txtSubject_id")
					rs("Subject_name") = Upload.Form("txtSubject_name")
					
					rs("Employee_ID")=Upload.Form("txtEmployee_ID")
					rs("Department_ID")=Upload.Form("Department_ID")
					rs("Std_Civil_id")=Upload.Form("txtStd_Civil_id"&ii)
					rs.update
					session("ErrMsg")=" „  «·«÷«ﬁ… »‰Ã«Õ"					
				End if
			rss.close
		end if
	next
	

	rs.close
	
	Rs.open "select * from Class_room where Class_room_id="&Upload.Form("txtClass_room_id")&"" , Conn,1,2
	if not rs.eof then
		Class_room = rs("Class_room")
	end if
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	
	
	
	response.redirect "teacher_Class_room_absence_list.asp?Class_id="&Upload.Form("txtClass_room_id")&"&subject_id="&Upload.Form("txtSubject_id")&"&subject_Name="&Upload.Form("txtSubject_name")&"&Class_room="&Class_room&"&start=1"	
	
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
	
	session("ErrMsg")=" „ «· ⁄œÌ· »‰Ã«Õ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "curriculum_done_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"
	
elseif Request.querystring("ID") <> "" then	
	ID = Request.querystring("ID")
	
	conn.execute "delete  from Students_absence where absence_ID="&ID&" "
	session("ErrMsg")=" „  Õ÷Ì— «·ÿ«·» "
	conn.close
	set conn=nothing
	response.redirect "Students_absence_Admin.asp?Class_id="&Request.queryString("Class_ID")&"&subject_id="&Request.queryString("subject_ID")&"&subject_Name="&Request.queryString("Subject_name")&"&Class_room="&Request.queryString("Class_room")&"&start=1"	

end if
%>