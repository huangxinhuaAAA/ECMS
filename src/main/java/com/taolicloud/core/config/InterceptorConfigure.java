package com.taolicloud.core.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.taolicloud.web.interceptor.ActionInterceptor;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserService
 * @date   2018年3月16日上午9:56:21
 * @desc  [用一句话描述改文件的功能]
 */
@Configuration
public class InterceptorConfigure extends WebMvcConfigurerAdapter {

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter#addInterceptors(org.springframework.web.servlet.config.annotation.InterceptorRegistry)
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ActionInterceptor());
		super.addInterceptors(registry);
	}
	
	

}
