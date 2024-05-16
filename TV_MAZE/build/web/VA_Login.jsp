<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    try {
        //Conectar BD
        Dba db = new Dba(application.getRealPath("")+"/daw.mdb");
        db.conectar();
        //Sentencia SQL
        db.query.execute("SELECT Correo,Password,Rol,Codigo FROM Usuarios");
        ResultSet rs = db.query.getResultSet();
        
        //Variables Intermedias
        boolean val = false;
        String Rol = "";
        String Code_US = "";
        
        //Bucle
        while (rs.next()) {                
            if (request.getParameter("Email").equals(rs.getString(1))&&
            request.getParameter("Password").equals(rs.getString(2))) {
                Rol=rs.getString(3);
                Code_US = rs.getString(4);
                val = true;
                break; //Salir Interacion
            }
        }
        
        //Validaciones
        if (val) {
            //Session Information
            session.setAttribute("S_User", request.getParameter("Email"));
            session.setAttribute("S_Pass", request.getParameter("Password"));
            session.setAttribute("S_Rol", Rol);
            session.setAttribute("S_Code", Code_US); 
            //Send HOME PAGE          
            request.getRequestDispatcher("HOME.jsp").forward(request, response);

        }else{
            //Go Login
            out.print("<script>alert('Crendenciales Invalidas!');"
            + " window.location.href='Login_US.jsp'; </script>");
        }
        //Disconect
        db.desconectar();   
    } catch (Exception e) {
        e.printStackTrace();
    }


%>