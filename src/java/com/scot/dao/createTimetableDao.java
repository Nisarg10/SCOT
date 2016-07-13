/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.dao;

import com.scot.bean.TableBean;
import com.scot.util.ConnectionUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nisarg
 */
public class createTimetableDao {

    private static Connection con = null;
    private static Statement stmt = null;

    public static List<TableBean> getSubjectList(TableBean bean) {

        List<TableBean> subjectList = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from subject where sem_id = '" + bean.getSem_id() + "'");

            while (rs.next()) {
                TableBean tableBean = new TableBean();

                tableBean.setSubject_id(rs.getInt("subject_id"));
                tableBean.setSubject_name(rs.getString("subject_name"));
                tableBean.setCredit(rs.getInt("credit"));

                subjectList.add(tableBean);

            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return subjectList;
    }

    public static List<TableBean> getFacultyList(List<TableBean> subjectList) {

        List<TableBean> allocatedFacultyList = new ArrayList<>();
        TableBean bean;

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();
            for (int i = 0; i < subjectList.size(); i++) {

                bean = new TableBean();
                bean = subjectList.get(i);

                ResultSet rs = stmt.executeQuery("select f.*,s.* from faculty_allocation_subject f,subject s where s.subject_id = '" + bean.getSubject_id() + "' AND f.subject_id = '" + bean.getSubject_id() + "' ");

                while (rs.next()) {
                    TableBean tableBean = new TableBean();

                    tableBean.setFaculty_allocation_subject_id(rs.getInt("faculty_allocation_subject_id"));
                    tableBean.setSubject_id(rs.getInt("subject_id"));
                    tableBean.setRegistration_id(rs.getInt("registration_id"));
                    tableBean.setSubject_name(rs.getString("subject_name"));
                    tableBean.setCredit(rs.getInt("credit"));

                    allocatedFacultyList.add(tableBean);
                }
            }

            int x = allocatedFacultyList.size();

            for (int i = 0; i < x; i++) {

                bean = new TableBean();
                bean = allocatedFacultyList.get(i);

                ResultSet rs = stmt.executeQuery("select * from registration_detail_user where registration_id = '" + bean.getRegistration_id() + "' ");

                while (rs.next()) {
                    bean.setDepartment_id(rs.getInt("department_id"));
                    bean.setUser_type_id(rs.getInt("user_type_id"));
                    bean.setfName(rs.getString("f_name"));
                    bean.setlName(rs.getString("l_name"));
                }
            }

            for (int i = 0; i < x; i++) {

                bean = new TableBean();
                bean = allocatedFacultyList.get(i);

                ResultSet rs = stmt.executeQuery("select * from faculty_workload where user_type_id = '" + bean.getUser_type_id() + "'  AND department_id = '" + bean.getDepartment_id() + "' ");

                while (rs.next()) {

                    bean.setWorkload(rs.getInt("workload"));
                }
            }

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return allocatedFacultyList;

    }

    public static List<TableBean> getclassHoursDetail(int department_id) {

        List<TableBean> classHoursList = new ArrayList<>();
        TableBean bean;

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from degree where department_id = '" + department_id + "'");

            while (rs.next()) {
                TableBean tableBean = new TableBean();

                tableBean.setDegree_id(rs.getInt("degree_id"));
                classHoursList.add(tableBean);

            }

            int x = classHoursList.size();

            for (int i = 0; i < x; i++) {

                bean = new TableBean();
                bean = classHoursList.get(i);

                rs = stmt.executeQuery("select * from class_type_hours where degree_id = '" + bean.getDegree_id() + "' ");
                classHoursList.remove(i);

                while (rs.next()) {

                    bean = new TableBean();
                    bean.setDegree_id(rs.getInt("degree_id"));
                    bean.setClass_type_id(rs.getInt("class_type_id"));
                    bean.setHours(rs.getInt("hours"));
                    classHoursList.add(bean);
                }
            }

            x = x = classHoursList.size();

            for (int i = 0; i < x; i++) {

                bean = new TableBean();
                bean = classHoursList.get(i);

                rs = stmt.executeQuery("select * from class_type where class_type_id = '" + bean.getClass_type_id() + "' ");

                while (rs.next()) {

                    bean.setClass_type(rs.getString("class_type"));

                }
            }

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return classHoursList;
    }

    public static List<TableBean> getUsedWorkload(int sem_id, List<TableBean> allocatedFacultyList) {

        List<TableBean> usedWorkload = new ArrayList<>();
        TableBean bean, bean1;
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from division where sem_id = '" + sem_id + "'");

            while (rs.next()) {
                int y = rs.getInt("division_id");

                for (int i = 0; i < allocatedFacultyList.size(); i++) {
                    bean = new TableBean();
                    bean = allocatedFacultyList.get(i);
                    rs = stmt.executeQuery("select t.*,f.* from timetable_main t,faculty_allocation_subject f where t.div_id = '" + y + "' and t.faculty_allocation_subject_id = '" + bean.getFaculty_allocation_subject_id() + "' and f.faculty_allocation_subject_id = '" + bean.getFaculty_allocation_subject_id() + "' ");

                    while (rs.next()) {

                        TableBean beanTemp = new TableBean();

                        beanTemp.setFaculty_allocation_subject_id(rs.getInt("faculty_allocation_subject_id"));
                        beanTemp.setRegistration_id(rs.getInt("registration_id"));

                        usedWorkload.add(beanTemp);
                    }

                }
            }

            for (int i = 0; i < allocatedFacultyList.size(); i++) {

                bean = new TableBean();
                bean = allocatedFacultyList.get(i);
                int a = bean.getRegistration_id();
                int x = bean.getWorkload();

                for (int j = 0; j < usedWorkload.size(); j++) {

                    bean1 = new TableBean();
                    bean1 = usedWorkload.get(j);
                    int b = bean1.getRegistration_id();
                    TableBean beanTemp = new TableBean();
                    beanTemp.setRegistration_id(bean1.getRegistration_id());
                    usedWorkload.remove(j);
                    
                    if (a == b) {
                        
                        --x;                              
                        beanTemp.setWorkload(x);
                        
                    } else {
                        
                        beanTemp.setWorkload(x);
                    }
                    usedWorkload.add(beanTemp);
                }
            }

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        for (int i = 0; i < usedWorkload.size(); i++) {
            bean = new TableBean();
            bean = usedWorkload.get(i);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + bean.getRegistration_id() + bean.getWorkload());
        }

        return usedWorkload;
    }
}
