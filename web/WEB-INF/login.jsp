<%-- 
    Document   : login
    Created on : 11-Nov-2022, 5:03:46 PM
    Author     : Arcto
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    </head>
    <body class="vh-100 bg-image"
          style="background-image: url('https://images.unsplash.com/photo-1441986380878-c4248f5b8b5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80');">
        <header class="navbar sticky-top d-flex mb-5 pt-2 pb-2 d-flex justify-content-between bg-light">
            <img class="pl-3" src="${pageContext.request.contextPath}/logo.png" width="50" height="50">
            <h2 class="text-uppercase ml-5 align-self-center" style="font-family: 'Oswald', sans-serif; position: relative; left: 30px;">HOME nVentory</h2>
            <div class="align-self-center pr-3" ><a class="btn btn-primary" href="#">Contact Admin</a></div>
        </header>
        <div class="d-flex justify-content-center align-self-center">
            <div class="card p-3 mb-5 align-self-center" style="width: 26rem; border-radius: 15px;"" >
                <div class="card-body p-5">
                    <h2 class="text-uppercase text-center mb-5">Login</h2>
                    <form action="login" method="post">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input required type="email" id="userEmail" name="userEmail" class="form-control" />
                            <label class="form-label" for="userEmail">Email address</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input required type="password" id="userPassword" name="userPassword" class="form-control" />
                            <label class="form-label" for="userPassword">Password</label>
                        </div>

                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                                    <label class="form-check-label" for="form2Example31"> Remember me </label>
                                </div>
                            </div>
                        </div>

                        <!-- Submit button -->
                        <button type="submit"  class="btn btn-primary btn-block mb-4">Sign in</button>

                        <!-- Register buttons -->
                        <div class="text-center">
                            <p>Not a member? <a href="login?action=register">Register</a></p>
                        </div>

                        <c:if test="${message != null}">
                            <div class="mt-4 text-center text-danger">
                                <p><c:out value ="${message.toString()}"></c:out></p>
                                </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
