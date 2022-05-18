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
	txtLecture_date=upload.form("txtLecture_date")
	
	if upload.form("txtSubject_id")<>"" then
		set Rssub=conn.execute("Select * from Subjects where Subject_id="&upload.form("txtSubject_ID")&"")
		Subject_name=Rssub("Subject_name")
		Rssub.close
	End if
	if upload.form("txtEmployee_id")<>"" then
		set Rssub=conn.execute("Select * from Employees where Employee_id="&upload.form("txtEmployee_ID")&"")
		Department_id=Rssub("Department_id")
		Rssub.close
	End if
	
	Rs.open "select * from Students_absence" , Conn,1,2
	
	for ii = 1 to Upload.Form("txtStdCount")
		if Upload.Form("txtStd_Civil_id"&ii) <> "" then
				Rss.open "select * from Students_absence where std_civil_id='"&Upload.Form("txtStd_Civil_id"&ii)&"' and Absence_Day="&Day(txtLecture_date)&" and Absence_month="&month(txtLecture_date)&" and Absence_year="&year(txtLecture_date)&" and Lecture_Time_ID="&Upload.Form("txtLecture_Time_ID")&" " , Conn,1,2
				if rss.eof then
					rs.addnew	
					rs("Absence_Date")= txtLecture_date
					rs("Absence_Day") = Day(txtLecture_date)
					rs("Absence_Month") = Month(txtLecture_date)
					rs("Absence_Year") = Year(txtLecture_date)
					rs("Lecture_Time_ID")=Upload.Form("txtLecture_Time_ID")
					rs("Class_room_id")=Upload.Form("txtClass_room_id")
					rs("Subject_id") = Upload.Form("txtSubject_id")
					rs("Subject_name") = Subject_name
					
					rs("Employee_ID")=Upload.Form("txtEmployee_ID")
					rs("Department_ID")= Department_id
					rs("Std_Civil_id")=Upload.Form("txtStd_Civil_id"&ii)
					rs("Managment")="yes"
					rs.update
					session("ErrMsg")=" „  «·«÷«ﬁ… »‰Ã«Õ"					
				End if
			rss.close
		end if
	next
	if upload.form("TxtStd_Civil_id") = "xxxx" then
			rs.addnew
					rs("Absence_Date")= txtLecture_date
					rs("Absence_Day") = Day(txtLecture_date)
					rs("Absence_Month") = Month(txtLecture_date)
					rs("Absence_Year") = Year(txtLecture_date)
					rs("Lecture_Time_ID")=Upload.Form("txtLecture_Time_ID")
					rs("Class_room_id")=Upload.Form("txtClass_room_id")
					rs("Subject_id") = Upload.Form("txtSubject_id")
					rs("Subject_name") = Subject_name
					
					rs("Employee_ID")=Upload.Form("txtEmployee_ID")
					rs("Department_ID")= Department_id
					rs("Std_Civil_id")="xxxx"
					rs("Managment")="yes"
			rs.update
			session("ErrMsg")=" „ «—”«· «·€Ì«» »‰Ã«Õ"					
	End if	
	rs.close
	
	Rs.open "select * from Class_room where Class_room_id="&Upload.Form("txtClass_room_id")&"" , Conn,1,2
	if not rs.eof then
		Class_room = rs("Class_room")
	end if
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	
	
	
	response.redirect "Students_absence_Admin_list.asp?Class_Room_id="&Upload.Form("txtClass_room_id")&"&subject_id="&Upload.Form("txtSubject_id")&"&subject_Name="&Upload.Form("txtSubject_name")&"&Class_room="&Class_room&"&start=1"	
	
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
	response.redirect "Students_absence_Admin_list.asp?Class_Room_id="&Request.queryString("Class_Room_ID")&"&Class_room="&Request.queryString("Class_room")&"&start=1"	

end if
%>