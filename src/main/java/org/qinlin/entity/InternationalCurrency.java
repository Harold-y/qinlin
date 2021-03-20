package org.qinlin.entity;

import java.util.Date;

public class InternationalCurrency {
    private Integer currencyid;

    private String currencyEngName;

    private String currencyCnName;

    private String currencyAbbreName;

    private Double exchangerateUsd;

    private Date timeupdated;

    public Integer getCurrencyid() {
        return currencyid;
    }

    public void setCurrencyid(Integer currencyid) {
        this.currencyid = currencyid;
    }

    public String getCurrencyEngName() {
        return currencyEngName;
    }

    public void setCurrencyEngName(String currencyEngName) {
        this.currencyEngName = currencyEngName == null ? null : currencyEngName.trim();
    }

    public String getCurrencyCnName() {
        return currencyCnName;
    }

    public void setCurrencyCnName(String currencyCnName) {
        this.currencyCnName = currencyCnName == null ? null : currencyCnName.trim();
    }

    public String getCurrencyAbbreName() {
        return currencyAbbreName;
    }

    public void setCurrencyAbbreName(String currencyAbbreName) {
        this.currencyAbbreName = currencyAbbreName == null ? null : currencyAbbreName.trim();
    }

    public Double getExchangerateUsd() {
        return exchangerateUsd;
    }

    public void setExchangerateUsd(Double exchangerateUsd) {
        this.exchangerateUsd = exchangerateUsd;
    }

    public Date getTimeupdated() {
        return timeupdated;
    }

    public void setTimeupdated(Date timeupdated) {
        this.timeupdated = timeupdated;
    }

    public InternationalCurrency() {
    }

    public InternationalCurrency(Integer currencyid, String currencyEngName, String currencyCnName, String currencyAbbreName, Double exchangerateUsd, Date timeupdated) {
        this.currencyid = currencyid;
        this.currencyEngName = currencyEngName;
        this.currencyCnName = currencyCnName;
        this.currencyAbbreName = currencyAbbreName;
        this.exchangerateUsd = exchangerateUsd;
        this.timeupdated = timeupdated;
    }

    public InternationalCurrency(String currencyEngName, String currencyCnName, String currencyAbbreName, Double exchangerateUsd) {
        this.currencyEngName = currencyEngName;
        this.currencyCnName = currencyCnName;
        this.currencyAbbreName = currencyAbbreName;
        this.exchangerateUsd = exchangerateUsd;
    }
}