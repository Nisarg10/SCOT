/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.scot.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Anand
 */
public class ConnectionUtil {

    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/scot";
    public static Connection con = null;

    public static Connection getCon() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, "root", "nisarg");
        } catch (ClassNotFoundException e) {
            System.out.println("Error in Class.forName " + e);
        } catch (SQLException e) {
            System.out.println("Error in con " + e);
        }
        return con;
    }
}