

<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="java.util.Date"%>
<%@page import="com.lowagie.text.Font"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page import="com.lowagie.text.pdf.PdfTable"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=\"Reporte_Usuarios.pdf\"");

    try {
        Document PDF = new Document();
        PdfWriter.getInstance(PDF, response.getOutputStream());
        PDF.open();

        //Agregar Informacion Documento
        PDF.addAuthor("Eric Funez");
        PDF.addCreator("Eric Funez");
        PDF.addSubject("Reporte Usuarios");
        PDF.addCreationDate();
        
        //Conectar Base de datos
        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();
        db.query.execute("SELECT Codigo,Nombre,Apellido,Correo,Rol FROM Usuarios");
        ResultSet rs = db.query.getResultSet();
        
        //Crear Tabla Usuarios
        PdfPTable Table = new PdfPTable(5);
        
        //Agregar Logo Con HTML
        HTMLWorker htmlWorker = new HTMLWorker(PDF);
        String Logo= "<html><head></head><body>"+
        "<img src='https://static.tvmaze.com/images/tvm-header-logo.png' width='120px'>";
        htmlWorker.parse(new StringReader(Logo));
        
        //Agregar Informacion
        PDF.add(new Paragraph("Reporte Usuarios TV-MAZE"));
        PDF.add(new Paragraph(new Date().toString()));
        PDF.add(new Paragraph("\n"));
        
        //Agregar Formato a la Tabla
        Table.addCell("CODIGO");
        Table.addCell("NOMBRE");
        Table.addCell("APELLIDO");
        Table.addCell("CORREO");
        Table.addCell("ROL");
        //Funcion Repetitiva Para Tabla
        while (rs.next()) {
            Table.addCell(rs.getString(1));
            Table.addCell(rs.getString(2));
            Table.addCell(rs.getString(3));
            Table.addCell(rs.getString(4));
            Table.addCell(rs.getString(5));
        }
        db.desconectar();
        PDF.add(Table);
        PDF.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>