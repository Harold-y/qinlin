package org.qinlin.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Transaction {
    private Integer transactionid;

    private Integer buyerid;

    private Integer sellerid;

    private Integer coinid;

    private Double amount;

    @DateTimeFormat
    private Date transactionTime;

    public Double getTotalCharge() {
        return totalCharge;
    }

    public Transaction(Integer transactionid, Integer buyerid, Integer sellerid, Integer coinid, Double amount, Date transactionTime, Double totalCharge) {
        this.transactionid = transactionid;
        this.buyerid = buyerid;
        this.sellerid = sellerid;
        this.coinid = coinid;
        this.amount = amount;
        this.transactionTime = transactionTime;
        this.totalCharge = totalCharge;
    }

    public Transaction() {
    }

    public void setTotalCharge(Double totalCharge) {
        this.totalCharge = totalCharge;
    }

    private Double totalCharge;


    public Integer getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(Integer transactionid) {
        this.transactionid = transactionid;
    }

    public Integer getBuyerid() {
        return buyerid;
    }

    public void setBuyerid(Integer buyerid) {
        this.buyerid = buyerid;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
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

    public Date getTransactionTime() {
        return transactionTime;
    }

    public void setTransactionTime(Date transactionTime) {
        this.transactionTime = transactionTime;
    }
}