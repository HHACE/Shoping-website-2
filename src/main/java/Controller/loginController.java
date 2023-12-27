/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.accountDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author namti
 */
public class loginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith("/user/login")) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else if (path.endsWith("/user/register")) {
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } else if (path.endsWith("/user/otpConfirm")) {
            request.getRequestDispatcher("/otpConfirm.jsp").forward(request, response);
        } else if (path.endsWith("/user/changePassword")) {
            request.getRequestDispatcher("/changePassword.jsp").forward(request, response);
        } else if (path.endsWith("/user/forgotPassword")) {
            request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
        } 
        else if (path.endsWith("/user/logout")) {
            // Lấy tất cả các cookie từ yêu cầu
            Cookie newUserCookie = new Cookie("username", null);

            newUserCookie.setPath("/");
            newUserCookie.setMaxAge(0);

            response.addCookie(newUserCookie);
            HttpSession session = request.getSession();
            session.setAttribute("username", null);
            session.setAttribute("user", null);
            response.sendRedirect("/user/login");
        } else if (path.endsWith("/home")) {
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Xử lý login
        if (request.getParameter("btnLogin") != null) {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            accountDAO dao = new accountDAO();
            int role_id = dao.getRoleByUsername(user);
            boolean login = dao.isAccountExists(user, pass);
            HttpSession session = request.getSession();

            if (login == false) {
                session.setAttribute("username", user);
                session.setAttribute("password", pass);
                request.setAttribute("mess", "Wrong username or password!!!");

                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                if (role_id == 1 || role_id == 2) {
                    Cookie usernameCookie = new Cookie("username", user);
                    usernameCookie.setPath("/");
                    if (request.getParameter("rmbMe") != null && !"".equals(request.getParameter("rmbMe"))) {
                        usernameCookie.setMaxAge(3 * 24 * 60 * 60);
                    } else {
                        usernameCookie.setMaxAge(1);
                    }
                    response.addCookie(usernameCookie); // Thêm cookie vào response
                    session.setAttribute("role_id", role_id);
                    session.setAttribute("isLoggedIn", true);
                    session.setAttribute("username", user);
                    
                    response.sendRedirect("/homeManagement");
                } else {
                    Cookie usernameCookie = new Cookie("username", user);
                    usernameCookie.setPath("/");
                    if (request.getParameter("rmbMe") != null) {
                        usernameCookie.setMaxAge(3 * 24 * 60 * 60);
                    } else {
                        usernameCookie.setMaxAge(1);
                    }
                    response.addCookie(usernameCookie);
                    session.setAttribute("isLoggedIn", true);
                    session.setAttribute("username", user);
                    response.sendRedirect("/home");
                }
            }
        }
        //---Kết thúc xử lý login---

        //---Xử lý sign up---
        if (request.getParameter("btnSignUp") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String repassword = request.getParameter("repassword");
            accountDAO dao = new accountDAO();

            boolean checkAEx = dao.checkExistingAccount(username);
            if (checkAEx == false) {
                try {
                    dao.signUp(username, password, email, fullname, phone);
                    // Đăng ký thành công
                    response.sendRedirect("/user/login?signupSuccess=true");
                } catch (IOException e) {
                    // Đăng ký không thành công
                    response.sendRedirect("/user/signup?signupError=true");
                }
            } else {
                // Username đã tồn tại, trả về trang signup.jsp và truyền dữ liệu và thông báo lỗi qua thuộc tính của request
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                request.setAttribute("fullname", fullname);
                request.setAttribute("phone", phone);
                request.setAttribute("password", password);
                request.setAttribute("repassword", repassword);
                request.setAttribute("signupError", "Your username already exists.");
            }
        }
        //---Kết thúc xử lý sign up---

        //--Xử lý Confirm Email---
        if (request.getParameter("btnConfirmOTP") != null) {
            String characters1 = request.getParameter("characters1");
            String characters2 = request.getParameter("characters2");
            String characters3 = request.getParameter("characters3");
            String characters4 = request.getParameter("characters4");
            String characters5 = request.getParameter("characters5");
            String characters6 = request.getParameter("characters6");
            String sendMailotp = request.getParameter("sentOTP");
            String email = request.getParameter("email");

            // Lưu email vào phiên
            String OTP = characters1 + characters2 + characters3 + characters4 + characters5 + characters6;
            if (sendMailotp.equals(OTP)) {
                // Chuyển hướng đến trang đổi mật khẩu
                response.sendRedirect("/user/changePassword");
                // Chuyển hướng đến trang "changePassword.jsp"
            } else {
                // Chuyển hướng đến trang nhập OTP và hiển thị thông báo lỗi
                response.sendRedirect("/user/otpConfirm?error=1");
            }
        }

        //--Xử lý Confirm OTP
        if (request.getParameter("btnSendEmail") != null) {
            accountDAO dao = new accountDAO();
            String email = request.getParameter("email");
            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("mess", "Email cannot be empty");
                request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
                return;
            }

            Customer a = dao.getCustomerByEmail(email);
            if (a != null) {
                request.getSession().setAttribute("email", email);
                String OTP = dao.generateOTP();
                String to = email;
                String fullname = dao.getFullnameByEmail(email);
                // Lưu mã OTP vào session
                request.getSession().setAttribute("otp", OTP);

                String subject = "Rubicon's message";
                String body = "<html><head>"
                        + "<style>"
                        + "body {"
                        + "    font-family: Arial, sans-serif;"
                        + "    background-color: #f2f2f2;"
                        + "    padding: 20px;"
                        + "}"
                        + "p {"
                        + "    color: #333333;"
                        + "}"
                        + "a {"
                        + "    color: #0066cc;"
                        + "    text-decoration: none;"
                        + "}"
                        + ".otp {"
                        + "    font-weight: bold;"
                        + "    font-size: 18px;"
                        + "}"
                        + ".rubicon {"
                        + "    font-size: 14px;" // Thay đổi kích thước font-size
                        + "    color: #669966;;" // Thay đổi màu chữ
                        + "    font-weight: normal;" // Thay đổi font-weight
                        + "}"
                        + "</style>"
                        + "</head>"
                        + "<body>"
                        + "<p>Dear customer " + fullname + ",</p>"
                        + "<p>Your OTP is:   <span class=\"otp\">" + OTP + "</span></p>"
                        + "<p>Please do not share your OTP to anyone else</p>"
                        + "   <p>Best regards </p>"
                        + "     <p><span class=\"rubicon\">Rubicon</span></p>"
                        + "</body></html>";
                boolean result = sendEmail(to, subject, body);

                if (result) {
                    request.getSession().setAttribute("email", email);
                    response.sendRedirect("/user/otpConfirm");
                } else {
                    response.sendRedirect("/user/forgotPassword");
                }
            } else {
                request.setAttribute("mess", "Wrong email");
                request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
            }
        }

        //---Xử lý Forgot password---
        if (request.getParameter("btnReset") != null) {
            String email = request.getParameter("email");
            String pass = request.getParameter("newPassword");
            String rePass = request.getParameter("confirmPassword");
            accountDAO dao = new accountDAO();
            boolean success = dao.changePasswordByEmail(email, pass);
            if (success == true) {
                response.sendRedirect("/user/login");
            } else {
                response.sendRedirect("/user/changePassword");
            }
        }
        //---Kết thúc xử lý Forgot password---
    }

    private boolean sendEmail(String to, String subject, String body) throws UnsupportedEncodingException {
        // Cấu hình các thông tin cần thiết để gửi email
        String host = "smtp.gmail.com";
        String port = "587";

        final String username = "locdtce170077@fpt.edu.vn";
        final String password = "zaukxbjjdrnjsyzu";
        String displayName = "Rubicon";
        // Thiết lập các thuộc tính cho kết nối SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo đối tượng Authenticator để xác thực người dùng
        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        // Tạo phiên gửi email
        Session session = Session.getInstance(props, authenticator);

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Đặt thông tin người gửi và người nhận
            message.setFrom(new InternetAddress(username, displayName));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Đặt tiêu đề và nội dung email
            message.setSubject(subject, "UTF-8");
            message.setContent(body, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);

            return true;
        } catch (MessagingException ex) {
            return false;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
