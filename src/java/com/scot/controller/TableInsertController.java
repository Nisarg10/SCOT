/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.controller;

import com.scot.bean.TableBean;
import com.scot.dao.TableContentDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anand
 */
public class TableInsertController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getRequestURI().contains("city")) {
                int state_id = Integer.parseInt(request.getParameter("state_id"));
                String city_name = request.getParameter("city_name");

                TableBean tableBean = new TableBean();
                tableBean.setState_id(state_id);
                tableBean.setCity_name(city_name);

                TableContentDao.insertCityContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/city");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree_type")) {
                String degree_type = request.getParameter("degree_type");

                TableBean tableBean = new TableBean();
                tableBean.setDegree_type(degree_type);

                TableContentDao.insertDegreeTypeContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/degree_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree")) {
                int degree_type_id = Integer.parseInt(request.getParameter("degree_type_id"));
                int department_id = Integer.parseInt(request.getParameter("department_id"));
                String degree_name = request.getParameter("degree_name");

                TableBean tableBean = new TableBean();
                tableBean.setDegree_type_id(degree_type_id);
                tableBean.setDepartment_id(department_id);
                tableBean.setDegree_name(degree_name);

                TableContentDao.insertDegreeContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/degree");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/class_type")) {
                String class_type = request.getParameter("class_type");

                TableBean tableBean = new TableBean();
                tableBean.setClass_type(class_type);

                TableContentDao.insertClassTypeContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/class_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("room_allocation")) {
                int class_type_id = Integer.parseInt(request.getParameter("class_type_id"));
                int room_no = Integer.parseInt(request.getParameter("room_no"));

                TableBean tableBean = new TableBean();
                tableBean.setClass_type_id(class_type_id);
                tableBean.setRoom_no(room_no);

                TableContentDao.insertRoomAllocationContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/room_allocation");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/day")) {
                String day = request.getParameter("day");

                TableBean tableBean = new TableBean();
                tableBean.setDay(day);

                TableContentDao.insertDayContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/day");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("faculty_workload")) {
                int user_type_id = Integer.parseInt(request.getParameter("user_type_id"));
                int department_id = Integer.parseInt(request.getParameter("department_id"));
                int workload = Integer.parseInt(request.getParameter("workload"));

                TableBean tableBean = new TableBean();
                tableBean.setUser_type_id(user_type_id);
                tableBean.setDepartment_id(department_id);
                tableBean.setWorkload(workload);

                TableContentDao.insertFacultyWorkloadContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_workload");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/subject")) {
                int sem_id = Integer.parseInt(request.getParameter("sem_id"));
                int credit = Integer.parseInt(request.getParameter("credit"));
                String subject_name = request.getParameter("subject_name");

                TableBean tableBean = new TableBean();
                tableBean.setSem_id(sem_id);
                tableBean.setCredit(credit);
                tableBean.setSubject_name(subject_name);

                TableContentDao.insertSubjectContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("state")) {
                int country_id = Integer.parseInt(request.getParameter("country_id"));
                String state_name = request.getParameter("state_name");

                TableBean tableBean = new TableBean();
                tableBean.setCountry_id(country_id);
                tableBean.setState_name(state_name);

                TableContentDao.insertStateContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/state");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("country")) {
                String country_name = request.getParameter("country_name");

                TableBean tableBean = new TableBean();
                tableBean.setCountry_name(country_name);

                TableContentDao.insertCountryContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/country");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("institute_detail")) {
                String institute_name = request.getParameter("institute_name");

                TableBean tableBean = new TableBean();
                tableBean.setInstitute_name(institute_name);

                TableContentDao.insertInstituteDetailContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/institute_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("department_detail")) {
                String department_name = request.getParameter("department_name");
                int institute_id = Integer.parseInt(request.getParameter("institute_id"));

                TableBean tableBean = new TableBean();
                tableBean.setInstitute_id(institute_id);
                tableBean.setDepartment_name(department_name);

                TableContentDao.insertDepartmentDetailContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/department_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("user_type")) {
                String user_type = request.getParameter("user_type");
                String temp = request.getParameter("tableDropDownisActive");
                boolean isActive;
                isActive = temp.equals("true");

                System.out.println(isActive);

                TableBean tableBean = new TableBean();
                tableBean.setUser_type(user_type);
                tableBean.setIsActive(isActive);

                TableContentDao.insertUserTypeContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/user_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("semester")) {
                String sem_no = request.getParameter("sem_no");
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();
                tableBean.setSem_no(sem_no);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertSemesterContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/semester");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("division")) {
                int sem_id = Integer.parseInt(request.getParameter("sem_id"));
                String div_name = request.getParameter("div_name");

                TableBean tableBean = new TableBean();
                tableBean.setSem_id(sem_id);
                tableBean.setDiv_name(div_name);

                TableContentDao.insertDivisionContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/division");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/faculty_allocation_subject")) {
                int registration_id = Integer.parseInt(request.getParameter("registration_id"));
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));

                TableBean tableBean = new TableBean();
                tableBean.setRegistration_id(registration_id);
                tableBean.setSubject_id(subject_id);

                TableContentDao.insertFacultyAllocationSubjectContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_allocation_subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("timeslot_template")) {
                int timeslot_set_id = Integer.parseInt(request.getParameter("timeslot_set_id"));
                int day_id = Integer.parseInt(request.getParameter("day_id"));
                String s = request.getParameter("start_time");
                String e = request.getParameter("end_time");
                Time start_time = Time.valueOf(s);
                Time end_time = Time.valueOf(e);

                TableBean tableBean = new TableBean();

                tableBean.setTimeslot_set_id(timeslot_set_id);
                tableBean.setStart_time(start_time);
                tableBean.setEnd_time(end_time);
                tableBean.setDay_id(day_id);

                TableContentDao.insertTimeslotTemplateContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/timeslot_template");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/class_type_hours")) {

                int class_type_id = Integer.parseInt(request.getParameter("class_type_id"));
                int hours = Integer.parseInt(request.getParameter("hours"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();

                tableBean.setClass_type_id(class_type_id);
                tableBean.setHours(hours);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertClassTypeHoursContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/class_type_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("continuous_hours")) {
                int max_continuous = Integer.parseInt(request.getParameter("max_continuous"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();

                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertContinuousHoursContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/continuous_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/faculty_maxhours_day")) {
                int max_hours_day = Integer.parseInt(request.getParameter("max_hours_day"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();

                tableBean.setMax_hours_day(max_hours_day);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertfacultyMaxHoursDayContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_maxhours_day");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/subject_continuous")) {

                int max_continuous = Integer.parseInt(request.getParameter("max_continuous"));
                
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));
                TableBean tableBean = new TableBean();

                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertSubjectContinuousContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/subject_continuous");
                rd.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
