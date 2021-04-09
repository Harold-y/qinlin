package org.qinlin.entity;

import java.util.Date;

public class User {
    private Integer userid;

    private String username;

    private String phone;

    private String email;

    private String password;

    private String realname;

    private String uuid;

    private Date timecreated;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public Date getTimecreated() {
        return timecreated;
    }

    public void setTimecreated(Date timecreated) {
        this.timecreated = timecreated;
    }

    public User(Integer userid, String username, String phone, String email, String password, String realname, String uuid, Date timecreated) {
        this.userid = userid;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.realname = realname;
        this.uuid = uuid;
        this.timecreated = timecreated;
    }

    public User(String username, String phone, String email, String password, String uuid, Date timecreated) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.uuid = uuid;
        this.timecreated = timecreated;
    }

    public User(String username, String phone, String email, String password) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }
    public User()
    {

    }
}