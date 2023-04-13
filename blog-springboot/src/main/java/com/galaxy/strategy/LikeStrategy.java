package com.galaxy.strategy;

/**
 * 点赞策略
 *
 * @author galaxy
 */
public interface LikeStrategy {

    /**
     * 点赞
     *
     * @param typeId 类型id
     */
    void like(Integer typeId);
}
