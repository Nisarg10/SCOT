/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.dao;

import com.scot.bean.AdminBean;
import com.scot.bean.TableBean;
import com.scot.bean.UserBean;
import com.scot.util.ConnectionUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anand
 */
public class AdminDao {

    private static Connection con = null;
    private static Statement stmt = null;

    public static boolean loginAdmin(AdminBean adminBean) {
        boolean flag = false;

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("Select * from system_admin where username='" + adminBean.getUserName() + "' And password='" + adminBean.getPassWord() + "'");

            while (rs.next()) {
                flag = rs.getBoolean("isActive");
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return flag;
    }

    public static boolean changePassword(AdminBean adminBean) {
        boolean flag = false;
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from system_admin where username='" + adminBean.getUserName() + "' AND password='" + adminBean.getPassWord() + "'");

            if (rs.next()) {
                flag = false;
            } else {
                stmt.executeUpdate("insert into system_admin values (null,'" + adminBean.getUserName() + "','" + adminBean.getPassWord() + "',true)");
                stmt.executeUpdate("update system_admin set isActive=false where username<>'" + adminBean.getUserName() + "' AND password<>'" + adminBean.getPassWord() + "'");
                flag = true;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return flag;
    }

    public static List<String> tableNames() {
        List<String> tableNames = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("show tables");

            while (rs.next()) {
                tableNames.add(rs.getString(1));
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        tableNames.remove("system_admin");
        tableNames.remove("registration_detail_user");
        tableNames.remove("timetable_live");

        return tableNames;
    }

    public static List<TableBean> notificationShow() {
        List<TableBean> notificationList = new ArrayList<>();
        TableBean tableBean;
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from registration_detail_user where user_type_id=1 AND isActive=false");

            while (rs.next()) {
                tableBean = new TableBean();
                tableBean.setRegistration_id(rs.getInt("registration_id"));
                tableBean.setEmail(rs.getString("e_mail"));
                tableBean.setfName(rs.getString("f_name"));
                tableBean.setmName(rs.getString("m_name"));
                tableBean.setlName(rs.getString("l_name"));
                tableBean.setGender(rs.getString("gender"));
                tableBean.setDateOfBirth(rs.getDate("dob"));
                tableBean.setDepartment_id(rs.getInt("department_id"));
                tableBean.setInstitute_id(rs.getInt("institute_id"));

                notificationList.add(tableBean);
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return notificationList;
    }

    public static void notificationAct(List<UserBean> userActList) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            UserBean userBean;

            for (int i = 0; i < userActList.size(); i++) {
                userBean = new UserBean();
                userBean = (UserBean) userActList.get(i);
                stmt.executeUpdate("update registration_detail_user set isActive = " + userBean.isIsActive() + " where registration_id = '" + userBean.getRegistration_id() + "'");
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }
}
