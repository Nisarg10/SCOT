package com.scot.bean;

import java.sql.Date;
import java.sql.Time; // if not work use JAVA.UTIL.CALENDER

public class TableBean {

    private int subject_continuous_id;
    private int faculty_maxhours_day_id;
    private int max_hours_day;
    private int continuous_hours_id;
    private int max_continuous;
    private int class_type_hours_id;
    private int hours;
    private int country_id;
    private int room_allocation_id;
    private int room_no;
    private int sem_id;
    private String sem_no;
    private int degree_id;
    private int div_id;
    private int class_type_id;
    private int degree_type_id;
    private int department_id;
    private int subject_id;
    private int credit;
    private int timetable_main_id;
    private int timetable_id;
    private int day_id;
    private int faculty_allocation_subject_id;
    private int timeslot_template_id;
    private int timeslot_set_id;
    private Time start_time;
    private Time end_time;

    private String country_name;
    private String columnName;
    private String class_type;
    private String div_name;
    private String degree_type;
    private String degree_name;
    private String subject_name;

    private String email;
    private String fName;
    private String lName;
    private String mName;
    private String gender;
    private Date dateOfBirth;
    private long mobileNo;
    private String address;
    private String degree_registration;
    private String professionalDetail;
    private String password;

    private int state_id;
    private String state_name;

    private int city_id;
    private String city_name;

    private int institute_id;
    private String institute_name;

    private String department_name;

    private int user_type_id;
    private String user_type;
    private boolean isActive;

    private int faculty_workload_id;
    private int workload;

    private int registration_id;

    private String day;

