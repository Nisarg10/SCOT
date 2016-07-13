/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.controller;

import com.scot.bean.TableBean;
import com.scot.bean.UserBean;
import com.scot.dao.AdminDao;
import com.scot.dao.TableContentDao;
import com.scot.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anand
 */

public class UserController extends HttpServlet {

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
            if (request.getRequestURI().contains("userLogin")) {
                String email = request.getParameter("email");
                String passWord = request.getParameter("passWord");

                UserBean userBean = new UserBean();
                userBean.setEmail(email);
                userBean.setPassWord(passWord);

                int check = UserDao.loginUser(userBean);

                if (check != 0 && check != 1) {

                    userBean = UserDao.userDetail(userBean);
                    String userName = userBean.getfName() + " " + userBean.getlName();
                    int user_type_id = userBean.getUser_type_id();
                    List<TableBean> user_type = TableContentDao.userTypeShow();
                    List<TableBean> institute = TableContentDao.institute_detailShow();
                    List<TableBean> country = TableContentDao.countryShow();
                    List<TableBean> department = TableContentDao.departmentDetailShow();

                    HttpSession session = request.getSession();
                    session.setAttribute("userName", userName);
                    session.setAttribute("user_type_id", user_type_id);

                    request.setAttribute("msg", "imageLoad");

                    RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                    session.setAttribute("userBean", userBean);
                    session.setAttribute("user_type", user_type);
                    session.setAttribute("country", country);
                    session.setAttribute("institute", institute);
                    session.setAttribute("department", department);
                    rd.forward(request, response);
                } else {
                    if (check == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        request.setAttribute("msg", "Incorrect Username or Password");
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        request.setAttribute("msg", "User is yet to be activate");
                        rd.forward(request, response);
                    }
                }
            } else if (request.getRequestURI().contains("raw_data")) {

                List<TableBean> tableDropDownCountry = TableContentDao.countryShow();
                List<TableBean> tableDropDownUserType = TableContentDao.userTypeShow();
                List<TableBean> tableDropDownInstituteDetail = TableContentDao.institute_detailShow();
                List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();

                RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
                request.setAttribute("tableDropDownCountry", tableDropDownCountry);
                request.setAttribute("tableDropDownUserType", tableDropDownUserType);
                request.setAttribute("tableDropDownInstituteDetail", tableDropDownInstituteDetail);
                request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("registration")) {

                String f_name = request.getParameter("fname");
                String m_name = request.getParameter("mname");
                String l_name = request.getParameter("lname");
                String e_mail = request.getParameter("email");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String s = request.getParameter("dob");
                Date dob = Date.valueOf(s);
                int user_type_id = Integer.parseInt(request.getParameter("userTypeId"));
                long phone_no = Long.parseLong(request.getParameter("mobileNumber"));
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                int country_id = Integer.parseInt(request.getParameter("country"));
                int institute_id = Integer.parseInt(request.getParameter("institute"));
                int department_id = Integer.parseInt(request.getParameter("department"));
                String degree = request.getParameter("degree");
                String professional_detail = request.getParameter("professional_detail");

                UserBean userBean = new UserBean();
                userBean.setUser_type_id(user_type_id);
                userBean.setEmail(e_mail);
                userBean.setfName(f_name);
                userBean.setmName(m_name);
                userBean.setlName(l_name);
                userBean.setGender(gender);
                userBean.setDateOfBirth(dob);
                userBean.setMobileNo(phone_no);
                userBean.setAddress(address);
                userBean.setCity(city);
                userBean.setDegree_registration(degree);
                userBean.setProfessionalDetail(professional_detail);
                userBean.setDepartment_id(department_id);
                userBean.setPassWord(password);
                userBean.setInstitute_id(institute_id);
                userBean.setState(state);
                userBean.setCountry_id(country_id);

                UserDao.insertRegistrationData(userBean);

                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                request.setAttribute("msg", " ");
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("updateDetails")) {
                int registrationId = Integer.parseInt(request.getParameter("registrationId"));
                String emailId = request.getParameter("emailId");
                String passsword = request.getParameter("password");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                int country_id = Integer.parseInt(request.getParameter("country"));
                int institute_id = Integer.parseInt(request.getParameter("institute"));
                int department_id = Integer.parseInt(request.getParameter("department"));
                String educationQualification = request.getParameter("educationQualification");
                String pofessionalDetail = request.getParameter("professionalDetail");
                long mobileNo = Long.parseLong(request.getParameter("mobileNumber"));

                UserBean userBean = new UserBean();
                userBean.setRegistration_id(registrationId);
                userBean.setPassWord(passsword);
                userBean.setMobileNo(mobileNo);
                userBean.setAddress(address);
                userBean.setCity(city);
                userBean.setDegree_registration(educationQualification);
                userBean.setProfessionalDetail(pofessionalDetail);
                userBean.setDepartment_id(department_id);
                userBean.setInstitute_id(institute_id);
                userBean.setState(state);
                userBean.setCountry_id(country_id);

                UserDao.updateRegistrationData(userBean);

                UserBean userBeanUpdated = new UserBean();
                userBeanUpdated.setEmail(emailId);
                userBeanUpdated.setPassWord(passsword);

                userBeanUpdated = UserDao.userDetail(userBeanUpdated);
                List<TableBean> user_type = TableContentDao.userTypeShow();
                List<TableBean> institute = TableContentDao.institute_detailShow();
                List<TableBean> country = TableContentDao.countryShow();
                List<TableBean> department = TableContentDao.departmentDetailShow();

                HttpSession session = request.getSession();

                RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                session.setAttribute("userBean", userBeanUpdated);
                session.setAttribute("user_type", user_type);
                session.setAttribute("country", country);
                session.setAttribute("institute", institute);
                session.setAttribute("department", department);
                request.setAttribute("msg", "imageLoad");
                rd.forward(request, response);

            } else if (request.getRequestURI().contains("notification")) {

                HttpSession session = request.getSession();

                int i = (int) request.getSession().getAttribute("user_type_id");
                List<TableBean> notificationList = UserDao.notificationShow(i);
                List<TableBean> tableDropDownInstituteDetail = TableContentDao.institute_detailShow();
                List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();

                RequestDispatcher rd = request.getRequestDispatcher("/notification.jsp");
                session.setAttribute("notificationList", notificationList);
                request.setAttribute("tableDropDownInstituteDetail", tableDropDownInstituteDetail);
                request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                rd.forward(request, response);
            } else if (request.getRequestURI().contains("setNotify")) {

                HttpSession session = request.getSession();

                List<TableBean> userList = (List<TableBean>) session.getAttribute("notificationList");
                List<UserBean> userActList = new ArrayList<>();
                TableBean bean;
                UserBean userBean;

                boolean user[] = new boolean[userList.size()];
                String x;

                for (int i = 0; i < userList.size(); i++) {

                    userBean = new UserBean();
                    bean = new TableBean();
                    bean = (TableBean) userList.get(i);

                    x = String.valueOf(bean.getRegistration_id());
                    user[i] = Boolean.parseBoolean(request.getParameter(x));

                    userBean.setRegistration_id(bean.getRegistration_id());
                    userBean.setIsActive(user[i]);

                    userActList.add(userBean);
                }

                AdminDao.notificationAct(userActList);

                List<String> tableNames = AdminDao.tableNames();
                List<TableBean> notificationList = AdminDao.notificationShow();

                RequestDispatcher rd = request.getRequestDispatcher("/UserController/notification");
                request.setAttribute("tableNames", tableNames);
                session.setAttribute("notificationList", notificationList);
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
