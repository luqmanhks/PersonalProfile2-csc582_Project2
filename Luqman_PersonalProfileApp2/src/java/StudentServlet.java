import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProfileBean;
import util.DBUtil;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "create":
                createProfile(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateProfile(request, response);
                break;
            case "delete":
                deleteProfile(request, response);
                break;
            case "view":
                viewProfile(request, response);
                break;
            case "search":
                searchProfiles(request, response);
                break;
            case "filter":
                filterProfiles(request, response);
                break;
            default:
                listProfiles(request, response);
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    private void listProfiles(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<ProfileBean> profiles = DBUtil.getAllProfiles();
        List<String> programs = DBUtil.getDistinctPrograms();
        
        request.setAttribute("students", profiles);
        request.setAttribute("programs", programs);
        request.getRequestDispatcher("listRegistrations.jsp").forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("registrationForm.jsp").forward(request, response);
    }
    
    private void createProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        ProfileBean profile = new ProfileBean(
            request.getParameter("name"),
            request.getParameter("studentId"),
            request.getParameter("program"),
            request.getParameter("email"),
            request.getParameter("hobbies"),
            request.getParameter("selfIntro")
        );
        
        boolean success = DBUtil.insertProfile(profile);
        
        if (success) {
            request.setAttribute("message", "Profile created successfully!");
            request.setAttribute("name", profile.getName());
            request.setAttribute("studentId", profile.getStudentId());
            request.setAttribute("program", profile.getProgram());
            request.setAttribute("email", profile.getEmail());
            request.setAttribute("hobbies", profile.getHobbies());
            request.setAttribute("selfIntro", profile.getSelfIntro());
            request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to create profile. Student ID might already exist.");
            request.getRequestDispatcher("registrationForm.jsp").forward(request, response);
        }
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProfileBean profile = DBUtil.getProfileById(id);
        
        if (profile != null) {
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("editForm.jsp").forward(request, response);
        } else {
            response.sendRedirect("StudentServlet");
        }
    }
    
    private void updateProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProfileBean profile = DBUtil.getProfileById(id);
        
        if (profile != null) {
            profile.setName(request.getParameter("name"));
            profile.setStudentId(request.getParameter("studentId"));
            profile.setProgram(request.getParameter("program"));
            profile.setEmail(request.getParameter("email"));
            profile.setHobbies(request.getParameter("hobbies"));
            profile.setSelfIntro(request.getParameter("selfIntro"));
            
            boolean success = DBUtil.updateProfile(profile);
            
            if (success) {
                response.sendRedirect("StudentServlet?action=view&id=" + id);
            } else {
                request.setAttribute("error", "Failed to update profile.");
                request.getRequestDispatcher("editForm.jsp").forward(request, response);
            }
        }
    }
    
    private void deleteProfile(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DBUtil.deleteProfile(id);
        response.sendRedirect("StudentServlet");
    }
    
    private void viewProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProfileBean profile = DBUtil.getProfileById(id);
        
        if (profile != null) {
            request.setAttribute("name", profile.getName());
            request.setAttribute("studentId", profile.getStudentId());
            request.setAttribute("program", profile.getProgram());
            request.setAttribute("email", profile.getEmail());
            request.setAttribute("hobbies", profile.getHobbies());
            request.setAttribute("selfIntro", profile.getSelfIntro());
            request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        } else {
            response.sendRedirect("StudentServlet");
        }
    }
    
    private void searchProfiles(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<ProfileBean> profiles = DBUtil.searchProfiles(keyword);
        List<String> programs = DBUtil.getDistinctPrograms();
        
        request.setAttribute("students", profiles);
        request.setAttribute("programs", programs);
        request.setAttribute("searchKeyword", keyword);
        request.getRequestDispatcher("listRegistrations.jsp").forward(request, response);
    }
    
    private void filterProfiles(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String program = request.getParameter("program");
        String hobby = request.getParameter("hobby");
        List<ProfileBean> profiles = DBUtil.getAllProfiles();
        List<String> programs = DBUtil.getDistinctPrograms();
        
        // Apply filters
        if (program != null && !program.isEmpty()) {
            profiles.removeIf(p -> !p.getProgram().equalsIgnoreCase(program));
        }
        
        if (hobby != null && !hobby.isEmpty()) {
            profiles.removeIf(p -> p.getHobbies() == null || 
                !p.getHobbies().toLowerCase().contains(hobby.toLowerCase()));
        }
        
        request.setAttribute("students", profiles);
        request.setAttribute("programs", programs);
        request.setAttribute("filterProgram", program);
        request.setAttribute("filterHobby", hobby);
        request.getRequestDispatcher("listRegistrations.jsp").forward(request, response);
    }
}