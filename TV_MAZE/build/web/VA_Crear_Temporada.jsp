<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    //CONNECT DB
    Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
    db.conectar();

    //Variables
    String Codigo = request.getParameter("Codigo");
    String Codigo_Serie = request.getParameter("Code-Serie");
    String Nombre = request.getParameter("Nombre");
    String EP_CR = request.getParameter("Crear_EP");

    //Validate UNIQUE CODE
    db.query.execute("SELECT Codigo FROM Temporadas");
    ResultSet rs = db.query.getResultSet();
    while (rs.next()) {
        if (rs.getString(1).equals(Codigo)) {
            out.print("<script>alert('CODIGO YA EXISTENTE');"
                    + "window.location.href='Crear_Temporada.jsp';</script>");
            return; //Break CODE
        }
    }
    //Insert Code INTO DB
    int VA = db.query.executeUpdate("INSERT INTO Temporadas (Codigo,Codigo_Serie,Nombre) values"
            + " ('" + Codigo + "','" + Codigo_Serie + "','" + Nombre + "')");

    //SQL CONFIRMATION
    out.print("<script>alert('TEMPORADA CREADA CON EXITO');</script>");

    //WHERE TO GO
    if (EP_CR.equals("S")) {
        out.print("<script>window.location.href='Crear_Episodios.jsp';</script>");
    } else {
        out.print("<script>window.location.href='HOME.jsp';</script>");
    }
    db.commit();
    db.desconectar();
%>