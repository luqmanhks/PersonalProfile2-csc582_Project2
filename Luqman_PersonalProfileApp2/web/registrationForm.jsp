<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Form</title>
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
            border-left: 5px solid #4CAF50; 
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
            border-color: #4CAF50;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }
        
        textarea { 
            resize: vertical; 
            min-height: 100px; 
        }
        
        .submit-btn { 
            background-color: #4CAF50; 
            color: white; 
            padding: 14px 24px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 16px; 
            font-weight: bold;
            width: 100%; 
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .submit-btn:hover { 
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .center {
            display: block; 
            margin-left: auto; 
            margin-right: auto; 
            width: 50%;
        }
        
        .form-group {
            margin-bottom: 5px;
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
        
        .back-btn {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }
        
        .back-btn:hover {
            background-color: #0b7dda;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <img src="Welcome.gif" class="center" style="width:500px; height:auto;">
    <div class="container">
        <h2>Student Information Registration Form</h2>
        
        <%-- Display error/success messages if any --%>
        <% 
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");
            
            if (error != null) {
        %>
            <div style="background-color: #ffebee; color: #c62828; padding: 10px; border-radius: 5px; margin-bottom: 20px; border-left: 4px solid #f44336;">
                <%= error %>
            </div>
        <%
            }
            
            if (message != null) {
        %>
            <div style="background-color: #e8f5e8; color: #2e7d32; padding: 10px; border-radius: 5px; margin-bottom: 20px; border-left: 4px solid #4CAF50;">
                <%= message %>
            </div>
        <%
            }
        %>
        
        <form action="ProcessServlet" method="POST">
            <div class="form-group">
                <label for="name" class="required">Name:</label>
                <input type="text" id="name" name="name" required 
                       value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
            </div>

            <div class="form-group">
                <label for="studentId" class="required">Student ID:</label>
                <input type="text" id="studentId" name="studentId" required 
                       value="<%= request.getParameter("studentId") != null ? request.getParameter("studentId") : "" %>">
            </div>

            <div class="form-group">
                <label for="program" class="required">Program:</label>
                <input type="text" id="program" name="program" required 
                       value="<%= request.getParameter("program") != null ? request.getParameter("program") : "" %>">
            </div>

            <div class="form-group">
                <label for="email" class="required">Email:</label>
                <input type="email" id="email" name="email" required 
                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
            </div>

            <div class="form-group">
                <label for="hobbies">Hobbies:</label>
                <input type="text" id="hobbies" name="hobbies" 
                       value="<%= request.getParameter("hobbies") != null ? request.getParameter("hobbies") : "" %>">
                <p class="note">Separate multiple hobbies with commas (e.g., Reading, Swimming, Gaming)</p>
            </div>

            <div class="form-group">
                <label for="selfIntro">Self-Introduction:</label>
                <textarea id="selfIntro" name="selfIntro"><%= request.getParameter("selfIntro") != null ? request.getParameter("selfIntro") : "" %></textarea>
                <p class="note">Tell us about yourself, your interests, and your goals</p>
            </div>

            <input type="submit" value="Submit Registration" class="submit-btn">
        </form>
        
        <%-- Optional: Add a back button if you want navigation to a list page --%>
        <%--
        <div style="text-align: center; margin-top: 20px;">
            <a href="listRegistrations.jsp" class="back-btn">View All Registrations</a>
        </div>
        --%>
    </div>
    
    <script>
        // Optional: Form validation enhancement
        document.querySelector('form').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const studentId = document.getElementById('studentId').value;
            
            // Basic email validation
            if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
                alert('Please enter a valid email address');
                e.preventDefault();
                return;
            }
            
            // Optional: Student ID validation (adjust pattern as needed)
            // if (!studentId.match(/^[A-Za-z0-9]+$/)) {
            //     alert('Student ID should contain only letters and numbers');
            //     e.preventDefault();
            //     return;
            // }
        });
    </script>
</body>
</html>