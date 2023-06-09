package cn.edu.nuc.ssm.entity;


import lombok.Data;

import java.io.Serializable;

/**
 * (TCar)实体类
 *
 * @author makejava
 * @since 2022-01-03 15:06:26
 */

public class TCar implements Serializable {
    private static final long serialVersionUID = -35514278421981901L;
    /**
     * 车辆编号
     */
    private String carId;
    /**
     * 购买时间
     */
    private  String buytime;
    /**
     * 生产厂家
     */
    private String manufacturer;
    /**
     * 型号
     */
    private String carType;
    /**
     * 已装重量
     */
    private Integer aLoadWeight;
    /**
     * 载重量
     */
    private Integer loadWeight;
    /**
     * 当前状态
     */
    private String nowStatus;
    /**
     * 车主
     */
    private String carOwner;

    @Override
    public String toString() {
        return "TCar{" +
                "carId=" + carId +
                ", buytime='" + buytime + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", carType='" + carType + '\'' +
                ", aLoadWeight=" + aLoadWeight +
                ", loadWeight=" + loadWeight +
                ", nowStatus='" + nowStatus + '\'' +
                ", carOwner='" + carOwner + '\'' +
                '}';
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getBuytime() {
        return buytime;
    }

    public void setBuytime(String buytime) {
        this.buytime = buytime;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public Integer getaLoadWeight() {
        return aLoadWeight;
    }

    public void setaLoadWeight(Integer aLoadWeight) {
        this.aLoadWeight = aLoadWeight;
    }

    public Integer getLoadWeight() {
        return loadWeight;
    }

    public void setLoadWeight(Integer loadWeight) {
        this.loadWeight = loadWeight;
    }

    public String getNowStatus() {
        return nowStatus;
    }

    public void setNowStatus(String nowStatus) {
        this.nowStatus = nowStatus;
    }

    public String getCarOwner() {
        return carOwner;
    }

    public void setCarOwner(String carOwner) {
        this.carOwner = carOwner;
    }
}

