package cs.dit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cs.dit.dto.BoardVO;
import cs.dit.dto.Criteria;
import cs.dit.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	// 의존성 주입으로 각각 서비스할 기능들에게 주입시킵니다.
	@Autowired
	private BoardMapper mp;	
	
	@Override
	public List<BoardVO> newgetList(Criteria cri) {
		// TODO Auto-generated method stub
		return mp.newgetList(cri);
	}
	@Override
	public List<BoardVO> getList(Criteria cri){
		return mp.getList(cri);
	}
	@Override
	public List<BoardVO> popgetList(Criteria cri){
		return mp.popgetList(cri);
	}
	@Override
	public int insert(BoardVO board) {
		return mp.insert(board);
	}
	@Override
	public BoardVO selectOne(Long bno) {
		return mp.selectOne(bno);
	}
	@Override
	public int delete(Long bno) {
		return mp.delete(bno);
	}
	@Override
	public int update(BoardVO board) {
		return mp.update(board);
	}
	public boolean viewcount(Long bno) {
		return mp.viewcount(bno);
	}
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mp.getTotal(cri);
	}
	
}
