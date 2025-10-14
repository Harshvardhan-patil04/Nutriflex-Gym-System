<%@ page import="java.sql.*, java.net.*, java.io.*" %>

<%
    String feedback = request.getParameter("feedbacks");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String rating = request.getParameter("rating");

    PrintWriter outStream = response.getWriter(); // For debugging

    String sentiment = "Neutral"; // Default fallback

    try {
        // 1. Connect to Flask Sentiment API
        URL url = new URL("http://localhost:5000/sentiment");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoOutput(true);

        String jsonInput = "{\"text\": \"" + feedback.replace("\"", "\\\"") + "\"}";

        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInput.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
        StringBuilder responseText = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseText.append(line.trim());
        }

        String result = responseText.toString();
        int start = result.indexOf(":\"") + 2;
        int end = result.indexOf("\"", start);
        if (start > 1 && end > start) {
            sentiment = result.substring(start, end);
        }
    } catch (Exception e) {
        sentiment = "Error"; // If Flask server isn't running
    }

    try {
        // 2. JDBC MySQL Connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback", "root", "");

        // 3. Insert feedback along with sentiment
        String query = "INSERT INTO feedbacks (name, email, rating, message, sentiment) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, rating);
        pstmt.setString(4, feedback);
        pstmt.setString(5, sentiment);

        int rows = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        if (rows > 0) {
%>
<script>
    alert('Feedback submitted successfully!');
    window.location.href = 'index.jsp';
</script>
<%
        } else {
            outStream.println("<h3 style='color: red;'> Failed to submit feedback! Please try again.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        outStream.println("<h3 style='color: red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
