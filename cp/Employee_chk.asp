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
	Rss.open "select * from Employees where civil_id='"& Upload.Form("txtCivil_ID") &"' " , Conn,1,2
	if Rss.eof then	
		Rs.open "select * from Employees" , Conn,1,2
		rs.addnew	
			rs("Employee_Name") = Upload.Form("txtEmployeeName")
			rs("Position") = Upload.Form("txtPosition")
			rs("File_number") = Upload.Form("txtFilenumber")
			rs("Employee_Mobile")=Upload.Form("txtEmployeeMobile")
			rs("Employee_Email")=Upload.Form("txtEmployeeEmail")
			rs("Department_ID")=session("Department_ID")
			rs("Civil_ID")=Upload.Form("txtCivil_ID")
			rs("subject")=Upload.Form("txtsubject")
			rs("Date_Start")=Upload.Form("txtDate_Start")
			rs("Certificate_description")=Upload.Form("txtCertificate_description")
			rs("Certificate_Type")=Upload.Form("txtCertificate_Type")
			rs("Certificate_Date")=Upload.Form("txtCertificate_Date")
			rs("Hiring_Date")=Upload.Form("txtHiring_Date")
			rs("Teacher_Hiring_Date")=Upload.Form("txtTeacher_Hiring_Date")
			rs("Nationality")=Upload.Form("txtNationality")
			rs("Housing_Area")=Upload.Form("txtHousing_Area")
			rs("Employee_MOBILE2")=Upload.Form("txtEmployee_MOBILE2")
			rs("Career_Level")=Upload.Form("txtCareer_Level")
		
		rs.update
	
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
		rs.close
	Else
			session("ErrMsg")="åÐÇ ÇáãæÙÝ ãÖÇÝ ãä ÞÈá"
	End if
	rss.close
	set rss=nothing
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "portal_main.asp" 
	
elseif procType="edit" then
	Employee_ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Employees where Employee_ID="&Employee_ID&" " , Conn,1,2

	'rs("PC_ID")=Upload.Form("ddlCTGR")
		rs("Employee_Name") = Upload.Form("txtEmployeeName")
		rs("Position") = Upload.Form("txtPosition")
		rs("File_number") = Upload.Form("txtFilenumber")
		rs("Employee_Mobile")=Upload.Form("txtEmployeeMobile")
		rs("Employee_Email")=Upload.Form("txtEmployeeEmail")
		DeptID=rs("Department_ID")
		rs("Civil_ID")=Upload.Form("txtCivil_ID")
		rs("subject")=Upload.Form("txtsubject")
		rs("Date_Start")=Upload.Form("txtDate_Start")
		rs("Certificate_description")=Upload.Form("txtCertificate_description")
		rs("Certificate_Type")=Upload.Form("txtCertificate_Type")
		rs("Certificate_Date")=Upload.Form("txtCertificate_Date")
		rs("Hiring_Date")=Upload.Form("txtHiring_Date")
		rs("Teacher_Hiring_Date")=Upload.Form("txtTeacher_Hiring_Date")
		rs("Nationality")=Upload.Form("txtNationality")
		rs("Housing_Area")=Upload.Form("txtHousing_Area")
		rs("Employee_MOBILE2")=Upload.Form("txtEmployee_MOBILE2")
		rs("Career_Level")=Upload.Form("txtCareer_Level")
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Employee_List.asp?start=1&ID="&DeptID&"&DeptName="&Upload.Form("txthdnDptName")&""
	
elseif procType="delete" then	
	Employee_ID= Upload.Form("txtID")
	DeptID= Upload.Form("txthdnDptID")
	
	conn.execute "delete  from Employees where Employee_ID="&Employee_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ ÈäÌÇÍ"
	conn.close
	set conn=nothing
	response.redirect "Employee_List.asp?start=1&ID="&DeptID&"&DeptName="&Upload.Form("txthdnDptName")&""

end if
%>