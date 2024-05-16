<%@page import="com.lowagie.text.PageSize"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="database.Dba"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%
    try {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"Reporte_Series.pdf\"");
        //CONNECT
        Document PDF = new Document(PageSize.A4.rotate());
        PdfWriter.getInstance(PDF, response.getOutputStream());
        PDF.open();

        //Agregar Informacion Documento
        PDF.addAuthor("Eric Funez");
        PDF.addCreator("Eric Funez");
        PDF.addSubject("Reporte Series");
        PDF.addCreationDate();

        //Conectar Base de datos
        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();

        //Crear Tabla
        PdfPTable Table = new PdfPTable(4);

        //Agregar Logo Con HTML
        HTMLWorker htmlWorker = new HTMLWorker(PDF);
        String Logo = "<html><head></head><body>"
                + "<img src='https://static.tvmaze.com/images/tvm-header-logo.png' width='120px'>";
        htmlWorker.parse(new StringReader(Logo));

        //Agregar Informacion
        PDF.add(new Paragraph("REPORTE SISTEMA TV-MAZE"));
        PDF.add(new Paragraph(new Date().toString()));
        PDF.add(new Paragraph("\n"));

        //Tabla de Reporte Series
        PDF.add(new Paragraph("Series"));
        PDF.add(new Paragraph("\n"));
        //Formato Tabla de Series
        Table.addCell("CODIGO");
        Table.addCell("NOMBRE");
        Table.addCell("RESUMEN");
        Table.addCell("GENERO");
        //Sentencia SQL
        db.query.execute("SELECT Codigo,Nombre,Resumen,Genero FROM Series");
        ResultSet rs = db.query.getResultSet();
        while (rs.next()) {
            Table.addCell(rs.getString(1));
            Table.addCell(rs.getString(2));
            Table.addCell(rs.getString(3));
            Table.addCell(rs.getString(4));
        }

        PDF.add(Table);
        PDF.add(new Paragraph("\n"));
        Table = new PdfPTable(3);

        PDF.add(new Paragraph("Temporadas"));
        PDF.add(new Paragraph("\n"));
        Table.addCell("CODIGO");
        Table.addCell("CODIGO-SERIE");
        Table.addCell("NOMBRE");
        db.query.execute("SELECT Codigo,Codigo_Serie,Nombre FROM Temporadas");
        rs = db.query.getResultSet();
        while (rs.next()) {
            Table.addCell(rs.getString(1));
            Table.addCell(rs.getString(2));
            Table.addCell(rs.getString(3));
        }

        PDF.add(Table);
        PDF.add(new Paragraph("\n"));
        Table = new PdfPTable(3);

        PDF.add(new Paragraph("Episodios"));
        PDF.add(new Paragraph("\n"));
        Table.addCell("CODIGO");
        Table.addCell("CODIGO-SERIE");
        Table.addCell("CODIGO-TEMPORADA");
        Table.addCell("NOMBRE");
        Table.addCell("DURACION");
        db.query.execute("SELECT Codigo,Codigo_Serie,Codigo_Temporada,Nombre,Duracion FROM Episodio");
        rs = db.query.getResultSet();
        while (rs.next()) {
            Table.addCell(rs.getString(1));
            Table.addCell(rs.getString(2));
            Table.addCell(rs.getString(3));
            Table.addCell(rs.getString(4));
            Table.addCell(rs.getString(5));
        }
        PDF.add(Table);
        PDF.close();
        db.desconectar();
    } catch (Exception e) {
    }
%>