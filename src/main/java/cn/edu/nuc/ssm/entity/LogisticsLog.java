package cn.edu.nuc.ssm.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (LogisticsLog)实体类
 *
 * @author makejava
 * @since 2022-02-14 14:25:23
 */
public class LogisticsLog implements Serializable {
    private static final long serialVersionUID = -61491799301708644L;

    private Integer id;

    private String lNumber;

    private String info;

    private String address;

    private Date time;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "LogisticsLog{" +
                "id=" + id +
                ", lNumber='" + lNumber + '\'' +
                ", info='" + info + '\'' +
                ", address='" + address + '\'' +
                ", time=" + time +
                '}';
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getlNumber() {
        return lNumber;
    }

    public void setlNumber(String lNumber) {
        this.lNumber = lNumber;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}

