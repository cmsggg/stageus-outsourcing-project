<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 찾는 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL문을 만들 때 도움을 주는 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%
    // 다른 페이지로부터 오는 값들에 대한 문자 인코딩 설정
    request.setCharacterEncoding("utf-8");

    // 다른 페이지로부터 온 값 저장 
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    // 데이터베이스 탐색
    Class.forName("com.mysql.jdbc.Driver");  // Connector 파일을 찾아오는 역할
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/stageus", "cono", "1234");

    // SQL문 만들기
    String sql = "INSERT INTO account(id, pw) VALUES(?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    // SQL문 전송
    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("<%=idValue%>님의 회원가입 완료")
        location.href="week7_login.jsp"
    </script>
</body>