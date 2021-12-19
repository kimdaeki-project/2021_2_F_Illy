package com.c.illy.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO implements UserDetails {

	private Integer member_id;


	@NotBlank(message = "필수항목 입니다.")
	@Pattern(regexp="^[a-zA-Z0-9]{4,13}", message="아이디는 영문 대/소문자와 숫자로 4~13자로 구성")
	private String username;
	
	@NotBlank(message = "필수항목 입니다.")
	@Pattern(regexp="^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,16}$", message = "비밀번호는 영문, 숫자, 특수문자 무조건 1개 이상씩 10~16자로 구성")
	private String password;

	@NotBlank(message = "필수항목 입니다.")
	private String passwordCheck;
	
	@NotBlank(message = "필수항목 입니다.")
	private String member_name;
	
	@NotBlank(message = "필수항목 입니다.")
	@Pattern(regexp = "[a-zA-z0-9]+@[a-zA-z]+[.]+[a-zA-z.]+", message="이메일 형식에 맞게 입력해 주세요.")
	private String member_email;

	@NotBlank(message = "필수항목 입니다.")
	@PositiveOrZero(message="숫자만 입력해주세요.")	
	private String member_phone;
	
	
	private Date member_birth;

	private Integer member_point;

	private boolean enabled;

	private List<RoleVO> roles;
	// get AddressAPI

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (RoleVO roleVO : roles) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}

}
