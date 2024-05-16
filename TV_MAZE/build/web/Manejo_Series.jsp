<%-- 
    Document   : Manejo_Series
    Created on : 12-09-2023, 04:12:17 PM
    Author     : FZ
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manejo Series</title>
        <link rel="stylesheet" href="Tablas_MOD.css"/>
    </head>
    <body>
        <%
            //VALIDATE ONLY ADMIN CAN ENTER
            HttpSession Mi_session = request.getSession();
            if (Mi_session == null || Mi_session.getAttribute("S_User") == null) {
                request.getRequestDispatcher("Login_US.jsp").forward(request, response);
            } else if (Mi_session.getAttribute("S_Rol").equals("CL")) {
                //Validate ROL
                request.getRequestDispatcher("HOME.jsp").forward(request, response);
            }
        %>
        <%
            try {
                //Connect DBA
                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                db.conectar();

                if (request.getParameter("ELM_SRS") != null) {
                    //DELETE FROM FAVORITE LIST RELATED TO SERIES
                    db.query.executeUpdate("DELETE FROM FAVORITOS WHERE Codigo_Serie='"+request.getParameter("Codigo_SRS")+"'");
                    //DELETE EPISODES RELATED TO SERIES
                    db.query.executeUpdate("DELETE FROM Episodio WHERE Codigo_Serie='" + request.getParameter("Codigo_SRS") + "'");
                    //DELETE SEASON REALTED TO SERIES
                    db.query.executeUpdate("DELETE FROM  Temporadas WHERE Codigo_Serie='" + request.getParameter("Codigo_SRS") + "'");
                    //DELETE SERIES
                    db.query.executeUpdate("DELETE FROM Series WHERE Codigo='" + request.getParameter("Codigo_SRS") + "'");
                }

                //ELIMINATE SEASON
                if (request.getParameter("ELM_TEMP") != null) {
                    //DELETE EPISODES RELATED TO SEASON
                    db.query.executeUpdate("DELETE FROM Episodio WHERE Codigo_Temporada='" + request.getParameter("Codigo_TEMP") + "'");
                    //DELETE SEASON
                    db.query.executeUpdate("DELETE FROM  Temporadas WHERE Codigo='" + request.getParameter("Codigo_TEMP") + "'");
                }

                //ELIMINATE EPISODE
                if (request.getParameter("ELM_EPS") != null) {
                    db.query.executeUpdate("DELETE FROM Episodio WHERE Codigo='" + request.getParameter("Codigo_EPS") + "'");
                }
                db.commit();
                db.desconectar();
            } catch (SQLException E) {
                E.printStackTrace();
            }


        %>



        <!-- HEADER -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="HOME.jsp">HOME</a>
                <a href="G_REP_SRS.jsp">GENERAR REPORTE</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESION</a>
            </nav>
        </header>
        <%       try {
                //CONNECT DBA
                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                db.conectar();
                //OBTAIN PARAMETERS FROM SERIES
                db.query.execute("SELECT Codigo,Nombre,Resumen,Genero,Imagen FROM Series");
                ResultSet rs = db.query.getResultSet();
        %>
        <h2>SERIES</h2>
        <table>
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>NOMBRE</th>
                    <th>RESUMEN</th>
                    <th>GENERO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td style="width: 50%"><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td>
                        <%
                            //Codificar RESUMEN
                            String Resumen = URLEncoder.encode(rs.getString(3), "UTF-8");
                        %>


                        <a href="Manejo_Series.jsp?ELM_SRS=true&Codigo_SRS=<%=rs.getString(1)%>">ELIMINAR</a>
                        <a href="Modificar_Serie.jsp?Codigo=<%=rs.getString(1)%>&Nombre=<%=rs.getString(2)%>&Resumen=<%=Resumen%>&Genero=<%=rs.getString(4)%>&Imagen=<%=rs.getString(5)%>">ACTUALIZAR</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%
            //OBTAIN PARAMETERS FROM TEMPORADAS
            db.query.execute("SELECT Codigo,Codigo_Serie,Nombre FROM Temporadas");
            rs = db.query.getResultSet();
        %>
        <h2>TEMPORADAS</h2>
        <table>
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>CODIGO SERIE</th>
                    <th>NOMBRE</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td>
                        <a href="Manejo_Series.jsp?ELM_TEMP=true&Codigo_TEMP=<%=rs.getString(1)%>">ELIMINAR</a>
                        <a href="Modificar_Temporada.jsp?Codigo=<%=rs.getString(1)%>&Nombre=<%=rs.getString(3)%>">ACTUALIZAR</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%
            //OBTAIN PARAMETERS FROM EPISODIOS
            db.query.execute("SELECT Codigo,Codigo_Serie,Codigo_Temporada,Nombre,Duracion,Resumen FROM Episodio");
            rs = db.query.getResultSet();
        %>
        <h2>EPISODIOS</h2>
        <table>
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>CODIGO SERIE</th>
                    <th>CODIGO TEMPORADA</th>
                    <th>NOMBRE</th>
                    <th>DURACION</th>
                    <th>RESUMEN</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td style="width: 45%"><%=rs.getString(6)%></td>
                    <td>
                        <%
                            //Codificar RESUMEN
                            String Resumen = URLEncoder.encode(rs.getString(6), "UTF-8");
                        %>
                        <a href="Manejo_Series.jsp?ELM_EPS=true&Codigo_EPS=<%=rs.getString(1)%>">ELIMINAR</a>
                        <a href="Modificar_Episodio.jsp?Codigo=<%=rs.getString(1)%>&Codigo_Serie=<%=rs.getString(2)%>&Codigo_Temporada=<%=rs.getString(3)%>&Nombre=<%=rs.getString(4)%>&Duracion=<%=rs.getString(5)%>&Resumen=<%=Resumen%>">ACTUALIZAR</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%
                db.desconectar();
            } catch (SQLException E) {
                E.printStackTrace();
            }
        %>
    </body>
</html>
