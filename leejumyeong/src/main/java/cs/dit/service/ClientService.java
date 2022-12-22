package cs.dit.service;

import java.util.List;

import cs.dit.dto.ClientVO;

public interface ClientService {
	// 실행할 서비스을 미리 인터페이스로 구현해둡니다.
	public List<ClientVO> getlistP(); // 리스트 가져와서 확인
	public ClientVO loginCheck(ClientVO client); // 리스트을 가져와 데이터 비교
	public int signUp(ClientVO client); // 데이터을 가져와 DB에 넣기
	public int deleteP(String userid); // 해당 userid을 찾아 삭제
	public int updateP(ClientVO client); // 해당 리스트을 업데이트
}
