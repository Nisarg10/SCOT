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
public class UserTableUpdateController extends HttpServlet {

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
            if (request.getRequestURI().contains("instituteDetail")) {

                String institute_name = request.getParameter("institute_name_UD");
                int institute_id = Integer.parseInt(request.getParameter("id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setInstitute_id(institute_id);
                tableBean.setInstitute_name(institute_name);

                TableContentDao.updateInstituteDetailContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/institute_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("departmentDetail")) {

                int department_id = Integer.parseInt(request.getParameter("id_UD"));
                String department_name = request.getParameter("department_name_UD");
                int institute_id = Integer.parseInt(request.getParameter("institute_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setDepartment_id(department_id);
                tableBean.setDepartment_name(department_name);
                tableBean.setInstitute_id(institute_id);

                TableContentDao.updateDepartmentDetailContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/department_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/class_type_hours")) {

                int class_type_hours_id = Integer.parseInt(request.getParameter("id_UD"));
                int class_type_id = Integer.parseInt(request.getParameter("class_type_id_UD"));
                int hours = Integer.parseInt(request.getParameter("hours_UD"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setClass_type_hours_id(class_type_hours_id);
                tableBean.setClass_type_id(class_type_id);
                tableBean.setHours(hours);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updateClassTypeHoursContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/class_type_hours");
                rd.forward(request, response);

            } else if (request.getRequestURI().contains("continuous_hours")) {

                int continuous_hours_id = Integer.parseInt(request.getParameter("id_UD"));
                int max_continuous = Integer.parseInt(request.getParameter("max_continuous_UD"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setContinuous_hours_id(continuous_hours_id);
                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updateContinuousHoursContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/continuous_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/faculty_maxhours_day")) {

                int faculty_maxhours_day_id = Integer.parseInt(request.getParameter("id_UD"));
                int max_hours_day = Integer.parseInt(request.getParameter("max_hours_day_UD"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setFaculty_maxhours_day_id(faculty_maxhours_day_id);
                tableBean.setMax_hours_day(max_hours_day);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updateFacultyMaxHoursDayContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/faculty_maxhours_day");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/subject_continuous")) {

                int subject_continuous_id = Integer.parseInt(request.getParameter("id_UD"));
                int max_continuous = Integer.parseInt(request.getParameter("max_continuous_UD"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setSubject_continuous_id(subject_continuous_id);
                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updatesubjectContinuousContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/subject_continuous");
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
