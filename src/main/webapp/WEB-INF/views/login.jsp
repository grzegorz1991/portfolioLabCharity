<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="head.jsp" %>
  <body>
    <header>
      <nav class="container container--70">
        <ul class="nav--actions">
          <li><a href="/login">Zaloguj</a></li>
          <li class="highlighted"><a href="/register">Załóż konto</a></li>
        </ul>

        <ul>
          <li><a href="/" class="btn btn--without-border active">Start</a></li>
          <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
          <li><a href="/#aboutUs" class="btn btn--without-border">O nas</a></li>
          <li><a href="/#foundations" class="btn btn--without-border">Fundacje i organizacje</a></li>
          <li><a href="/#contactUs" class="btn btn--without-border">Kontakt</a></li>
        </ul>
      </nav>
    </header>

    <section class="login-page">
      <h2>Zaloguj się</h2>
      <form action="/login" method="post">
        <div class="form-group">
          <input type="text" name="username" placeholder="Username" />
        </div>
        <div class="form-group">
          <input type="password" name="password" placeholder="Hasło" />
          <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
          <a href="/register" class="btn btn--without-border">Załóż konto</a>
          <button class="btn" type="submit">Zaloguj się</button> 
        </div>
      </form>
    </section>
    <%@ include file="footer.jsp" %>

  </body>
</html>
