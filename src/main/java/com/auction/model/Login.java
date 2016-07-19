package com.auction.model;

/**
 * Created by dell on 2016/7/19.
 */
public class Login {
    private String userName;
    private String password;
    private String validCode;

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setValidCode(String validCode) {
        this.validCode = validCode;
    }

    public String getValidCode() {
        return validCode;
    }

    @Override
    public String toString() {
        return "Login{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", validCode='" + validCode + '\'' +
                '}';
    }
}

