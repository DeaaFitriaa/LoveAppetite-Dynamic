/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Logic.Controller.OrderController;
import Logic.Model.OrderModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafih
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            response.sendRedirect("index");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean login = (Boolean)request.getSession().getAttribute("status");
        
        String productName = request.getParameter("product");
        
        String productId;
        String userId;
        String name;
        String email;
        String phoneNumber;
        String address;
        String paymentId;
        
        OrderController oc = new OrderController();
        ResultSet rsProduct = oc.getProductId(productName);
        
        try {
            if (rsProduct.isBeforeFirst()) {
                if (!login) {
                    userId = "";
                }
                else {
                    userId = request.getParameter("account-id");
                }
                rsProduct.first();
                productId = rsProduct.getString(1);
                name = request.getParameter("name");
                email = request.getParameter("email");
                phoneNumber = request.getParameter("phone-number");
                address = request.getParameter("address");
                paymentId = request.getParameter("payment");
                
                OrderModel model = new OrderModel();
                model.setProductId(productId);
                model.setAddress(address);
                model.setEmail(email);
                model.setName(name);
                model.setPaymentId(paymentId);
                model.setPhoneNumber(phoneNumber);
                model.setUserId(userId);
                
                if (login) {
                    boolean ordered = oc.createOrderUser(model);

                    if (ordered) {
                        response.sendRedirect("index");
                    }
                }
                else {
                    boolean ordered = oc.createOrderPublic(model);
                    if (ordered) {
                        response.sendRedirect("index");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
