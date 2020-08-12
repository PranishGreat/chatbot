<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}


 .button2{
 line-height: 12px;
     width: 150px;

     font-family: tahoma;
     margin-top: 25px;
     margin-right: 40px;
     position:absolute;
     top:5px;

     display: block;
    border: none;
    outline: none;
    height: 35px;
    background: #eccc68;
    color: #000;
    font-size: 20px;
    border-radius: 20px;

 left:90px;
 
 }
 
 .button2:hover{
    border: none;
    outline: none;
    height: 35px;
    background: #ff6348;
    color: #fff;
    font-size: 20px;
    border-radius: 20px;
    cursor: pointer;
    transition: .3s ease-out;
    
 }
 
</style>

</head>
<body>
<script>
function alert()
{	<%session.invalidate();%>
	swal ('Logout Suceesfully!!!','','success')
	.then(() => {	
		var delayInMilliseconds = 1000; //1 second
		setTimeout(function() {
			
			location='AdminLogin.jsp';
			
		}, delayInMilliseconds);
	});
	
}
				
				
</script>
<div>
<Button  class="button2" type="button"  onclick="alert()">Logout</Button>
</div>
<div>
<h1 align="center">Customer's Data</h1>
</div>
<table border="1">
<tr>
<th>Sr.No.</th>
<th>Time</th>
<th>Name</th>
<th>Aadhar No.</th>
<th>Bank Account No.</th>
<th>Mobile</th>
<th>Loan</th>
<th>Income-Src</th>
<th>Monthly-Src</th>
<th>EMI</th>
<th>Wage-Cut</th>
<th>Affect</th>
<th>Covid-Zone</th>
<th>Rent</th>
<th>Terms</th>
<th>Repay-Month</th>
</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb?useSSL=false&serverTimezone=UTC", "root", "");
statement=connection.createStatement();
String sql ="select * from details";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("time") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("adhar") %></td>
<td><%=resultSet.getString("account_no") %></td>
<td><%=resultSet.getString("mobile") %></td>
<td><%=resultSet.getString("loan") %></td>
<td><%=resultSet.getString("income_source") %></td>
<td><%=resultSet.getString("month_income") %></td>
<td><%=resultSet.getString("month_emi") %></td>
<td><%=resultSet.getString("wagecut") %></td>
<td><%=resultSet.getString("affect") %></td>
<td><%=resultSet.getString("zone") %></td>
<td><%=resultSet.getString("rent") %></td>
<td><%=resultSet.getString("terms") %></td>
<td><%=resultSet.getString("repay") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>