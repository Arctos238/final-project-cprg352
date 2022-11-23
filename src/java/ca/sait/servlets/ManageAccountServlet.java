/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ca.sait.servlets;

import ca.sait.dataaccess.UserDB;
import ca.sait.models.Item;
import ca.sait.models.Role;
import ca.sait.models.User;
import ca.sait.services.ItemService;
import ca.sait.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arcto
 */
public class ManageAccountServlet extends HttpServlet {
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
        User user = (User) request.getSession().getAttribute("user");
        String action = request.getParameter("action");

        if (action != null && action.equals("logout")) {
            request.getSession().invalidate();
            response.sendRedirect("home");
            return;
        } else if (action != null && action.equals("deactivate")) {
            UserService userService = new UserService();

            user.setActive(false);

            userService.updateUser(user);

            request.getSession().invalidate();
            response.sendRedirect("home");
            return;
        }

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/manageaccount.jsp").forward(request, response);
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
        User user = (User) request.getSession().getAttribute("user");

        String newFirstName = request.getParameter("firstName");
        String newLastName = request.getParameter("lastName");
        String newEmail = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordTwo = request.getParameter("retypeNewPassword");

        String message = null;

        if (newPassword != null && newPasswordTwo != null && !newPassword.equals(newPasswordTwo)) {
            message = "New passwords do not match, please try again";
        } else if (currentPassword != null && !currentPassword.equals(user.getPassword())) {
            message = "Current Password is incorrect";
        } else if (newFirstName.length() > 0 && newLastName.length() > 0 && newEmail.length() > 0) {
            UserService userService = new UserService();

            String oldEmail = user.getEmail();
            
            User updatedUser = new User(newEmail, true,  newFirstName,  newLastName, newPassword);
            updatedUser.setRole(new Role(2, "regular user"));

            if (userService.updateUserInfo(updatedUser, oldEmail)) {
                request.getSession().setAttribute("user", updatedUser);
                message = "Successful";
            } else {
                message = "Email already in use";
            }
        }

        request.setAttribute("message", message);

        this.getServletContext().getRequestDispatcher("/WEB-INF/manageaccount.jsp").forward(request, response);
    }
}
