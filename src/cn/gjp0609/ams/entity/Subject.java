package cn.gjp0609.ams.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by gjp06 on 17.4.23.
 */
public class Subject implements Serializable {
    private Integer id;
    private String name;
    private List<User> users;

    public Subject() {
    }

    public Subject(Integer id, String name, List<User> users) {
        this.id = id;
        this.name = name;
        this.users = users;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", users=" + users +
                '}';
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
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
}
