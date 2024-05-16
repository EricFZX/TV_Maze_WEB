<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    try {
        //Connect DB
        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();

        //Intermedian Variables
        String Codigo = request.getParameter("Codigo");
        String Codigo_Serie = request.getParameter("Code-Serie");
        String Codigo_Temporada = request.getParameter("Temporada_ID");
        String Nombre = request.getParameter("Nombre");
        String Duracion = request.getParameter("Duracion");
        String Resumen = request.getParameter("Resumen");

        if (Codigo_Serie.equals("") || Codigo_Temporada.equals("")) {
            out.print("<script>alert('NO SE PERMITEN CAMPOS VACIOS EN LOS SELECT');"
                    + "window.location.href='Crear_Episodios.jsp';</script>");
            return; //Break CODE 
        }

        //VALIDATE UNIQUE CODE
        db.query.execute("SELECT Codigo FROM Episodio");
        ResultSet rs = db.query.getResultSet();
        while (rs.next()) {
            if (rs.getString(1).equals(Codigo)) {
                out.print("<script>alert('CODIGO YA EXISTENTE');"
                        + "window.location.href='Crear_Episodios.jsp';</script>");
                return; //Break CODE  
            }
        }

        //Insert Episodes into DB
        int VA = db.query.executeUpdate("INSERT INTO Episodio (Codigo,Codigo_Serie,CODIGO_Temporada,Nombre,Duracion,Resumen) values"
                + " ('" + Codigo + "','" + Codigo_Serie + "','" + Codigo_Temporada + "','" + Nombre + "','" + Duracion + "','" + Resumen + "')");

        //VALIDATE SQL Update
        if (VA >= 1) {
            out.print("<script>alert('EPISODIO CREADO CON EXITO');"
                    + "window.location.href='HOME.jsp';</script>");
        }
        db.desconectar();
        db.commit();
    } catch (SQLException E) {
        E.printStackTrace();
    } finally {
    }


%>