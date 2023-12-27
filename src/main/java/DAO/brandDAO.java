/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author namti
 */
public class brandDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public brandDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "Select * From brand";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
        }
        return list;
    }

    public List<Brand> getBrandName(String brand_id) {
        List<Brand> list = new ArrayList<>();
        String sql = "Select * from brand where brand_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, brand_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
        }
        return list;
    }
    
    public boolean addNewBrand(Brand brand) {
        String sql = "INSERT INTO brand VALUES (?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, brand.getBrand_id());
            ps.setString(2, brand.getBrand_name());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }     
    }

    public Brand getBrandByProductId(String product_id) {
        Brand brand = null;
        String sql = "SELECT b.* FROM brand b JOIN product p ON b.brand_id = p.brand_id WHERE p.product_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                brand = new Brand(rs.getString("brand_id"), rs.getString("brand_name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return brand;
    }

//    public static void main(String[] args) {
//        brandDAO dao = new brandDAO();
//        List<Brand> list = dao.getAllBrand();
//        System.out.println(list);
//    }
}
