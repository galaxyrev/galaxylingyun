package com.galaxy.service.impl;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.galaxy.entity.Album;
import com.galaxy.entity.Photo;
import com.galaxy.mapper.AlbumMapper;
import com.galaxy.mapper.PhotoMapper;
import com.galaxy.model.dto.AlbumDTO;
import com.galaxy.model.dto.ConditionDTO;
import com.galaxy.model.vo.AlbumBackVO;
import com.galaxy.model.vo.AlbumVO;
import com.galaxy.model.vo.PageResult;
import com.galaxy.service.AlbumService;
import com.galaxy.utils.BeanCopyUtils;
import com.galaxy.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Objects;

/**
 * 相册业务接口实现类
 *
 * @author galaxy
 */
@Service
public class AlbumServiceImpl extends ServiceImpl<AlbumMapper, Album> implements AlbumService {

    @Autowired
    private AlbumMapper albumMapper;

    @Autowired
    private PhotoMapper photoMapper;

    @Override
    public PageResult<AlbumBackVO> listAlbumBackVO(ConditionDTO condition) {
        // 查询相册数量
        Long count = albumMapper.selectCount(new LambdaQueryWrapper<Album>()
                .like(StringUtils.hasText(condition.getKeyword()), Album::getAlbumName, condition.getKeyword()));
        if (count == 0) {
            return new PageResult<>();
        }
        // 查询相册信息
        List<AlbumBackVO> albumList = albumMapper.selectAlbumBackVO(PageUtils.getLimit(), PageUtils.getSize(), condition.getKeyword());
        return new PageResult<>(albumList, count);
    }

    @Override
    public void addAlbum(AlbumDTO album) {
        // 相册是否存在
        Album existAlbum = albumMapper.selectOne(new LambdaQueryWrapper<Album>()
                .select(Album::getId)
                .eq(Album::getAlbumName, album.getAlbumName()));
        Assert.isNull(existAlbum, album.getAlbumName() + "相册已存在");
        // 添加新相册
        Album newAlbum = BeanCopyUtils.copyBean(album, Album.class);
        baseMapper.insert(newAlbum);
    }

    @Override
    public void deleteAlbum(Integer albumId) {
        // 查询照片数量
        Long count = photoMapper.selectCount(new LambdaQueryWrapper<Photo>()
                .eq(Photo::getAlbumId, albumId));
        Assert.isFalse(count > 0, "相册下存在照片");
        // 不存在照片则删除
        albumMapper.deleteById(albumId);
    }

    @Override
    public void updateAlbum(AlbumDTO album) {
        // 相册是否存在
        Album existAlbum = albumMapper.selectOne(new LambdaQueryWrapper<Album>()
                .select(Album::getId)
                .eq(Album::getAlbumName, album.getAlbumName()));
        Assert.isFalse(Objects.nonNull(existAlbum) && !existAlbum.getId().equals(album.getId()),
                album.getAlbumName() + "相册已存在");
        // 修改相册
        Album newAlbum = BeanCopyUtils.copyBean(album, Album.class);
        baseMapper.updateById(newAlbum);
    }

    @Override
    public AlbumDTO editAlbum(Integer albumId) {
        return albumMapper.selectAlbumById(albumId);
    }

    @Override
    public List<AlbumVO> listAlbumVO() {
        return albumMapper.selectAlbumVOList();
    }
}




