<% 
'''SQL Server Connection
'ConnString = "Provider=SQLOLEDB;Persist Security Info=False;Data Source=.;Initial Catalog=;User Id=sa;Password=sa"

'''Access Database
ConnString ="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../homoud22.mdb") & ";"		
session("myDate")=month(DateAdd("h",11,now()))&"/"& day(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))
%>