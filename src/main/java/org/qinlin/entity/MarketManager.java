package org.qinlin.entity;

import java.util.Date;

public class MarketManager {
    private Integer managerid;

    private Integer validity;

    private Double enthusiasmRate;

    private Double optimismRate;

    private Double extremeRate;

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

    public Double getEnthusiasmRate() {
        return enthusiasmRate;
    }

    public void setEnthusiasmRate(Double enthusiasmRate) {
        this.enthusiasmRate = enthusiasmRate;
    }

    public Double getOptimismRate() {
        return optimismRate;
    }

    public void setOptimismRate(Double optimismRate) {
        this.optimismRate = optimismRate;
    }

    public Double getExtremeRate() {
        return extremeRate;
    }

    public void setExtremeRate(Double extremeRate) {
        this.extremeRate = extremeRate;
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