package cn.edu.nuc.ssm.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * logistics表(Logistics)实体类
 *
 * @author makejava
 * @since 2022-02-11 14:10:57
 */

public class Logistics implements Serializable {
    private static final long serialVersionUID = 770256800216421241L;
    /**
     * id主键
     */
    private Integer lId;

    private String toAddress;

    private String toName;

    private String toPhone;

    private String address;

    private String name;

    private String phone;

    private String way;

    private Integer weight;

    private String money;

    private String kinds;

    private String lNumber;

    private String deliver;

    private String mark;
    private String logisticsAddress;

    @Override
    public String toString() {
        return "Logistics{" +
                "lId=" + lId +
                ", toAddress='" + toAddress + '\'' +
                ", toName='" + toName + '\'' +
                ", toPhone='" + toPhone + '\'' +
                ", address='" + address + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", way='" + way + '\'' +
                ", weight=" + weight +
                ", money='" + money + '\'' +
                ", kinds='" + kinds + '\'' +
                ", lNumber='" + lNumber + '\'' +
                ", deliver='" + deliver + '\'' +
                ", mark='" + mark + '\'' +
                ", logisticsAddress='" + logisticsAddress + '\'' +
                '}';
    }

    public String getLogisticsAddress() {
        return logisticsAddress;
    }

    public void setLogisticsAddress(String logisticsAddress) {
        this.logisticsAddress = logisticsAddress;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getDeliver() {
        return deliver;
    }

    public void setDeliver(String deliver) {
        this.deliver = deliver;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public String getToPhone() {
        return toPhone;
    }

    public void setToPhone(String toPhone) {
        this.toPhone = toPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getKinds() {
        return kinds;
    }

    public void setKinds(String kinds) {
        this.kinds = kinds;
    }

    public String getlNumber() {
        return lNumber;
    }

    public void setlNumber(String lNumber) {
        this.lNumber = lNumber;
    }
}

