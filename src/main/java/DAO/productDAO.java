/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Product;
import Models.Specification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author namti
 */
public class productDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public productDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product";
        String sqlImg = "SELECT url FROM product_images WHERE product_id = ?";
        String sqlSpecifi = "SELECT * FROM specification WHERE product_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getString("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_quantity(rs.getInt("product_quantity"));
                product.setProduct_price(rs.getDouble("product_price"));
                product.setDiscount(rs.getInt("discount"));
                product.setProduct_description(rs.getString("product_description"));
                product.setBrand_id(rs.getString("brand_id"));
                product.setCategory_id(rs.getString("category_id"));
                product.setImages(null); // Điều chỉnh theo logic của bạn để đặt giá trị hình ảnh
                product.setSpecification(null); // Điều chỉnh theo logic của bạn để đặt giá trị thông số kỹ thuật
                product.setStatus(rs.getBoolean("status"));

                // Lấy danh sách hình ảnh
                List<String> img = new ArrayList<>();
                ps = conn.prepareStatement(sqlImg);
                ps.setString(1, product.getProduct_id());
                ResultSet rsImg = ps.executeQuery();
                while (rsImg.next()) {
                    img.add(rsImg.getString(1));
                }
                product.setImages(img);
                rsImg.close();

                // Lấy danh sách thông số kỹ thuật
                List<Specification> specifi = new ArrayList<>();
                ps = conn.prepareStatement(sqlSpecifi);
                ps.setString(1, product.getProduct_id());
                ResultSet rsSpecifi = ps.executeQuery();
                while (rsSpecifi.next()) {
                    specifi.add(new Specification(rsSpecifi.getString(1), rsSpecifi.getString(2), rsSpecifi.getString(3), rsSpecifi.getString(4),
                            rsSpecifi.getString(5), rsSpecifi.getString(6), rsSpecifi.getString(7), rsSpecifi.getString(8)));
                }
                product.setSpecification(specifi);

                rsSpecifi.close();
                list.add(product);
                System.out.println(list.size());
            }
        } catch (SQLException e) {
        }
        for (Product product : list) {
            System.out.println(product.getProduct_id());
        }
        return list;
    }

    public List<Product> getProductByCateId(String category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category_id ='" + category_id + "'";
        String sqlImg = "SELECT url FROM product_images WHERE product_id =?";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getString("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_quantity(rs.getInt("product_quantity"));
                product.setProduct_price(rs.getDouble("product_price"));
                product.setDiscount(rs.getInt("discount"));
                product.setProduct_description(rs.getString("product_description"));
                product.setBrand_id(rs.getString("brand_id"));
                product.setCategory_id(rs.getString("category_id"));
                product.setImages(null); // Điều chỉnh theo logic của bạn để đặt giá trị hình ảnh
                product.setSpecification(null); // Điều chỉnh theo logic của bạn để đặt giá trị thông số kỹ thuật
                product.setStatus(rs.getBoolean("status"));

                // Lấy danh sách hình ảnh
                List<String> img = new ArrayList<>();
                ps = conn.prepareStatement(sqlImg);
                ps.setString(1, product.getProduct_id());
                ResultSet rsImg = ps.executeQuery();
                while (rsImg.next()) {
                    img.add(rsImg.getString(1));
                }
                product.setImages(img);
                rsImg.close();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByPrice(int minPrice, int maxPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "WHERE product_price >= '" + minPrice + "' AND product_price <= '" + maxPrice + "'";
        String sqlImg = "SELECT url FROM product_images WHERE product_id =?";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getString("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_quantity(rs.getInt("product_quantity"));
                product.setProduct_price(rs.getDouble("product_price"));
                product.setDiscount(rs.getInt("discount"));
                product.setProduct_description(rs.getString("product_description"));
                product.setBrand_id(rs.getString("brand_id"));
                product.setCategory_id(rs.getString("category_id"));
                product.setImages(null); // Điều chỉnh theo logic của bạn để đặt giá trị hình ảnh
                product.setSpecification(null); // Điều chỉnh theo logic của bạn để đặt giá trị thông số kỹ thuật
                product.setStatus(rs.getBoolean("status"));

                // Lấy danh sách hình ảnh
                List<String> img = new ArrayList<>();
                ps = conn.prepareStatement(sqlImg);
                ps.setString(1, product.getProduct_id());
                ResultSet rsImg = ps.executeQuery();
                while (rsImg.next()) {
                    img.add(rsImg.getString(1));
                }
                product.setImages(img);
                rsImg.close();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByPriceAfterSale(int minPrice, int maxPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "WHERE (product_price - (product_price * discount / 100)) >= '" + minPrice + "'\n"
                + "  AND (product_price - (product_price * discount / 100)) <='" + maxPrice + "'";
        String sqlImg = "SELECT url FROM product_images WHERE product_id =?";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getString("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_quantity(rs.getInt("product_quantity"));
                product.setProduct_price(rs.getDouble("product_price"));
                product.setDiscount(rs.getInt("discount"));
                product.setProduct_description(rs.getString("product_description"));
                product.setBrand_id(rs.getString("brand_id"));
                product.setCategory_id(rs.getString("category_id"));
                product.setImages(null); // Điều chỉnh theo logic của bạn để đặt giá trị hình ảnh
                product.setSpecification(null); // Điều chỉnh theo logic của bạn để đặt giá trị thông số kỹ thuật
                product.setStatus(rs.getBoolean("status"));

                // Lấy danh sách hình ảnh
                List<String> img = new ArrayList<>();
                ps = conn.prepareStatement(sqlImg);
                ps.setString(1, product.getProduct_id());
                ResultSet rsImg = ps.executeQuery();
                while (rsImg.next()) {
                    img.add(rsImg.getString(1));
                }
                product.setImages(img);
                rsImg.close();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByBrandId(String brand_id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE brand_id ='" + brand_id + "'";
        String sqlImg = "SELECT url FROM product_images WHERE product_id =?";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getString("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_quantity(rs.getInt("product_quantity"));
                product.setProduct_price(rs.getDouble("product_price"));
                product.setDiscount(rs.getInt("discount"));
                product.setProduct_description(rs.getString("product_description"));
                product.setBrand_id(rs.getString("brand_id"));
                product.setCategory_id(rs.getString("category_id"));
                product.setImages(null); // Điều chỉnh theo logic của bạn để đặt giá trị hình ảnh
                product.setSpecification(null); // Điều chỉnh theo logic của bạn để đặt giá trị thông số kỹ thuật
                product.setStatus(rs.getBoolean("status"));

                // Lấy danh sách hình ảnh
                List<String> img = new ArrayList<>();
                ps = conn.prepareStatement(sqlImg);
                ps.setString(1, product.getProduct_id());
                ResultSet rsImg = ps.executeQuery();
                while (rsImg.next()) {
                    img.add(rsImg.getString(1));
                }
                product.setImages(img);
                rsImg.close();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // Phương thức thêm sản phẩm mới
    public boolean addNewProduct(Product newProduct) {
        String insertProductSql = "INSERT INTO product (product_id, product_name, product_quantity, product_price, discount, product_description, brand_id, category_id, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String insertImgSql = "INSERT INTO product_images (product_id, url) VALUES (?, ?)";

        String insertSpecifiSql = "INSERT INTO specification (product_id, cpu, gpu, ram, storage, screen, pin, weight, os) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false);

            // Insert product
            PreparedStatement psProduct = conn.prepareStatement(insertProductSql);
            psProduct.setString(1, newProduct.getProduct_id());
            psProduct.setString(2, newProduct.getProduct_name());
            psProduct.setInt(3, newProduct.getProduct_quantity());
            psProduct.setDouble(4, newProduct.getProduct_price());
            psProduct.setInt(5, newProduct.getDiscount());
            psProduct.setString(6, newProduct.getProduct_description());
            psProduct.setString(7, newProduct.getBrand_id());
            psProduct.setString(8, newProduct.getCategory_id());
            psProduct.setBoolean(9, newProduct.isStatus());
            psProduct.executeUpdate();
            psProduct.close();

            // Insert images
            List<String> images = newProduct.getImages();
            if (images != null && !images.isEmpty()) {
                PreparedStatement psImg = conn.prepareStatement(insertImgSql);
                for (String imageUrl : images) {
                    psImg.setString(1, newProduct.getProduct_id());
                    psImg.setString(2, imageUrl);
                    psImg.executeUpdate();
                }
                psImg.close();
            }

            // Insert specification
            List<Specification> specs = newProduct.getSpecification();
            if (specs != null && !specs.isEmpty()) {
                PreparedStatement psSpec = conn.prepareStatement(insertSpecifiSql);
                for (Specification spec : specs) {
                    psSpec.setString(1, newProduct.getProduct_id());
                    psSpec.setString(2, spec.getCpu());
                    psSpec.setString(3, spec.getGpu());
                    psSpec.setString(4, spec.getRam());
                    psSpec.setString(5, spec.getStorage());
                    psSpec.setString(6, spec.getScreen());
                    psSpec.setString(7, spec.getPin());
                    psSpec.setString(8, spec.getWeight());
                    psSpec.setString(9, spec.getOs());
                    psSpec.executeUpdate();
                }
                psSpec.close();
            }

            conn.commit(); // Xác nhận và lưu thay đổi vào cơ sở dữ liệu
            return true;
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    //code delete ở đây chuyền id của sản phẩm từ cái sản phẩm m click vào đó
    public boolean deleteProduct(String productId) {
        String updateStatusSql = "UPDATE product SET status = ? WHERE product_id = ?";

        try {
            PreparedStatement psUpdateStatus = conn.prepareStatement(updateStatusSql);
            psUpdateStatus.setBoolean(1, false);
            psUpdateStatus.setString(2, productId);
            int rowsAffected = psUpdateStatus.executeUpdate();
            psUpdateStatus.close();

            if (rowsAffected > 0) {
                return true; // Sản phẩm đã được xóa thành công
            }
        } catch (SQLException ex) {
        }

        return false; // Xóa sản phẩm không thành công
    }
    //sửa sản phẩm 

    public boolean updateProduct(Product updatedProduct) {
        String updateProductSql = "UPDATE product SET product_name = ?, product_quantity = ?, product_price = ?, discount = ?, product_description = ?, brand_id = ?, category_id = ?, status = ? WHERE product_id = ?";

        String insertImgSql = "INSERT INTO product_images (product_id, url) VALUES (?, ?)";
        String selectImagesSql = "SELECT url FROM product_images WHERE product_id = ?";

        String updateSpecifiSql = "UPDATE specification SET cpu = ?, gpu = ?, ram = ?, storage = ?, screen = ?, pin = ?, weight = ?, os = ? WHERE product_id = ?";

        try {
            conn.setAutoCommit(false);

            // Update product
            PreparedStatement psUpdateProduct = conn.prepareStatement(updateProductSql);
            psUpdateProduct.setString(1, updatedProduct.getProduct_name());
            psUpdateProduct.setInt(2, updatedProduct.getProduct_quantity());
            psUpdateProduct.setDouble(3, updatedProduct.getProduct_price());
            psUpdateProduct.setInt(4, updatedProduct.getDiscount());
            psUpdateProduct.setString(5, updatedProduct.getProduct_description());
            psUpdateProduct.setString(6, updatedProduct.getBrand_id());
            psUpdateProduct.setString(7, updatedProduct.getCategory_id());
            psUpdateProduct.setBoolean(8, updatedProduct.isStatus());
            psUpdateProduct.setString(9, updatedProduct.getProduct_id());
            psUpdateProduct.executeUpdate();
            psUpdateProduct.close();

            // Get existing images
            List<String> existingImages = new ArrayList<>();
            PreparedStatement psSelectImages = conn.prepareStatement(selectImagesSql);
            psSelectImages.setString(1, updatedProduct.getProduct_id());
            ResultSet rsImages = psSelectImages.executeQuery();
            while (rsImages.next()) {
                existingImages.add(rsImages.getString("url"));
            }
            rsImages.close();
            psSelectImages.close();

            // Insert new images
            List<String> newImages = updatedProduct.getImages();
            if (newImages != null && !newImages.isEmpty()) {
                PreparedStatement psInsertImages = conn.prepareStatement(insertImgSql);
                for (String imageUrl : newImages) {
                    if (!existingImages.contains(imageUrl)) {
                        psInsertImages.setString(1, updatedProduct.getProduct_id());
                        psInsertImages.setString(2, imageUrl);
                        psInsertImages.executeUpdate();
                    }
                }
                psInsertImages.close();
            }

            // Update specification
            List<Specification> specs = updatedProduct.getSpecification();
            if (specs != null && !specs.isEmpty()) {
                PreparedStatement psUpdateSpec = conn.prepareStatement(updateSpecifiSql);
                for (Specification spec : specs) {
                    psUpdateSpec.setString(1, spec.getCpu());
                    psUpdateSpec.setString(2, spec.getGpu());
                    psUpdateSpec.setString(3, spec.getRam());
                    psUpdateSpec.setString(4, spec.getStorage());
                    psUpdateSpec.setString(5, spec.getScreen());
                    psUpdateSpec.setString(6, spec.getPin());
                    psUpdateSpec.setString(7, spec.getWeight());
                    psUpdateSpec.setString(8, spec.getOs());
                    psUpdateSpec.setString(9, updatedProduct.getProduct_id());
                    psUpdateSpec.executeUpdate();
                }
                psUpdateSpec.close();
            }

            conn.commit(); // Xác nhận và lưu thay đổi vào cơ sở dữ liệu
            return true;
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    public Product getProductDetail(String productId) {
        String selectProductSql = "SELECT * FROM product WHERE product_id = ?";
        String selectImagesSql = "SELECT * FROM product_images WHERE product_id = ?";
        String selectSpecsSql = "SELECT * FROM specification WHERE product_id = ?";

        try {
            // Retrieve product information
            PreparedStatement psProduct = conn.prepareStatement(selectProductSql);
            psProduct.setString(1, productId);
            ResultSet productResult = psProduct.executeQuery();

            if (productResult.next()) {
                Product product = new Product();
                product.setProduct_id(productResult.getString("product_id"));
                product.setProduct_name(productResult.getString("product_name"));
                product.setProduct_quantity(productResult.getInt("product_quantity"));
                product.setProduct_price(productResult.getDouble("product_price"));
                product.setDiscount(productResult.getInt("discount"));
                product.setProduct_description(productResult.getString("product_description"));
                product.setBrand_id(productResult.getString("brand_id"));
                product.setCategory_id(productResult.getString("category_id"));
                product.setStatus(productResult.getBoolean("status"));

                // Retrieve images
                PreparedStatement psImages = conn.prepareStatement(selectImagesSql);
                psImages.setString(1, productId);
                ResultSet imagesResult = psImages.executeQuery();
                List<String> images = new ArrayList<>();
                while (imagesResult.next()) {
                    images.add(imagesResult.getString("url"));
                }
                product.setImages(images);

                // Retrieve specifications
                PreparedStatement psSpecs = conn.prepareStatement(selectSpecsSql);
                psSpecs.setString(1, productId);
                ResultSet specsResult = psSpecs.executeQuery();
                List<Specification> specifications = new ArrayList<>();
                while (specsResult.next()) {
                    Specification spec = new Specification();
                    spec.setCpu(specsResult.getString("cpu"));
                    spec.setGpu(specsResult.getString("gpu"));
                    spec.setRam(specsResult.getString("ram"));
                    spec.setStorage(specsResult.getString("storage"));
                    spec.setScreen(specsResult.getString("screen"));
                    spec.setPin(specsResult.getString("pin"));
                    spec.setWeight(specsResult.getString("weight"));
                    spec.setOs(specsResult.getString("os"));
                    specifications.add(spec);
                }
                product.setSpecification(specifications);

                return product;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null; // Product not found
    }

    public List<Specification> getProductSpecifications(String product_id) {
        List<Specification> specifications = new ArrayList<>();
        String sql = "SELECT * FROM specification WHERE product_id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String cpu = rs.getString("cpu");
                String gpu = rs.getString("gpu");
                String ram = rs.getString("ram");
                String storage = rs.getString("storage");
                String screen = rs.getString("screen");
                String pin = rs.getString("pin");
                String weight = rs.getString("weight");
                String os = rs.getString("os");

                Specification specification = new Specification(cpu, gpu, ram, storage, screen, pin, weight, os);
                specifications.add(specification);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return specifications;
    }

    public static void main(String[] args) {
        productDAO proDAO = new productDAO();
        List<Specification> list = proDAO.getProductSpecifications("acer_06");
        System.out.println(list);
    }
}
