package cn.edu.nuc.ssm.entity;

import lombok.Data;

public class Sysuser {
    private Integer userid;

    private Integer roleid;

    private Sysrole sysrole;

    private String username;

    private String userpwd;
    //
    private String userphone;
    private Integer sex;
    private String usertruename;

    private Integer userstate;
    //数据传输字段
    private String rolename;

    @Override
    public String toString() {
        return "Sysuser{" +
                "userid=" + userid +
                ", roleid=" + roleid +
                ", sysrole=" + sysrole +
                ", username='" + username + '\'' +
                ", userpwd='" + userpwd + '\'' +
                ", userphone='" + userphone + '\'' +
                ", sex=" + sex +
                ", usertruename='" + usertruename + '\'' +
                ", userstate=" + userstate +
                ", rolename='" + rolename + '\'' +
                '}';
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Sysrole getSysrole() {
        return sysrole;
    }

    public void setSysrole(Sysrole sysrole) {
        this.sysrole = sysrole;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getUsertruename() {
        return usertruename;
    }

    public void setUsertruename(String usertruename) {
        this.usertruename = usertruename;
    }

    public Integer getUserstate() {
        return userstate;
    }

    public void setUserstate(Integer userstate) {
        this.userstate = userstate;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}