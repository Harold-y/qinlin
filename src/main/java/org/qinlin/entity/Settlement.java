package org.qinlin.entity;

import java.util.Date;

public class Settlement {
    private Integer settlementid;

    private Integer userid;

    private Integer coinid;

    private Double amount;

    private Double price;

    private Double totalCharge;

    private Double serviceChargeUsd;

    private Date settleTime;

    private String type;

    @Override
    public String toString() {
        return "Settlement{" +
                "settlementid=" + settlementid +
                ", userid=" + userid +
                ", coinid=" + coinid +
                ", amount=" + amount +
                ", price=" + price +
                ", totalCharge=" + totalCharge +
                ", serviceChargeUsd=" + serviceChargeUsd +
                ", settleTime=" + settleTime +
                ", type='" + type + '\'' +
                '}';
    }

    public Settlement(Integer settlementid, Integer userid, Integer coinid, Double amount, Double price, Double totalCharge, Double serviceChargeUsd, Date settleTime, String type) {
        this.settlementid = settlementid;
        this.userid = userid;
        this.coinid = coinid;
        this.amount = amount;
        this.price = price;
        this.totalCharge = totalCharge;
        this.serviceChargeUsd = serviceChargeUsd;
        this.settleTime = settleTime;
        this.type = type;
    }

    public Settlement(Integer userid, Integer coinid, Double amount, Double price, Double totalCharge) {
        this.userid = userid;
        this.coinid = coinid;
        this.amount = amount;
        this.price = price;
        this.totalCharge = totalCharge;
    }

    public Settlement(Integer userid, Integer coinid, Double amount, Double price, Double totalCharge, Double serviceChargeUsd, Date settleTime) {
        this.userid = userid;
        this.coinid = coinid;
        this.amount = amount;
        this.price = price;
        this.totalCharge = totalCharge;
        this.serviceChargeUsd = serviceChargeUsd;
        this.settleTime = settleTime;
    }

    public Settlement() {
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSettlementid() {
        return settlementid;
    }

    public void setSettlementid(Integer settlementid) {
        this.settlementid = settlementid;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalCharge() {
        return totalCharge;
    }

    public void setTotalCharge(Double totalCharge) {
        this.totalCharge = totalCharge;
    }

    public Double getServiceChargeUsd() {
        return serviceChargeUsd;
    }

    public void setServiceChargeUsd(Double serviceChargeUsd) {
        this.serviceChargeUsd = serviceChargeUsd;
    }

    public Date getSettleTime() {
        return settleTime;
    }

    public void setSettleTime(Date settleTime) {
        this.settleTime = settleTime;
    }
}