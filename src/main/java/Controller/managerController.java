/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.accountDAO;
import DAO.brandDAO;
import DAO.categoryDAO;
import DAO.productDAO;
import Models.Brand;
import Models.Category;
import Models.Customer;
import Models.Manager;
import Models.Product;
import Models.Specification;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author namti
 */
public class managerController extends HttpServlet {

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
            out.println("<title>Servlet ManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Integer role_id = (Integer) session.getAttribute("role_id");

        String path = request.getRequestURI();

        if (role_id == null || role_id != 1 && role_id != 2) {
            response.sendRedirect("/home");
        } else {
            if (path.endsWith("/homeManagement")) {
                accountDAO accDao = new accountDAO();
                productDAO proDao = new productDAO();

                List<Customer> listCustomer = accDao.getAllcustomer();
                List<Product> listPro = proDao.getAllProduct();

                request.setAttribute("listCustomer", listCustomer);
                request.setAttribute("listPro", listPro);

                request.getRequestDispatcher("/homeManagement.jsp").forward(request, response);
            } else if (path.endsWith("/homeManagement/productManagement")) {
                String productId = request.getParameter("productId");

                productDAO proDao = new productDAO();
                categoryDAO cateDao = new categoryDAO();
                brandDAO brandDao = new brandDAO();

                List<Product> listPro = proDao.getAllProduct();
                List<Category> listCate = cateDao.GetAllCategory();
                List<Brand> listBrand = brandDao.getAllBrand();
                List<Specification> spec = proDao.getProductSpecifications(productId);

                request.setAttribute("listProduct", listPro);
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("listCategory", listCate);

                request.getRequestDispatcher("/productManagement.jsp").forward(request, response);

            } else if (path.endsWith("/homeManagement/productDetailForManagement")) {
                String productId = request.getParameter("productId");

                productDAO proDao = new productDAO();
                categoryDAO cateDao = new categoryDAO();
                brandDAO brandDao = new brandDAO();

                Brand brand = brandDao.getBrandByProductId(productId);
                Category cate = cateDao.getCategoryByProductId(productId);
                Product pro = proDao.getProductDetail(productId);
                List<Specification> spec = proDao.getProductSpecifications(productId);

                request.setAttribute("listSpec", spec);// đây là list cho mấy thuộc tính specification
                request.setAttribute("listProduct", pro);// này là product như tên á
                request.setAttribute("listCate", cate);// này category
                request.setAttribute("listBrand", brand);

                request.getRequestDispatcher("/productDetailForManagement.jsp").forward(request, response);
            } else if (path.endsWith("/homeManagement/productManagement/addNewProduct")) {
                if (role_id == 2) {
                    request.setAttribute("You dont have permission to do it", "msg");
                    request.getRequestDispatcher("/productManagement.jsp").forward(request, response);
                } else {
                    brandDAO brandDao = new brandDAO();
                    categoryDAO cateDao = new categoryDAO();

                    List<Brand> listBrand = brandDao.getAllBrand();
                    List<Category> listCate = cateDao.GetAllCategory();

                    request.setAttribute("listBrand", listBrand);
                    request.setAttribute("listCate", listCate);

                    request.getRequestDispatcher("/addNewProduct.jsp").forward(request, response);
                }

            } else if (path.endsWith("/homeManagement/productManagement/editProduct")) {

                productDAO proDao = new productDAO();
                categoryDAO cateDao = new categoryDAO();
                brandDAO brandDao = new brandDAO();

                List<Product> listPro = proDao.getAllProduct();
                List<Category> listCate = cateDao.GetAllCategory();
                List<Brand> listBrand = brandDao.getAllBrand();

                request.setAttribute("listProduct", listPro);
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("listCategory", listCate);

                request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
            } else if (path.endsWith("/homeManagement/brandManagement")) {
                brandDAO brandDao = new brandDAO();
                List<Brand> listBrand = brandDao.getAllBrand();

                request.setAttribute("listBrand", listBrand);
                request.getRequestDispatcher("/brandManagement.jsp").forward(request, response);
            } else if (path.endsWith("/homeManagement/brandManagement/addNewBrand")) {
                request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
            } else if (path.endsWith("homeManagement/categoryManagement")) {
                categoryDAO cateDao = new categoryDAO();
                List<Category> listCate = cateDao.GetAllCategory();

                request.setAttribute("listCate", listCate);
                request.getRequestDispatcher("/categoryManagement.jsp").forward(request, response);
            } else if (path.endsWith("homeManagement/categoryManagement/addNewCategory")) {
                request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);
            } else if (path.endsWith("homeManagement/customerManagement")) {
                accountDAO accDao = new accountDAO();
                List<Customer> listCus = accDao.getAllcustomer();

                request.setAttribute("listCustomer", listCus);
                request.getRequestDispatcher("/customerManagement.jsp").forward(request, response);
            } else if (path.endsWith("/homeManagement/staffManagement")) {
                if (role_id == 2) {
                    response.sendRedirect("/homeManagement");
                } else {
                    accountDAO accDao = new accountDAO();
                    List<Manager> listStaff = accDao.getAllManager();

                    request.setAttribute("listStaff", listStaff);
                    request.getRequestDispatcher("/staffManagement.jsp").forward(request, response);
                }
            } else if (path.endsWith("/homeManagement/staffManagement/addNewStaff")) {
                request.getRequestDispatcher("/addNewStaff.jsp").forward(request, response);
            } else if (path.startsWith("/homeManagement/staffManagement/deleteStaff")) {
                String[] data = path.split("/");
                int manager_id = Integer.parseInt(data[data.length - 1]);
                accountDAO accDao = new accountDAO();
                Boolean isSuccess = accDao.deleteStaff(manager_id);
                request.getRequestDispatcher("/homeManagement/staffManagement").forward(request, response);
            }
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
        //---Add new product---
        if (request.getParameter("btnAddProduct") != null) {
            productDAO dao = new productDAO();
            String productId = request.getParameter("product_id");
            String productName = request.getParameter("product_name");
            int productQuantity = Integer.parseInt(request.getParameter("product_quantity"));
            double productPrice = Double.parseDouble(request.getParameter("product_price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String productDescription = request.getParameter("product_description");
            String brandId = request.getParameter("brand_id");
            String categoryId = request.getParameter("category_id");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // Lấy danh sách các hình ảnh từ biểu mẫu
            String[] imageUrls = request.getParameterValues("images");
            List<String> images = Arrays.asList(imageUrls);

            // Tạo đối tượng Specification và đặt thông tin
            Specification spec = new Specification();
            spec.setCpu(request.getParameter("cpu"));
            spec.setGpu(request.getParameter("gpu"));
            spec.setRam(request.getParameter("ram"));
            spec.setStorage(request.getParameter("storage"));
            spec.setScreen(request.getParameter("screen"));
            spec.setPin(request.getParameter("pin"));
            spec.setWeight(request.getParameter("weight"));
            spec.setOs(request.getParameter("os"));
            List<Specification> specList = new ArrayList<>();
            specList.add(spec);

            // Tạo đối tượng Product và đặt thông tin
            Product newProduct = new Product();
            newProduct.setProduct_id(productId);
            newProduct.setProduct_name(productName);
            newProduct.setProduct_quantity(productQuantity);
            newProduct.setProduct_price(productPrice);
            newProduct.setDiscount(discount);
            newProduct.setProduct_description(productDescription);
            newProduct.setBrand_id(brandId);
            newProduct.setCategory_id(categoryId);
            newProduct.setStatus(status);
            newProduct.setImages(images);
            newProduct.setSpecification(specList);

            // Gọi phương thức addNewProduct để thêm sản phẩm mới vào cơ sở dữ liệu
            boolean isSuccess = dao.addNewProduct(newProduct);
            if (isSuccess) {
                System.out.println("herre1");
                response.sendRedirect("/homeManagement/addNewProduct");
                //Nên thêm thông báo thành công ở đây
            } else {
                //Tương tự thêm thông báo thất bại ở đây (nhớ đổi thành request)
                System.out.println("herre2");
                response.sendRedirect("/homeManagement/addNewProduct");
            }
        }
        //---End of add product---

        //---Edit product---
        if (request.getParameter("btnEditProduct") != null) {
            String productId = request.getParameter("product_id");
            String productName = request.getParameter("product_name");
            int productQuantity = Integer.parseInt(request.getParameter("product_quantity"));
            double productPrice = Double.parseDouble(request.getParameter("product_price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String productDescription = request.getParameter("product_description");
            String brandId = request.getParameter("brand_id");
            String categoryId = request.getParameter("category_id");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            String[] imageUrls = request.getParameterValues("images");
            List<String> images = Arrays.asList(imageUrls);

            Specification spec = new Specification();
            spec.setCpu(request.getParameter("cpu"));
            spec.setGpu(request.getParameter("gpu"));
            spec.setRam(request.getParameter("ram"));
            spec.setStorage(request.getParameter("storage"));
            spec.setScreen(request.getParameter("screen"));
            spec.setPin(request.getParameter("pin"));
            spec.setWeight(request.getParameter("weight"));
            spec.setOs(request.getParameter("os"));
            List<Specification> specList = new ArrayList<>();
            specList.add(spec);

            Product newProduct = new Product();
            newProduct.setProduct_id(productId);
            newProduct.setProduct_name(productName);
            newProduct.setProduct_quantity(productQuantity);
            newProduct.setProduct_price(productPrice);
            newProduct.setDiscount(discount);
            newProduct.setProduct_description(productDescription);
            newProduct.setBrand_id(brandId);
            newProduct.setCategory_id(categoryId);
            newProduct.setStatus(status);
            newProduct.setImages(images);
            newProduct.setSpecification(specList);

            productDAO dao = new productDAO();
            dao.updateProduct(newProduct);
            response.sendRedirect("/homeManagement/productManagement");
        }
        //---End of edit product---

        //---Delete product---
        if (request.getParameter("btnDeleteProduct") != null) {
            productDAO dao = new productDAO();
            String productId = request.getParameter("productId");
            boolean DeleteStatus = dao.deleteProduct(productId);
            if (DeleteStatus == true) {
                response.sendRedirect("/homeManagement/productManagement");
            } else {
                response.sendRedirect("/homeManagement/productManagement");
            }
        }
        //---End of delete product---

        //---Add new brand---
        if (request.getParameter("btnAddNewBrand") != null) {
            brandDAO dao = new brandDAO();

            String brandId = request.getParameter("brandId");
            String brandName = request.getParameter("brandName");

            Brand newBrand = new Brand();
            newBrand.setBrand_id(brandId);
            newBrand.setBrand_name(brandName);

            boolean isSuccess = dao.addNewBrand(newBrand);

            if (isSuccess == true) {
                request.setAttribute("successMessage", "Adding successfully");
                request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Adding failed");
                request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
            }
        }
        //---Ending of add new brand---

        //---Add new category---
        if (request.getParameter("btnAddNewCategory") != null) {
            categoryDAO dao = new categoryDAO();

            String cateId = request.getParameter("categoryId");
            String cateName = request.getParameter("categoryName");

            Category newCate = new Category();
            newCate.setCategory_id(cateId);
            newCate.setCategory_name(cateName);

            boolean isSuccess = dao.addNewCate(newCate);

            if (isSuccess == true) {
                request.setAttribute("successMessage", "Adding successfully");
                request.getRequestDispatcher("/addNewCateg ory.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Adding failed");
                request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);
            }
        }
        //---Ending of add new category---

        //---Add New Staff---
        if (request.getParameter("btnAddNewStaff") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            int role_id = Integer.parseInt(request.getParameter("role_id"));

            accountDAO accDao = new accountDAO();

            boolean checkAccountExisted = accDao.checkExistingAccount(username);

            if (checkAccountExisted == false) {
                try {
                    accDao.addNewStaff(username, password, fullname, role_id);
                    // Đăng ký thành công
                    response.sendRedirect("/homeManagement/staffManagement?signupSuccess=true");
                } catch (IOException e) {
                    // Đăng ký không thành công
                    response.sendRedirect("/homeManagement/addNewStaff?signupError=true");
                }
            } else {
                request.setAttribute("username", username);
                request.setAttribute("fullname", fullname);
                request.setAttribute("password", password);
                request.setAttribute("signupError", "Your username already exists.");
            }
        }
        //---Ending of Add New Staff---
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
