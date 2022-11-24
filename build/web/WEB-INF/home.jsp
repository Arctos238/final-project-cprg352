<%-- 
    Document   : Home
    Created on : 11-Nov-2022, 4:59:41 PM
    Author     : J.Pointer
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
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
                                <a class="nav-link active" href="/finalproject/home">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                    Dashboard <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/finalproject/manageaccount">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                                    Manage Account                       
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/finalproject/manageinventory">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                                    Manage Inventory
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4 w-75"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h1 class="h2">Dashboard</h1>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Category</th>
                                <th scope="col">Item</th>
                                <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:set var = "i" value = "${1}"/>
                           <c:forEach var="item" items="${usersItems}">
                            <tr>
                                <td>${i}</td>
                                <td>${item.category.categoryName}</td>
                                <td>${item.itemName}</td>
                                <td>\$${item.price}</td>
                            </tr>
                            <c:set var = "i" value = "${i + 1}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                    <canvas class="my-4 chartjs-render-monitor" id="myChart" width="500" height="190" style="display: block; height: 127px; width: 303px;"></canvas>
                </main>
            </div>
        </div>
    </body>
</html>
