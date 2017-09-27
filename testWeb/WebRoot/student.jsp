<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
table{
width:400px;
margin:20px auto;
border-collapse:collapse;
boder:1px solid #666;
}

td{
border:1px solid #666;
}
</style>
  </head>
  
  <body>
     <%
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","123456");
     Statement stat=conn.createStatement();
     ResultSet rs=stat.executeQuery("select*from student");
     out.println("<table>");
     
     while(rs.next()){
     out.print("<tr>");
      out.print("<td>");
     out.print(rs.getInt("id"));
      out.print("</td>");
      out.print("<td>");
     out.print(rs.getString("name"));
      out.print("</td>");
      out.print("<td>");
     out.print(rs.getString("sex"));
      out.print("</td>");
      out.print("<td>");
     out.print(rs.getInt("age"));
      out.print("</td>");
      out.print("</tr>");
    %>
    
    <%
     }
     conn.close();
      %>
  </body>
</html>
