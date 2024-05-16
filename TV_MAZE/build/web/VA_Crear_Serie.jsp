<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    try {
        //Connect DBA
        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();
        //Get Parameters
        String Codigo = request.getParameter("Codigo");
        String Nombre = request.getParameter("Nombre");
        String Resumen = request.getParameter("Resumen");
        String Imagen = request.getParameter("Imagen");
        String Genero = request.getParameter("Genero");
        String TEMP = request.getParameter("CR_TEMP");

        //Verify Unique CODE SERIES
        db.query.execute("SELECT Codigo FROM Series");
        ResultSet rs = db.query.getResultSet();
        while (rs.next()) {
            if (rs.getString(1).equals(Codigo)) {
                out.print("<script>alert('CODIGO YA EXISTENTE');"
                        + "window.location.href='Crear_Serie.jsp';</script>");
                return; //Break CODE
            }
        }
        if (Imagen.equals("")) {
            Imagen="https://th.bing.com/th/id/R.71b6f7edf13edb00337ca82ca7ae08f0?rik=yqiSMvDd%2fbFk9Q&pid=ImgRaw&r=0";
        }
        
        //SQL Sentence
        db.query.executeUpdate("INSERT INTO Series (Codigo,Nombre,Resumen,Imagen,Genero) values "
                + "('" + Codigo + "','" + Nombre + "','" + Resumen + "','" + Imagen + "','" + Genero + "')");
        //Show Message Complete SQL
        out.print("<script>alert('SERIE CREADA CON EXITO');</script>");

        //Where to GO
        if (TEMP.equals("S")) {
            out.print("<script>window.location.href='Crear_Temporada.jsp';</script>");
        } else {
            out.print("<script>window.location.href='HOME.jsp';</script>");
        }
        //Disconnect
        db.commit();
        db.desconectar();
    } catch (Exception e) {
    } finally {
    }
    

%>