<%-- 
    Document   : SERIE_INFO
    Created on : 29 nov 2023, 12:22:53 a. m.
    Author     : FZ
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            //CONNECT DB
            Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
            db.conectar();
            //Variables to USE
            String Codigo = request.getParameter("Codigo");
            //SQL SENTENCE
            db.query.execute("SELECT Codigo,Nombre,Resumen,Imagen,Genero FROM Series WHERE Codigo='" + Codigo + "'");
            ResultSet rs = db.query.getResultSet();
            //INFO VARIABLES
            String Nombre = "";
            String Resumen = "";
            String Imagen = "";
            String Genero = "";

            while (rs.next()) {
                Nombre = rs.getString(2);
                Resumen = rs.getString(3);
                Imagen = rs.getString(4);
                Genero = rs.getString(5);

    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=Nombre%></title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORM_HOME.css"/>
    </head>
    <body>
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav class="nav">
                <%
                    if (session.getAttribute("S_Rol").equals("AL")) {
                %>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <%}%>
                <a href="HOME.jsp">HOME</a>
                <a href="Lista_Favorito.jsp">LISTA FAVORITOS</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>                
            </nav>
        </header>

        <section class="CONTAINER CONT">
            <div class="TEXT-CE">
                <div class="TEXT-CT">
                    <h2><%=Nombre%></h2>
                    <h3>RESUMEN</h3>
                    <p><%=Resumen%></p>
                    <h3>GENERO</h3>
                    <p><%=Genero%></p>
                    <h3>TEMPORADAS</h3>
                    <form action="">
                        <select name="TEMP-INFO" id="TEMP-INFO" onchange="cambiarURL(this.form)">
                            <option value="null"></option>
                            <%
                                }
                                db.query.execute("SELECT Codigo,Nombre FROM Temporadas WHERE Codigo_Serie='" + Codigo + "'");
                                rs = db.query.getResultSet();
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                            <%}%>      
                        </select>
                        <input type="text" name="Codigo" id="Codigo" value="<%=Codigo%>" hidden>
                    </form>
                    <br>
                    <h3>EPISODIOS</h3>
                    <%
                        if (request.getParameter("TEMP-INFO") != null) {
                        //DBA SENTENCE
                        db.query.execute("SELECT Nombre FROM Episodio WHERE Codigo_Serie='" + Codigo + "' AND Codigo_Temporada='" + request.getParameter("TEMP-INFO") + "'");
                        rs = db.query.getResultSet();
                    %>
                    <ul>
                        <%while(rs.next()){%>
                        <li><%=rs.getString(1)%></li>
                        <%}%>
                    </ul>
                    <%}%>
                    <br>

                    <%
                        db.query.execute("SELECT Codigo_Serie,Codigo_Cliente FROM Favoritos WHERE Codigo_Serie='" + Codigo + "' and Codigo_Cliente='" + session.getAttribute("S_Code") + "'");
                        rs = db.query.getResultSet();
                        boolean FA = false;
                        while (rs.next()) {
                            if (rs.getString(1).equals(Codigo) && rs.getString(2).equals(session.getAttribute("S_Code"))) {
                                FA = true;
                                break;
                            }
                        }
                        //FAVORITOS
                        if (FA) {
                    %>
                    <a href="VA_FAVORITOS_LOGIC.jsp?Codigo=<%=Codigo%>&Codigo_USER=<%=session.getAttribute("S_Code")%>&Accion=ELM">ELIMINAR</a>
                    <%} else {%>
                    <a href="VA_FAVORITOS_LOGIC.jsp?Codigo=<%=Codigo%>&Codigo_USER=<%=session.getAttribute("S_Code")%>&Accion=AGR">AGREGAR</a>
                    <%}%>
                </div>
            </div>
            <div class="CONTENT-CE">
                <div class="CONTENT-CT">
                    <img src="<%=Imagen%>"
                         alt="">
                </div>
            </div>
        </section>
        <script>
            //Funcion Setear Nuevamente un value predeterminado sin hacer el evento on change 
            var parametroCode_Serie = '<%= request.getParameter("TEMP-INFO")%>'; // Asegúrate de que sea una cadena de texto
            var miSelect = document.getElementById('TEMP-INFO');

            for (var i = 0; i < miSelect.options.length; i++) {
                if (miSelect.options[i].value === parametroCode_Serie) {
                    miSelect.selectedIndex = i;
                    break;
                }
            }
            function cambiarURL(formulario) {
                // Cambia la acción del formulario
                formulario.action = "/TV_MAZE/SERIE_INFO.jsp";
                // Envía el formulario automáticamente
                formulario.submit();
            }
        </script> 
        <%

                db.desconectar();
            } catch (SQLException E) {
                E.printStackTrace();
            }
        %>


    </body>
</html>
