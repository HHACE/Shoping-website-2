/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DBConnection.DbConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class accountDAOTest {

    @Mock
    private DbConnection dbConnection;

    @Mock
    private Connection connection;

    @Mock
    private PreparedStatement statement;

    @Mock
    private ResultSet resultSet;

    @InjectMocks
    private accountDAO customerService;

    @Before
    public void setUp() throws SQLException {
        MockitoAnnotations.initMocks(this);
//        when(dbConnection.getConnection()).thenReturn(connection);
        when(connection.prepareStatement(anyString(), anyInt())).thenReturn(statement);
        when(statement.getGeneratedKeys()).thenReturn(resultSet);
    }

     public static String encode(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Test
    public void testSignUpSuccess() throws SQLException {
        // Arrange
        String username = "testuser";
        String password = "testpass";
        String email = "test@test.com";
        String fullname = "Test User";
        String phoneNumber = "1234567890";
        int customerId = 1;

        when(statement.executeUpdate()).thenReturn(1);
        when(resultSet.next()).thenReturn(true);
        when(resultSet.getInt(1)).thenReturn(customerId);

        // Act
        boolean result = customerService.signUp(username, password, email, fullname, phoneNumber);
        System.out.println(result);
        // Assert
        assertTrue(result);
        verify(statement).setString(1, username);
        verify(statement).setString(2, accountDAOTest.encode(password));
        verify(statement).setString(3, email);
        verify(statement).setString(4, fullname);
        verify(statement).setString(5, phoneNumber);
        verify(statement).executeUpdate();
    }

    @Test
    public void testSignUpFailure() throws SQLException {
        // Arrange
        String username = "testuser";
        String password = "testpass";
        String email = "test@test.com";
        String fullname = "Test User";
        String phoneNumber = "1234567890";

        when(statement.executeUpdate()).thenThrow(new SQLException());

        // Act
        boolean result = customerService.signUp(username, password, email, fullname, phoneNumber);

        // Assert
        assertFalse(result);
        verify(statement).setString(1, username);
        verify(statement).setString(2, accountDAOTest.encode(password));
        verify(statement).setString(3, email);
        verify(statement).setString(4, fullname);
        verify(statement).setString(5, phoneNumber);
        verify(statement).executeUpdate();
    }
}
