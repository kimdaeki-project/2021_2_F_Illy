package com.c.illy.Board;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	
		@NotBlank(message = "필수항목 입니다.")
		private String username;

		@NotBlank(message = "필수항목 입니다.")
		private String password;

		@NotBlank(message = "필수항목 입니다.")
		private String member_name;

		@NotBlank(message = "필수항목 입니다.")
		private String member_email;

		@NotBlank(message = "필수항목 입니다.")
		private String member_phone;

		private Date member_birth;

		private Integer member_point;

}
