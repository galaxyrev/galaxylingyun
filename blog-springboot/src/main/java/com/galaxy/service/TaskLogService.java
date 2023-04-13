package com.galaxy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.galaxy.entity.TaskLog;
import com.galaxy.model.dto.ConditionDTO;
import com.galaxy.model.vo.PageResult;
import com.galaxy.model.vo.TaskLogVO;

/**
 * 定时任务日志业务接口
 *
 * @author galaxy
 */
public interface TaskLogService extends IService<TaskLog> {

    /**
     * 查看后台定时任务日志
     *
     * @param condition 条件
     * @return 后台定时任务日志
     */
    PageResult<TaskLogVO> listTaskLog(ConditionDTO condition);

    /**
     * 清空定时任务日志
     */
    void clearTaskLog();
}
