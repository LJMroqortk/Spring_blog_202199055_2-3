package cs.dit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cs.dit.dto.ClientVO;
import cs.dit.mapper.BoardMapper;
import cs.dit.mapper.ClientMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class ClientServiceImpl implements ClientService {
	// 의존성 주입으로 각각 서비스할 기능들에게 주입시킵니다.
	private final ClientMapper mp;
	
	@Override
	public List<ClientVO> getlistP() {
		return mp.getlistP();
	}
	
	@Override
	public ClientVO loginCheck(ClientVO client) {
		return mp.loginCheck(client);
	}

	@Override
	public int signUp(ClientVO client) {
		return mp.signUp(client);
	}

	@Override
	public int deleteP(String userid) {
		return mp.deleteP(userid);
	}

	@Override
	public int updateP(ClientVO client) {
		return mp.updateP(client);
	}
	
}
