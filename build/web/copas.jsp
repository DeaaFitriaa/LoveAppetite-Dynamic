<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register To Love Appetite</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <% 
            String category[];
            String product[];
            String address[];
            String payment[];
            String paid[];
            String date[];
            String time[];
            
            ResultSet rsAccount = (ResultSet)request.getSession().getAttribute("accountRs");
            ResultSet rsHistory;
            int historyCounter = 0;
            
            boolean hasHistory = (Boolean)request.getAttribute("boolHistory");
            if (hasHistory) {
                rsHistory = (ResultSet)request.getAttribute("rsHistory");
                rsHistory.last();
                historyCounter = rsHistory.getRow();
                
                category = new String[historyCounter];
                product = new String[historyCounter];
                address = new String[historyCounter];
                payment = new String[historyCounter];
                paid = new String[historyCounter];
                date = new String[historyCounter];
                time = new String[historyCounter];
                rsHistory.beforeFirst();
                
                for (int i = 0; i < historyCounter; i++) {
                    rsHistory.next();
                    category[i] = rsHistory.getString(1);
                    product[i] = rsHistory.getString(2);
                    address[i] = rsHistory.getString(3);
                    payment[i] = rsHistory.getString(4);
                    paid[i] = rsHistory.getString(5);
                    date[i] = rsHistory.getString(6);
                    time[i] = rsHistory.getString(7);
                }
            
        %>
        <section class="order" id="order">
            <% rsAccount.first(); %>
            <h1 class="heading"> <span>order</span> history for <%= rsAccount.getString("Name")%> </h1>

            <div class="row">

                <table class="table">
                    
                    <tr>
                        
                        <th>No</th>
                        <th>Category</th>
                        <th>Product</th>
                        <th>Delivery</th>
                        <th>Payment</th>
                        <th>Paid</th>
                        <th>Date</th>
                        <th>Time</th>
                        
                    </tr>
             
                    <% for (int i = 0; i < historyCounter; i++) { %>
                    <tr>
                        
                        <td><%= (Integer)i+1%></td>
                        <td><%= category[i]%></td>
                        <td><%= product[i]%></td>
                        <td><%= address[i]%></td>
                        <td><%= payment[i]%></td>
                        <td><%= paid[i]%></td>
                        <td><%= date[i]%></td>
                        <td><%= time[i]%></td>
                        
                    </tr>
                    <% } %>
                </table>

            </div>

        </section>
    </body>
</html>
