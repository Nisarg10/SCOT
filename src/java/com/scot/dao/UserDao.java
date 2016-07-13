/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.dao;

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
public class UserDao {

    private static Connection con = null;
    private static Statement stmt = null;

    public static int loginUser(UserBean userBean) {
        int check = 0; // no data

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("Select * from registration_detail_user where e_mail='" + userBean.getEmail() + "' And password='" + userBean.getPassWord() + "'");

            while (rs.next()) {
                check = 1; // data but not active
                if (rs.getBoolean("isActive")) {
                    check = 2; // data and active
                }
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return check;
    }

    public static UserBean userDetail(UserBean userBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("Select * from registration_detail_user where e_mail='" + userBean.getEmail() + "' And password='" + userBean.getPassWord() + "'");

            rs.next();

            userBean.setRegistration_id(rs.getInt("registration_id"));
            userBean.setUser_type_id(rs.getInt("user_type_id"));
            userBean.setEmail(rs.getString("e_mail"));
            userBean.setfName(rs.getString("f_name"));
            userBean.setmName(rs.getString("m_name"));
            userBean.setlName(rs.getString("l_name"));
            userBean.setGender(rs.getString("gender"));
            userBean.setDateOfBirth(rs.getDate("dob"));
            userBean.setMobileNo(rs.getLong("phone_no"));
            userBean.setAddress(rs.getString("address"));
            userBean.setCity(rs.getString("city"));
            userBean.setDegree_registration(rs.getString("degree"));
            userBean.setProfessionalDetail(rs.getString("professional_detail"));
            userBean.setDepartment_id(rs.getInt("department_id"));
            userBean.setIsActive(rs.getBoolean("isActive"));
            userBean.setPassWord(rs.getString("password"));
            userBean.setInstitute_id(rs.getInt("institute_id"));
            userBean.setState(rs.getString("state"));
            userBean.setCountry_id(rs.getInt("country_id"));

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return userBean;
    }

    public static void insertRegistrationData(UserBean userBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into registration_detail_user values (null,'" + userBean.getUser_type_id() + "','" + userBean.getEmail() + "','" + userBean.getfName() + "','" + userBean.getmName() + "','" + userBean.getlName() + "','" + userBean.getGender() + "','" + userBean.getDateOfBirth() + "','" + userBean.getMobileNo() + "','" + userBean.getAddress() + "','" + userBean.getCity() + "','" + userBean.getDegree_registration() + "','" + userBean.getProfessionalDetail() + "','" + userBean.getDepartment_id() + "',false,'" + userBean.getPassWord() + "','" + userBean.getInstitute_id() + "','" + userBean.getState() + "','" + userBean.getCountry_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void updateRegistrationData(UserBean userBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update registration_detail_user set phone_no = '" + userBean.getMobileNo() + "', city = '" + userBean.getCity() + "', degree = '" + userBean.getDegree_registration() + "', professional_detail = '" + userBean.getProfessionalDetail() + "',department_id = '" + userBean.getDepartment_id() + "', password = '" + userBean.getPassWord() + "', institute_id = '" + userBean.getInstitute_id() + "', state = '" + userBean.getState() + "', country_id = '" + userBean.getCountry_id() + "', address = '" + userBean.getAddress()+ "' where registration_id = '" + userBean.getRegistration_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }
    public static List<TableBean> notificationShow(int i) {

        List<TableBean> notificationList = new ArrayList<>();
        TableBean tableBean;
        ResultSet rs;
        
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            if (i == 1) {
                rs = stmt.executeQuery("select * from registration_detail_user where user_type_id=2 AND isActive=false");
            } else {
                rs = stmt.executeQuery("select * from registration_detail_user where user_type_id<>2 AND user_type_id<>1 AND isActive=false");
            }

                        
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
}