<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.profile.ProfileBean" %>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Result</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            font-family: 'Segoe UI', sans-serif;
        }

        .profile-card {
            max-width: 650px;
            margin: 60px auto;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
        }

        .title {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333;
        }

        .info {
            font-size: 16px;
            margin-bottom: 12px;
        }

        .icon {
            color: #6c63ff;
            margin-right: 8px;
        }

        .label {
            font-weight: bold;
        }
    </style>
</head>

<body>

<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>

<div class="profile-card">

    <h2 class="title">
        <i class="fas fa-id-card"></i> Student Profile
    </h2>

    <div class="info">
        <i class="fas fa-user icon"></i>
        <span class="label">Name:</span>
        <%= (p != null) ? p.getName() : "No data" %>
    </div>

    <div class="info">
        <i class="fas fa-id-badge icon"></i>
        <span class="label">Student ID:</span>
        <%= (p != null) ? p.getStudentId() : "No data" %>
    </div>

    <div class="info">
        <i class="fas fa-graduation-cap icon"></i>
        <span class="label">Program:</span>
        <%= (p != null) ? p.getProgram() : "No data" %>
    </div>

    <div class="info">
        <i class="fas fa-envelope icon"></i>
        <span class="label">Email:</span>
        <%= (p != null) ? p.getEmail() : "No data" %>
    </div>

    <div class="info">
        <i class="fas fa-gamepad icon"></i>
        <span class="label">Hobbies:</span>
        <%= (p != null) ? p.getHobbies() : "No data" %>
    </div>

    <div class="info">
        <i class="fas fa-comment icon"></i>
        <span class="label">Introduction:</span>
        <%= (p != null) ? p.getIntro() : "No data" %>
    </div>
<br><br>
<a href="viewProfiles.jsp" class="btn btn-primary">
    View All Profiles
</a>
</div>

</body>
</html>