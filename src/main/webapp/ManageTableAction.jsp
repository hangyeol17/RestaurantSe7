<%@page import="java.io.PrintWriter"%>
<%@page import="table.Table"%>
<%@page import="table.TableDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
   TableDAO tabledao = new TableDAO();
   ArrayList<Table> tables = tabledao.getAllTables();
   int max = 0;
   int tmp;
   for(Table table : tables){
      try {
         tmp = Integer.parseInt(table.getTableName());
      } catch(Exception e) { //숫자형 문자열이 아닌경우 예외발생
         continue; //예외처리
      }
      if (tmp > max) {
         max = tmp;
      }
   }
   
   int result = tabledao.insertTable(Integer.toString(max+1));
   if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류')");
      script.println("history.back()");
      script.println("</script>");
   } else {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href='ManageTable.jsp'");
      script.println("</script>");
   }
   %>
</body>
</html>