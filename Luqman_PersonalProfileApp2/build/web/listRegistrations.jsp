<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.ProfileBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registrations</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            color: white;
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        
        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .controls-panel {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            margin-bottom: 30px;
        }
        
        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .search-box input {
            flex: 1;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .search-box input:focus {
            border-color: #667eea;
            outline: none;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-search {
            background: #4CAF50;
            color: white;
        }
        
        .btn-search:hover {
            background: #45a049;
            transform: translateY(-2px);
        }
        
        .btn-new {
            background: #2196F3;
            color: white;
        }
        
        .btn-new:hover {
            background: #0b7dda;
            transform: translateY(-2px);
        }
        
        .filter-box {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .filter-group {
            flex: 1;
            min-width: 200px;
        }
        
        .filter-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #333;
        }
        
        .filter-group select {
            width: 100%;
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
        }
        
        .btn-filter {
            background: #FF9800;
            color: white;
            align-self: flex-end;
        }
        
        .btn-filter:hover {
            background: #e68900;
            transform: translateY(-2px);
        }
        
        .btn-reset {
            background: #f44336;
            color: white;
            align-self: flex-end;
        }
        
        .btn-reset:hover {
            background: #d32f2f;
            transform: translateY(-2px);
        }
        
        .table-container {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        th {
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }
        
        tbody tr {
            border-bottom: 1px solid #e0e0e0;
            transition: background 0.3s;
        }
        
        tbody tr:hover {
            background: #f8f9fa;
        }
        
        td {
            padding: 15px;
            color: #333;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        
        .btn-view {
            background: #009688;
            color: white;
            padding: 8px 15px;
            font-size: 14px;
        }
        
        .btn-edit {
            background: #FFC107;
            color: white;
            padding: 8px 15px;
            font-size: 14px;
        }
        
        .btn-delete {
            background: #f44336;
            color: white;
            padding: 8px 15px;
            font-size: 14px;
        }
        
        .btn-view:hover, .btn-edit:hover, .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .empty-state {
            text-align: center;
            padding: 50px 20px;
            color: #666;
        }
        
        .empty-state i {
            font-size: 48px;
            margin-bottom: 15px;
            color: #ccc;
        }
        
        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .badge-cs { background: #e3f2fd; color: #1976d2; }
        .badge-business { background: #e8f5e8; color: #2e7d32; }
        .badge-engineering { background: #fff3e0; color: #f57c00; }
        
        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px;
            gap: 10px;
        }
        
        .page-btn {
            padding: 8px 15px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .page-btn:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }
        
        .page-btn.active {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }
        
        @media (max-width: 768px) {
            .search-box, .filter-box {
                flex-direction: column;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-users"></i> Student Registrations</h1>
            <p>Manage and view all student registrations</p>
        </div>
        
        <div class="controls-panel">
            <!-- Search Form -->
            <form action="StudentServlet" method="GET" class="search-box">
                <input type="text" name="keyword" placeholder="Search by name or student ID..." 
                       value="<%= request.getAttribute("searchKeyword") != null ? request.getAttribute("searchKeyword") : "" %>">
                <input type="hidden" name="action" value="search">
                <button type="submit" class="btn btn-search">
                    <i class="fas fa-search"></i> Search
                </button>
                <a href="StudentServlet?action=new" class="btn btn-new">
                    <i class="fas fa-plus"></i> New Registration
                </a>
            </form>
            
            <!-- Filter Form -->
            <form action="StudentServlet" method="GET" class="filter-box">
                <div class="filter-group">
                    <label><i class="fas fa-graduation-cap"></i> Filter by Program:</label>
                    <select name="program">
                        <option value="">All Programs</option>
                        <%
                            List<String> programs = (List<String>) request.getAttribute("programs");
                            String filterProgram = (String) request.getAttribute("filterProgram");
                            if (programs != null) {
                                for (String prog : programs) {
                                    String selected = "";
                                    if (filterProgram != null && prog.equals(filterProgram)) {
                                        selected = "selected";
                                    }
                        %>
                        <option value="<%= prog %>" <%= selected %>>
                            <%= prog %>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="filter-group">
                    <label><i class="fas fa-heart"></i> Filter by Hobby:</label>
                    <input type="text" name="hobby" placeholder="Enter hobby..." 
                           value="<%= request.getAttribute("filterHobby") != null ? request.getAttribute("filterHobby") : "" %>">
                </div>
                <input type="hidden" name="action" value="filter">
                <button type="submit" class="btn btn-filter">
                    <i class="fas fa-filter"></i> Apply Filter
                </button>
                <a href="StudentServlet" class="btn btn-reset">
                    <i class="fas fa-redo"></i> Reset
                </a>
            </form>
        </div>
        
        <div class="table-container">
            <%
                List<ProfileBean> students = (List<ProfileBean>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Student ID</th>
                        <th>Program</th>
                        <th>Email</th>
                        <th>Hobbies</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ProfileBean student : students) {
                            String badgeClass = "";
                            if (student.getProgram() != null) {
                                String programLower = student.getProgram().toLowerCase();
                                if (programLower.contains("computer")) {
                                    badgeClass = "badge-cs";
                                } else if (programLower.contains("business")) {
                                    badgeClass = "badge-business";
                                } else if (programLower.contains("engineer")) {
                                    badgeClass = "badge-engineering";
                                }
                            }
                    %>
                    <tr>
                        <td><%= student.getId() %></td>
                        <td><strong><%= student.getName() %></strong></td>
                        <td><code><%= student.getStudentId() %></code></td>
                        <td>
                            <% if (!badgeClass.isEmpty()) { %>
                            <span class="badge <%= badgeClass %>"><%= student.getProgram() %></span>
                            <% } else { %>
                            <%= student.getProgram() %>
                            <% } %>
                        </td>
                        <td><%= student.getEmail() %></td>
                        <td>
                            <%
                                if (student.getHobbies() != null && !student.getHobbies().isEmpty()) {
                                    String[] hobbyList = student.getHobbies().split(",");
                                    for (int i = 0; i < Math.min(hobbyList.length, 3); i++) {
                                        if (!hobbyList[i].trim().isEmpty()) {
                            %>
                            <span style="background: #e0e0e0; padding: 2px 6px; border-radius: 3px; margin: 2px; display: inline-block; font-size: 12px;">
                                <%= hobbyList[i].trim() %>
                            </span>
                            <%
                                        }
                                    }
                                    if (hobbyList.length > 3) {
                            %>
                            <span style="color: #666;">+<%= hobbyList.length - 3 %> more</span>
                            <%
                                    }
                                }
                            %>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="StudentServlet?action=view&id=<%= student.getId() %>" 
                                   class="btn btn-view">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <a href="StudentServlet?action=edit&id=<%= student.getId() %>" 
                                   class="btn btn-edit">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="StudentServlet?action=delete&id=<%= student.getId() %>" 
                                   class="btn btn-delete" 
                                   onclick="return confirm('Are you sure you want to delete this student?')">
                                    <i class="fas fa-trash"></i> Delete
                                </a>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                } else {
            %>
            <div class="empty-state">
                <i class="fas fa-user-slash"></i>
                <h3>No Students Found</h3>
                <p>No student registrations available. Add your first student!</p>
                <a href="StudentServlet?action=new" class="btn btn-new" style="margin-top: 15px;">
                    <i class="fas fa-plus"></i> Add First Student
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>
    
    <script>
        // Add confirmation for delete
        document.addEventListener('DOMContentLoaded', function() {
            const deleteLinks = document.querySelectorAll('.btn-delete');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to delete this student? This action cannot be undone.')) {
                        e.preventDefault();
                    }
                });
            });
        });
        
        // Auto-submit filter when program is selected
        document.addEventListener('DOMContentLoaded', function() {
            const programSelect = document.querySelector('select[name="program"]');
            if (programSelect) {
                programSelect.addEventListener('change', function() {
                    if (this.value) {
                        this.form.submit();
                    }
                });
            }
        });
    </script>
</body>
</html>