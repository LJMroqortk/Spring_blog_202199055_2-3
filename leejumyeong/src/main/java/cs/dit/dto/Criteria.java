package cs.dit.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	//페이지 번호 및 페이지 개수
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);
	}
	// 페이지 기본 생성자
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	//페이지 시작 번호
	public int getPageStart() {
		
		return (this.pageNum - 1) * this.amount;
	}
}
