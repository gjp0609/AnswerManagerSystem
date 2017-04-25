package cn.gjp0609.ams.service.impl;

import cn.gjp0609.ams.dao.UserDao;
import cn.gjp0609.ams.entity.Interact;
import cn.gjp0609.ams.entity.Page;
import cn.gjp0609.ams.entity.User;
import cn.gjp0609.ams.service.UserService;
import cn.gjp0609.ams.utils.MyBatisUtils;

import java.util.List;

/**
 * Created by gjp06 on 17.4.21.
 */
public class UserServiceImpl implements UserService {

    @Override
    public User login(User user) {
        List<User> userList = null;
        try {
            if (user == null) throw new RuntimeException("USI -> userLogin -> 收到的 user 为空");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            userList = dao.selectUserByCdt(user, 0, 100);
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            e.printStackTrace();
        }
        return userList != null && userList.size() > 0 ? userList.get(0) : null;
    }

    @Override
    public int register(User user) {
        int result = 0;
        try {
            if (user == null) throw new RuntimeException("USI -> userLogin -> 收到的 user 为空");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            result = dao.insertUser(user);
            if (result != 1) throw new RuntimeException("USI -> userLogin -> 注册失败");
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<User> fuzzySelect(User user, Page page) {
        List<User> userList = null;
        try {
            if (user == null) throw new RuntimeException("USI -> fuzzySelect -> 收到的 user 为空");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            int totalRows = dao.selectTotalRows(user);
            page.setTotalRows(totalRows);
            user.setRole("teacher");
            userList = dao.selectUserByCdt(user,
                    page.getFirstRow(), page.getLastRow());
            if (userList == null) {
                System.out.println("USI -> fuzzySelect -> null");
            }
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<Interact> fuzzFindInteract(Interact interact, Page page) {
        List<Interact> interactList = null;
        try {
            if (interact == null) throw new RuntimeException("USI -> fuzzFindInteract -> 收到的 interact 为空");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            int totalRows = dao.selTotalInterRows(interact);
            page.setTotalRows(totalRows);
            interactList = dao.selectInteractByCdt(interact, page.getFirstRow(), page.getLastRow());
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            e.printStackTrace();
        }
        return interactList;
    }

    @Override
    public int deleteInteract(Integer id) {
        int result = 0;
        try {
            if (id == null) throw new RuntimeException("USI -> fuzzFindInteract -> 收到的 id 为空");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            result = dao.deleteInteract(id);
            if (result == 0) throw new RuntimeException("USI -> fuzzFindInteract -> 删除失败");
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }
}
