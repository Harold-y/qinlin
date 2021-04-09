package org.qinlin.entity;

public class Bank {
    private Integer bankid;

    private String bankCnName;

    private String bankEngName;

    private String bankAbbreName;

    public Integer getBankid() {
        return bankid;
    }

    public void setBankid(Integer bankid) {
        this.bankid = bankid;
    }

    public String getBankCnName() {
        return bankCnName;
    }

    public void setBankCnName(String bankCnName) {
        this.bankCnName = bankCnName == null ? null : bankCnName.trim();
    }

    public String getBankEngName() {
        return bankEngName;
    }

    public void setBankEngName(String bankEngName) {
        this.bankEngName = bankEngName == null ? null : bankEngName.trim();
    }

    public String getBankAbbreName() {
        return bankAbbreName;
    }

    public void setBankAbbreName(String bankAbbreName) {
        this.bankAbbreName = bankAbbreName == null ? null : bankAbbreName.trim();
    }
}