<%@page import="booking.Booking"%>
<%@page import="booking.BookingDAO"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="table.Table"%>
<%@page import="table.TableDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="user.User" scope="session" />

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<title>SE Team7 Restaurant Booking System // ReservationInfo</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href=".\\resources\\css\\bootstrap.min.css" rel="stylesheet">

<!-- Favicons -->
<link rel="apple-touch-icon"
   href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
   sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
   sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
   sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
   href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
   color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

.col-sm-6 {
   width: 500px;
}

.col-12 {
   display: flex;
   width: 90%;
   margin: .5rem;
   margin-top: 0px;
}

.col-13 {
   display: flex;
   width: 100%;
}

label {
   margin: .5rem;
   width: 30%;
}

.btn {
   height: 40px;
}
img:hover{
   cursor : pointer;
}
</style>

<!-- Custom styles for this template -->
<link href=".\resources\css\signin.css" rel="stylesheet">
</head>
<body class="text-center">


   <jsp:useBean id="bookingDAO" class="booking.BookingDAO" scope="page" />
   <jsp:useBean id="bookings" class="booking.Booking" scope="page" />
   <jsp:useBean id="tables" class="table.Table" scope="page" />
   <jsp:useBean id="tableDAO" class="table.TableDAO" scope="page" />
   <jsp:useBean id="userDAO" class="user.UserDAO" scope="page" />
   <%
       User u =  userDAO.getUserInfo(user.getUserID());
       user.setUserName(u.getUserName());
       
       
       Booking bk = bookingDAO.getReservationInfo(u.getUserID());
       bookings.setUserPhone(bk.getUserPhone());
       bookings.setBookingDateTime(bk.getBookingDateTime());
       
       String dateTime = (bk.getBookingDateTime().substring(0, 16));
       
       bookings.setAgeOver(bk.getAgeOver());
       bookings.setAgeUnder(bk.getAgeUnder());
       bookings.setTotalPeople(bk.getTotalPeople());
       bookings.setCarNumber(bk.getCarNumber());
       bookings.setNotCancel(bk.getNotCancel());
       
       Table t = tableDAO.getTableInfo(bk.getTableID());
       tables.setTableName(t.getTableName());
    %>
    
   <div class="container">
      <div class="py-5 text-center">
         <img class="d-block mx-auto mb-4" src=".\resources\images\seven.svg" onclick="location.href='Main.jsp'" width="150" height="100">
         <h2 style="color: #ffffff;">?????? ?????? ??????</h2>
      </div>
      <div class="row g-3">
         <div class="col-sm-6 center-block"
            style="float: none; margin: 0 auto;">
            <h4 class="mb-3" style="color: #ffffff;">?????? ??????</h4>

            <div class="col-13">
               <div class="col-12">
                  <label for="userName" class="form-label" style="color: #ffffff;">?????????</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="user" property="userName" />
                     disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="userPhone" class="form-label" style="color: #ffffff;">????????????</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="userPhone" />
                     disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="bookingDateTime" class="form-label" style="color: #ffffff;">????????????</label>
                  <input type="text" class="form-control"
                     placeholder="<%=dateTime%>"   
                     name="Date" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="ageOver" class="form-label" style="color: #ffffff;">??????</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="ageOver" />
                     name="ageOver" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="ageUnder" class="form-label" style="color: #ffffff;">??????</label><br /> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="ageUnder" />
                     name="ageUnder" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="totalPeople" class="form-label" style="color: #ffffff;">??? ??????</label><br /> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="totalPeople" />
                     name="to" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="tableID" class="form-label" style="color: #ffffff;">????????? ??????</label><br /> <input
                     type="text" class="form-control"
                     placeholder="<%=tables.getTableName()%>"
                     name="to" disabled />
               </div>
            </div>


            <div class="col-13">
               <div class="col-12">
                  <label for="carNumber" class="form-label" style="color: #ffffff;">?????? ??????</label><br />
                  <%
                     if(bk.getCarNumber()!=null){
                        %>
                  <input type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="carNumber" />
                     name="to" disabled />
                  <%
                        }
                     else{
                        %>
                  <input type="text" class="form-control" placeholder="?????? ???????????? ??????"
                     name="to" disabled />
                  <%
                     }
                     %>
               </div>
              

               <%
                  if(bk.getCarNumber()!=null){
                      %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal" value="???????????????">
               <%
                     }
                  else{
                     %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal" value="???????????????" disabled>
               <%
                  }
                  %>
                   </div>
                   
                   
                  <div class="col-13">
               <div class="col-12">
                  <label for="notCancel" class="form-label" style="color: #ffffff;">?????? ??????</label>
                  <%
                     if(bk.getNotCancel() == 1){
                        %>
                  <input type="text" class="form-control" placeholder="No-show ?????? ??????" name="to" disabled />
                     <%
                     }
                     if(bk.getNotCancel() == 0){
                     %>
                     <input type="text" class="form-control"placeholder="No-show ?????? ?????? ???????????? ??????" name="to" disabled />
                     <%
                  }
                  %>
               </div>
               
               <%
                  if(bk.getNotCancel() == 1){
                      %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal2" value="??????">
               <%
                     }
                  if(bk.getNotCancel() == 0){
                     %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal2" value="??????" disabled>
               <%
                  }
                  %>
            </div>
            

            <!-- Button trigger modal -->

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><img class="mb-1" src=".\resources\images\seven.svg" alt="" width="31" height="25">?????????</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <input type="text" class="form-control"
                           placeholder="?????? ?????? : <jsp:getProperty name="bookings" property="carNumber" />"
                           name="to" disabled /><img src=".\resources\images\qrcode.png" style="margin-top:15px;">
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-bs-dismiss="modal">??????</button>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="modal fade" id="exampleModal2" tabindex="-1"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">No-Show ?????? ?????? 10% ?????? ??????</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <img src=".\resources\images\qrcode.png" style="margin-top:15px;">
                        <p style="margin-top : 25px; margin-bottom : 0;">???????????? : ?????? ????????? ???????????? ?????? 3??????</p>
                     </div>
                     <div class="modal-footer">
                     <p style="margin-right:60px;">??? ??? ????????? ?????? ?????? ??? ???????????? ???????????????.</p>
                        <button type="button" class="btn btn-secondary"
                           data-bs-dismiss="modal">??????</button>
                     </div>
                  </div>
               </div>
            </div>

            <br>
            <button type="button" class="btn btn-warning"
               onclick="location.href='Main.jsp'">????????????</button>&nbsp;&nbsp;
               
               
               
               
               
           <%
                  if(bk.getNotCancel() == 1){
                      %>
               <button type="button" class="btn btn-warning"
               onclick="location.href='NotCancelConfirm.jsp'">?????? ??????</button>
               <%
                     }
                  if(bk.getNotCancel() == 0){
                     %>
               <button type="button" class="btn btn-warning"
               onclick="location.href='CancelConfirm.jsp'">?????? ??????</button>
               <%
                  }
                  %>
                      
                      

         </div>
      </div>
   </div>
   <footer class="mt-auto text-black-50" style="position:absolute; bottom:0; left:0; right:0;">
        <br>
        <p style="color: #ffffff; text-decorate:none;">
        <a href="https://github.com/leesb971204/RestaurantSe7.git" class="text-white" style="text-decoration:none;">
        ??????A+?????? Restaurant Booking System</a>.
        </p>
        </footer>
   <script src=".\resources\js\bootstrap.bundle.min.js"></script>
</body>
</html>