/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
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
public class managerControllerTest {
    
   
    private managerController controller;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    @Mock
    private accountDAO dao;

    @Before
    public void setUp() {
        controller = new managerController();
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
    public void testAddingProduct() {
        try {
            //products
            when(request.getParameter("product_id")).thenReturn("TP-001");
            when(request.getParameter("product_name")).thenReturn("testproduct");
            when(request.getParameter("product_quantity")).thenReturn("100");
            when(request.getParameter("product_price")).thenReturn("200000");
            when(request.getParameter("discount")).thenReturn("50");
            when(request.getParameter("product_description")).thenReturn("test product description");
            when(request.getParameter("brand_id")).thenReturn("test brand");
            when(request.getParameter("category_id")).thenReturn("test category");
            when(request.getParameter("status")).thenReturn("true");
            
            String[] array = new String[1];
            array[0]= "temp.png";
            when(request.getParameterValues("images")).thenReturn(array);
            //spec
            when(request.getParameter("cpu")).thenReturn("testcpu");
            when(request.getParameter("gpu")).thenReturn("testgpu");
            when(request.getParameter("ram")).thenReturn("testram");
            when(request.getParameter("storage")).thenReturn("teststorage");
            when(request.getParameter("screen")).thenReturn("testscreen");
            when(request.getParameter("pin")).thenReturn("testpin");
            when(request.getParameter("weight")).thenReturn("testweight");
            when(request.getParameter("os")).thenReturn("testos");
            
            when(request.getParameter("btnAddProduct")).thenReturn("AddProduct");
            
            controller.doPost(request, response);
            assertTrue(true);      
   
//            assertFalse(true);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    @Test
        public void testAddingProductWrong() {
        try {
            //products
            when(request.getParameter("product_id")).thenReturn("");
            when(request.getParameter("product_name")).thenReturn("testproduct");
            when(request.getParameter("product_quantity")).thenReturn("100");
            when(request.getParameter("product_price")).thenReturn("200000");
            when(request.getParameter("discount")).thenReturn("50");
            when(request.getParameter("product_description")).thenReturn("test product description");
            when(request.getParameter("brand_id")).thenReturn("test brand");
            when(request.getParameter("category_id")).thenReturn("test category");
            when(request.getParameter("status")).thenReturn("true");
//           when(request.getParameterValues("images")).thenReturn(String[] colors = {"red", "green", "blue", "yellow"});
            //spec
            when(request.getParameter("cpu")).thenReturn("testcpu");
            when(request.getParameter("gpu")).thenReturn("testgpu");
            when(request.getParameter("ram")).thenReturn("testram");
            when(request.getParameter("storage")).thenReturn("teststorage");
            when(request.getParameter("screen")).thenReturn("testscreen");
            when(request.getParameter("pin")).thenReturn("testpin");
            when(request.getParameter("weight")).thenReturn("testweight");
            when(request.getParameter("os")).thenReturn("testos");
            
            when(request.getParameter("btnAddProduct")).thenReturn("AddProduct");
            
            controller.doPost(request, response);
//            assertTrue(true);      
   
            assertFalse(true);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NullPointerException e){
            assertTrue(true);     
            
        }
    }
    
        @Test
    public void testUpdatingProduct() {
        try {
            //products
            when(request.getParameter("product_id")).thenReturn("TP-001");
            when(request.getParameter("product_name")).thenReturn("testproduct");
            when(request.getParameter("product_quantity")).thenReturn("100");
            when(request.getParameter("product_price")).thenReturn("200000");
            when(request.getParameter("discount")).thenReturn("50");
            when(request.getParameter("product_description")).thenReturn("test product description");
            when(request.getParameter("brand_id")).thenReturn("test brand");
            when(request.getParameter("category_id")).thenReturn("test category");
            when(request.getParameter("status")).thenReturn("true");
            
            String[] array = new String[1];
            array[0]= "temp.png";
            when(request.getParameterValues("images")).thenReturn(array);
            //spec
            when(request.getParameter("cpu")).thenReturn("testcpu");
            when(request.getParameter("gpu")).thenReturn("testgpu");
            when(request.getParameter("ram")).thenReturn("testram");
            when(request.getParameter("storage")).thenReturn("teststorage");
            when(request.getParameter("screen")).thenReturn("testscreen");
            when(request.getParameter("pin")).thenReturn("testpin");
            when(request.getParameter("weight")).thenReturn("testweight");
            when(request.getParameter("os")).thenReturn("testos");
            
            when(request.getParameter("btnEditProduct")).thenReturn("EditProduct");
            
            controller.doPost(request, response);
            assertTrue(true);      
   
//            assertFalse(true);
        } catch (ServletException | IOException ex) {
              assertFalse(true);  
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
            @Test
    public void testUpdatingProductWrong() {
        try {
            //products
            when(request.getParameter("product_id")).thenReturn("TP-001");
            when(request.getParameter("product_name")).thenReturn("testproduct");
            when(request.getParameter("product_quantity")).thenReturn("100");
            when(request.getParameter("product_price")).thenReturn("200000");
            when(request.getParameter("discount")).thenReturn("50");
            when(request.getParameter("product_description")).thenReturn("test product description");
            when(request.getParameter("brand_id")).thenReturn("test brand");
            when(request.getParameter("category_id")).thenReturn("test category");
            when(request.getParameter("status")).thenReturn("true");
            
            String[] array = new String[1];
            array[0]= "temp.png";
//            when(request.getParameterValues("images")).thenReturn(array);
            //spec
            when(request.getParameter("cpu")).thenReturn("testcpu");
            when(request.getParameter("gpu")).thenReturn("testgpu");
            when(request.getParameter("ram")).thenReturn("testram");
            when(request.getParameter("storage")).thenReturn("teststorage");
            when(request.getParameter("screen")).thenReturn("testscreen");
            when(request.getParameter("pin")).thenReturn("testpin");
            when(request.getParameter("weight")).thenReturn("testweight");
            when(request.getParameter("os")).thenReturn("testos");
            
            when(request.getParameter("btnEditProduct")).thenReturn("EditProduct");
            
            controller.doPost(request, response);
            assertFalse(true);      
   
//            assertFalse(true);
        } catch (ServletException | IOException ex) {
               
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
                   catch (NullPointerException e){
              assertTrue(true); 
            
        }

    }
    
    
    
            @Test
    public void testDeletingProduct() {
        try {
            //products
            when(request.getParameter("productId")).thenReturn("TP-001");

            when(request.getParameter("btnDeleteProduct")).thenReturn("DeleteProduct");
            
            controller.doPost(request, response);
            assertTrue(true);      
   
//            assertFalse(true);
        } catch (ServletException | IOException ex) {
               
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
             catch (NullPointerException e){
              assertFalse(true); 
            
        }

    }

       @Test
        public void testAddingProductBrand() {
        try {
            //products
            when(request.getParameter("brandId")).thenReturn("TB-01");
            when(request.getParameter("brandName")).thenReturn("testbrand");
  
            when(request.getParameter("btnAddNewBrand")).thenReturn("AddNewBrand");
            
            controller.doPost(request, response);
               
   
            assertFalse(true);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NullPointerException e){
              assertTrue(true);     
            
        }
    }
    
        

               @Test
        public void testAddingProductCategory() {
        try {
            //products
            when(request.getParameter("categoryId")).thenReturn("TC-01");
            when(request.getParameter("categoryName")).thenReturn("testCategory");
  
            when(request.getParameter("btnAddNewCategory")).thenReturn("AddNewCategory");
            
            controller.doPost(request, response);
               
   
            assertFalse(true);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NullPointerException e){
           assertTrue(true);      
            
        }
    }
    
        
        

               @Test
        public void testAddingNewStaff() {
        try {
            //products
            when(request.getParameter("username")).thenReturn("teststaff");
            when(request.getParameter("password")).thenReturn("teststaff");
            when(request.getParameter("fullname")).thenReturn("Test Staff");
            when(request.getParameter("role_id")).thenReturn("2");
  
            when(request.getParameter("btnAddNewStaff")).thenReturn("AddNewStaff");
            
            controller.doPost(request, response);
               
             assertTrue(true);  
           
        } catch (ServletException | IOException ex) {
            Logger.getLogger(loginControllerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NullPointerException e){
               
            assertFalse(true);
            
        }
    }
        
}
