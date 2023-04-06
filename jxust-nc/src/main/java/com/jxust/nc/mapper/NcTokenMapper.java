package com.jxust.nc.mapper;


import com.jxust.nc.domain.NcToken;

import java.util.List;


/**
 * TokenMapper接口
 *
 * @author xuxiaoyang
 * @date 2023-04-04
 */
public interface NcTokenMapper
{

    public NcToken selectNcTokenByTokenId(Long tokenId);


    public List<NcToken> selectNcTokenList(NcToken ncToken);


    public int insertNcToken(NcToken ncToken);


    public int updateNcToken(NcToken ncToken);


    public int deleteNcTokenByTokenId(Long tokenId);


    public int deleteNcTokenByTokenIds(Long[] tokenIds);
}

