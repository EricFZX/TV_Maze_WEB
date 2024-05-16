<%-- 
    Document   : Crear_Cuenta
    Created on : 28 nov 2023, 2:30:43 p. m.
    Author     : FZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Cuenta</title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORMS_CS.css"/>
    </head>
    <body>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>

        <!-- NAV -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="Login_US.jsp">INICIAR SESIÓN</a>
                <a href="index.jsp#FAQ">FAQ</a>
            </nav>
        </header>
        <!-- LOGIN FORM -->
        <section class="left-PG IMG-2">
            <div class="left-CENTER">
                <h1>¡UNETE A ESTA COMUNIDAD!</h1>
                <p>
                    ¡Bienvenido a TV-MAZE esperamos que tengas una excelente experiencia, y disfrutes de cada serie,
                    pelicula y comuniad de la mejor manera!
                </p>
            </div>
        </section>
        <section class="right-PG">
            <form action="VA_Crear_Cuenta.jsp" method="post">
                <h2 class="TITULO">CREAR CUENTA</h2>
                <label for="Codigo">Codigo:</label>
                <input type="number" name="Codigo" id="Codigo" placeholder="Ingrese un Codigo" pattern="[a-zA-Z]+" title="¡Solo se aceptan letras!" required>

                <label for="Nombre">Nombre:</label>
                <input type="text" name="Nombre" id="Nombre" placeholder="Ingrese su Nombre" pattern="[a-zA-Z]+" title="¡Solo se aceptan letras!" required>

                <label for="Apellido">Apellido:</label>
                <input type="text" name="Apellido" id="Apellido" placeholder="Ingrese su Apellido" pattern="[a-zA-Z]+" title="¡Solo se aceptan letras!" required>

                <label for="Correo">Email:</label>
                <input type="email" id="Correo" name="Correo" placeholder="Ingrese su Email" required>

                <label for="Password">Password:</label>
                <input type="password" name="Password" id="Password" placeholder="Ingrese su Contraseña" minlength="8" required>

                <a href="Login_US.jsp">¿Ya tienes una cuenta? ¡Inicia sesión!</a>
                <div class="SE">
                    <button type="submit">CREAR CUENTA</button>
                </div>
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
                <label>&copy; 2023 TVmaze.com</label>
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
