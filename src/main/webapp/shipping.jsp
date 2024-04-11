//IT22312426
//D.D.Irushi Gunawardaana

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 

 
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Shipping Details</title>
<%@include file="/includes/head.jsp"%>

</head>

<body>
 <%@include file="/includes/navbar.jsp"%>
 
 <div class="row">
               

                <div class="container">
                    <h3 class="text-center">Shipping Details</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="<%=request.getContextPath()%>/new" class="btn btn-dark">Add
     Shipping Details</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Country</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="shipping" items="${listshipping}">

                                <tr>
                                    <td>
                                        <c:out value="${shipping.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${shipping.name}" />
                                    </td>
                                    <td>
                                        <c:out value="${shipping.address}" />
                                    </td>
                                    <td>
                                        <c:out value="${shipping.country}" />
                                    </td>
                                   <td>
                                   
                                        <form action="edit" method="get" style="display: inline;">
                                        <input type="hidden" name="id" value="<c:out value='${shipping.id}' />">
                                        <button type="submit" style="background-color: black; color: white; width: 80px;">Edit</button>
                                        </form>
                                         &nbsp;&nbsp;&nbsp;&nbsp;
                                        <form action="delete" method="get" style="display: inline;">
                                        <input type="hidden" name="id" value="<c:out value='${shipping.id}' />">
                                        <button type="submit" style="background-color: black; color: white;width: 80px;">Delete</button>
                                       
                                        </form>
                                    </td>
                                   
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>
