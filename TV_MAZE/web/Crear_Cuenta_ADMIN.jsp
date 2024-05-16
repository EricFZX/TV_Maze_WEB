<%-- 
    Document   : Crear_Cuenta_ADMIN
    Created on : 12-10-2023, 10:22:18 PM
    Author     : FZ
--%>

<%@page import="database.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Cuenta</title>
        <link rel="stylesheet" href="FORMS_CS.css"/>
    </head>
    <body>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>
        <%            if (request.getParameter("BTN-CREAR") != null) {
                try {
                    //Connect DBA
                    Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                    db.conectar();

                    //Middle Variables
                    String Codigo = request.getParameter("Codigo");
                    String Nombre = request.getParameter("Nombre");
                    String Apellido = request.getParameter("Apellido");
                    String Correo = request.getParameter("Correo");
                    String Password = request.getParameter("Password");

                    //Validation SET TRUE
                    boolean VA = true;
                    String AL_ID = "Crendenciales ya existentes:";

                    //Validate UNIQUE CODE, UNIQUE Correo
                    db.query.execute("SELECT Codigo,Correo FROM Usuarios");
                    ResultSet rs = db.query.getResultSet();

                    while (rs.next()) {
                        if (rs.getString(1).equals(Codigo)) {
                            AL_ID += "CODIGO";
                            VA = false;
                            break;
                        } else if (rs.getString(2).equals(Correo)) {
                            AL_ID += "CORREO";
                            VA = false;
                            break;
                        }
                    }

                    if (VA) {
                        //Insert User into DB
                        int VA_BD = db.query.executeUpdate("INSERT INTO Usuarios (Codigo,Nombre,Apellido,Correo,Rol,Password)"
                                + " values('" + Codigo + "','" + Nombre + "','" + Apellido + "','" + Correo + "','CL','" + Password + "')");

                        //Validation
                        if (VA_BD >= 1) {
                            out.print("<script>alert('USUARIO CREADO!');"
                                    + "window.location.href='Manejo_Usuarios.jsp';</script>");
                        }
                    } else {
                        out.print("<script>alert('" + AL_ID + "!');"
                                + "window.location.href='Crear_Cuenta_ADMIN.jsp';</script>");
                    }

                    //Disconnect
                    db.commit();
                    db.desconectar();
                } catch (Exception e) {
                }
            }
        %>
        <!-- NAV -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>

                <a href="Manejo_Usuarios.jsp">MANEJO USUARIOS</a>
                <a href="index.jsp#FAQ">CERRAR SESIÓN</a>
            </nav>
        </header>
        <!-- LOGIN FORM -->
        <section class="left-PG IMG-2">
            <div class="left-CENTER">
            </div>
        </section>
        <section class="right-PG">
            <form action="Crear_Cuenta_ADMIN.jsp" method="post">
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

                
                <div class="SE">
                    <button type="submit" name="BTN-CREAR">CREAR CUENTA</button>
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
