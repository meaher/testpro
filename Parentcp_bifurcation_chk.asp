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
uploadsDirVar = server.mappath("Vaccination_Files")
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
std_civil_id= Upload.Form("std_civil_id")


if procType="add" then
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from bifurcation where std_civil_id='"&std_civil_id&"'" , Conn,1,2
 	if Rs.eof then
		rs.addnew	
		rs("Std_Civil_ID") = Std_Civil_ID
		rs("bifurcation")=Upload.Form("bifurcation")
		rs("Class_Room_ID")=Upload.Form("Class_Room_ID")
		'rs("Reg_Date")=Date()
		'rs("Reg_Day")=Day(Date())
		'rs("Reg_month")=Month(Date())
		'rs("Reg_year")=Year(Date())
		rs.update

		
	Else
		rs("Std_Civil_ID") = Std_Civil_ID
		rs("bifurcation")=Upload.Form("bifurcation")
		rs("Class_Room_ID")=Upload.Form("Class_Room_ID")
	'	rs("Reg_Date")=Date()
	'	rs("Reg_Day")=Day(Date())
	'	rs("Reg_month")=Month(Date())
	'	rs("Reg_year")=Year(Date())
	'	rs("Vaccination_File")=ArrImg(0)
	
		rs.update

	End if
	
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	session("ErrMsg")="Êã ÍÝÙ ÇáÈíÇäÇÊ ÈäÌÇÍ"

	response.redirect "Parentcp_bifurcation.asp?msg='Êã ÇáÍÞÙ ÈäÌÇÍ'" 
	
elseif procType="edit" then

elseif procType="delete" then	

end if
%>