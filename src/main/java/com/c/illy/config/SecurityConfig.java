package com.c.illy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.c.illy.member.LoginFail;
import com.c.illy.member.LoginSuccess;
import com.c.illy.member.MemberService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private LoginFail loginFail;
	@Autowired
	private LoginSuccess loginSuccess;
	
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
					.antMatchers("/member/common/**")
					.antMatchers("/upload/**")
					.antMatchers("/product/**")
					;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		  http
		  .cors()
		  .and()
		  .csrf()
		  .disable()
		  .authorizeRequests()
		  .antMatchers("/").permitAll()
					 .antMatchers("/member/login").anonymous()
					 .antMatchers("/member/findPw").anonymous()
					 .antMatchers("/member/findId").anonymous()
					 .antMatchers("/member/find_id").anonymous()
					 .antMatchers("/member/join_agreement").anonymous()
					 .antMatchers("/member/join_agreement_detail").anonymous()
					 .antMatchers("/member/join_agreement_detail2").anonymous()
					 .antMatchers("/member/join").anonymous()
					 .antMatchers("/member/checkId").anonymous()
					 .antMatchers("/member/myPage/**").hasAnyRole("MEMBER")
		  .anyRequest().authenticated();
		  http
		  .formLogin()
		  .loginPage("/member/login")
		  .failureHandler(loginFail)
		  .successHandler(loginSuccess)
		  .usernameParameter("username") 
		  .passwordParameter("password") 
		  .defaultSuccessUrl("/")
		  .permitAll()
		  .and() 
		  .logout() 
		  .logoutUrl("/member/logout") 
		  .logoutSuccessUrl("/")
		  .deleteCookies("JSESSIONID") .permitAll();

	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		//Spring 5 이후 부터, 비밀번호를 평문 저장 금지
		return new BCryptPasswordEncoder();
	}
	
}
