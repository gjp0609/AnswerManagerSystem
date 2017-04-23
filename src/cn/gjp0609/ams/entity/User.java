package cn.gjp0609.ams.entity;

import java.io.Serializable;
import java.util.List;

/**
 * ID * NAME * REAL_NAME * PASSWORD * ROLE * COLLEGE_ID
 * Created by gjp06 on 17.4.21.
 */
public class User implements Serializable {
    private Integer id;
    private String name;
    private String realName;
    private String password;
    private String role;
    private College college;
    private List<Subject> subjects;

    public User() {
    }

    public User(Integer id, String name, String realName, String password, String role, College college, List<Subject> subjects) {
        this.id = id;
        this.name = name;
        this.realName = realName;
        this.password = password;
        this.role = role;
        this.college = college;
        this.subjects = subjects;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", realName='" + realName + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", college=" + college +
                ", subjects=" + subjects +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }
}
