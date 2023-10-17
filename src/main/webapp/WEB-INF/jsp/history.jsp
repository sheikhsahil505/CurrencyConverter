

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%@ include file="header.jsp"%>


<!DOCTYPE html>
<html>
<head>
 <style>










/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    padding-top: 50px;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.9);
}

.modal-content {
    margin: auto;
    display: block;
    max-width: 50%;
    max-height: auto;
}

.close {
    position: absolute;
    top: 20px;
    right: 30px;
    font-size: 30px;
    font-weight: bold;
    color: white;
    cursor: pointer;
}


    </style>
    <title>Registration List</title>

    <link rel="stylesheet" href="./assets/bootstrap/bootstrap.css">
  </head>

<body>





  <div class="container mt-5">
      <div class="container text-center">

      </div>
      <div class="table-responsive" id="adminTable">
          <table class="table table-striped table-bordered">
              <thead class="thead-dark">
                  <tr>
                      <th>S.No.</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Contact</th>
                      <th>User Role</th>
                      <th>Date of Birth</th>
                      <th>Time</th>

                  </tr>
              </thead>
              <tbody>
                  <c:forEach items="${result}" var="registration" varStatus="loop">
                      <tr>
                          <td>${loop.index + 1}</td>
                          <td>${registration.amount}</td>
                          <td>${registration.convertedAmount}</td>
                          <td>${registration.date}</td>
                          <td>${registration.exchangeRate}</td>
                          <td>${registration.toCurrency}</td>
                          <td>${registration.fromCurrency}</td>
                          <td>${registration.timeStamp}</td>
                    </tr>
                  </c:forEach>
              </tbody>
          </table>
      </div>
  </div>


</body>
</html>



