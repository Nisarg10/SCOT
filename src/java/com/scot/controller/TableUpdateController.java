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
public class TableUpdateController extends HttpServlet {

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

                int city_id = Integer.parseInt(request.getParameter("id_UD"));
                String city_name = request.getParameter("city_name_UD");
                int state_id = Integer.parseInt(request.getParameter("state_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setCity_id(city_id);
                tableBean.setCity_name(city_name);
                tableBean.setState_id(state_id);

                TableContentDao.updateCityContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/city");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree_type")) {

                int degree_type_id = Integer.parseInt(request.getParameter("id_UD"));
                String degree_type = request.getParameter("degree_type_UD");

                TableBean tableBean = new TableBean();

                tableBean.setDegree_type_id(degree_type_id);
                tableBean.setDegree_type(degree_type);

                TableContentDao.updateDegreeTypeContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/degree_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/day")) {

                int day_id = Integer.parseInt(request.getParameter("id_UD"));
                String day = request.getParameter("day_UD");

                TableBean tableBean = new TableBean();

                tableBean.setDay_id(day_id);
                tableBean.setDay(day);

                TableContentDao.updateDayContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/day");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("degree")) {

                int degree_id = Integer.parseInt(request.getParameter("id_UD"));
                String degree_name = request.getParameter("degree_name_UD");
                int degree_type_id = Integer.parseInt(request.getParameter("degree_type_id_UD"));
                int department_id = Integer.parseInt(request.getParameter("department_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setDegree_id(degree_id);
                tableBean.setDegree_name(degree_name);
                tableBean.setDegree_type_id(degree_type_id);
                tableBean.setDepartment_id(department_id);

                TableContentDao.updateDegreeContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/degree");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/class_type")) {

                int class_type_id = Integer.parseInt(request.getParameter("id_UD"));
                String class_type = request.getParameter("class_type_UD");

                TableBean tableBean = new TableBean();

                tableBean.setClass_type_id(class_type_id);
                tableBean.setClass_type(class_type);

                TableContentDao.updateClassTypeContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/class_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("room_allocation")) {

                int room_allocation_id = Integer.parseInt(request.getParameter("id_UD"));
                int class_type_id = Integer.parseInt(request.getParameter("class_type_id_UD"));
                int room_no = Integer.parseInt(request.getParameter("room_no_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setRoom_allocation_id(room_allocation_id);
                tableBean.setClass_type_id(class_type_id);
                tableBean.setRoom_no(room_no);

                TableContentDao.updateRoomAllocationContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/room_allocation");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("faculty_workload")) {

                int faculty_workload_id = Integer.parseInt(request.getParameter("id_UD"));
                int user_type_id = Integer.parseInt(request.getParameter("user_type_id_UD"));
                int department_id = Integer.parseInt(request.getParameter("department_id_UD"));
                int workload = Integer.parseInt(request.getParameter("workload_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setFaculty_workload_id(faculty_workload_id);
                tableBean.setUser_type_id(user_type_id);
                tableBean.setDepartment_id(department_id);
                tableBean.setWorkload(workload);

                TableContentDao.updateFacultyWorkloadContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_workload");
                rd.forward(request, response);
            } else if (request.getRequestURI().equals("/SCOT/TableUpdateController/subject")) {

                int subject_id = Integer.parseInt(request.getParameter("id_UD"));
                String subject_name = request.getParameter("subject_name_UD");
                int credit = Integer.parseInt(request.getParameter("credit_UD"));
                int sem_id = Integer.parseInt(request.getParameter("sem_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setSubject_id(subject_id);
                tableBean.setSubject_name(subject_name);
                tableBean.setCredit(credit);
                tableBean.setSem_id(sem_id);

                TableContentDao.updateSubjectContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("state")) {

                int state_id = Integer.parseInt(request.getParameter("id_UD"));
                String state_name = request.getParameter("state_name_UD");
                int country_id = Integer.parseInt(request.getParameter("country_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setState_id(state_id);
                tableBean.setState_name(state_name);
                tableBean.setCountry_id(country_id);

                TableContentDao.updateStateContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/state");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("country")) {

                String country_name = request.getParameter("country_name_UD");
                int country_id = Integer.parseInt(request.getParameter("id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setCountry_id(country_id);
                tableBean.setCountry_name(country_name);

                TableContentDao.updateCountryContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/country");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("instituteDetail")) {

                String institute_name = request.getParameter("institute_name_UD");
                int institute_id = Integer.parseInt(request.getParameter("id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setInstitute_id(institute_id);
                tableBean.setInstitute_name(institute_name);

                TableContentDao.updateInstituteDetailContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/institute_detail");
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

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/department_detail");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("semester")) {

                int semester_id = Integer.parseInt(request.getParameter("id_UD"));
                String semester_no = request.getParameter("semester_no_UD");
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setSem_id(semester_id);
                tableBean.setSem_no(semester_no);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updateSemesterContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/semester");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("division")) {

                int division_id = Integer.parseInt(request.getParameter("id_UD"));
                String div_name = request.getParameter("div_name_UD");
                int sem_id = Integer.parseInt(request.getParameter("sem_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setDiv_id(division_id);
                tableBean.setDiv_name(div_name);
                tableBean.setSem_id(sem_id);

                TableContentDao.updateDivisionContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/division");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("userType")) {

                int user_type_id = Integer.parseInt(request.getParameter("id_UD"));
                String user_type = request.getParameter("user_type_UD");
                String temp = request.getParameter("isActive");
                boolean isActive = false;

                if (temp.equals("true")) {
                    isActive = true;
                }

                TableBean tableBean = new TableBean();

                tableBean.setUser_type_id(user_type_id);
                tableBean.setUser_type(user_type);
                tableBean.setIsActive(isActive);

                TableContentDao.updateUserTypeContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/user_type");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("facultyAllocationSubject")) {

                int facultyAllocationSubject_id = Integer.parseInt(request.getParameter("id_UD"));
                int registration_id = Integer.parseInt(request.getParameter("registration_id_UD"));
                int subject_id = Integer.parseInt(request.getParameter("subject_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setFaculty_allocation_subject_id(facultyAllocationSubject_id);
                tableBean.setRegistration_id(registration_id);
                tableBean.setSubject_id(subject_id);

                TableContentDao.updateFacultyAllocationSubjectContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_allocation_subject");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("timeslot_template")) {

                int timeslot_template_id = Integer.parseInt(request.getParameter("id_UD"));
                int timeslot_set_id = Integer.parseInt(request.getParameter("timeslot_set_id_UD"));
                int day_id = Integer.parseInt(request.getParameter("day_id_UD"));
                String s = request.getParameter("start_time_UD");
                String e = request.getParameter("end_time_UD");
                Time start_time = Time.valueOf(s);
                Time end_time = Time.valueOf(e);

                TableBean tableBean = new TableBean();

                tableBean.setTimeslot_template_id(timeslot_template_id);
                tableBean.setTimeslot_set_id(timeslot_set_id);
                tableBean.setStart_time(start_time);
                tableBean.setEnd_time(end_time);
                tableBean.setDay_id(day_id);

                TableContentDao.updateTimeslotTemplateContent(tableBean);

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/timeslot_template");
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

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/class_type_hours");
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

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/continuous_hours");
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

                RequestDispatcher rd = request.getRequestDispatcher("/TableController/faculty_maxhours_day");
                rd.forward(request, response);
            }else if (request.getRequestURI().equals("/SCOT/TableUpdateController/subject_continuous")) {

                int subject_continuous_id = Integer.parseInt(request.getParameter("id_UD"));
                int max_continuous = Integer.parseInt(request.getParameter("max_continuous_UD"));
                int degree_id = Integer.parseInt(request.getParameter("degree_id_UD"));

                TableBean tableBean = new TableBean();

                tableBean.setSubject_continuous_id(subject_continuous_id);
                tableBean.setMax_continuous(max_continuous);
                tableBean.setDegree_id(degree_id);

                TableContentDao.updatesubjectContinuousContent(tableBean);

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
