<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/student_profiles", "root", ""
);

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM profiles WHERE id=?"
);
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if (!rs.next()) {
    out.println("Profile not found");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            font-family: 'Segoe UI', sans-serif;
        }

        .card-box {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .title {
            font-weight: 700;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-custom {
            background: #4e73df;
            color: white;
            border-radius: 10px;
        }

        .btn-custom:hover {
            background: #3b5bcc;
        }
    </style>
</head>

<body>

<div class="card-box">

    <h3 class="title">✏️ Edit Profile</h3>

    <form action="UpdateServlet" method="post">

        <input type="hidden" name="id" value="<%= id %>">

        <div class="mb-3">
            <label>Name</label>
            <input class="form-control" type="text" name="name"
                   value="<%= rs.getString("name") %>">
        </div>

        <div class="mb-3">
            <label>Student ID</label>
            <input class="form-control" type="text" name="studentId"
                   value="<%= rs.getString("student_id") %>">
        </div>

        <div class="mb-3">
            <label>Program</label>
            <input class="form-control" type="text" name="program"
                   value="<%= rs.getString("program") %>">
        </div>

        <div class="mb-3">
            <label>Email</label>
            <input class="form-control" type="email" name="email"
                   value="<%= rs.getString("email") %>">
        </div>

        <div class="mb-3">
            <label>Hobbies</label>
            <input class="form-control" type="text" name="hobbies"
                   value="<%= rs.getString("hobbies") %>">
        </div>

        <div class="mb-3">
            <label>Intro</label>
            <textarea class="form-control" name="intro"><%= rs.getString("intro") %></textarea>
        </div>

        <button type="submit" class="btn btn-custom w-100">
            Update Profile
        </button>

        <a href="viewProfiles.jsp" class="btn btn-outline-secondary w-100 mt-2">
            Cancel
        </a>

    </form>

</div>

</body>
</html>