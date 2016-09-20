<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title> &#60;BOOT/PREP&#62; HOME</title>
</head>
<body>
  <div class="bg-img">


<%@ include file="sitenavbar.jsp" %>

<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide hidden-xs" src="img/bannerphoto1.jpg" alt="First slide">
            <img class="first-slide hidden-sm hidden-md hidden-lg" src="img/bannerphoto1xs.jpg" alt="First slide">
          <div class="container verticalmiddle">
            <div class="carousel-caption ">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Start Learning!</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="first-slide hidden-xs" src="img/bannerphoto2.jpg" alt="First slide">
            <img class="first-slide hidden-sm hidden-md hidden-lg" src="img/bannerphoto2xs.jpg" alt="First slide">
          <div class="container verticalmiddle">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign Up Today!</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control hidden-xs" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control hidden-xs" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->

<a href="userprofile.jsp?id=${userId}">ACCOUNT</a>
<a href="resourcelist.do">List Resources</a>
<%@ include file="sitefooter.jsp" %>
  </div>
</body>
</html>
