<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<!-- header -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>블로그</title>
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet"/>
        <link href="../resources/css/default.css" rel="stylesheet"/>
        <script src="../resources/js/jquery-3.6.3.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/controller/boards/index">LeeeeeSite</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/controller/boards/index">Main</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/controller/boards/list">FreeBoard</a></li>
                        <!-- 해당 session에서 null이면 login과 signup을 가진 태그을 아니면 MyProfile과 Logout을 가진 태그을 보여주는 조건문 -->
                        <c:if test="${empty client}">
                        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" data-bs-toggle="modal" data-bs-target="#modalloginForm">Login</a></li>
                        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" data-bs-toggle="modal" data-bs-target="#modalRegisterForm">SignUp</a></li>
                        </c:if>
                        <c:if test="${not empty client}">
                        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/controller/boards/profile">MyProfile</a></li>
							<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/controller/boards/logouts">Logout</a></li>
							<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/controller/boards/registers">new Register</a></li>
							<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">${client.userid}</a></li>
						</c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/assets/img/banner.gif')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <img alt="" src="../resources/assets/img/backbanner.png">
                            <span class="subheading" id="texts_kr">사람들의 게임 이야기를 나눠보세요.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
</script>
<!-- modal로 이루워진 태그을 include로 불러오기 -->
<%@ include file="../includes/login.jsp" %>     
<%@ include file="../includes/signUp.jsp" %>