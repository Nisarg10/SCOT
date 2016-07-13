package com.scot.controller;

import com.scot.bean.TableBean;
import com.scot.dao.AdminDao;
import com.scot.dao.TableContentDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TableController extends HttpServlet {

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
            if (request.getRequestURI().contains("country")) {
                List<TableBean> tableContent = TableContentDao.countryShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "country");

                request.setAttribute("tableContent", tableContent);
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/class_type")) {

                List<TableBean> tableContent = TableContentDao.classTypeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableName", "class_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("room_allocation")) {

                List<TableBean> tableContent = TableContentDao.roomAllocationShow();
                List<TableBean> tableDropDownClassType = TableContentDao.classTypeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownClassType", tableDropDownClassType);
                request.setAttribute("tableName", "room_allocation");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("semester")) {

                List<TableBean> tableContent = TableContentDao.semesterShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);
                request.setAttribute("tableName", "semester");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("division")) {

                List<TableBean> tableContent = TableContentDao.divisionShow();
                List<TableBean> tableDropDownSemester = TableContentDao.semesterShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownSemester", tableDropDownSemester);
                request.setAttribute("tableName", "division");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree_type")) {

                List<TableBean> tableContent = TableContentDao.degreeTypeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableName", "degree_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree")) {

                List<TableBean> tableContent = TableContentDao.degreeShow();
                List<TableBean> tableDropDownDegreeType = TableContentDao.degreeTypeShow();
                List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegreeType", tableDropDownDegreeType);
                request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                request.setAttribute("tableName", "degree");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/subject")) {

                List<TableBean> tableContent = TableContentDao.subjectShow();
                List<TableBean> tableDropDownSemester = TableContentDao.semesterShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownSemester", tableDropDownSemester);
                request.setAttribute("tableName", "subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("timetable_main")) {

                List<TableBean> tableContent = TableContentDao.timetableMainShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableName", "timetable_main");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("timeslot_template")) {

                List<TableBean> tableContent = TableContentDao.timeslotTemplateShow();
                List<TableBean> tableDropDownDay = TableContentDao.dayShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDay", tableDropDownDay);
                request.setAttribute("tableName", "timeslot_template");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("state")) {

                List<TableBean> tableContent = TableContentDao.stateShow();
                List<TableBean> tableDropDownCountry = TableContentDao.countryShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownCountry", tableDropDownCountry);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "state");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/city")) {

                List<TableBean> tableContent = TableContentDao.cityShow();
                List<TableBean> tableDropDownState = TableContentDao.stateShow();
                List<TableBean> tableDropDownCountry = TableContentDao.countryShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableDropDownState", tableDropDownState);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownCountry", tableDropDownCountry);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "city");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("institute_detail")) {

                List<TableBean> tableContent = TableContentDao.institute_detailShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "institute_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("department_detail")) {

                List<TableBean> tableContent = TableContentDao.departmentDetailShow();
                List<TableBean> tableDropDownInstitute = TableContentDao.institute_detailShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();

                request.setAttribute("tableNames", tableNames);
                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownInstitute", tableDropDownInstitute);
                request.setAttribute("notificationList", notificationList);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "department_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("user_type")) {

                List<TableBean> tableContent = TableContentDao.userTypeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "user_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("faculty_workload")) {

                List<TableBean> tableContent = TableContentDao.facultyWorkloadShow();
                List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();
                List<TableBean> tableDropDownUserType = TableContentDao.userTypeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                request.setAttribute("tableDropDownUserType", tableDropDownUserType);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "faculty_workload");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/faculty_allocation_subject")) {

                List<TableBean> tableContent = TableContentDao.facultyAllocationSubjectShow();
                List<TableBean> tableDropDownRegistration = TableContentDao.registration_detail_userShow();
                List<TableBean> tableDropDownSubject = TableContentDao.subjectShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownSubject", tableDropDownSubject);
                request.setAttribute("tableDropDownRegistration", tableDropDownRegistration);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "faculty_allocation_subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/day")) {

                List<TableBean> tableContent = TableContentDao.dayShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "day");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("proxy_table")) {

                List<TableBean> tableContent = TableContentDao.proxyTableShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "proxy_table");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/class_type_hours")) {

                List<TableBean> tableContent = TableContentDao.classTypeHoursShow();
                List<TableBean> tableDropDownClassType = TableContentDao.classTypeShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownClassType", tableDropDownClassType);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "class_type_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("continuous_hours")) {

                List<TableBean> tableContent = TableContentDao.continuousHoursShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "continuous_hours");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/faculty_maxhours_day")) {

                List<TableBean> tableContent = TableContentDao.facultyMaxHoursDayShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                request.setAttribute("tableName", "faculty_maxhours_day");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableController/subject_continuous")) {

                List<TableBean> tableContent = TableContentDao.subjectContinuousShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();
                List<TableBean> notificationList = AdminDao.notificationShow();
                List<String> tableNames = AdminDao.tableNames();
                request.setAttribute("tableNames", tableNames);

                request.setAttribute("notificationList", notificationList);
                request.setAttribute("tableContent", tableContent);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);

                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
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
