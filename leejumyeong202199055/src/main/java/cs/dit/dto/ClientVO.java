package cs.dit.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ClientVO {
	// my_client에 넣을 DTO 데이터
	public String userid,passwd,name,email;
	public Date join_date;
}
