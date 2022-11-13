/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ca.sait.servlets;

import ca.sait.models.Role;
import ca.sait.models.User;
import ca.sait.services.RoleService;
import ca.sait.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arcto
 */
public class RegisterServlet extends HttpServlet {

    private final Role DEFAULT_ROLE = new Role(2, "regular user");
    private final boolean DEFAULT_ACTIVE = true;

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
        this.getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
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
        String inputFirstName = request.getParameter("inputFirstName");
        String inputLastName = request.getParameter("inputLastName");
        String inputEmail = request.getParameter("inputEmail");
        String inputPasswordFirst = request.getParameter("inputPasswordFirst");
        String inputPasswordSecond = request.getParameter("inputPasswordSecond");
        String message = null;

        Pattern textPattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$");

        Boolean patteredPasses = textPattern.matcher(inputPasswordFirst).matches();

        if (inputPasswordFirst.contains("inputFirstName") || inputPasswordFirst.contains("inputLastName")) {
            message = "Password must not contain first name or last name";
        } else if (!patteredPasses) {
            message = "Password must contain atleast one uppercase, one lowercase and one number";
        } else if (inputFirstName != null && inputLastName != null
                && inputFirstName != null && inputPasswordFirst != null && inputPasswordSecond != null && inputPasswordFirst.equals(inputPasswordSecond)) {
            UserService userService = new UserService();
            User newUser = new User(inputEmail, DEFAULT_ACTIVE, inputFirstName, inputLastName, inputPasswordFirst);

            newUser.setRole(DEFAULT_ROLE);

            boolean success = userService.createUser(newUser);

            if (success) {
                response.sendRedirect("home");
                return;
            } else {
                message = "That email is already in use";
                request.setAttribute("message", message);
            }
        } else {
            message = "Both passwords do not match! Please try again";

        }

        request.setAttribute("message", message);
        this.getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }
}
