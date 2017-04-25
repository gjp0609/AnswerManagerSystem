package cn.gjp0609.ams.service;

import cn.gjp0609.ams.entity.Interact;
import cn.gjp0609.ams.entity.Page;
import cn.gjp0609.ams.entity.User;

import java.util.List;

/**
 * Created by gjp06 on 17.4.21.
 */
public interface UserService {
    public User login(User user);

    public int register(User user);

    public List<User> fuzzySelect(User user, Page page);

    public List<Interact> fuzzFindInteract(Interact interact, Page page);

    public int deleteInteract(Integer id);
}
