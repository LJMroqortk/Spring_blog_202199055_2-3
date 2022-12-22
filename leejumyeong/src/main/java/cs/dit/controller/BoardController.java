package cs.dit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs.dit.dto.BoardVO;
import cs.dit.dto.Criteria;
import cs.dit.dto.PageVO;
import cs.dit.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/boards/*")
@RequiredArgsConstructor
public class BoardController {
	private final BoardService service;
	
	// index.jsp에서 list을 뽑는 메소드 
	@GetMapping("/index")
	public void index(Criteria cri,Model model) {
		// cri는 페이지개수와 페이지번호을 저장하는 DTO을 index에 맞게 5개정도만 넣었습니다.
		cri = new Criteria(0,5);
		
		// 총 게시글 수을 알기 위해 service의 getTotal로 카운터 하여 데이터 추출한 뒤 total 변수에 담았음 
		int total = service.getTotal(cri);
		// i_list는 새 글이 나올때마다 5개의 게시글을 뽑고, p_list는 조회수가 가장 노은 5개을 순서대로 뽑습니다.
		// 그리고 데이터를 해당 index에 뿌리기 위해 model로 잠시 가져갑니다.
		model.addAttribute("i_list", service.newgetList(cri));
		model.addAttribute("p_list", service.popgetList(cri));
	}
	// list.jsp에서 페이지네이션이 포함된 list을 뽑는 메소드 
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		// 총 게시글 수을 알기 위해 service의 getTotal로 카운터 하여 데이터 추출한 뒤 total 변수에 담았음 
		int total = service.getTotal(cri);
		// list는 게시판의 글을 10개로 한정하여 출력합니다.
		// 그리고 pageMaker는 게시글을 제한한 페이지네이션의 DTO을 새로 설정하여 model에 저장하였습니다.
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	// get과 modify의 주소을 클릭 시 상세 정보을 보는 메소드 
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		// board의 제목을 클릭 시 상세 정보을 확인 가능합니다.
		// 그리고 볼때마다 조회수가 증가하는 viewcount을 사용
		model.addAttribute("board",service.selectOne(bno));
		service.viewcount(bno);
	}
	// 게시글 생성 페이지로 가는 GET POST 메소드
	@GetMapping("/registers")
	public void registersGET() {
	}
	@PostMapping("/registers")
	public String registers() {
		return "redirect:/boards/registers";
	}
	// (중요) 리턴 값이 있는 메소드는 해당 위치로 이동하는 메소드가 Controller에 있기에 설정한 것입니다.
	// 게시글 생성 페이지 가는 메소드
	@GetMapping("/register")
	public void registerGET() {
	}
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		// my_board에 데이터 삽입하는 service
		int count = service.insert(board);
		// 카운터 값이 1이면 완료 표시을 알리기 위해 rttr로 한번만 보내줍니다.
		if(count==1)
			rttr.addFlashAttribute("result","registered");
		
		return "redirect:/boards/list";
	}
	// 데이터를 수정하는 메소드
	@PostMapping("/modify")
	public String modify(BoardVO board,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		// my_board에 데이터 수정을 하는 service
		int count = service.update(board);
		// 카운터 값이 1이면 수정이 완료되었다는 표시을 알리기 위해 rttr로 한번만 보내줍니다.
		if(count==1)
			rttr.addFlashAttribute("result","modified");
		//현재 페이지 개수와 페이지 번호도 보내줍니다.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/boards/list";
	}
	// 데이터를 삭제하는 메소드
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("delete : " + bno);
		// my_board에 데이터를 삭제하는 service
		int count = service.delete(bno);
		// 카운터 값이 1이면 삭제가 완료되었다는 표시을 알리기 위해 rttr로 한번만 보내줍니다.
		if(count==1)
			rttr.addFlashAttribute("result","removed");
		//현재 페이지 개수와 페이지 번호도 보내줍니다.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/boards/list";
	}
}