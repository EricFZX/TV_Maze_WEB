<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%

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
                + "window.location.href='Login_US.jsp';</script>");
            }
        } else {
            out.print("<script>alert('"+AL_ID+"!');"
            + "window.location.href='Crear_Cuenta.jsp';</script>");
        }

        //Disconnect
        db.commit();
        db.desconectar();
    } catch (Exception e) {
    }

%>