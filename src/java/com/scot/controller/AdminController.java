/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scot.controller;

import com.scot.bean.AdminBean;
import com.scot.bean.TableBean;
import com.scot.bean.UserBean;
import com.scot.dao.AdminDao;
import com.scot.dao.TableContentDao;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AdminController extends HttpServlet {

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
            if (request.getRequestURI().contains("adminLogin")) {
                String userName = request.getParameter("userName");
                String passWord = request.getParameter("passWord");

                AdminBean adminBean = new AdminBean();
                adminBean.setUserName(userName);
                adminBean.setPassWord(passWord);

                boolean flag = AdminDao.loginAdmin(adminBean);

                if (flag) {
                    if ("admin".equals(userName) && "123".equals(passWord)) {
                        RequestDispatcher rd = request.getRequestDispatcher("/adminChangePassword.jsp");
                        rd.forward(request, response);
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("userName", userName);

                        List<String> tableNames = AdminDao.tableNames();
                        List<TableBean> notificationList = AdminDao.notificationShow();
                        List<TableBean> tableDropDownInstituteDetail = TableContentDao.institute_detailShow();
                        List<TableBean> tableDropDownDepartmentDetail = TableContentDao.departmentDetailShow();

                        RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                        request.setAttribute("tableNames", tableNames);
                        session.setAttribute("notificationList", notificationList);
                        request.setAttribute("tableDropDownInstituteDetail", tableDropDownInstituteDetail);
                        request.setAttribute("tableDropDownDepartmentDetail", tableDropDownDepartmentDetail);
                        rd.forward(request, response);
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                    request.setAttribute("msg", "Incorrect Username or Password");
                    rd.forward(request, response);
                }
            } else if (request.getRequestURI().contains("changePassword")) {
                String userName = request.getParameter("userName");
                String passWord = request.getParameter("passWord");

                AdminBean adminBean = new AdminBean();
                adminBean.setUserName(userName);
                adminBean.setPassWord(passWord);

                boolean flag = AdminDao.changePassword(adminBean);
                if (flag) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", userName);
                    List<String> tableNames = AdminDao.tableNames();
                    List<TableBean> notificationList = AdminDao.notificationShow();

                    RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                    request.setAttribute("tableNames", tableNames);
                    session.setAttribute("notificationList", notificationList);
                    rd.forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    List<String> tableNames = AdminDao.tableNames();
                    List<TableBean> notificationList = AdminDao.notificationShow();

                    RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
                    request.setAttribute("error", "Username and Password combination alreday exists");
                    request.setAttribute("tableNames", tableNames);
                    session.setAttribute("notificationList", notificationList);
                    rd.forward(request, response);
                }
            } else if (request.getRequestURI().contains("notificationSet")) {

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

                RequestDispatcher rd = request.getRequestDispatcher("/adminHome.jsp");
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
