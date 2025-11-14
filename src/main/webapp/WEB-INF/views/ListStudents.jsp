<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>

	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h2>List Students</h2>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${students}" var="s">
						<tr>
							<td>${s.firstName }</td>
							<td>${s.lastName }</td>
							<td><a href="deletestudent?studentId=${s.studentId}">Delete</a> | view |
								<a href="editstudent?studentId=${s.studentId}">Edit</a>
							 </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>