package org.qinlin.entity;

public class BankAccount {
    private Integer id;

    private Integer userid;

    private Integer bankid;

    private String bankaccount;

    private double checkingaccount;

    public BankAccount(Integer userid, Integer bankid, String bankaccount, double checkingAccount) {
        this.userid = userid;
        this.bankid = bankid;
        this.bankaccount = bankaccount;
        this.checkingaccount = checkingAccount;
    }

    public BankAccount() {
    }

    public BankAccount(Integer id, Integer userid, Integer bankid, String bankaccount, double checkingAccount) {
        this.id = id;
        this.userid = userid;
        this.bankid = bankid;
        this.bankaccount = bankaccount;
        this.checkingaccount = checkingAccount;
    }

    public double getCheckingaccount() {
        return checkingaccount;
    }

    public void setCheckingaccount(double checkingAccount) {
        this.checkingaccount = checkingAccount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getBankid() {
        return bankid;
    }

    public void setBankid(Integer bankid) {
        this.bankid = bankid;
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount;
    }
}