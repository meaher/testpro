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
	RsChk.open "select * from Work_Day where Work_Day="&Day(DateAdd("h",11,now()))&" and Work_Month="&Month(DateAdd("h",11,now()))&" and work_year="&Year(DateAdd("h",11,now()))&" and Employee_ID= "&Upload.Form("txtEmployee_ID")&"" , Conn,1,2
if RsChk.eof then
	Rs.open "select * from Work_Day" , Conn,1,2
	rs.addnew	
	'rs("PC_ID")=Upload.Form("ddlCTGR")
	

		rs("Work_Date") = Upload.Form("hdnwork_date") 
		rs("Work_Day") = Day(DateAdd("h",11,now()))
		rs("Work_Month") = Month(DateAdd("h",11,now()))
		rs("Work_Year") = Year(DateAdd("h",11,now()))
		rs("Employee_ID") = Upload.Form("txtEmployee_ID")
		set rsname=server.createobject("ADODB.Recordset")
		rsname.open "select Employee_Name from Employees where Employee_ID="&Upload.Form("txtEmployee_ID")&"",conn,1,2
			rs("Employee_Name") = rsname("Employee_Name")
		rsname.close
		'Request.Querystring("DeptName") = Upload.Form("txtDeptName")
		rs("Department_ID") = Upload.Form("txthdnDptID")
		if Upload.Form("cbleave_IN") <> "" then 
			rs("leave_IN")=-1
			rs("Time_IN") = Time() 
		else
			 rs("leave_IN")=0
		end if
		if Upload.Form("cbleave_out") <> "" then
			rs("leave_out")=-1
		 	rs("Time_Out")= Time()
		else 
			rs("leave_out")=0 
		end if
				
		if Upload.Form("cbMorning_Permission") <> "" then 
			rs("Morning_Permission")=-1 
			rs("Morning_Permission_Time")=Time()
		else 
			rs("Morning_Permission")=0 
		end if
		
		if Upload.Form("cbEvening_Permission") <> "" then 
			rs("Evening_Permission")=-1
			rs("Evening_Permission_Time")=Time()
		else 
			rs("Evening_Permission")=0 
		end if
		
	rs.update
	session("ErrMsg")=" „  «·«÷«ﬁ… »‰Ã«Õ"
	rs.close
	set rs=nothing	
Else
	session("ErrMsg")=" „  «·«÷«ﬁ… œÊ«„ «·„ÊŸ› „”»ﬁ«"
End if
RsChk.close
set rsChk=nothing	

	conn.close
	set conn=nothing
	response.redirect "Department_AddWork.asp?start=1&ID="&Upload.Form("txtHdnDptID")&"&DeptName="&Upload.Form("txthdnDptName")&"" 
	
elseif procType="edit" then
	Work_ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Work_Day where Work_ID="&Work_ID&" " , Conn,1,2

	'rs("PC_ID")=Upload.Form("ddlCTGR")
		'rs("Work_Date") = Upload.Form("txtWork_Date")
		'rs("Employee_Name") = Upload.Form("txtEmployee_Name")
		'Request.Querystring("DeptName") = Upload.Form("txtDeptName")
		'rs("Department_ID") = Upload.Form("txtHdnDptID")
		if Upload.Form("cbleave_IN") <> "" then rs("leave_IN")=-1 else rs("leave_IN")=0 end if
		if Upload.Form("cbleave_out") <> "" then rs("leave_out")=-1 else rs("leave_out")=0 end if
		
		
		rs("Time_IN") = Upload.Form("txtTime_in")
		rs("Time_Out")=Upload.Form("txtTime_out")
		if Upload.Form("cbMorning_Permission") <> "" then rs("Morning_Permission")=-1 else rs("Morning_Permission")=0 end if
		if Upload.Form("cbEvening_Permission") <> "" then rs("Evening_Permission")=-1 else rs("Evening_Permission")=0 end if

		rs("Morning_Permission_Time")=Upload.Form("txtMorning_Permission_Time")
		rs("Evening_Permission_Time")=Upload.Form("txtEvening_Permission_Time")
	rs.update
	
	session("ErrMsg")=" „ «· ⁄œÌ· »‰Ã«Õ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Department.asp?start=1&ID="&Upload.Form("txtHdnDptID")&"&DeptName="&Upload.Form("txthdnDptName")&""
	
elseif procType="delete" then	
	Work_ID= Upload.Form("txtID")
	
	conn.execute "delete  from Work_Day where Work_ID="&Work_ID&" "
	session("ErrMsg")=" „ «·Õ–› »‰Ã«Õ"
	conn.close
	set conn=nothing
	response.redirect "Department.asp?start=1&ID="&Upload.Form("txtHdnDptID")&"&DeptName="&Upload.Form("txthdnDptName")&""	

end if
%>