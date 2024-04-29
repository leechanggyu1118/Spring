package com.ezen.test.controller;



import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.test.domain.BoardDTO;
import com.ezen.test.domain.BoardVO;
import com.ezen.test.domain.FileVO;
import com.ezen.test.domain.PagingVO;
import com.ezen.test.handler.FileHandler;
import com.ezen.test.handler.PagingHandler;
import com.ezen.test.serivce.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board/*")
@Slf4j
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	

	private final BoardService bsv;
	private final FileHandler fhd;
	
	@GetMapping("/register")
	public String register() {
		return "/board/register";
	}
	
	//@RequestParam("name")String name : 파라미터를 받을 떄
	// required : 필수여부 false : 파라미터가 없어도 예외가 발생하지 않음
	@PostMapping("/insert")
	public String insert(BoardVO bvo, @RequestParam(name="files", required = false)MultipartFile[] files) {
		log.info(">>>> bvo >> {}", bvo);
		
		//파일 핸들러 처리
		//파일 저장처리 => fileList 리턴
		List<FileVO> flist = null;
		
		//파일이 있을 경우에만 핸들러 호출
		if(files[0].getSize() > 0) {
			//핸들러 호출
			flist = fhd.uploadFiles(files);
			log.info(">>>> files >> {}", files);
		}
		
		BoardDTO bdto = new BoardDTO(bvo, flist);
		int isOk = bsv.insert(bdto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) { // PagingVO 파라미터가 없으면 기본 생성자 값이 된다.
		log.info(">>>> pgvo >> {}", pgvo);
		// 리턴타입은 목적지 경로에 대한 타입(destPage가 리턴)
		//Model 객체 => request.setAttribute 역할을 하는 객체
		List<BoardVO> list = bsv.getList(pgvo);
		int totalCount = bsv.getTotal(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount); 
		log.info(">>>> ph >> {}", ph);
		
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);
		
		return "/board/list";
	}
	
	//detail => /board/detail => return /board/detail
	//modify => /board/modify => return /board/modify
	// controller로 들어오는 경로와 jsp로 나가는 경로가 일치하면 void 처리 할 수 있음.
	@GetMapping({"/detail","/modify"})
	public void detail(Model m, @RequestParam("bno")int bno) {
		log.info(">>>> bno >> {}", bno);
		BoardDTO bdto = bsv.getDetail(bno);
		log.info(">>>> bdto >>{}",bdto);
		m.addAttribute("bdto", bdto);
		
	}
	
	@PostMapping("modify")
	public String modify(BoardVO bvo) {
		log.info(">>> modify bvo >> {}", bvo);
		bsv.update(bvo);
		// /board/detail.jsp : 새로운 데이터를 가지고 가야 함.
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("remove")
	public String remove(@RequestParam("bno")int bno) {
		bsv.remove(bno);
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	
	
	
	
	
}