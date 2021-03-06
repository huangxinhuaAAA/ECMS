package com.taolicloud.core.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.taolicloud.http.converter.JSONMessageConvertor;
import com.taolicloud.web.servlet.ExceptionHandler;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserService
 * @date   2018年3月16日上午9:56:21
 * @desc  [Model View Controller 配置文件]
 */
@Configuration
public class CmsMvcConfigure extends WebMvcConfigurerAdapter{
	
	/* (non-Javadoc)

	 * @see org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter#extendMessageConverters(java.util.List)

	 */
	@Override
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new JSONMessageConvertor());
		super.extendMessageConverters(converters);
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(300000);
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	@Bean 
	public ExceptionHandler exceptionResolver() {
		return new ExceptionHandler();
	}

}
