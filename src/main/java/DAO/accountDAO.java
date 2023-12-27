/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static SupportPackage.MD5.encode;
import Models.Customer;
import Models.Manager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author namti
 */
public class accountDAO {

    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public accountDAO() {

    }

    public List<Customer> getAllcustomer() {
        List<Customer> list = new ArrayList<>();
        String query = "select * from customer";
        try {
            conn = DBConnection.DbConnection.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));

            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Manager> getAllManager() {
        List<Manager> list = new ArrayList<>();
        String query = "select * from manager";
        try {
            conn = DBConnection.DbConnection.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Manager(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7)));

            }

        } catch (Exception e) {
        }
        return list;
    }

    public boolean isAccountExists(String username, String password) {
        String customerQuery = "SELECT * FROM customer WHERE username = ? and password = ?";
        String ManagerQuery = "SELECT * FROM Manager WHERE username = ? and password = ?";
        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement customerStatement = conn.prepareStatement(customerQuery);  PreparedStatement ManagerStatement = conn.prepareStatement(ManagerQuery)) {
            customerStatement.setString(1, username);
            customerStatement.setString(2, encode(password));
            ManagerStatement.setString(1, username);
            ManagerStatement.setString(2, encode(password));
            ResultSet customerResultSet = customerStatement.executeQuery();
            ResultSet ManagerResultSet = ManagerStatement.executeQuery();
            return customerResultSet.next() || ManagerResultSet.next();
        } catch (SQLException e) {
        }
        return false;
    }

    public Customer getCustomerByEmail(String email) {
        String query = "SELECT * FROM customer WHERE email = ?";
        Customer customer = null;

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                String fullname = resultSet.getString("fullname");
                String phone_number = resultSet.getString("phone_number");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String address = resultSet.getString("address");

                customer = new Customer(customer_id, fullname, phone_number, email, username, password, address);
            }
        } catch (SQLException e) {
        }

        return customer;
    }

    public Customer getCustomerByUsername(String username) {
        String query = "SELECT * FROM customer WHERE username = ?";
        Customer customer = null;

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                String fullname = resultSet.getString("fullname");
                String phone_number = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String address = resultSet.getString("address");

                customer = new Customer(customer_id, fullname, phone_number, email, username, password, address);
            }
        } catch (SQLException e) {
        }
        return customer;
    }

    public boolean checkExistingAccount(String username) {
        String queryCustomer = "SELECT COUNT(*) FROM customer WHERE username = ?";
        String queryManager = "SELECT COUNT(*) FROM Manager WHERE username = ?";
        boolean exists = false;

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statementCustomer = conn.prepareStatement(queryCustomer);  PreparedStatement statementManager = conn.prepareStatement(queryManager)) {
            statementCustomer.setString(1, username);
            statementManager.setString(1, username);

            ResultSet resultSetCustomer = statementCustomer.executeQuery();
            if (resultSetCustomer.next()) {
                int countCustomer = resultSetCustomer.getInt(1);
                if (countCustomer > 0) {
                    exists = true;
                }
            }

            ResultSet resultSetManager = statementManager.executeQuery();
            if (resultSetManager.next()) {
                int countManager = resultSetManager.getInt(1);
                if (countManager > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
        }

        return exists;
    }

    public boolean deleteStaff(int manager_id) {
        String sql = "DELETE FROM manager where manager_id =?";
        boolean success = false;

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, manager_id);
            ResultSet rs = statement.executeQuery();

            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException e) {
        }
        return success;
    }

    public String getFullnameByEmail(String email) {
        String fullname = null;
        String query = "SELECT fullname FROM customer WHERE email = ?";
        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                fullname = resultSet.getString("fullname");
            }
        } catch (SQLException e) {
        }
        return fullname;
    }

    public boolean signUp(String username, String password, String email, String fullname, String phoneNumber) {
        boolean success = false;
        String query = "INSERT INTO customer (username, password, email, fullname, phone_number) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, username);
            statement.setString(2, encode(password));
            statement.setString(3, email);
            statement.setString(4, fullname);
            statement.setString(5, phoneNumber);
            statement.executeUpdate();

            // Lấy customer_id tự tăng từ cơ sở dữ liệu
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int customerId = generatedKeys.getInt(1);
                success = true;
            }
        } catch (SQLException e) {
            return false;
        }
        return success;
    }

    public boolean addNewStaff(String username, String password, String fullname, int role_id) {
        String sql = "INSERT INTO manager (username, password, fullname, role_id) VALUES (?, ?, ?, ?)";
        boolean success = false;

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, username);
            statement.setString(2, encode(password));
            statement.setString(3, fullname);
            statement.setInt(4, role_id);
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int customerId = generatedKeys.getInt(1);
                success = true;
            }
        } catch (SQLException e) {

        }
        return success;
    }

    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public int getRoleByUsername(String username) {
        String managerQuery = "SELECT role_id FROM manager WHERE username = ?";
        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement managerStatement = conn.prepareStatement(managerQuery)) {
            managerStatement.setString(1, username);
            ResultSet managerResultSet = managerStatement.executeQuery();
            if (managerResultSet.next()) {
                String role_idString = managerResultSet.getString("role_id");
                return Integer.parseInt(role_idString);
            }
        } catch (SQLException e) {
        }
        return 0; // Giá trị mặc định nếu không tìm thấy role_id
    }

    public boolean changePasswordByEmail(String email, String newPassword) {
        // Kết nối đến cơ sở dữ liệu và thực hiện câu truy vấn để thay đổi mật khẩu
        // Ở đây, chúng ta giả sử rằng đã có một phương thức để kết nối và thực hiện truy vấn trong lớp DAO

        // Câu truy vấn SQL để cập nhật mật khẩu mới cho khách hàng dựa vào email
        String sql = "UPDATE customer SET password = ? WHERE email = ?";

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(sql)) {
            // Đặt các giá trị vào câu truy vấn SQL
            statement.setString(1, encode(newPassword));
            statement.setString(2, email);

            // Thực hiện câu truy vấn
            int rowsAffected = statement.executeUpdate();

            // Kiểm tra số hàng bị ảnh hưởng bởi câu truy vấn
            if (rowsAffected > 0) {
                return true; // Mật khẩu được thay đổi thành công
            }
        } catch (SQLException e) {

        }

        return false; // Thay đổi mật khẩu thất bại
    }

    public static void main(String[] args) {
        accountDAO dao = new accountDAO();

        System.out.println(dao.getRoleByUsername("admin123"));
    }

    public int updateAdminProfile(Manager mng) {
        int result = 0;
        String sql = "UPDATE manager SET manager_id = ?, fullname = ?, phone_number = ?, username = ?, password = ?, role_id = ?, ssn = ? WHERE manager_id = ?";

        try ( Connection conn = DBConnection.DbConnection.getConnection();  PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, mng.getManager_id());
            statement.setString(2, mng.getFullname());
            statement.setString(3, mng.getPhone_number());
            statement.setString(4, mng.getUsername());
            statement.setString(5, encode(mng.getPassword()));
            statement.setString(6, mng.getRole_id());
            statement.setInt(7, mng.getSsn());
            statement.setInt(8, mng.getManager_id());
            result = statement.executeUpdate();
        } catch (SQLException e) {

        }
        return result;
    }

}
