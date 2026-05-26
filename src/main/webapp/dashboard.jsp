<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String user = (String) session.getAttribute("user");

    if (user == null) {

        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Dashboard</title>
</head>

<body>

<h1>🔥 Welcome <%= user %></h1>

<h2>Login Successful!</h2>

</body>
</html>