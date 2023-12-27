/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author namti
 */
public class Manager {

    private int manager_id;
    private String fullname;
    private String phone_number;
    private int ssn;
    private String username;
    private String password;
    private String role_id;

    public Manager() {
    }

    public Manager(int manager_id, String fullname, String phone_number, int ssn, String username, String password, String role_id) {
        this.manager_id = manager_id;
        this.fullname = fullname;
        this.phone_number = phone_number;
        this.ssn = ssn;
        this.username = username;
        this.password = password;
        this.role_id = role_id;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
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

    public int getSsn() {
        return ssn;
    }

    public void setSsn(int ssn) {
        this.ssn = ssn;
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

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "Manager{" + "Manager_id=" + manager_id + ", fullname=" + fullname + ", phone_number=" + phone_number + ", ssn=" + ssn + ", username=" + username + ", password=" + password + ", role_id=" + role_id + '}';
    }
}
