package com.jxust.nc.service;



import java.util.List;

import com.jxust.nc.domain.NcToken;
/**
 * 【token】Service接口
 *
 * @author xuxiaoyang
 * @date 2023-04-04
 */
public interface INcTokenService
{

    public NcToken selectNcTokenByTokenId(Long tokenId);


    public List<NcToken> selectNcTokenList(NcToken ncToken);


    public int insertNcToken(NcToken ncToken);


    public int updateNcToken(NcToken ncToken);


    public int deleteNcTokenByTokenIds(Long[] tokenIds);


    public int deleteNcTokenByTokenId(Long tokenId);
}
