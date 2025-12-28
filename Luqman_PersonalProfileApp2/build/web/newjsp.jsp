<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submitted Details</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-image: url("profile2.jpg"); 
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
            border-left: 5px solid #00bcd4; 
        }
        
        h1 { 
            color: #FFFFFF; 
            text-align: center; 
            margin-bottom: 30px; 
            padding-bottom: 10px; 
        }
        
        h2 { 
            color: #00796b; 
            text-align: center; 
            margin-bottom: 30px; 
            border-bottom: 2px solid #e0f2f7; 
            padding-bottom: 10px; 
        }
        
        p { 
            margin-bottom: 10px; 
            line-height: 1.6; 
        }
        
        strong { 
            color: #004d40; 
        }
        
        .detail-item { 
            background-color: #f5f5f5; 
            padding: 12px; 
            margin-bottom: 10px; 
            border-radius: 5px; 
            border: 1px solid #eee; 
        }
        
        .self-intro-box { 
            background-color: #f9f9f9; 
            padding: 15px; 
            border-radius: 8px; 
            border: 1px dashed #b2dfdb; 
            margin-top: 20px; 
        }
        
        .center {
            display: block; 
            margin-left: auto; 
            margin-right: auto; 
            width: 50%;
        }
        
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            min-width: 180px;
        }
        
        .btn-new {
            background-color: #4CAF50;
            color: white;
        }
        
        .btn-new:hover {
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .btn-list {
            background-color: #2196F3;
            color: white;
        }
        
        .btn-list:hover {
            background-color: #0b7dda;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .btn:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <img src="ThankYou.gif" class="center" style="width:500px; height:auto;">
    <div class="container">
        <h2>Your Submitted Information</h2>
        <div class="detail-item">
            <p><strong>Name:</strong> <%= request.getAttribute("name") %></p>
        </div>
        <div class="detail-item">
            <p><strong>Student ID:</strong> <%= request.getAttribute("studentId") %></p>
        </div>
        <div class="detail-item">
            <p><strong>Program:</strong> <%= request.getAttribute("program") %></p>
        </div>
        <div class="detail-item">
            <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
        </div>
        <div class="detail-item">
            <p><strong>Hobbies:</strong> <%= request.getAttribute("hobbies") %></p>
        </div>
        <div class="self-intro-box">
            <p><strong>Self-Introduction:</strong></p>
            <p><%= request.getAttribute("selfIntro") %></p>
        </div>
        
        <!-- Button Container -->
        <div class="button-container">
            <!-- Button for New Registration -->
            <a href="registrationForm.jsp" class="btn btn-new">New Registration</a>
            
            <!-- Button for List of Registrations -->
            <a href="listRegistrations.jsp" class="btn btn-list">List Registrations</a>
        </div>
    </div>
</body>
</html>