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
                                <a class="nav-link"href="/finalproject/manageinventory">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                                    Manage Inventory
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 ">
                    <div class="w-75 border border-light mb-2 mt-2 ml-1 mr-2 p-2 flex-grow-1 flex-shrink-1">
                        <h2 class="text-center">Manage Items</h2>
                        <table class="table table-striped table-light">
                            <thead>
                                <tr>
                                    <th scope="col">Category</th>
                                    <th scope="col">Item</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="item" items="${usersItems}">
                                    <tr>
                                        <td>${item.category.categoryName}</td>
                                        <td>${item.itemName}</td>
                                        <td>\$${item.price}</td>
                                        <td><a href="manageinventory?action=edit&itemId=${item.itemId}">Edit</a></td>
                                        <td><a class="text-danger" href="manageinventory?action=delete&itemId=${item.itemId}">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>   
                    <div>
                        <c:if test="${selectedItem == null}">
                            <form action="manageinventory" method="POST" class="bg-light w-25 text-black mb-2 mt-2 p-2 ml-1 mr-lg-3 mr-2 border border-light flex-grow-2" style="font-size: 16px">
                                <input type="hidden" name="action" value="create">
                                <h2 class="text-center">Add Item</h2>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="newItemName">Item Name</label>
                                        <input required name="newItemName" type="text" class="form-control" id="newItemName" placeholder="Item Name">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="newItemPrice">Item Price</label>
                                        <input required name="newItemPrice" step="any" type="number" class="form-control" id="newItemPrice" placeholder="Item Price">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="newItemCategory">Category</label>
                                        <select name="newItemCategory" id="newItemCategory" class="form-control">
                                            <option selected>Select ...</option>
                                            <c:forEach var="category" items="${categoryList}">
                                                <option>${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <c:if test="${message != null}">
                                    <div class="mt-4 text-center text-danger">
                                        <p><c:out value ="${message.toString()}"></c:out></p>
                                        </div>
                                </c:if>
                                <button type="submit" class="btn btn-primary bg-light text-dark">Save</button>
                            </form>
                        </c:if>
                        <c:if test="${selectedItem != null}">
                            <form action="manageinventory" method="POST" class="bg-light w-25 text-black mb-2 mt-2 p-2 ml-1 mr-lg-3 mr-2 border border-light flex-grow-2" style="font-size: 16px">
                                <input type="hidden" name="action" value="update">
                                <h2 class="text-center">Edit Item</h2>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="updatedItemName">Item Name</label>
                                        <input required name="updatedItemName" type="text" class="form-control" id="updatedItemName"  value="<c:out value="${selectedItem.itemName}"/>">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="updatedItemPrice">Item Price</label>
                                        <input required name="updatedItemPrice" type="number" step="any" class="form-control" id="updatedItemPrice" value="<c:out value="${selectedItem.price}"/>">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="updatedItemCategory">Category</label>
                                        <select name="updatedItemCategory" id="updatedItemCategory" class="form-control">
                                            <option selected><c:out value="${selectedItem.category.categoryName}"/></option>
                                            <c:forEach var="category" items="${categoryList}">
                                                <option>${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <c:if test="${message != null}">
                                    <div class="mt-4 text-center text-danger">
                                        <p><c:out value ="${message.toString()}"></c:out></p>
                                        </div>
                                </c:if>
                                <button type="submit" class="btn btn-primary bg-light text-dark">Save</button>
                            </form>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
