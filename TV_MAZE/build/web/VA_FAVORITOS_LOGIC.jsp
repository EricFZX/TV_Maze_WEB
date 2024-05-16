<%@page import="database.Dba"%>
<%
    try {
        //SQL CONNECT
        Dba db = new Dba(application.getRealPath("")+"/daw.mdb");
        db.conectar();
        //Obtain Parameters
        String Codigo = request.getParameter("Codigo");
        String Codigo_User = request.getParameter("Codigo_USER");
        String Accion = request.getParameter("Accion");
        
        //Conditional
        if (Accion.equals("ELM")) {
                //SENTENCE ELIMINATE
                db.query.executeUpdate("DELETE FROM Favoritos WHERE Codigo_Serie='"+Codigo+"' and Codigo_Cliente='"+Codigo_User+"'");
        }else if(Accion.equals("AGR")){
                //SENTENCE INSERT
                db.query.executeUpdate("INSERT INTO Favoritos (Codigo_Serie,Codigo_Cliente) values('"+Codigo+"','"+Codigo_User+"')");                               
    }
        request.getRequestDispatcher("SERIE_INFO.jsp?Codigo="+Codigo).forward(request, response);
        db.desconectar();
        
    } catch (Exception e) {
    } 

%>