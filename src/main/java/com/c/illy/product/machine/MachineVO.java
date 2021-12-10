package com.c.illy.product.machine;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.c.illy.product.ProductVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MachineVO extends ProductVO {

	@NotBlank(message = "필수 항목 입니다")
	private String		machine_material;			//소재
	@NotNull(message = "필수 항목 입니다")
	private Integer 	machine_pump;				//펌프
	@NotBlank(message = "필수 항목 입니다")
	private String 		machine_size;				//사이즈
	@NotNull(message = "필수 항목 입니다")
	private Double 		machine_weight;				//무게
	@NotNull(message = "필수 항목 입니다")
	private Double 		machine_capacity;			//물탱크 용량
	@NotNull(message = "필수 항목 입니다")
	private Integer 	machine_powerV;				//정격전압(V)
	@NotNull(message = "필수 항목 입니다")
	private Integer 	machine_powerHz;			//정격전압(Hz)
	@NotNull(message = "필수 항목 입니다")
	private Integer		machine_powerConsumption;	//소비전력(W)
	@NotBlank(message = "필수 항목 입니다")
	private String		machine_safetyInfo;			//안전인증정보

}
