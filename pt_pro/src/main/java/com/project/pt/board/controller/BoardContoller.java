package com.project.pt.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.board.vo.BoardVO;
import com.project.pt.common.util.Paging;
import com.project.pt.mem.model.MemDTO;
import com.project.pt.board.model.BoardDTO;
import com.project.pt.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardContoller {
	private static final Logger logger = LoggerFactory.getLogger(BoardContoller.class);

	@Autowired
	private com.project.pt.board.service.BoardService service;
	
	@GetMapping(value="")
	public String getList(Model model,HttpSession session,
			@RequestParam(required=false) String category
		  , @RequestParam(defaultValue="1", required=false) int page) {
		logger.info("getList(category={},page={},sd={})",category,page,session.getAttribute("userid"));
		List datas = service.getBoard(category);


	    /**session.setAttribute("userid","khadmin1"); //어드민 세션
	    session.setAttribute("roles","A"); */
	    
		session.setAttribute("userid","thebibi"); //유저 세션
	    session.setAttribute("roles","M");	
		model.addAttribute("category",category);
		Paging paging = new Paging(datas, page, 10);//생성자로 게시판 리스트와 현재페이지 게시판 출력제한을 보내준다	
		model.addAttribute("datas", paging.getPageData());// 모델객체 데이터 부분에 출력제한된게시판을 넣어준다
		model.addAttribute("pageData", paging);
		
		return "board/list";
		
	}
	

	@GetMapping(value="/detail")
	public String getDetail(Model model,
			HttpSession session,
			@RequestParam(required=false) int dataNum,
			@RequestParam(required=false) String category) {
		logger.info("getDetail(dataNum={},category={})",dataNum,category);
		BoardDTO data = service.getDetail(dataNum);
		logger.info("getDetail(data={})",data);
		logger.info("sd={}",session.getAttribute("userid"));

	    /**session.setAttribute("userid","khadmin1"); 
	    session.setAttribute("roles","A"); */
		model.addAttribute("data", data);
		model.addAttribute("category",category);
		
		return "board/detail";		
	}
	
	
	
	@GetMapping(value="/modify")
	public String modify(Model model,
			  @RequestParam int dataNum
			/*,@SessionAttribute("loginData")MemDTO memDto*/
			, @ModelAttribute BoardVO boardVo) {
		logger.info("modify(boardVo={})",boardVo);

		BoardDTO data = service.getDetail(dataNum);

		model.addAttribute("data", data);
		return "/board/modify";
	}
	@PostMapping(value="/modify")
	public String modify(Model model
			/*, @SessionAttribute("loginData") EmpDTO empDto*/
			, @ModelAttribute BoardVO boardVo) {
		BoardDTO data = service.getDetail(boardVo.getDataNum());
		
		
				data.setTitle(boardVo.getTitle());
				data.setContents(boardVo.getContent());
	
			return "redirect:/board/detail?dataNum=" + data.getDataNum();
				
		}

	@GetMapping(value="/search")
	public String searchBoard(Model model,
			HttpSession session,
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) String category,
			@RequestParam(required=false) String type,
			@ModelAttribute BoardVO boardVo,
		    @RequestParam(defaultValue="1", required=false) int page) {
		logger.info("searchBoard(keyword={},category={},type={})",keyword,category,type);		
			
				List datas = service.searchKeyword(boardVo);
	
				
				model.addAttribute("type",type);
				model.addAttribute("keyword",keyword);
				model.addAttribute("category",category);
				Paging paging = new Paging(datas, page, 10);//생성자로 게시판 리스트와 현재페이지 게시판 출력제한을 보내준다	
				model.addAttribute("datas", paging.getPageData());// 모델객체 데이터 부분에 출력제한된게시판을 넣어준다
				model.addAttribute("pageData", paging);
				
				return "board/search";		
				
			}	
			
	
	@PostMapping(value="/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	public String delete(/*@SessionAttribute("loginData") MemDTO memDto,*/
			 @RequestParam int dataNum) {
		BoardDTO data = service.getDetail(dataNum);
		
		JSONObject json = new JSONObject();
		
		if(data == null) {
			// 삭제할 데이터 없음
			json.put("code", "notExists");
			json.put("message", "이미 삭제 된 데이터 입니다.");
		} /*else {
			if(data.getWriter() == memDto.getUserid()) {
				// 작성자, 수정자 동일인
				boolean result = service.remove(data);
				if(result) {
					json.put("code", "success");
					json.put("message", "삭제가 완료되었습니다.");
				} else {
					// 삭제 실패
					json.put("code", "fail");
					json.put("message", "삭제 작업 중 문제가 발생하였습니다.");
				}
			} else {
				// 작성자, 수정자 동일인 아님 - 권한 없음
				json.put("code", "permissionError");
				json.put("message", "삭제 할 권한이 없습니다.");
			}
		}*/
		
		return json.toJSONString();
	}

	@PostMapping(value="/like", produces="application/json; charset=utf-8")
	@ResponseBody
	public String like(HttpSession session
			, @RequestParam int dataNum) {
		BoardDTO data = service.getDetail(dataNum);
		JSONObject json = new JSONObject();
		
		if(data == null) {
			// 존재하지 않음.
			json.put("code", "noData");
			json.put("message", "해당 데이터가 존재하지 않습니다.");
		} else {
			service.incLike(session, data);
			json.put("code", "success");
			json.put("liked", data.getLiked());
		}
		return json.toJSONString();
	}

	@GetMapping(value="/add")
	public String add(Model model,
		@RequestParam String category) {
		System.out.println(category);
		model.addAttribute("category", category);
		return "board/add";
	}
	
	@PostMapping(value="/add")
	public String add(HttpServletRequest request,
		 // @SessionAttribute("loginData") EmpDTO empDto,
			@RequestParam(required=false) String category,
			@ModelAttribute BoardVO boardVo){
		BoardDTO data = new BoardDTO();
		//MemDTO memDto = new MemDTO();
		data.setTitle(boardVo.getTitle());
		data.setContents(boardVo.getContent());
		//data.setWriter(memDto.getUserid());
		data.setWriter("thebibi");
		data.setCategory(boardVo.getCategory());
		int dataNum = service.add(data);
		System.out.println(data);

		
		if(dataNum != -1) {
			return "redirect:/board/detail?dataNum=" + dataNum;			
		} else {
		}
			request.setAttribute("error", "게시글 저장 실패!");

			return "board/add";
}
}

