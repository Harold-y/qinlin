package org.qinlin.entity;

public class Founder {
    private Integer founderid;

    private Integer coinid;

    private String founderName;

    private String intro;

    private String position;

    public Integer getFounderid() {
        return founderid;
    }

    public void setFounderid(Integer founderid) {
        this.founderid = founderid;
    }

    public Integer getCoinid() {
        return coinid;
    }

    public void setCoinid(Integer coinid) {
        this.coinid = coinid;
    }

    public String getFounderName() {
        return founderName;
    }

    public void setFounderName(String founderName) {
        this.founderName = founderName == null ? null : founderName.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }
}