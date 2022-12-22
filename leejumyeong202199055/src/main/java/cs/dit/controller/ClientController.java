package cs.dit.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs.dit.dto.BoardVO;
import cs.dit.dto.ClientVO;
import cs.dit.dto.Criteria;
import cs.dit.service.BoardService;
import cs.dit.service.ClientService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/boards/*")
@RequiredArgsConstructor
public class ClientController {
	
	private final ClientService service;
	// (중요) 리턴 값이 있는 메소드는 해당 위치로 이동하는 메소드가 Controller에 있기에 설정한 것입니다.
	@GetMapping("/logins")
	public void loginCheckGET() {
	}

	@PostMapping("/logins")
	public String loginCheck(@RequestParam("userids") String userid,@RequestParam("passwds") String passwd, HttpSession session) {
		//데이터를 param으로 가져 온걸 고객DTO에 저장하고 데이터를 보냅니다. 보내준 데이터를 DB와 비교하여 맞다면 레코드 형식으로 가져오는데 이때
		//login을 할 시 데이터를 체크하여, 성공한다면 session에 에트리뷰트을 저장합니다.
		ClientVO data = new ClientVO();
		data.setUserid(userid);
		data.setPasswd(passwd);
		ClientVO check = service.loginCheck(data);
		if(check != null) {
			log.info("로그인 성공");
			session.setAttribute("client",check);
		}
		return "redirect:/boards/index";
	}
	// 로그아웃 메소드 session만 invalidate 하면 끝이다.
	@GetMapping("/logouts")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/boards/index";
	}
	//이미 session에 데이터가 있기에 굳이 세션을 저장할 필요가 없어 들어갈 수 있게만 하는 메소드
	@GetMapping("/profile")
	public void selectonesGET() {
	}
	@PostMapping("/profile")
	public String selectones() {
		return "redirect:/boards/profile";
	}
	//회원가입을 하면 해당 데이터을 가진 고객DTO을 가지고 service하여 DB에 있는 my_client에 저장합니다.
	@GetMapping("/signUps")
	public void signUpsGET() {
	}
	@PostMapping("/signUps")
	public String signUps(ClientVO client) {
		
		service.signUp(client);
		log.info(client);
		
		return "redirect:/boards/index";
	}
	// 회원정보를 바꿀 시 다시 client이라는 고객 DTO을 새로 저장하여서, 세션에서도 업데이트가 되도록 설정하였습니다.
	@PostMapping("/change")
	public String change(ClientVO client, HttpSession session) {
		
		service.updateP(client);
		session.setAttribute("client", client);
		return "redirect:/boards/index";
	}
	// 회원정보을 탈퇴하면 그와 같이 session도 같이 끊어지게 설정하였습니다.
	@PostMapping("/removes")
	public String remove(@RequestParam("userid") String userid, HttpSession session) {
		
		service.deleteP(userid);
		session.invalidate();
		return "redirect:/boards/index";
	}
}
