package org.zerock.controller;

import java.util.Date;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardServiceImpl service;
	@Autowired
	BoardVO v;
	
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));

	
		
	} 
	@PostMapping("/register")
	public String register(BoardVO board,RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result",board.getBno());
		return "redirect:/board/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno,Model model) {
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/modify")
	public String modify(BoardVO board,RedirectAttributes rttr) {
		service.modify(board);
		return "redirect:/board/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,RedirectAttributes rttr) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}
	@GetMapping("/register")
	public void register() {
		
	}
	
}

