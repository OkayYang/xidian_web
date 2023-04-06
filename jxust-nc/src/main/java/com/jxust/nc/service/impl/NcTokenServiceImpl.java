package com.jxust.nc.service.impl;


import java.util.List;
import com.jxust.common.utils.DateUtils;
import com.jxust.nc.domain.NcToken;
import com.jxust.nc.mapper.NcTokenMapper;
import com.jxust.nc.service.INcTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class NcTokenServiceImpl implements INcTokenService
{
    @Autowired
    private NcTokenMapper ncTokenMapper;


    @Override
    public NcToken selectNcTokenByTokenId(Long tokenId)
    {
        return ncTokenMapper.selectNcTokenByTokenId(tokenId);
    }


    @Override
    public List<NcToken> selectNcTokenList(NcToken ncToken)
    {
        return ncTokenMapper.selectNcTokenList(ncToken);
    }


    @Override
    public int insertNcToken(NcToken ncToken)
    {
        ncToken.setCreateTime(DateUtils.getNowDate());
        return ncTokenMapper.insertNcToken(ncToken);
    }


    @Override
    public int updateNcToken(NcToken ncToken)
    {
        ncToken.setUpdateTime(DateUtils.getNowDate());
        return ncTokenMapper.updateNcToken(ncToken);
    }


    @Override
    public int deleteNcTokenByTokenIds(Long[] tokenIds)
    {
        return ncTokenMapper.deleteNcTokenByTokenIds(tokenIds);
    }


    @Override
    public int deleteNcTokenByTokenId(Long tokenId)
    {
        return ncTokenMapper.deleteNcTokenByTokenId(tokenId);
    }
}
