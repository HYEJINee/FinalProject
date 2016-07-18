<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
   <title>Home</title>
</head>
<body>
   <!-- Header -->
   <%@ include file="include/header.jsp" %>
   <!-- Content Title -->
   <div class="container">
      <div class="row">
         <div class="col-md-3">
            <h2>인권을<br>자유를<br/>논하다</h2>
         </div>
         <div class="col-md-offset-9">
            <label class="label label-primary">찬반</label>
            <span>의견논제1</span><br/><br/>
            <label class="label label-primary">찬반</label>
            <span>의견논제2</span><br/><br/>
            <label class="label label-primary">찬반</label>
            <span>의견논제3</span><br/><br/>
         </div>
      </div>
   </div>
   <hr/>
   <!-- Content List -->
   
   <hr/>
   <!-- Board -->
   <div class="container">
      <div class="row">
         <div class="col-md-6">
            <center><h3>안건 건의</h3></center>
            <label class="label label-primary">찬반</label>
            <span>의견논제1</span>
            <span>아이콘</span>
            <br/><br/>
            <label class="label label-primary">찬반</label>
            <span>의견논제2</span>
            <span>아이콘</span>
            <br/><br/>
            <label class="label label-primary">찬반</label>
            <span>의견논제3</span>
            <span>아이콘</span>
            <br/><br/>
         </div>
         <div class="col-md-6">
            <center><h3>종료된 토론</h3></center>
            <label class="label label-primary">찬반</label>
            <span> 의견논제1</span>
            <span>아이콘</span>
            <br/><br/>
            <label class="label label-primary">찬반</label>
            <span> 의견논제2</span>
            <span>아이콘</span>
            <br/><br/>
            <label class="label label-primary">찬반</label>
            <span> 의견논제3</span>
            <span>아이콘</span>
            <br/><br/>
         </div>
      </div>
   </div>
</body>
</html>