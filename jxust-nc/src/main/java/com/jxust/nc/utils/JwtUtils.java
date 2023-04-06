package com.jxust.nc.utils;


import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.jxust.common.utils.StringUtils;


import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtUtils {

    /**
     * APP登录Token的生成和解析
     *
     */

    /** token秘钥，请勿泄露，请勿随便修改 backups:JKKLJOoasdlfj */
    public static final String SECRET = "jiangxiligong8722";
    /** token 过期时间: 10天 */
    public static final int calendarField = Calendar.DATE;
    public static final int calendarInterval = 30;

    /**
     * JWT生成Token.<br/>
     *
     * JWT构成: header, payload, signature
     *
     * @param uid 用户账号作为唯一标识
     *
     */

    public static String createToken(Long uid,String openid)  {
        try{
            Date iatDate = new Date();
            // expire time
            Calendar nowTime = Calendar.getInstance();
            nowTime.add(calendarField, calendarInterval);
            Date expiresDate = nowTime.getTime();

            // header Map
            Map<String, Object> map = new HashMap<>();
            map.put("alg", "HS256");
            map.put("typ", "JWT");

            // build token
            // param backups {iss:Service, aud:APP}
            String token = JWT.create().withHeader(map) // header
                    .withClaim("iss", "Service") // payload
                    .withClaim("aud", "APP")
                    .withClaim("uid", uid)
                    .withClaim("openid",openid)

                    .withIssuedAt(iatDate) // sign time
                    .withExpiresAt(expiresDate) // expire time
                    .sign(Algorithm.HMAC256(SECRET)); // signature

            return token;

        }catch (Exception e){
            return null;

        }

    }

    /**
     * 解密Token
     *
     * @param token
     * @return
     * @throws Exception
     */
    public static Map<String, Claim> verifyToken(String token) {
        DecodedJWT jwt = null;
        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SECRET)).build();
            jwt = verifier.verify(token);
        } catch (Exception e) {
            // e.printStackTrace();
            // token 校验失败, 抛出Token验证非法异常
            return null;
        }
        return jwt.getClaims();
    }

    /**
     * 根据Token获取phone
     *
     * @param token
     * @return 用户账号phone
     */
    public static Long getUid(String token) {
        try {
            Map<String, Claim> claims = verifyToken(token);
            if (claims==null){
                return null;
            }
            Claim user_id_claim = claims.get("uid");
            if (null == user_id_claim || StringUtils.isEmpty(user_id_claim.asString())) {

                // token 校验失败, 抛出Token验证非法异常
            }
            return user_id_claim.asLong();

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
    /**
     * 根据Token获取openid
     *
     * @param token
     * @return 用户openid
     */
    public static String getOpenId(String token) {
        try {
            Map<String, Claim> claims = verifyToken(token);
            if (claims==null){
                return null;
            }
            Claim openid_claim = claims.get("openid");
            if (null == openid_claim || StringUtils.isEmpty(openid_claim.asString())) {

                // token 校验失败, 抛出Token验证非法异常
            }
            return openid_claim.asString();

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

}