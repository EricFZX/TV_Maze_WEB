<%-- 
    Document   : Lista_Favorito
    Created on : 30 nov 2023, 7:38:04 p. m.
    Author     : FZ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Tablas_MOD.css"/>
    </head>
    <body>
    <body>
        <%
            //VALIDATE SESSION
            HttpSession Mi_session = request.getSession();
            if (Mi_session == null || Mi_session.getAttribute("S_User") == null) {
                request.getRequestDispatcher("Login_US.jsp").forward(request, response);
            }
        %>

        <!-- HEADER -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <%
                    if (session.getAttribute("S_Rol").equals("AL")) {
                %>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <%}%>
                <a href="HOME.jsp">HOME</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>
        <table>
            <thead>
                <tr>
                    <th>NOMBRE SERIE</th>
                    <th>IMAGEN</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        //Conexion Base de Datos
                        Dba DB = new Dba(application.getRealPath("") + "/daw.mdb");
                        DB.conectar();
                        //Sentencia SQL
                        DB.query.execute("SELECT A.Codigo_Serie,A.Codigo_Cliente,B.Codigo,B.Nombre,B.Imagen FROM Favoritos AS A, Series AS B WHERE A.Codigo_Serie=B.Codigo and A.Codigo_Cliente='" + session.getAttribute("S_Code") + "'");
                        ResultSet rs = DB.query.getResultSet();
                        //Tabla
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(4)%></td>

                    <td>
                        <div class="IMG-FL">
                            <a href="SERIE_INFO.jsp?Codigo=<%=rs.getString(3)%>">
                            <img src="<%=rs.getString(5)%>" alt="alt"/>
                        </a>
                        </div>
                    </td>
                </tr>
                <%
                        }
                        DB.desconectar();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
