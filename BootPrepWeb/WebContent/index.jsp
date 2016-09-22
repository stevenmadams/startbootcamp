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


<%@ include file="sitenavbar.jsp" %>

<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide hidden-xs" src="img/bannerphoto3.jpg" alt="First slide">
            <img class="first-slide hidden-sm hidden-md hidden-lg" src="img/bannerphoto3xs.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption ">
              <img class="img-responsive logoshadow" src="img/biglogo.png">
            </div>
          </div>
        </div>
        <div class="item">
          <img class="first-slide hidden-xs" src="img/bannerphoto1.jpg" alt="First slide">
            <img class="first-slide hidden-sm hidden-md hidden-lg" src="img/bannerphoto1xs.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption ">
              <h1 style="font-size: 3em;">Helpful Resources</h1>
              <p>&#60;BOOT/PREP&#62; is your source for curated articles that will help prepare you for coding bootcamp!</p>
              <p><a class="btn btn-lg btn-primary" href="resourcelist.do" role="button"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Start Learning!</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="first-slide hidden-xs" src="img/bannerphoto2.jpg" alt="First slide">
            <img class="first-slide hidden-sm hidden-md hidden-lg" src="img/bannerphoto2xs.jpg" alt="First slide">
          <div class="container verticalmiddle">
            <div class="carousel-caption">
              <h1 style="font-size: 3em;">Keep track of your progress...</h1>
              <p>With a &#60;BOOT/PREP&#62; account, you can add notes, rate articles, and add your own custom resources.</p>
              <p><a class="btn btn-lg btn-primary" href="userprofile.jsp" role="button"><i class="fa fa-pencil" aria-hidden="true"></i> Sign Up Today!</a></p>
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
<br>
    <div class="container">
      <div class="jumbotron">


				<div class="row">
					<div class="col-md-6">
            <h3>What is &#60;BOOT/PREP&#62;?</h3>
            <p>&#60;BOOT/PREP&#62; is a computer coding bootcamp preparation tool.</p>
            <p>Our account feature allows you to take notes, rate, tag, and add new resources to your own personal digital library.</p>
            <p>As a guest, you can browse our curated library of relevant bootcamp resources.</p>

            </p>
					</div>

					<div class="col-md-6">

            <img src="img/codepic.jpeg" class="img-circle img-responsive img-home logohalf center-block">
							</div>

            </div>
            <div class="row">
              <hr>
  						  <img class="img-responsive logohalf center-block" src="img/biglogo.png">
                  <hr>
  					</div>
            <div class="row">
              <div class="col-md-6">

                								<h3>Create an account...</h3>

                								<p>Features:</p>
                                <ul>
                									<li>Bookmark resources to your profile</li>
                									<li>Add notes and ratings to your resources</li>
                									<li>Keep track of your progress</li>
                                </ul>
                                  <br>
                							<p><a class="btn btn-lg btn-primary" href="userprofile.jsp" role="button"><i class="fa fa-pencil" aria-hidden="true"></i> Sign Up Today!</a></p>
              </div>
              <div class="col-md-6">
                <h3>As a guest...</h3>
                <p>View resources:</p>
                <ul>
                  <li>Access to resource links</li>
                  <li>View resource videos</li>
                  <li>Explore a list of all resources</li>
                </ul>
                  <br>
                <p><a class="btn btn-lg btn-primary" href="resourcelist.do" role="button"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Start Learning!</a></p>
              </div>
						</div>


					</div>
				</div>



<%@ include file="sitefooter.jsp" %>
</body>
</html>
