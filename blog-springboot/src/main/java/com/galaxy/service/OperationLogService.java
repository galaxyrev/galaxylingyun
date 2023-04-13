package com.galaxy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.galaxy.entity.OperationLog;
import com.galaxy.model.dto.ConditionDTO;
import com.galaxy.model.vo.OperationLogVO;
import com.galaxy.model.vo.PageResult;

/**
 * 操作日志业务接口
 *
 * @author galaxy
 */
public interface OperationLogService extends IService<OperationLog> {

    /**
     * 查看操作日志列表
     *
     * @param condition 条件
     * @return 日志列表
     */
    PageResult<OperationLogVO> listOperationLogVO(ConditionDTO condition);

    /**
     * 保存操作日志
     *
     * @param operationLog 操作日志信息
     */
    void saveOperationLog(OperationLog operationLog);
}
