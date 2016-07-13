/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.controller;

import com.scot.bean.TableBean;
import com.scot.dao.AdminDao;
import com.scot.dao.TableContentDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anand
 */
@WebServlet(name = "UserUserTableController", urlPatterns = {"/UserUserTableController"})
public class UserTableController extends HttpServlet {

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
            if (request.getRequestURI().contains("showTableNames")) {
                List<String> tableNames = AdminDao.tableNames();

                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("institute_detail")) {

                List<TableBean> tableContent = TableContentDao.institute_detailShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "institute_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("department_detail")) {

                List<TableBean> tableContent = TableContentDao.departmentDetailShow();
                List<TableBean> tableDropDownInstitute = TableContentDao.institute_detailShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();

                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");
                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownInstitute", tableDropDownInstitute);
                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "department_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/UserTableController/class_type_hours")) {

                List<TableBean> tableContent = TableContentDao.classTypeHoursShow();
                List<TableBean> tableDropDownClassType = TableContentDao.classTypeShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownClassType", tableDropDownClassType);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "class_type_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("continuous_hours")) {

                List<TableBean> tableContent = TableContentDao.continuousHoursShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "continuous_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/UserTableController/faculty_maxhours_day")) {

                List<TableBean> tableContent = TableContentDao.facultyMaxHoursDayShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "faculty_maxhours_day");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/UserTableController/subject_continuous")) {

                List<TableBean> tableContent = TableContentDao.subjectContinuousShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);
                request.setAttribute("msg","headerChange");

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/database.jsp");
                request.setAttribute("tableName", "subject_continuous");
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
