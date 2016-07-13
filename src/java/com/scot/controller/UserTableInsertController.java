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
public class UserTableInsertController extends HttpServlet {

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
            if (request.getRequestURI().contains("institute_detail")) {
                String institute_name = request.getParameter("institute_name");

                TableBean tableBean = new TableBean();
                tableBean.setInstitute_name(institute_name);

                TableContentDao.insertInstituteDetailContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/institute_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("department_detail")) {
                String department_name = request.getParameter("department_name");
                int institute_id = Integer.parseInt(request.getParameter("institute_id"));

                TableBean tableBean = new TableBean();
                tableBean.setInstitute_id(institute_id);
                tableBean.setDepartment_name(department_name);

                TableContentDao.insertDepartmentDetailContent(tableBean);
                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/department_detail");
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

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/class_type_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("continuous_hours")) {
                int max_continuous = Integer.parseInt(request.getParameter("max_continuous"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();

                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertContinuousHoursContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/continuous_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/faculty_maxhours_day")) {
                int max_hours_day = Integer.parseInt(request.getParameter("max_hours_day"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id"));

                TableBean tableBean = new TableBean();

                tableBean.setMax_hours_day(max_hours_day);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertfacultyMaxHoursDayContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/UserTableController/faculty_maxhours_day");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableInsertController/subject_continuous")) {

                int max_continuous = Integer.parseInt(request.getParameter("max_continuous"));

                int degree_id = Integer.parseInt(request.getParameter("degree_id"));
                TableBean tableBean = new TableBean();

                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.insertSubjectContinuousContent(tableBean);

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
