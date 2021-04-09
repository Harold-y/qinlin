package org.qinlin.entity;

public class CapitalAccount {
    private Integer accountid;

    private Integer userid;

    private Integer coinid;

    private Double amount;

    public CapitalAccount(Integer userid, Integer coinid, Double amount) {
        this.userid = userid;
        this.coinid = coinid;
        this.amount = amount;
    }

    public CapitalAccount() {
    }

    public Integer getAccountid() {
        return accountid;
    }

    public void setAccountid(Integer accountid) {
        this.accountid = accountid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCoinid() {
        return coinid;
    }

    public void setCoinid(Integer coinid) {
        this.coinid = coinid;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }
}