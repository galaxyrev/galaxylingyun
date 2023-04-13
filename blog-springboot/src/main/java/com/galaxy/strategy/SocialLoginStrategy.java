package com.galaxy.strategy;

/**
 * 第三方登录策略
 *
 * @author galaxy
 */
public interface SocialLoginStrategy {

    /**
     * 登录
     *
     * @param data data
     * @return {@link String} Token
     */
    String login(String data);
}
