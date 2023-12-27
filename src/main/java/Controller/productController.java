/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.brandDAO;
import DAO.categoryDAO;
import DAO.productDAO;
import Models.Brand;
import Models.Category;
import Models.Product;
import Models.Specification;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author namti
 */
public class productController extends HttpServlet {

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
            out.println("<title>Servlet productController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/product/productList")) {
            String cateId = "";
            String brandId = "";
            int minPrice = 0;
            int maxPrice = 0;

            cateId = request.getParameter("demand");
            brandId = request.getParameter("brand");
            minPrice = request.getParameter("minPrice") != null ? Integer.parseInt(request.getParameter("minPrice")) : 0;
            maxPrice = request.getParameter("maxPrice") != null ? Integer.parseInt(request.getParameter("maxPrice")) : 0;

            productDAO proDao = new productDAO();
            brandDAO brandDao = new brandDAO();
            categoryDAO cateDao = new categoryDAO();
            List<Product> proList;

            if (!"".equals(cateId) && cateId != null) {
                proList = proDao.getProductByCateId(cateId);
            } else if (!"".equals(brandId) && brandId != null) {
                proList = proDao.getProductByBrandId(brandId);
            } else {
                proList = proDao.getAllProduct();
            }

            if (request.getParameter("minPrice") != null && request.getParameter("maxPrice") != null && minPrice < maxPrice) {
                proList = proDao.getProductByPriceAfterSale(minPrice, maxPrice);
            } else if (minPrice > maxPrice) {
                request.setAttribute("Please input right value (min price cannot greater than max price", "errorMsg");
            }

            List<Brand> brandList = brandDao.getAllBrand();
            List<Category> cateList = cateDao.GetAllCategory();

            request.setAttribute("productList", proList);
            request.setAttribute("brandList", brandList);
            request.setAttribute("cateList", cateList);

            request.getRequestDispatcher("/shopList.jsp").forward(request, response);

        } else if (path.endsWith("/product/productDetail")) {
            String productId = request.getParameter("productId");

            productDAO proDao = new productDAO();
            categoryDAO cateDao = new categoryDAO();
            brandDAO brandDao = new brandDAO();

            Brand brand = brandDao.getBrandByProductId(productId);
            Category cate = cateDao.getCategoryByProductId(productId);
            Product pro = proDao.getProductDetail(productId);
            List<Specification> spec = proDao.getProductSpecifications(productId);
            List<Product> proList = proDao.getAllProduct();


            request.setAttribute("listSpec", spec);// đây là list cho mấy thuộc tính specification
            request.setAttribute("listProduct", pro);// này là product như tên á
            request.setAttribute("listCate", cate);/// này category
            request.setAttribute("listBrand", brand);
            request.setAttribute("proList", proList);

            request.getRequestDispatcher("/productDetail.jsp").forward(request, response);

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
        processRequest(request, response);
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
