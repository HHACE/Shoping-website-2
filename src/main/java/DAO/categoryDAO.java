/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Brand;
import Models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author namti
 */
public class categoryDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public categoryDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public List<Category> GetAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * From category";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
        }
        return list;
    }

//    public static void main(String[] args) {
//        categoryDAO dao = new categoryDAO();
//        List<Category> list = dao.GetAllCategory();
//        System.out.println(list);
//    }
    public List<Category> getCategoryName(String category_id) {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from category where category_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
        }
        return list;
    }

    public Category getCategoryByProductId(String product_id) {
        Category category = null;
        String sql = "SELECT c.* FROM category c JOIN product p ON c.category_id = p.category_id WHERE p.product_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category(rs.getString("category_id"), rs.getString("category_name"));
            }
        } catch (SQLException ex) {
        }
        return category;
    }
    
      public boolean addNewCate(Category cate) {
        String sql = "INSERT INTO category VALUES (?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate.getCategory_id());
            ps.setString(2, cate.getCategory_name());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }     
    }
}
