/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ADMIN
 */
public class DbConnectionTest {
    
    public DbConnectionTest() {
    }

    @Test
    public void testDbConnectionSuccess() {
        // Thực hiện kiểm tra xem kết nối với cơ sở dữ liệu thành công hay không
        Connection conn = DbConnection.getConnection();

        // Kiểm tra xem đối tượng Connection có null hay không
        assertNotNull(conn);

        try {
            // Kiểm tra xem kết nối có đóng thành công hay không
            conn.close();
        } catch (Exception e) {
            fail("Không thể đóng kết nối: " + e.getMessage());
        }
    }
    @Test
    public void testMain() throws Exception {
    }
    
}
