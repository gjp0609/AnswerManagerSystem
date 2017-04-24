package cn.gjp0609.ams.test;

import cn.gjp0609.ams.dao.UserDao;
import cn.gjp0609.ams.entity.College;
import cn.gjp0609.ams.entity.User;
import cn.gjp0609.ams.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * test
 * Created by gjp06 on 17.4.21.
 */
class TestUserDao {

    @Test
    void testInsert() {
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        College college = new College(10, "软件学院", null);
        User user = new User(null, "ming", "李明", "123123", "student", college, null);
        int i = dao.insertUser(user);
        System.out.println(i);
        MyBatisUtils.commit();
    }

    @Test
    void testSelect() {
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        User user = new User();
//        user.setRealName("");
        College college = new College();
        college.setName("软件");
        user.setCollege(college);
        user.setRole("teacher");
        List<User> userList = dao.selectUserByCdt(user, 1, 3);
        for (User u : userList) {
            System.out.println(u);
        }
    }

}