    private int proxy_table_id;
    private Date proxy_date;
    
    

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public long getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(long mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDegree_registration() {
        return degree_registration;
    }

    public void setDegree_registration(String degree_registration) {
        this.degree_registration = degree_registration;
    }

    public String getProfessionalDetail() {
        return professionalDetail;
    }

    public void setProfessionalDetail(String professionalDetail) {
        this.professionalDetail = professionalDetail;
    }
    
    

    public int getCountry_id() {
        return country_id;
    }

    public void setCountry_id(int country_id) {
        this.country_id = country_id;
    }

    public String getCountry_name() {
        return country_name;
    }

    public void setCountry_name(String country_name) {
        this.country_name = country_name;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public int getClass_type_id() {
        return class_type_id;
    }

    public void setClass_type_id(int class_type_id) {
        this.class_type_id = class_type_id;
    }

    public String getClass_type() {
        return class_type;
    }

    public void setClass_type(String class_type) {
        this.class_type = class_type;
    }

    public int getRoom_allocation_id() {
        return room_allocation_id;
    }

    public void setRoom_allocation_id(int room_allocation_id) {
        this.room_allocation_id = room_allocation_id;
    }

    public int getRoom_no() {
        return room_no;
    }

    public void setRoom_no(int room_no) {
        this.room_no = room_no;
    }

    public int getSem_id() {
        return sem_id;
    }

    public void setSem_id(int sem_id) {
        this.sem_id = sem_id;
    }

    public String getSem_no() {
        return sem_no;
    }

    public void setSem_no(String sem_no) {
        this.sem_no = sem_no;
    }

    public int getDegree_id() {
        return degree_id;
    }

    public void setDegree_id(int degree_id) {
        this.degree_id = degree_id;
    }

    public int getDiv_id() {
        return div_id;
    }

    public void setDiv_id(int div_id) {
        this.div_id = div_id;
    }

    public String getDiv_name() {
        return div_name;
    }

    public void setDiv_name(String div_name) {
        this.div_name = div_name;
    }

    public int getDegree_type_id() {
        return degree_type_id;
    }

    public void setDegree_type_id(int degree_type_id) {
        this.degree_type_id = degree_type_id;
    }

    public String getDegree_type() {
        return degree_type;
    }

    public void setDegree_type(String degree_type) {
        this.degree_type = degree_type;
    }

    public String getDegree_name() {
        return degree_name;
    }

    public void setDegree_name(String degree_name) {
        this.degree_name = degree_name;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public int getTimetable_main_id() {
        return timetable_main_id;
    }

    public void setTimetable_main_id(int timetable_main_id) {
        this.timetable_main_id = timetable_main_id;
    }

    public int getTimetable_id() {
        return timetable_id;
    }

    public void setTimetable_id(int timetable_id) {
        this.timetable_id = timetable_id;
    }

    public int getDay_id() {
        return day_id;
    }

    public void setDay_id(int day_id) {
        this.day_id = day_id;
    }

    public int getFaculty_allocation_subject_id() {
        return faculty_allocation_subject_id;
    }

    public void setFaculty_allocation_subject_id(int faculty_allocation_subject_id) {
        this.faculty_allocation_subject_id = faculty_allocation_subject_id;
    }

    public Time getStart_time() {
        return start_time;
    }

    public void setStart_time(Time start_time) {
        this.start_time = start_time;
    }

    public Time getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Time end_time) {
        this.end_time = end_time;
    }

    public int getTimeslot_template_id() {
        return timeslot_template_id;
    }

    public void setTimeslot_template_id(int timeslot_template_id) {
        this.timeslot_template_id = timeslot_template_id;
    }

    public int getTimeslot_set_id() {
        return timeslot_set_id;
    }

    public void setTimeslot_set_id(int timeslot_set_id) {
        this.timeslot_set_id = timeslot_set_id;
    }

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    public String getState_name() {
        return state_name;
    }

    public void setState_name(String state_name) {
        this.state_name = state_name;
    }

    public int getCity_id() {
        return city_id;
    }

    public void setCity_id(int city_id) {
        this.city_id = city_id;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    public int getInstitute_id() {
        return institute_id;
    }

    public void setInstitute_id(int institute_id) {
        this.institute_id = institute_id;
    }

    public String getInstitute_name() {
        return institute_name;
    }

    public void setInstitute_name(String institute_name) {
        this.institute_name = institute_name;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public int getUser_type_id() {
        return user_type_id;
    }

    public void setUser_type_id(int user_type_id) {
        this.user_type_id = user_type_id;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public int getFaculty_workload_id() {
        return faculty_workload_id;
    }

    public void setFaculty_workload_id(int faculty_workload_id) {
        this.faculty_workload_id = faculty_workload_id;
    }

    public int getWorkload() {
        return workload;
    }

    public void setWorkload(int workload) {
        this.workload = workload;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getProxy_table_id() {
        return proxy_table_id;
    }

    public void setProxy_table_id(int proxy_table_id) {
        this.proxy_table_id = proxy_table_id;
    }

    public Date getProxy_date() {
        return proxy_date;
    }

    public void setProxy_date(Date proxy_date) {
        this.proxy_date = proxy_date;
    }

    public int getClass_type_hours_id() {
        return class_type_hours_id;
    }

    public void setClass_type_hours_id(int class_type_hours_id) {
        this.class_type_hours_id = class_type_hours_id;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getContinuous_hours_id() {
        return continuous_hours_id;
    }

    public void setContinuous_hours_id(int continuous_hours_id) {
        this.continuous_hours_id = continuous_hours_id;
    }

    public int getMax_continuous() {
        return max_continuous;
    }

    public void setMax_continuous(int max_continuous) {
        this.max_continuous = max_continuous;
    }

    public int getFaculty_maxhours_day_id() {
        return faculty_maxhours_day_id;
    }

    public void setFaculty_maxhours_day_id(int faculty_maxhours_day_id) {
        this.faculty_maxhours_day_id = faculty_maxhours_day_id;
    }

    public int getMax_hours_day() {
        return max_hours_day;
    }

    public void setMax_hours_day(int max_hours_day) {
        this.max_hours_day = max_hours_day;
    }

    public int getSubject_continuous_id() {
        return subject_continuous_id;
    }

    public void setSubject_continuous_id(int subject_continuous_id) {
        this.subject_continuous_id = subject_continuous_id;
    }

}
