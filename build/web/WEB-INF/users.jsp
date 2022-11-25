<%-- 
    Document   : users
    Created on : 24-Nov-2022, 5:12:50 PM
    Author     : Arcto
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    </head>
</head>
<body data-new-gr-c-s-check-loaded="14.1086.0" data-gr-ext-installed="">
    <header class="navbar sticky-top d-flex  pt-2 pb-2 d-flex justify-content-between bg-light">
        <img class="pl-3" src="${pageContext.request.contextPath}/logo.png" width="50" height="50">
        <h2 class="text-uppercase ml-5 align-self-center d-flex" style="font-family: 'Oswald', sans-serif;  position: relative; left: 30px;">HOME nVentory</h2>
        <div class="mr-2 mb-0 d-flex justify-content-between align-items-between">
            <h6 class="align-self-center mb-0 pr-2"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></h6>
            <a class="btn btn-primary align-self-center" href="home?action=logout">Logout</a>
        </div>
    </header>
    <div class="container-fluid ">
        <div class="row">
            <nav class="mt-3 col-md-2 d-none d-block bg-white sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="/finalproject/user">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                Manage Users  <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/finalproject/category">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                                Manage Categories                       
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <main class="bg-light text-white row" style="font-size: 14px;">
                <div class="d-flex flex-row flex-fill justify-content-between mt-5 container-fluid text-dark"> 
                    <form action="user" method="POST" class=" mb-2 mt-2 p-2 ml-lg-3 ml-1 mr-2 border border-light">
                        <input type="hidden" name="action" value="addUser">
                        <h2 class="text-center">Add User</h2>
                        <div class="form-row">
                            <div class="form-group col-md">
                                <label for="inputEmail">Email</label>
                                <input required= type="email" name="inputEmail" class="form-control" id="inputEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md">
                                <label for="inputPassword">Password</label>
                                <input required min=6 max=24 type="password" name="inputPassword" class="form-control" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md">
                                <label for="inputFirstName">First Name</label>
                                <input required min=2 max=24 type="text" name="inputFirstName" class="form-control" id="inputFirstName" placeholder="First Name">
                            </div>
                            <div class="form-group col-md">
                                <label for="inputLastName">Last Name</label>
                                <input required min=2 max=24 type="text" name="inputLastName" class="form-control" id="inputLastName" placeholder="Last Name">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md">
                                <label for="inputRole">Role</label>
                                <select id="inputRole" name="inputRole" class="form-control">
                                    <option selected>Select a role...</option>
                                    <c:forEach var="role" items="${roles}">
                                        <option>${role.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md">
                                <label for="inputActive">Active</label>
                                <select id="inputActive" name="inputActive" class="form-control">
                                    <option selected>Is active...</option>
                                    <option>Yes</option>
                                    <option>No</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary bg-light text-dark">Save</button>

                        <p class="mt-2"> <c:out value="${message.toString()}"/></p>

                    </form>
                    <div class="border border-light mb-2 mt-2 ml-1 mr-2 p-2 flex-grow-1 flex-shrink-1">
                        <h2 class="text-center">Manage Users</h2>
                        <table class="table table-striped table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">Email</th>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Active</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="applicationUser" items="${users}">
                                <tr>
                                    <td>${applicationUser.email}</td>
                                    <td>${applicationUser.firstName}</td>
                                    <td>${applicationUser.lastName}</td>
                                    <td>${applicationUser.role.roleName}</td>
                                    <td>
                                <c:choose>
                                    <c:when test="${applicationUser.active==true}">
                                        Yes 
                                    </c:when>    
                                    <c:otherwise>
                                        No
                                    </c:otherwise>
                                </c:choose>
                                </td>
                                <td><a href="user?action=edit&user=${applicationUser.email}">Edit</a></td>
                                <td><a href="user?action=delete&user=${applicationUser.email}">Delete</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>     
                    <c:if test="${selectedUser != null}">
                        <form action="user" method="POST" class="text-dark mb-2 mt-2 p-2 ml-1 mr-lg-3 mr-2 border border-light flex-grow-2" style="font-size: 16px">
                            <input type="hidden" name="action" value="update">
                            <h2 class="text-center">Edit User</h2>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="selectedEmail">Email</label>
                                    <input required readonly="readonly" name="selectedEmail" type="email" class="form-control" id="selectedEmail" value="${selectedUser.email}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="selectedFirstName">First Name</label>
                                    <input required name="selectedFirstName" type="text" class="form-control" id="selectedFirstName" value="${selectedUser.firstName}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="selectedLastName">Last Name</label>
                                    <input required name="selectedLastName" type="text" class="form-control" id="selectedLastName" value="${selectedUser.lastName}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="selectedRole">Role</label>
                                    <select name="selectedRole" id="selectedRole" class="form-control">
                                        <option selected>Current: ${selectedUser.role.roleName}</option>
                                        <c:forEach var="role" items="${roles}">
                                            <option>${role.roleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md">
                                    <label for="selectedActive">Active</label>
                                    <select name="selectedActive" id="selectedActive" class="form-control">
                                        <option selected>
                                        <c:choose>
                                            <c:when test="${selectedUser.active==true}">
                                                Current: Yes
                                            </c:when>    
                                            <c:otherwise>
                                                Current: No
                                            </c:otherwise>
                                        </c:choose></option>
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary bg-light text-dark">Save</button>
                            <a href="user?action=cancel" class="btn btn-primary bg-light text-dark">Cancel</a>
                        </form>
                    </c:if>
                </div>
            </main>
            </body>
            </html>
