/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author namti
 */
public class Customer {

    private int customer_id;
    private String fullname;
    private String phone_number;
    private String email;
    private String username;
    private String password;
    private String address;

    public Customer() {
    }

    public Customer(int customer_id, String fullname, String phone_number, String email, String username, String password, String address) {
        this.customer_id = customer_id;
        this.fullname = fullname;
        this.phone_number = phone_number;
        this.email = email;
        this.username = username;
        this.password = password;
        this.address = address;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    @Override
    public String toString() {
        return "customer{" + "customer_id=" + customer_id + ", fullname=" + fullname + ", phone_number=" + phone_number + ", email=" + email + ", username=" + username + ", password=" + password + ", address=" + address + '}';
    }
}
