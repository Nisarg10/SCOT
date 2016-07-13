package com.scot.dao;

import com.scot.bean.TableBean;
import com.scot.util.ConnectionUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anand
 */
public class TableContentDao {

    private static Connection con = null;
    private static Statement stmt = null;

    public static List<TableBean> countryShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from country");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 3) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setCountry_id(rs.getInt("country_id"));
                tableBean.setCountry_name(rs.getString("country_name"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> stateShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from state");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setState_id(rs.getInt("state_id"));
                tableBean.setState_name(rs.getString("state_name"));
                tableBean.setCountry_id(rs.getInt("country_id"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> cityShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from city");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setState_id(rs.getInt("state_id"));
                tableBean.setCity_id(rs.getInt("city_id"));
                tableBean.setCity_name(rs.getString("city_name"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> institute_detailShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from institute_detail");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 3) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setInstitute_id(rs.getInt("institute_detail_id"));
                tableBean.setInstitute_name(rs.getString("institute_name"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> departmentDetailShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from department_detail");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setInstitute_id(rs.getInt("institute_id"));
                tableBean.setDepartment_id(rs.getInt("department_detail_id"));
                tableBean.setDepartment_name(rs.getString("department_name"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> userTypeShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from user_type");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setUser_type_id(rs.getInt("user_type_id"));
                tableBean.setUser_type(rs.getString("user_type"));
                tableBean.setIsActive(rs.getBoolean("isActive"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> facultyWorkloadShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from faculty_workload");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 5) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setFaculty_workload_id(rs.getInt("faculty_workload_id"));
                tableBean.setWorkload(rs.getInt("workload"));
                tableBean.setUser_type_id(rs.getInt("user_type_id"));
                tableBean.setDepartment_id(rs.getInt("department_id"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> facultyAllocationSubjectShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from faculty_allocation_subject");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setFaculty_allocation_subject_id(rs.getInt("faculty_allocation_subject_id"));
                tableBean.setRegistration_id(rs.getInt("registration_id"));
                tableBean.setSubject_id(rs.getInt("subject_id"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> dayShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from day");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 3) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setDay_id(rs.getInt("day_id"));
                tableBean.setDay(rs.getString("day"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> proxyTableShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from proxy_table");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 6) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setProxy_table_id(rs.getInt("proxy_table_id"));
                tableBean.setTimetable_id(rs.getInt("timetable_id"));
                tableBean.setProxy_date(rs.getDate("proxy_date"));
                tableBean.setRoom_allocation_id(rs.getInt("room_allocation_id"));
                tableBean.setFaculty_allocation_subject_id(rs.getInt("faculty_allocation_subject_id"));
                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> classTypeShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from class_type");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 3) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setClass_type_id(rs.getInt("class_type_id"));
                tableBean.setClass_type(rs.getString("class_type"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;

    }

    public static List<TableBean> roomAllocationShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from room_allocation");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setRoom_allocation_id(rs.getInt("room_allocation_id"));
                tableBean.setClass_type_id(rs.getInt("class_type_id"));
                tableBean.setRoom_no(rs.getInt("room_no"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> semesterShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from semester");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setSem_id(rs.getInt("semester_id"));
                tableBean.setSem_no(rs.getString("sem_no"));
                tableBean.setDegree_id(rs.getInt("degree_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> divisionShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from division");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setDiv_id(rs.getInt("division_id"));
                tableBean.setDiv_name(rs.getString("div_name"));
                tableBean.setSem_id(rs.getInt("sem_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> degreeTypeShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from degree_type");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 3) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setDegree_type_id(rs.getInt("degree_type_id"));
                tableBean.setDegree_type(rs.getString("degree_type"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> degreeShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from degree");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 5) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setDegree_id(rs.getInt("degree_id"));
                tableBean.setDegree_name(rs.getString("degree_name"));
                tableBean.setDegree_type_id(rs.getInt("degree_type_id"));
                tableBean.setDepartment_id(rs.getInt("department_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> subjectShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from subject");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 5) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setSubject_id(rs.getInt("subject_id"));
                tableBean.setSubject_name(rs.getString("subject_name"));
                tableBean.setCredit(rs.getInt("credit"));
                tableBean.setSem_id(rs.getInt("sem_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> timetableMainShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from timetable_main");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 9) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setTimetable_main_id(rs.getInt("timetable_main_id"));
                tableBean.setTimetable_id(rs.getInt("timetable_id"));
                tableBean.setDay_id(rs.getInt("day_id"));
                tableBean.setStart_time(rs.getTime("start_time"));
                tableBean.setEnd_time(rs.getTime("end_time"));
                tableBean.setDiv_id(rs.getInt("div_id"));
                tableBean.setRoom_allocation_id(rs.getInt("room_allocation_id"));
                tableBean.setFaculty_allocation_subject_id(rs.getInt("faculty_allocation_subject_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static List<TableBean> timeslotTemplateShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from timeslot_template");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 6) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setTimeslot_template_id(rs.getInt("timeslot_template_id"));
                tableBean.setTimeslot_set_id(rs.getInt("timeslot_set_id"));
                tableBean.setStart_time(rs.getTime("start_time"));
                tableBean.setEnd_time(rs.getTime("end_time"));
                tableBean.setDay_id(rs.getInt("day_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static void insertCityContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into city values (null,'" + tableBean.getCity_name() + "','" + tableBean.getState_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertDegreeTypeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into degree_type values (null,'" + tableBean.getDegree_type() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertDegreeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into degree values (null,'" + tableBean.getDegree_name() + "','" + tableBean.getDegree_type_id() + "','" + tableBean.getDepartment_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertClassTypeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into class_type values (null,'" + tableBean.getClass_type() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertRoomAllocationContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into room_allocation values (null,'" + tableBean.getClass_type_id() + "','" + tableBean.getRoom_no() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertDayContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into day values (null,'" + tableBean.getDay() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertFacultyWorkloadContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into faculty_workload values (null,'" + tableBean.getUser_type_id() + "','" + tableBean.getDepartment_id() + "','" + tableBean.getWorkload() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertSubjectContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into subject values (null,'" + tableBean.getSubject_name() + "','" + tableBean.getCredit() + "','" + tableBean.getSem_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertStateContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into state values (null,'" + tableBean.getState_name() + "','" + tableBean.getCountry_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertCountryContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into country values (null,'" + tableBean.getCountry_name() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertInstituteDetailContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into institute_detail values (null,'" + tableBean.getInstitute_name() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertDepartmentDetailContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into department_detail values (null,'" + tableBean.getDepartment_name() + "','" + tableBean.getInstitute_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertUserTypeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            String x = "insert into user_type values (null,'" + tableBean.getUser_type() + "'," + tableBean.isIsActive() + ")";
            System.out.println(x);

            stmt.executeUpdate("insert into user_type values (null,'" + tableBean.getUser_type() + "'," + tableBean.isIsActive() + ")");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertSemesterContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into semester values (null,'" + tableBean.getSem_no() + "','" + tableBean.getDegree_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertDivisionContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into division values (null,'" + tableBean.getDiv_name() + "','" + tableBean.getSem_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static List<TableBean> registration_detail_userShow() {
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from registration_detail_user");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();

                if (i < 18) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }

                tableBean.setRegistration_id(rs.getInt("registration_id"));
                tableBean.setUser_type_id(rs.getInt("user_type_id"));
                tableBean.setEmail(rs.getString("e_mail"));
                tableBean.setfName(rs.getString("f_name"));
                tableBean.setlName(rs.getString("l_name"));
                tableBean.setmName(rs.getString("m_name"));
                tableBean.setGender(rs.getString("gender"));
                tableBean.setDateOfBirth(rs.getDate("dob"));
                tableBean.setAddress(rs.getString("address"));
                tableBean.setMobileNo(rs.getLong("phone_no"));
                tableBean.setCity_name(rs.getString("city"));
                tableBean.setDegree_registration("degree");
                tableBean.setProfessionalDetail(rs.getString("professional_detail"));
                tableBean.setDepartment_id(rs.getInt("department_id"));
                tableBean.setIsActive(rs.getBoolean("isActive"));
                tableBean.setPassword(rs.getString("password"));
                tableBean.setInstitute_id(rs.getInt("institute_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
        return tableContent;
    }

    public static void insertFacultyAllocationSubjectContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into faculty_allocation_subject values (null,'" + tableBean.getRegistration_id() + "','" + tableBean.getSubject_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void deleteContent(String table_name, int id) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            String colID = table_name + "_id";

            stmt.executeUpdate("delete from " + table_name + " where " + colID + " = '" + id + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateCityContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update city set city_name='" + tableBean.getCity_name() + "' ,state_id='" + tableBean.getState_id() + "' where city_id='" + tableBean.getCity_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateStateContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update state set state_name='" + tableBean.getState_name() + "' ,country_id='" + tableBean.getCountry_id() + "' where state_id='" + tableBean.getState_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateCountryContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update country set country_name='" + tableBean.getCountry_name() + "'  where country_id='" + tableBean.getCountry_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateInstituteDetailContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update institute_detail set institute_name='" + tableBean.getInstitute_name() + "'  where institute_detail_id='" + tableBean.getInstitute_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateDepartmentDetailContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update department_detail set department_name='" + tableBean.getDepartment_name() + "' ,institute_id='" + tableBean.getInstitute_id() + "' where department_detail_id='" + tableBean.getDepartment_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateSemesterContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update semester set sem_no='" + tableBean.getSem_no() + "' ,degree_id='" + tableBean.getDegree_id() + "' where semester_id='" + tableBean.getSem_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateDivisionContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update division set div_name='" + tableBean.getDiv_name() + "' ,sem_id='" + tableBean.getSem_id() + "' where division_id='" + tableBean.getDiv_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateUserTypeContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update user_type set user_type='" + tableBean.getUser_type() + "' , isActive=" + tableBean.isIsActive() + " where user_type_id='" + tableBean.getUser_type_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateFacultyAllocationSubjectContent(TableBean tableBean) {
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update faculty_allocation_subject set registration_id='" + tableBean.getRegistration_id() + "' , subject_id=" + tableBean.getSubject_id() + " where faculty_allocation_subject_id='" + tableBean.getFaculty_allocation_subject_id() + "'");
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateDegreeTypeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update degree_type set degree_type='" + tableBean.getDegree_type() + "' where degree_type_id='" + tableBean.getDegree_type_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateDayContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update day set day='" + tableBean.getDay() + "' where day_id='" + tableBean.getDay_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void updateDegreeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update degree set degree_name='" + tableBean.getDegree_name() + "' ,degree_type_id='" + tableBean.getDegree_type_id() + "',department_id='" + tableBean.getDepartment_id() + "' where degree_id='" + tableBean.getDegree_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateClassTypeContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update class_type set class_type='" + tableBean.getClass_type() + "' where class_type_id='" + tableBean.getClass_type_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateRoomAllocationContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update room_allocation set class_type_id='" + tableBean.getClass_type_id() + "',room_no='" + tableBean.getRoom_no() + "' where room_allocation_id='" + tableBean.getRoom_allocation_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void updateFacultyWorkloadContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update faculty_workload set user_type_id='" + tableBean.getUser_type_id() + "',department_id='" + tableBean.getDepartment_id() + "',workload='" + tableBean.getWorkload() + "' where faculty_workload_id='" + tableBean.getFaculty_workload_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateSubjectContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update subject set subject_name='" + tableBean.getSubject_name() + "',credit='" + tableBean.getCredit() + "',sem_id='" + tableBean.getSem_id() + "' where subject_id='" + tableBean.getSubject_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateTimeslotTemplateContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update timeslot_template set timeslot_set_id='" + tableBean.getTimeslot_set_id() + "',start_time='" + tableBean.getStart_time() + "',end_time='" + tableBean.getEnd_time() + "',day_id='" + tableBean.getDay_id() + "' where timeslot_template_id='" + tableBean.getTimeslot_template_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void insertTimeslotTemplateContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into timeslot_template values (null,'" + tableBean.getTimeslot_set_id() + "','" + tableBean.getStart_time() + "','" + tableBean.getEnd_time() + "','" + tableBean.getDay_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static List<TableBean> classTypeHoursShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from class_type_hours");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 5) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setClass_type_hours_id(rs.getInt("class_type_hours_id"));
                tableBean.setClass_type_id(rs.getInt("class_type_id"));
                tableBean.setHours(rs.getInt("hours"));
                tableBean.setDegree_id(rs.getInt("degree_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return tableContent;
    }

    public static void insertClassTypeHoursContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into class_type_hours values (null,'" + tableBean.getClass_type_id() + "','" + tableBean.getHours() + "','" + tableBean.getDegree_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void updateClassTypeHoursContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update class_type_hours set class_type_id='" + tableBean.getClass_type_id() + "',hours='" + tableBean.getHours() + "',degree_id='" + tableBean.getDegree_id() + "' where class_type_hours_id='" + tableBean.getClass_type_hours_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static List<TableBean> continuousHoursShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from continuous_hours");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setContinuous_hours_id(rs.getInt("continuous_hours_id"));
                tableBean.setMax_continuous(rs.getInt("max_continuous"));
                tableBean.setDegree_id(rs.getInt("degree_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return tableContent;
    }

    public static void insertContinuousHoursContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into continuous_hours values (null,'" + tableBean.getMax_continuous() + "','" + tableBean.getDegree_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void updateContinuousHoursContent(TableBean tableBean) {

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update continuous_hours set max_continuous='" + tableBean.getMax_continuous() + "',degree_id='" + tableBean.getDegree_id() + "' where continuous_hours_id='" + tableBean.getContinuous_hours_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static List<TableBean> facultyMaxHoursDayShow() {

        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from faculty_maxhours_day");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setFaculty_maxhours_day_id(rs.getInt("faculty_maxhours_day_id"));
                tableBean.setMax_hours_day(rs.getInt("max_hours_day"));
                tableBean.setDegree_id(rs.getInt("degree_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return tableContent;

    }

    public static void insertfacultyMaxHoursDayContent(TableBean tableBean) {
       
         try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into faculty_maxhours_day values (null,'" + tableBean.getMax_hours_day() + "','" + tableBean.getDegree_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static void updateFacultyMaxHoursDayContent(TableBean tableBean) {
        
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update faculty_maxhours_day set max_hours_day='" + tableBean.getMax_hours_day() + "',degree_id='" + tableBean.getDegree_id() + "' where faculty_maxhours_day_id='" + tableBean.getFaculty_maxhours_day_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

    public static List<TableBean> subjectContinuousShow() {
        
        List<TableBean> tableContent = new ArrayList<>();

        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from subject_continuous");
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = 1;
            while (rs.next()) {
                TableBean tableBean = new TableBean();
                if (i < 4) {
                    String name = rsmd.getColumnName(i);
                    tableBean.setColumnName(name);
                }
                tableBean.setSubject_continuous_id(rs.getInt("subject_continuous_id"));
                tableBean.setMax_continuous(rs.getInt("max_continuous"));
                tableBean.setDegree_id(rs.getInt("degree_id"));

                tableContent.add(tableBean);
                i++;
            }
            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

        return tableContent;
    }

    public static void updatesubjectContinuousContent(TableBean tableBean) {
        
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("update subject_continuous set max_continuous='" + tableBean.getMax_continuous() + "',degree_id='" + tableBean.getDegree_id() + "' where subject_continuous_id='" + tableBean.getSubject_continuous_id() + "'");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }

    }

    public static void insertSubjectContinuousContent(TableBean tableBean) {
        
        try {
            con = ConnectionUtil.getCon();
            stmt = con.createStatement();

            stmt.executeUpdate("insert into subject_continuous values (null,'" + tableBean.getMax_continuous() + "','" + tableBean.getDegree_id() + "')");

            if (con != null) {
                stmt.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error in Stmt " + e);
        }
    }

}
