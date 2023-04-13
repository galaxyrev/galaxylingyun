package com.galaxy.model.vo;

/**
 * @author galaxy
 * @date 2023/02/07 11:29
 **/

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 回复数VO
 *
 * @author galaxy
 */
@Data
@ApiModel(description = "回复数VO")
public class ReplyCountVO {

    /**
     * 评论id
     */
    @ApiModelProperty(value = "评论id")
    private Integer commentId;

    /**
     * 回复数
     */
    @ApiModelProperty(value = "回复数")
    private Integer replyCount;
}
