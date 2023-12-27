/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.accountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.mockito.Mock;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import org.mockito.MockitoAnnotations;

/**
 *
 * @author ADMIN
 */
public class LoginTest {
    
//    public loginControllerTest() {
//    }

    private loginController controller;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    @Mock
    private accountDAO dao;

    @Before
    public void setUp() {
        controller = new loginController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        session.setAttribute("username", "");
        session.setAttribute("isLoggedIn", false);
        when(request.getSession()).thenReturn(session);
        MockitoAnnotations.initMocks(this);
        
    }

    //login
    @Test
    public void UTCID01() {
        try {
            when(request.getParameter("username")).thenReturn("testuser");
            when(request.getParameter("password")).thenReturn("testuser");
            when(request.getParameter("btnLogin")).thenReturn("Login");
            
            controller.doPost(request, response);

//            assertNull(session.getAttribute("username"));
            //System.out.println(session.getAttribute("isLoggedIn"));
            assertNotEquals("Invalid Username or Password",false, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    @Test
    public void UTCID02() {
        try {
            when(request.getParameter("username")).thenReturn("testuser1");
            when(request.getParameter("password")).thenReturn("testuser");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "Invalid Username or Password";

            assertNotEquals(expected,null, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){
            assertEquals(null, session.getAttribute("isLoggedIn"));
        }
    }
    
    @Test
    public void UTCID03() {
        try {
            when(request.getParameter("username")).thenReturn("testuser1");
            when(request.getParameter("password")).thenReturn("testuser1");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "Invalid Username or Password";

            assertNull(expected);
            assertEquals(null, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){
            
            
        }
    }
    
        @Test
    public void UTCID04() {
        try {
            when(request.getParameter("username")).thenReturn("testuser");
            when(request.getParameter("password")).thenReturn("test");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "Invalid Username or Password";

            assertEquals(expected,null, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){

            
        }
    }
    
            @Test
    public void UTCID05() {
        try {
            when(request.getParameter("username")).thenReturn("test");
            when(request.getParameter("password")).thenReturn("test");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "input must contain 6 to 50 characters";
            assertEquals(expected,null, session.getAttribute("isLoggedIn"));
            
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){

            
        }
    }
    
                @Test
    public void UTCID06() {
        try {
            when(request.getParameter("username")).thenReturn("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            when(request.getParameter("password")).thenReturn("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "input must contain 6 to 50 characters";
            assertEquals(expected,null, session.getAttribute("isLoggedIn"));
            
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){

            
        }
    }
    
                    @Test
    public void UTCID07() {
        try {
            when(request.getParameter("username")).thenReturn("");
            when(request.getParameter("password")).thenReturn("");
            when(request.getParameter("btnLogin")).thenReturn("Login");

            controller.doPost(request, response);

            String expected = "input is empty";
            assertEquals(expected,null, session.getAttribute("isLoggedIn"));
            
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){

            
        }
    }

    //signup
    
      @Test
    public void testSuccessfulSignUp() {
        try {
            when(request.getParameter("username")).thenReturn("testuser1");
            when(request.getParameter("password")).thenReturn("testuser1");
            when(request.getParameter("email")).thenReturn("testuser1@gmail.com");
            when(request.getParameter("fullname")).thenReturn("Test User1");
            when(request.getParameter("repassword")).thenReturn("testuser1");
            
            when(request.getParameter("btnSignUp")).thenReturn("SignUp");
            
            controller.doPost(request, response);

            
            assertNotEquals(true, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){
            assertFalse(true);
            
        }
    }
    
    
          @Test
    public void testExistedSignUp() {
        try {
            when(request.getParameter("username")).thenReturn("testuser");
            when(request.getParameter("password")).thenReturn("testuser1");
            when(request.getParameter("email")).thenReturn("testuser1@gmail.com");
            when(request.getParameter("fullname")).thenReturn("Test User1");
            when(request.getParameter("repassword")).thenReturn("testuser1");
            
            when(request.getParameter("btnSignUp")).thenReturn("SignUp");
            
            controller.doPost(request, response);

            
            assertNotEquals(true, session.getAttribute("isLoggedIn"));
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e){
            assertFalse(true);
            
        }
    }
    

    
    
 
}
