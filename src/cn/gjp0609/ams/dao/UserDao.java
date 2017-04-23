package cn.gjp0609.ams.dao;

import cn.gjp0609.ams.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * UserDao 接口
 * Created by gjp06 on 17.4.21.
 */
public interface UserDao {
    /**
     * 根据条件查找用户
     *
     * @param user 条件
     * @return 查得的用户集合
     */
    public List<User> selectUserByCdt(@Param("user") User user, @Param("firstRow") Integer firstRow, @Param("lastRow") Integer lastRow);

    /**
     * 添加用户
     *
     * @param user 要添加的用户
     * @return 受影响行数
     */
    public int insertUser(User user);

    public int selectTotalRows();

}
