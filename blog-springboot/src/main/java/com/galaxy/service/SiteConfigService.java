package com.galaxy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.galaxy.entity.SiteConfig;

/**
 * 网站配置业务接口
 *
 * @author galaxy
 */
public interface SiteConfigService extends IService<SiteConfig> {

    /**
     * 获取网站配置
     *
     * @return 网站配置
     */
    SiteConfig getSiteConfig();

    /**
     * 更新网站配置
     *
     * @param siteConfig 网站配置
     */
    void updateSiteConfig(SiteConfig siteConfig);
}
