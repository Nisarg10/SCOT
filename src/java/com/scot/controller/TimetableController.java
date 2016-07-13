package com.scot.controller;

import com.scot.bean.TableBean;
import com.scot.dao.TableContentDao;
import com.scot.dao.createTimetableDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nisarg
 */
public class TimetableController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getRequestURI().contains("data_required")) {

                List<TableBean> tableDropDownInstituteDetail = TableContentDao.institute_detailShow();
                List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();
                List<TableBean> tableDropDownSemester = TableContentDao.semesterShow();
                List<TableBean> tableDropDownDivision = TableContentDao.divisionShow();
                List<TableBean> tableDropDownDegree = TableContentDao.degreeShow();

                request.setAttribute("tableDropDownInstituteDetail", tableDropDownInstituteDetail);
                request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                request.setAttribute("tableDropDownSemester", tableDropDownSemester);
                request.setAttribute("tableDropDownDivision", tableDropDownDivision);
                request.setAttribute("tableDropDownDegree", tableDropDownDegree);
                RequestDispatcher rd = request.getRequestDispatcher("/timetable.jsp");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("createTimetable")) {

                int institute_id = Integer.parseInt(request.getParameter("institute"));
                int department_id = Integer.parseInt(request.getParameter("department"));
                int sem_id = Integer.parseInt(request.getParameter("semester"));
                int div_id = Integer.parseInt(request.getParameter("division"));
                String s = request.getParameter("start_time");
                String e = request.getParameter("end_time");
                int start_time = Integer.parseInt(request.getParameter("start_time"));
                int total_duration = Integer.parseInt(request.getParameter("total_duration"));
                int total_break_day = Integer.parseInt(request.getParameter("total_break"));
                int totalClass[] = new int[total_duration];
                int track = 0;

                for (int i = 0; i < total_duration; i++) {
                    if (start_time <= 12) {
                        totalClass[track] = start_time;
                    } else {
                        start_time = 1;
                        totalClass[track] = start_time;
                    }
                    track++;
                }

                int sizeCol = 560 / track;

                String days[] = request.getParameterValues("days");
                int dayTrack = days.length;

                String Monday = null, Tuesday = null, Wednesday = null, Thursday = null, Friday = null, Saturday = null, Sunday = null;

                for (String day : days) {
                    switch (day) {
                        case "Monday":
                            Monday = "Monday";
                            break;
                        case "Tuesday":
                            Tuesday = "Tuesday";
                            break;
                        case "Wednesday":
                            Wednesday = "Wednesday";
                            break;
                        case "Thursday":
                            Thursday = "Thursday";
                            break;
                        case "Friday":
                            Friday = "Friday";
                            break;
                        case "Saturday":
                            Saturday = "Saturday";
                            break;
                        case "Sunday":
                            Sunday = "Sunday";
                            break;
                    }
                }

                String daysString = "";
                for (String string : days) {

                    daysString = daysString + "" + string + " ";
                }
                
                int continuous_study_hours = Integer.parseInt(request.getParameter("continuous_study_hours"));
                int continuous_professor_hours = Integer.parseInt(request.getParameter("professor_continuous_hours"));
                

                TableBean bean = new TableBean();
                bean.setInstitute_id(institute_id);
                bean.setDepartment_id(department_id);
                bean.setSem_id(sem_id);
                bean.setDiv_id(div_id);

                List<TableBean> subjectList = createTimetableDao.getSubjectList(bean);
                List<TableBean> allocatedFacultyList = createTimetableDao.getFacultyList(subjectList);
                int dayTrackValue = total_break_day * dayTrack;

                TableBean beanBreak = new TableBean();
                beanBreak.setfName("BREAK");
                beanBreak.setRegistration_id(0);
                beanBreak.setCredit(dayTrackValue);
                beanBreak.setSubject_id(0);
                allocatedFacultyList.add(beanBreak);

                List<TableBean> classHoursList = createTimetableDao.getclassHoursDetail(department_id);
                List<TableBean> usedWorkload = createTimetableDao.getUsedWorkload(sem_id,allocatedFacultyList);
                
                request.setAttribute("Monday", Monday);
                request.setAttribute("Tuesday", Tuesday);
                request.setAttribute("Wednesday", Wednesday);
                request.setAttribute("Thursday", Thursday);
                request.setAttribute("Friday", Friday);
                request.setAttribute("Saturday", Saturday);
                request.setAttribute("Sunday", Sunday);
                request.setAttribute("subjectList", subjectList);
                request.setAttribute("allocatedFacultyList", allocatedFacultyList);
                request.setAttribute("totalClass", totalClass);
                request.setAttribute("sizeCol", sizeCol);
                request.setAttribute("dayTrackValue", dayTrackValue);
                request.setAttribute("track", track);

                RequestDispatcher rd = request.getRequestDispatcher("/createTimetable.jsp");
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
