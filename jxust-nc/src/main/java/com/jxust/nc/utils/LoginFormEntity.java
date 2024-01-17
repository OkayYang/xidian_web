package com.jxust.nc.utils;

public class LoginFormEntity {
    boolean isNeed;
    String ltValue ;
    String clltValue ;
    String dlltValue ;
    String exeValue ;

    public boolean isNeed() {
        return isNeed;
    }

    public void setNeed(boolean need) {
        isNeed = need;
    }

    public String getLtValue() {
        return ltValue;
    }

    public void setLtValue(String ltValue) {
        this.ltValue = ltValue;
    }

    public String getClltValue() {
        return clltValue;
    }

    public void setClltValue(String clltValue) {
        this.clltValue = clltValue;
    }

    public String getDlltValue() {
        return dlltValue;
    }

    public void setDlltValue(String dlltValue) {
        this.dlltValue = dlltValue;
    }

    public String getExeValue() {
        return exeValue;
    }

    public void setExeValue(String exeValue) {
        this.exeValue = exeValue;
    }
}
