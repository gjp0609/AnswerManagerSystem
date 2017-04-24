package cn.gjp0609.ams.dao;

import cn.gjp0609.ams.entity.Interact;
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
     * @param user     条件
     * @param firstRow 分页起始行
     * @param lastRow  分页结束行
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

    /**
     * 查询总行数
     *
     * @param user 模糊查询条件，若无则为 new User()
     * @return 符合条件行数
     */
    public int selectTotalRows(User user);

    /**
     * 根据条件查找互动
     *
     * @param interact 条件
     * @param firstRow 分页起始行
     * @param lastRow  分页结束行
     * @return 查得的互动集合
     */
    public List<Interact> selectInteractByCdt(@Param("interact") Interact interact, @Param("firstRow") Integer firstRow, @Param("lastRow") Integer lastRow);
}
