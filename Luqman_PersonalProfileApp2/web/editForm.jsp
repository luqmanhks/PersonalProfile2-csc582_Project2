<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ProfileBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Profile</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-image: url("profile.jpg"); 
            margin: 20px; 
            color: #333;
        }
        
        .container { 
            background-color: #ffffff; 
            padding: 40px; 
            border-radius: 10px; 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); 
            max-width: 700px; 
            margin: auto; 
            border-left: 5px solid #FF9800; 
        }
        
        h2 { 
            color: #00796b; 
            text-align: center; 
            margin-bottom: 30px; 
            border-bottom: 2px solid #e0f2f7; 
            padding-bottom: 10px; 
        }
        
        label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: bold; 
            color: #004d40; 
        }
        
        input[type="text"], 
        input[type="email"], 
        textarea { 
            width: calc(100% - 22px); 
            padding: 12px; 
            margin-bottom: 20px; 
            border: 1px solid #ddd; 
            border-radius: 5px; 
            font-size: 16px;
            background-color: #f9f9f9;
        }
        
        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus { 
            outline: none;
            border-color: #FF9800;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(255, 152, 0, 0.3);
        }
        
        textarea { 
            resize: vertical; 
            min-height: 100px; 
        }
        
        .btn { 
            padding: 14px 24px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 16px; 
            font-weight: bold;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            margin: 5px;
            min-width: 120px;
        }
        
        .btn-update { 
            background-color: #FF9800; 
            color: white; 
        }
        
        .btn-update:hover { 
            background-color: #e68900;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .btn-cancel { 
            background-color: #757575; 
            color: white; 
        }
        
        .btn-cancel:hover { 
            background-color: #616161;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        
        .required::after {
            content: " *";
            color: #ff0000;
        }
        
        .note {
            font-size: 14px;
            color: #666;
            margin-top: -10px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Student Profile</h2>
        
        <% 
            ProfileBean profile = (ProfileBean) request.getAttribute("profile");
            if (profile != null) {
        %>
        
        <% if (request.getAttribute("error") != null) { %>
            <div style="background-color: #ffebee; color: #c62828; padding: 10px; border-radius: 5px; margin-bottom: 20px; border-left: 4px solid #f44336;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="StudentServlet" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= profile.getId() %>">
            
            <div class="form-group">
                <label for="name" class="required">Name:</label>
                <input type="text" id="name" name="name" required 
                       value="<%= profile.getName() %>">
            </div>

            <div class="form-group">
                <label for="studentId" class="required">Student ID:</label>
                <input type="text" id="studentId" name="studentId" required 
                       value="<%= profile.getStudentId() %>">
            </div>

            <div class="form-group">
                <label for="program" class="required">Program:</label>
                <input type="text" id="program" name="program" required 
                       value="<%= profile.getProgram() %>">
            </div>

            <div class="form-group">
                <label for="email" class="required">Email:</label>
                <input type="email" id="email" name="email" required 
                       value="<%= profile.getEmail() %>">
            </div>

            <div class="form-group">
                <label for="hobbies">Hobbies:</label>
                <input type="text" id="hobbies" name="hobbies" 
                       value="<%= profile.getHobbies() != null ? profile.getHobbies() : "" %>">
                <p class="note">Separate multiple hobbies with commas</p>
            </div>

            <div class="form-group">
                <label for="selfIntro">Self-Introduction:</label>
                <textarea id="selfIntro" name="selfIntro"><%= profile.getSelfIntro() != null ? profile.getSelfIntro() : "" %></textarea>
            </div>

            <div class="button-group">
                <input type="submit" value="Update Profile" class="btn btn-update">
                <a href="StudentServlet" class="btn btn-cancel">Cancel</a>
            </div>
        </form>
        
        <% } else { %>
            <div style="text-align: center; padding: 40px;">
                <h3>Profile not found</h3>
                <a href="StudentServlet" class="btn btn-update">Back to List</a>
            </div>
        <% } %>
    </div>
</body>
</html>