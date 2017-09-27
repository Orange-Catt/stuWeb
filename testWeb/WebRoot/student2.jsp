<%@ page language="java" import="java.util.*,entity.*,dao.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'student2.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<style>
.table {
	width: 400px;
	margin: 20px auto;
}

td {
	border: 1px solid #666;
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	  $("tbody tr:odd").css("background","#fff");
	  $("tbody tr:even").css("background","#e3e4e5");
       var  oldColor;
       $("tbody tr").hover(function(){
       oldColor=$(this).css("background");
         $(this).css("background","#e3e4e5");
       },function(){
       $(this).css("background",oldColor);
       })	
	})
</script>
</head>

<body>
	<%
		StudentDao stuDao= new StudentDao();
		List<student> list=stuDao.searchAll();
	%>
		<table class='table table-bordered' >
		<thead>
		<tr>
		<th>ID</th>
		<th>姓名</th>
		<th>性别</th> 
		<th>年龄</th>
		</tr>
		</thead>
	    <tbody>
	    <% for(int i=0;i<list.size();i++){ %>
	    <tr>
	    <td>
	    <% out.print(list.get(i).getId()); %>
	    </td>
	    <td>
	    <% out.print(list.get(i).getName()); %>
	    </td>
	    <td>
	    <% out.print(list.get(i).getSex()); %>
	    </td>
	    <td>
	    <% out.print(list.get(i).getAge()); %>
	    </td>
	    </tr>
	    <%
		}
		
	    %>
	    
	    

		

	
	</tbody>
	</table>
</body>
</html>
