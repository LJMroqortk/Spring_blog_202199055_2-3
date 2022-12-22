package cs.dit.service;

import java.util.List;

import cs.dit.dto.BoardVO;
import cs.dit.dto.Criteria;

public interface BoardService {
	// 실행할 서비스을 미리 인터페이스로 구현해둡니다.
	public List<BoardVO> getList(Criteria cri); //list.jsp 자유게시판 리스트 추출
	public List<BoardVO> newgetList(Criteria cri); //index.jsp 자유게시판의 새 글만 리스트 추출
	public List<BoardVO> popgetList(Criteria cri); //index.jsp 자유게시판의 조회수가 가장 높은 리스트만 추출
	public int insert(BoardVO board); // 데이터를 DB에 넣는 메소드
	public BoardVO selectOne(Long bno); // 데이터의 정밀 데이터를 확인하는 메소드
	public int delete(Long bno); // 해당 데이터 번호을 가진 게시글을 삭제하기 위한 메소드
	public int update(BoardVO board); // 해당 데이터 리스트을 업데이트하는 메소드
	public boolean viewcount(Long bno); // 해당 글을 볼때마다 조회수가 증가하는 메소드
	public int getTotal(Criteria cri); // 전체 게시글의 개수을 아는 메소드
}
