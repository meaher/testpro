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
	Delay_date=upload.form("Delay_date")
	
	Rs.open "select * from Students_Delay" , Conn,1,2
	
	for ii = 1 to Upload.Form("txtStdCount")
		if Upload.Form("txtStd_Civil_id"&ii) <> "" then
				Rss.open "select * from Students_Delay where std_civil_id='"&Upload.Form("txtStd_Civil_id"&ii)&"' and Delay_Day="&Day(Delay_date)&" and Delay_month="&month(Delay_date)&" and Delay_year="&year(Delay_date)&" and Delay_Time_ID="&Upload.Form("Delay_Time_ID")&" " , Conn,1,2
				if rss.eof then
					rs.addnew	
					rs("Delay_Date")= Delay_date
					rs("Delay_Day") = Day(Delay_date)
					rs("Delay_Month") = Month(Delay_date)
					rs("Delay_Year") = Year(Delay_date)
					rs("Delay_Time_ID")=Upload.Form("Delay_Time_ID")
					rs("Class_room_id")=Upload.Form("txtClass_room_id")
					
					rs("Std_Civil_id")=Upload.Form("txtStd_Civil_id"&ii)
					rs("Supervisor_Name")=session("admin_name")
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
	
	
	
	response.redirect "Students_Delay_Admin_list.asp?Class_Room_id="&Upload.Form("txtClass_room_id")&"&Class_room="&Class_room&"&start=1"	
	
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
	conn.execute "delete from Students_Delay where Delay_ID="&ID&" "
	session("ErrMsg")=" „ Õ–› «· √ŒÌ— «·ÿ«·» "
	conn.close
	set conn=nothing
	response.redirect "Students_Delay_Admin_list.asp?Class_Room_id="&Request.queryString("Class_Room_id")&"&Class_room="&Request.queryString("Class_room")&"&start=1"	

end if
%>