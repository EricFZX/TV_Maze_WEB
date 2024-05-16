<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    try {
        //Connect BD
        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();
        //SQL Sentence
        db.query.execute("Select Correo FROM Usuarios");
        ResultSet rs = db.query.getResultSet();

        //Intermedian Variables
        boolean val = false;
        String Destine = "";

        //Validate Email (Exist on BD)
        while (rs.next()) {
            if (request.getParameter("Email").equals(rs.getString(1))) {
                Destine = rs.getString(1);
                val = true;
                break; //Out of Bucle
            }
        }

        if (val) {
            //Set Properties Email
            String Sender = "ericfunez2005@gmail.com";
            String Pass = "sget mrwm gewd xdbh";

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.user", Sender);
            props.put("mail.smtp.clave", Pass);

            //Create Connection
            javax.mail.Session s = javax.mail.Session.getDefaultInstance(props);
            //Create Message
            MimeMessage mensaje = new MimeMessage(s);

            //Generate Random Password (8 Characters only letters)
            Random random = new Random();
            String New_Pass = "";
            for (int i = 0; i < 8; i++) {
                New_Pass += (char) (random.nextInt(26) + 97);
            }

            //Update Password on BD
            int Validation = db.query.executeUpdate("UPDATE Usuarios SET Password='"
                    + New_Pass + "' WHERE Correo='" + Destine + "'");

            //Content Message
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(Destine));
            mensaje.setSubject("Password Recover TV-MAZE");
            //Add Message
            mensaje.setText("Estimado usuario por este medio le notificamos que su contraseña a sido restablecida. Su nueva contraseña es:" + New_Pass);

            mensaje.setFrom(new InternetAddress(Sender));

            //Protocol SMTP
            Transport transport = s.getTransport("smtp");
            transport.connect("smtp.gmail.com", Sender, Pass);
            transport.sendMessage(mensaje, mensaje.getAllRecipients());
            transport.close();

            //Validate Update
            if (Validation >= 1) {
                out.print("<script>alert('CONTRASEÑA RESTABLECIDA (REVISAR CORREO)');"
                        + "window.location.href='Login_US.jsp'; </script>");
            }

        } else {
            //Send Back Invalid Credentials
            out.print("<script>alert('¡Crendenciales Invalidas!');"
                    + "window.location.href='Pass_Recovery.jsp'; </script>");
        }
        db.commit();
        db.desconectar();

    } catch (Exception e) {
        e.printStackTrace();
    }


%>
