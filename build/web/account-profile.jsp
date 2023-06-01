<%-- 
    Document   : account-profile
    Created on : Jul 12, 2022, 3:10:49 PM
    Author     : rafih
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fast Food - Account </title>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 
    </head>
    <body>
        
        
        <!-- Begin page content -->
        <%
            ResultSet profileRs = (ResultSet)request.getSession().getAttribute("accountRs");
        %>
        <% profileRs.first(); %>
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Edit Account - <%= profileRs.getString("Name") %></h1>
                <p class="lead">Edit account <%= profileRs.getString("Name")  %> in G2Airline</p>
                <form action="index">
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary btn-small btn-rounded">Home</button>
                    </div>
                </form>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="account">
                            <input type="hidden" name="account-id" value="<%= profileRs.getString("ID")%>" />
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" 
                                       name="name" readonly
                                       value="<%= profileRs.getString("Name")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" class="form-control" 
                                       name="email" readonly
                                       value="<%= profileRs.getString("Email")%>"
                                       >
                            </div>
                           <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" 
                                       name="password"
                                       value="<%= profileRs.getString("Password")%>" required
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="number" class="form-control" 
                                       placeholder="Phone Number..." name="phone-number" required
                                       value="<%= profileRs.getString("PhoneNumber") %>"
                                       >
                            </div>
                           <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" placeholder="address" name="address" id="address" value="<%= profileRs.getString("Address")%>" required>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Edit</button>
                            </div>
                        </form>
                        <form action="history">
                            <div class="mb-3">
                                <input type="hidden" name="id" value="<%= profileRs.getString("ID")%>">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Order History</button>
                            </div>
                        </form>
                        <form action="logout">
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Logout</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main
        
        
    </body>
</html>
