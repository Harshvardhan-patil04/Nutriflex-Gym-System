<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page import="com.itextpdf.text.pdf.draw.LineSeparator" %>


<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=Health_Report.pdf");

    // Create PDF document
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();

    PdfWriter writer = PdfWriter.getInstance(document, baos);

    // Add watermark
    writer.setPageEvent(new PdfPageEventHelper() {
        public void onEndPage(PdfWriter writer, Document document) {
            PdfContentByte canvas = writer.getDirectContentUnder();
            Font watermarkFont = new Font(Font.FontFamily.HELVETICA, 42, Font.BOLD, new BaseColor(220, 220, 220));
            Phrase watermark = new Phrase("NutriFlex Gym", watermarkFont);
            ColumnText.showTextAligned(canvas, Element.ALIGN_CENTER, watermark,
                (document.right() + document.left()) / 2, 
                (document.top() + document.bottom()) / 2, 45);
        }
    });

    document.open();

    try {
        double height = Double.parseDouble(request.getParameter("height"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        double bmi = weight / Math.pow(height / 100.0, 2);
        String condition = (bmi < 18.5) ? "Underweight" : (bmi < 24.9) ? "Normal" : (bmi < 29.9) ? "Overweight" : "Obese";

        // Fonts
        Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
        Font sectionFont = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLUE);
        Font bodyFont = new Font(Font.FontFamily.HELVETICA, 12);

        // Brand Logo
        String logoPath = application.getRealPath("/images/mainlogo.jpeg");
        Image logo = Image.getInstance(logoPath);
        logo.scaleToFit(100, 100);
        logo.setAlignment(Image.ALIGN_CENTER);
        document.add(logo);

        // Title
        Paragraph title = new Paragraph(" User Health Report", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // User Info
        document.add(new Paragraph(" Username: " + username, bodyFont));
        document.add(new Paragraph(" Height: " + height + " cm", bodyFont));
        document.add(new Paragraph(" Weight: " + weight + " kg", bodyFont));
        document.add(new Paragraph(String.format(" BMI: %.2f (%s)", bmi, condition), bodyFont));
        document.add(Chunk.NEWLINE);
        document.add(new LineSeparator());
        document.add(Chunk.NEWLINE);

        // DB Connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");

        // Diet Section
        Paragraph dietHeader = new Paragraph(" Diet Plan", sectionFont);
        dietHeader.setSpacingAfter(10);
        document.add(dietHeader);

        PreparedStatement dietStmt = con.prepareStatement("SELECT day, date, meal, calories FROM diet WHERE username=?");
        dietStmt.setString(1, username);
        ResultSet dietRs = dietStmt.executeQuery();

        boolean dietFound = false;
        while (dietRs.next()) {
            dietFound = true;
            document.add(new Paragraph(
                " Day: " + dietRs.getString("day") +
                ",  Date: " + dietRs.getString("date") +
                "\n Meal: " + dietRs.getString("meal") +
                ",  Calories: " + dietRs.getString("calories"),
                bodyFont
            ));
            document.add(Chunk.NEWLINE);
        }
        if (!dietFound) {
            document.add(new Paragraph("No diet plan assigned.", bodyFont));
            document.add(Chunk.NEWLINE);
        }

        document.add(new LineSeparator());
        document.add(Chunk.NEWLINE);

        // Workout Section
        Paragraph workoutHeader = new Paragraph(" Workout Plan", sectionFont);
        workoutHeader.setSpacingAfter(10);
        document.add(workoutHeader);

        PreparedStatement workoutStmt = con.prepareStatement("SELECT day, date, excer, dura, note FROM workout WHERE username=?");
        workoutStmt.setString(1, username);
        ResultSet workoutRs = workoutStmt.executeQuery();

        boolean workoutFound = false;
        while (workoutRs.next()) {
            workoutFound = true;
            document.add(new Paragraph(
                " Day: " + workoutRs.getString("day") +
                ",  Date: " + workoutRs.getString("date") +
                "\n Exercise: " + workoutRs.getString("excer") +
                ",  Duration: " + workoutRs.getString("dura") +
                "\n Note: " + workoutRs.getString("note"),
                bodyFont
            ));
            document.add(Chunk.NEWLINE);
        }
        if (!workoutFound) {
            document.add(new Paragraph("No workout plan assigned.", bodyFont));
        }

        con.close();

    } catch (Exception e) {
        document.add(new Paragraph(" Error generating report: " + e.getMessage()));
    }

    document.close();

    // Write PDF to output stream
    OutputStream os = response.getOutputStream();
    baos.writeTo(os);
    os.flush();
%>
