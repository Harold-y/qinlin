package org.qinlin.entity;

import java.util.Date;

public class Price {
    private Integer priceid;

    private Integer coinid;

    private Double priceUsd;

    private Date timeupdated;

    public Integer getPriceid() {
        return priceid;
    }

    public void setPriceid(Integer priceid) {
        this.priceid = priceid;
    }

    public Integer getCoinid() {
        return coinid;
    }

    public void setCoinid(Integer coinid) {
        this.coinid = coinid;
    }

    public Double getPriceUsd() {
        return priceUsd;
    }

    public void setPriceUsd(Double priceUsd) {
        this.priceUsd = priceUsd;
    }

    public Date getTimeupdated() {
        return timeupdated;
    }

    public void setTimeupdated(Date timeupdated) {
        this.timeupdated = timeupdated;
    }
}