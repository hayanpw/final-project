<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
		<div class="container" id="container">
		<table id="table_id" class="display">
		    <thead>
		        <tr>
		            <th>Column 1</th>
		            <th>Column 2</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>Row 1 Data 1</td>
		            <td>Row 1 Data 2</td>
		        </tr>
		        <tr>
		            <td>Row 2 Data 1</td>
		            <td>Row 2 Data 2</td>
		        </tr>
		    </tbody>
		</table>
		</div>
		<script type="text/javascript">
		$(document).ready( function () {
		    $('#table_id').DataTable();
		} );
		</script>
</body>
</html>