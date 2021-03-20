package org.qinlin.entity;

public class Coin {
    private Integer coinid;

    private String coinIntro;

    private String engName;

    private String cnName;

    private String abbreName;

    private String coinRating;

    public Integer getCoinid() {
        return coinid;
    }

    public void setCoinid(Integer coinid) {
        this.coinid = coinid;
    }

    public String getCoinIntro() {
        return coinIntro;
    }

    public void setCoinIntro(String coinIntro) {
        this.coinIntro = coinIntro == null ? null : coinIntro.trim();
    }

    public String getEngName() {
        return engName;
    }

    public void setEngName(String engName) {
        this.engName = engName == null ? null : engName.trim();
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName == null ? null : cnName.trim();
    }

    public String getAbbreName() {
        return abbreName;
    }

    public void setAbbreName(String abbreName) {
        this.abbreName = abbreName == null ? null : abbreName.trim();
    }

    public String getCoinRating() {
        return coinRating;
    }

    public void setCoinRating(String coinRating) {
        this.coinRating = coinRating == null ? null : coinRating.trim();
    }

    public Coin() {
    }

    public Coin(Integer coinid, String coinIntro, String engName, String cnName, String abbreName, String coinRating) {
        this.coinid = coinid;
        this.coinIntro = coinIntro;
        this.engName = engName;
        this.cnName = cnName;
        this.abbreName = abbreName;
        this.coinRating = coinRating;
    }
}