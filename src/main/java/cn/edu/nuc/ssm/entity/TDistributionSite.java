package cn.edu.nuc.ssm.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 配送点表(TDistributionSite)实体类
 *
 * @author makejava
 * @since 2022-01-08 21:56:12
 */
@Data
public class TDistributionSite implements Serializable {
    private static final long serialVersionUID = -18050859561099445L;
    /**
     * 配送点编号
     */
    private String distributionSiteId;
    /**
     * 配送点名称
     */
    private String distributionSiteName;
    /**
     * 配送点所在地址
     */
    private String distributionSiteAddress;
    /**
     * 配送点规模
     */
    private String distributionSiteScale;
    /**
     * 备注信息
     */
    private String remark;



}

