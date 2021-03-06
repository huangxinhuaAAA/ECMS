package com.taolicloud.auth.shiro;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserService
 * @date   2018年3月16日上午9:56:21
 * @desc  [登陆缓存配置文件]
 */
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {
	
	private Cache<String, AtomicInteger> passwordRetryCache;

	public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
		passwordRetryCache = cacheManager.getCache("passwordRetryCache");
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		String userName = (String) token.getPrincipal();
		AtomicInteger retryCount = passwordRetryCache.get(userName);
		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(userName, retryCount);
		}
		if (retryCount.incrementAndGet() > 5) {
			throw new ExcessiveAttemptsException();
		}
		boolean matchers = super.doCredentialsMatch(token, info);
		if (matchers) {
			passwordRetryCache.remove(userName);
		}
		return matchers;
	}
}
