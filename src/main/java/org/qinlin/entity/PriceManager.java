package org.qinlin.entity;

import java.util.Date;

public class PriceManager {
    private Integer managerid;

    private Integer validity;

    private Integer coinid;

    private Double optimismRate;

    private Double enthusiasmRate;

    private Double assumeLevel;

    private Date timerange;

    private Double pricefloor;

    private Double priceceiling;

    private Integer userid;

    private Date timeupdated;

    public Integer getManagerid() {
        return managerid;
    }

    public void setManagerid(Integer managerid) {
        this.managerid = managerid;
    }

    public Integer getValidity() {
        return validity;
    }

    public void setValidity(Integer validity) {
        this.validity = validity;
    }

    public Integer getCoinid() {
        return coinid;
    }

    public void setCoinid(Integer coinid) {
        this.coinid = coinid;
    }

    public Double getOptimismRate() {
        return optimismRate;
    }

    public void setOptimismRate(Double optimismRate) {
        this.optimismRate = optimismRate;
    }

    public Double getEnthusiasmRate() {
        return enthusiasmRate;
    }

    public void setEnthusiasmRate(Double enthusiasmRate) {
        this.enthusiasmRate = enthusiasmRate;
    }

    public Double getAssumeLevel() {
        return assumeLevel;
    }

    public void setAssumeLevel(Double assumeLevel) {
        this.assumeLevel = assumeLevel;
    }

    public Date getTimerange() {
        return timerange;
    }

    public void setTimerange(Date timerange) {
        this.timerange = timerange;
    }

    public Double getPricefloor() {
        return pricefloor;
    }

    public void setPricefloor(Double pricefloor) {
        this.pricefloor = pricefloor;
    }

    public Double getPriceceiling() {
        return priceceiling;
    }

    public void setPriceceiling(Double priceceiling) {
        this.priceceiling = priceceiling;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getTimeupdated() {
        return timeupdated;
    }

    public void setTimeupdated(Date timeupdated) {
        this.timeupdated = timeupdated;
    }
}