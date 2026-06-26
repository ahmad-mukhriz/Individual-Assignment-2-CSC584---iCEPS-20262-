<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .wrapper {
            max-width: 1200px;
            margin: 40px auto;
        }

        .card-box {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        table thead {
            background: #4e73df;
            color: white;
        }

        table tbody tr:hover {
            background: #f1f3f9;
        }

        .btn {
            border-radius: 10px;
        }

        .action-btn {
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 13px;
            text-decoration: none;
            color: white;
        }

        .edit { background: #28a745; }
        .delete { background: #dc3545; }
    </style>
</head>

<body>

<div class="wrapper">

    <div class="card-box">

        <!-- HEADER -->
        <div class="top-bar">

            <h3>📋 Student Profiles</h3>

            <!-- SEARCH FORM (FIXED) -->
            <form method="get" class="d-flex gap-2 align-items-center flex-wrap">

                <input type="text"
                       name="search"
                       class="form-control"
                       style="width: 250px;"
                       placeholder="Search name or student ID"
                       value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

                <button type="submit" class="btn btn-success">
                    Search
                </button>

                <a href="viewProfiles.jsp" class="btn btn-secondary">
                    Show All
                </a>

                <a href="index.html" class="btn btn-primary">
                    + Add
                </a>

            </form>

        </div>

        <!-- TABLE -->
        <div class="table-responsive">

            <table class="table table-bordered align-middle">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Student ID</th>
                        <th>Program</th>
                        <th>Email</th>
                        <th>Hobbies</th>
                        <th>Intro</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/student_profiles",
            "root",
            ""
        );

        String search = request.getParameter("search");

        if (search != null && !search.trim().isEmpty()) {

            ps = con.prepareStatement(
                "SELECT * FROM profiles WHERE name LIKE ? OR student_id LIKE ?"
            );

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");

        } else {
            ps = con.prepareStatement("SELECT * FROM profiles");
        }

        rs = ps.executeQuery();

        while (rs.next()) {
%>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("student_id") %></td>
            <td><%= rs.getString("program") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("hobbies") %></td>
            <td><%= rs.getString("intro") %></td>

            <td>
                <a href="editProfile.jsp?id=<%= rs.getInt("id") %>"
                   class="action-btn edit">Edit</a>

                <a href="DeleteServlet?id=<%= rs.getInt("id") %>"
                   class="action-btn delete"
                   onclick="return confirm('Delete this profile?');">
                   Delete
                </a>
            </td>
        </tr>

<%
        }

    } catch (Exception e) {
%>
        <tr>
            <td colspan="8" class="text-danger text-center">
                Error: <%= e.getMessage() %>
            </td>
        </tr>
<%
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

                </tbody>
            </table>

        </div>

    </div>

</div>

</body>
</html>