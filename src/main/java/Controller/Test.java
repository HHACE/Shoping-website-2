/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.productDAO;
import Models.Product;
import java.util.List;

/**
 *
 * @author namti
 */
public class Test {
    public static void main(String[] args) {
        productDAO dao = new productDAO();
        List<Product> list = dao.getAllProduct();
        for (Product pro : list) {
            System.out.println(pro.getProduct_quantity());
        }
    }
}
