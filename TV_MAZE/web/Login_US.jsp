<%-- 
    Document   : Login_US
    Created on : 28 nov 2023, 12:27:39 p. m.
    Author     : FZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="FORMS_CS.css"/>
    </head>
    <body>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>


        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="index.jsp">HOME</a>
                <a href="Crear_Cuenta.jsp">CREAR CUENTA</a>
                <a href="index.jsp#FAQ">FAQ</a>
            </nav>
        </header>
        <!-- LOGIN FORM -->
        <section class="left-PG IMG-1">
        </section>
        <section class="right-PG">
            <form action="VA_Login.jsp" method="post">
                <h2 class="TITULO">INICIAR SESIÓN</h2>
                <label for="Email">Email:</label>
                <input type="email" name="Email" id="Email" placeholder="Ingrese su correo electronico" required>
                <label for="Password">Password:</label>
                <input type="password" name="Password" id="Password" minlength="8" placeholder="Ingrese su contreseña" required>
                <a href="Pass_Recovery.jsp">¿Olvidaste tu Contraseña?</a>
                <input type="submit" value="Ingresar">
            </form>
        </section>
        <div class="footer">
            <div>
                <label>SIGUENOS EN:</label>
                <br>
                <a href="<%=port.getFacebook()%>"> <img src="IMGS/FOOTER/icons8-facebook-48.png" alt=""></a>
                <a href="<%=port.getInstagram()%>"> <img src="IMGS/FOOTER/icons8-instagram-48.png" alt=""></a>
                <a href="<%=port.getReddit()%>"> <img src="IMGS/FOOTER/icons8-reddit-48.png" alt=""></a>
                <a href="<%=port.getTwitter()%>"> <img src="IMGS/FOOTER/icons8-twitter-48.png" alt=""></a>
                <br>
                <label>&copy; TVmaze.com </label>
                <br>
                <div class="copy">
                    <a href="https://www.tvmaze.com/site/copyright">Copyright Policy</a>
                    <a href="https://www.tvmaze.com/site/privacy">Privacy Policy</a>
                    <a href="https://www.tvmaze.com/site/tos">ToS</a>
                </div>
            </div>
        </div>

    </body>
</html>
