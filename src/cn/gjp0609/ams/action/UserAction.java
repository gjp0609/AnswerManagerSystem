package cn.gjp0609.ams.action;

import cn.gjp0609.ams.entity.College;
import cn.gjp0609.ams.entity.Interact;
import cn.gjp0609.ams.entity.Page;
import cn.gjp0609.ams.entity.User;
import cn.gjp0609.ams.service.impl.UserServiceImpl;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gjp06 on 17.4.21.
 */
public class UserAction extends BaseAction {
    private Page page = new Page();
    // 记录模糊查询状态及关键词
    private Integer type = 0;
    private Integer statusType = 0;
    private String name = "";
    private String role = "";
    // 验证码
    private String vcode;


    //
    private Integer interactId = 0;
    private User user = new User();
    private List<User> userList = new ArrayList<>();
    private List<Interact> interactList = new ArrayList<>();

    public String userLogin() throws Exception {
        String adminLoginVCode = (String) getSessionValue("userLoginVCode");
        if (vcode == null || vcode.isEmpty() || !vcode.equalsIgnoreCase(adminLoginVCode))
            return LOGIN;
        // 无教师用户暂时跳转
        if (!"stu".equals(role)) return LOGIN;
        User login = new UserServiceImpl().login(this.user);
        if (login == null) return LOGIN;
        else {
            ServletActionContext.getRequest().getSession().setAttribute("user", login);
            return SUCCESS;
        }
    }

    public String register() throws Exception {
        System.out.println("=    =    =     =    =  = " + user);
        int result = new UserServiceImpl().register(user);
        if (result != 1) return "register";
        else return LOGIN;
    }

    public String fuzzySelect() {
        User u = new User();
        // 院系名称
        if (type == -1) {
            College college = new College();
            college.setName(name);
            u.setCollege(college);
        } else if (type == 2) {
            // 教师姓名
            u.setRealName(name);
        } else {// 非分页
        }
        userList = new UserServiceImpl().fuzzySelect(u, page);
        return SUCCESS;
    }

    public String queryAll() {
        userList = new UserServiceImpl().fuzzySelect(user, page);
        return SUCCESS;
    }

    public String fuzzySelectInteract() {
        Interact interact = new Interact();
        User teacher = new User();
        // 教师姓名
        if (type == 2) {
            teacher.setRole("teacher");
            teacher.setRealName(name);
        }
        // 院系名称
        if (type == -1) { //
            College college = new College();
            college.setName(name);
            teacher.setCollege(college);
        }
        // 未回复
        if (statusType == -1) interact.setStatus("否");
            // 已回复
        else interact.setStatus("是");
        interact.setTeacher(teacher);

        interactList = new UserServiceImpl().fuzzFindInteract(interact, page);
        return SUCCESS;
    }

    public String interactDetails() {
        Interact interact = new Interact();
        interact.setId(interactId);
        interactList = new UserServiceImpl().fuzzFindInteract(interact, new Page());
        return SUCCESS;
    }

    public String deleteInteract() {
        new UserServiceImpl().deleteInteract(interactId);
        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getVcode() {
        return vcode;
    }

    public void setVcode(String vcode) {
        this.vcode = vcode;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public List<Interact> getInteractList() {
        return interactList;
    }

    public void setInteractList(List<Interact> interactList) {
        this.interactList = interactList;
    }

    public Integer getInteractId() {
        return interactId;
    }

    public void setInteractId(Integer interactId) {
        this.interactId = interactId;
    }

    public Integer getStatusType() {
        return statusType;
    }

    public void setStatusType(Integer statusType) {
        this.statusType = statusType;
    }
}
