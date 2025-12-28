import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/initDB")
public class DatabaseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby:studentDB;create=true", "", "");
            
            Statement stmt = conn.createStatement();
            
            String createTableSQL = "CREATE TABLE profiles (" +
                "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)," +
                "name VARCHAR(100) NOT NULL," +
                "student_id VARCHAR(20) UNIQUE NOT NULL," +
                "program VARCHAR(100) NOT NULL," +
                "email VARCHAR(100) NOT NULL," +
                "hobbies VARCHAR(500)," +
                "self_intro CLOB," +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                ")";
            
            try {
                stmt.executeUpdate(createTableSQL);
                response.getWriter().println("Database and table created successfully!");
            } catch (Exception e) {
                response.getWriter().println("Table already exists or error: " + e.getMessage());
            }
            
            conn.close();
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}