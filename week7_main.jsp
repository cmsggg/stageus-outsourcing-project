<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    Class.forName("com.mysql.jdbc.Driver");  // Connector 파일을 찾아오는 역할
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/stageus", "cono", "1234");

    String sql = "SELECT * FROM account WHERE id=? AND pw=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    // SQL문 전송
    ResultSet result = query.executeQuery();

    // 값 정제
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();   // 2차원 리스트 생성
    String sendData = "[";
    while(result.next()) {
        ArrayList<String> tmpData = new ArrayList<String>();   // 2차원 리스트에 넣어줄 1차원 리스트 생성
        tmpData.add("\"" + result.getString(1) + "\"");
        tmpData.add(result.getString(2));
        data.add(tmpData);
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        var result = <%=data%>

        for (var index=0; index < result.length; index++) {
            console.log(result[index][0])
        }
    </script>

</body>