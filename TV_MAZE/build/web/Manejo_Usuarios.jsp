<%-- 
    Document   : Manejo_Usuarios
    Created on : 22 nov 2023, 18:00:45
    Author     : FZ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manejo Usuarios</title>
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
            if (request.getParameter("Codigo") != null) {
                //Validar ELIMINAR ADMIN
                if (request.getParameter("Rol").equals("AL")) {
                    out.print("<script>alert('¡NO SE PERMITE ELIMINAR AL ADMINISTRADOR!');</script>");
                } else {
                    try {
                        //Conectar
                        Dba DB = new Dba(application.getRealPath("") + "/daw.mdb");
                        DB.conectar();
                        //Sentencia SQL
                        DB.query.executeUpdate("DELETE FROM Usuarios WHERE Codigo='"
                                + request.getParameter("Codigo") + "'");
                        DB.commit();
                        DB.desconectar();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        %>

        <!-- HEADER -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="HOME.jsp">HOME</a>
                <a href="Crear_Cuenta_ADMIN.jsp">CREAR CUENTA</a>
                <a href="G_REP_USR.jsp">GENERAR REPORTE</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESION</a>
            </nav>
        </header>
        <table>
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>CORREO</th>
                    <th>ROL</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%                    try {
                        //Conexion Base de Datos
                        Dba DB = new Dba(application.getRealPath("") + "/daw.mdb");
                        DB.conectar();
                        //Sentencia SQL
                        DB.query.execute("select Codigo,Nombre,Apellido,Correo,Rol,Password from Usuarios");
                        ResultSet rs = DB.query.getResultSet();

                        //Tabla
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td>
                        <a href="Manejo_Usuarios.jsp?Codigo=<%=rs.getString(1)%>&Rol=<%=rs.getString(5)%>">Eliminar</a>
                        <a href="Modificar_Usuarios.jsp?Codigo=<%=rs.getString(1)%>&Nombre=<%=rs.getString(2)%>&Apellido=<%=rs.getString(3)%>&Correo=<%=rs.getString(4)%>&Rol=<%=rs.getString(5)%>&Password=<%=rs.getString(6)%>">Actualizar</a>  
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
