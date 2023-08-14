<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="head.jsp" %>
<body>
<%@ include file="formHeader.jspf" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form modelAttribute="donation" action="/form-confirmation" method="post">
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id"/>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>
                <div class="form-group form-group--inline">
                    <form:input path="quantity" type="number" step="1" min="1"/>

                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Wstecz</button>
                        <button type="button" class="btn next-step">Dalej</button>
                    </div>
                </div>
            </div>

            <!-- STEP 3 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <form:radiobuttons path="institution" items="${institutions}" itemLabel="name" itemValue="id"/>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera</h3>
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <form:input path="street" type="text"/>
                        <form:input path="city" type="text"/>
                        <form:input path="zipCode" type="text"/>
                    </div>
                    <div class="form-section--column">
                        <form:input path="pickUpDate" type="date" pattern="yyyy-MM-dd" />
                        <form:input path="pickUpTime" type="time" pattern="HH:mm" />
                        <form:input path="pickUpComment" type="text" />
                    </div>

                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Wstecz</button>
                        <button type="button" class="btn next-step">Dalej</button>
                    </div>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text" id="summary-quantity-categories">
                    </span>
                            </li>
                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text" id="summary-institution-city">
                    </span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul id="summary-address">
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul id="summary-date-time-comment">
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

        </form:form>

    </div>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
            </div>

            <div class="form-group">
    <textarea
            name="message"
            placeholder="Wiadomość"
            rows="1"
    ></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value='/resources/images/icon-facebook.svg'/>"/></a>
            <a href="#" class="btn btn--small"><img src="<c:url value='/resources/images/icon-instagram.svg'/>"/></a>
        </div>
    </div>
</footer>
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script>
    var categories = ${categories};
    var institutions = ${institutions};
    var donations = ${donations};
    var donation = ${donation};
    console.log("Categories:", categories);
    console.log("Institutions:", institutions);
    console.log("Donations:", donations);
</script>
</body>
</html>