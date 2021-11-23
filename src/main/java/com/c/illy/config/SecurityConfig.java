package com.c.illy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		//정적자원 요청 URL은 Security 거치지 않고 통과
		web.ignoring()
					.antMatchers("/css/**")
					.antMatchers("/js/**")
					.antMatchers("/images/**")
					.antMatchers("/vendor/**")
					.antMatchers("/favicon*/**")
					.antMatchers("/resources/**")
					.antMatchers("/front/**")
					
					;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		//Spring 5 이후 부터, 비밀번호를 평문 저장 금지
		return new BCryptPasswordEncoder();
	}
	
}
