package cs.dit.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	// my_board에 넣을 DTO 데이터
	private Long bno,count;
	private String title,content,writer;
	private Date regdate,updatedate;
}
