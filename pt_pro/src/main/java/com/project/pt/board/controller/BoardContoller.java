package com.project.pt.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Patch;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.board.model.BoardDTO;
import com.project.pt.board.model.BoardStaticsDTO;
import com.project.pt.board.service.BoardService;
import com.project.pt.board.vo.BoardCommentVO;
import com.project.pt.board.vo.BoardVO;
import com.project.pt.common.util.Paging;
import com.project.pt.mem.model.MemDTO;


@Controller
@RequestMapping(value = "/board")
public class BoardContoller {
	private static final Logger logger = LoggerFactory.getLogger(BoardContoller.class);

	@Autowired
	private BoardService service;
	
	@GetMapping(value = "")
	public String getList(Model model, HttpSession session, 
			@RequestParam(required = false) String category,
			//@SessionAttribute("loginData")MemDTO memDto,
			@RequestParam(required = false) Integer usersCode,
			@RequestParam(defaultValue = "1", required = false) int page) {
		logger.info("CONTROLgetList(category={},page={},sd={})", category, page, session.getAttribute("userid"));
		List datas;
		
		MemDTO tDataName = new MemDTO();
		
		if (category.equals("R")) {
			List Tdata = service.getTrainer();
			logger.info("Tdata(Tdata={}", Tdata);

			model.addAttribute("Tdata", Tdata);
		}
		if (usersCode != null) { // ?????????????????? ???????????? ??????
			datas = service.getRBoard(usersCode);
			model.addAttribute("usersCode",usersCode);
		} else {
			datas = service.getBoard(category);
		}
		
		Paging paging = new Paging(datas, page, 10);// ???????????? ????????? ???????????? ??????????????? ????????? ??????????????? ????????????
		model.addAttribute("datas", paging.getPageData());// ????????? ????????? ??????????????????????????? ????????????
		model.addAttribute("category", category);

		model.addAttribute("pageData", paging);
		return "board/list";

	}

	
	@GetMapping(value = "/detail")
	public String getDetail(Model model, HttpSession session, @RequestParam(required = false) int dataNum,
			@RequestParam(required = false) String category) {
		BoardDTO data = service.getDetail(dataNum);
		List comment = service.getComents(dataNum);
		logger.info("CONTROLcomment(comment={}", comment);

		model.addAttribute("data", data);
		model.addAttribute("category", category);
		model.addAttribute("comment", comment);
		logger.info("CONTROLgetDetail(data={}", data);

		return "board/detail";
	}

	@GetMapping(value = "/modify")
	public String modify(Model model, @RequestParam(required = false) int dataNum,
			@RequestParam(required = false) String category,
			//@SessionAttribute("loginData")MemDTO memDto,
			@ModelAttribute BoardVO boardVo) {
		logger.info("CONTROLmodify(boardVo={})", boardVo);

		BoardDTO data = service.getDetail(dataNum);
		if (category.equals("R")) { // ??????????????? ?????????????????? ???????????? ????????? ????????????
			List Tdata = service.getTrainer();
			model.addAttribute("Tdata", Tdata);
		}
		model.addAttribute("data", data);
		model.addAttribute("category", category);
		model.addAttribute("dataNum", dataNum);
		return "/board/modify";
	}

	@PostMapping(value = "/modify")
	public String modify(Model model
			, @SessionAttribute("loginData") MemDTO memDto
			, @ModelAttribute BoardVO boardVo, @RequestParam(required = false) int dataNum,
			@RequestParam(required = false) String category) {
		BoardDTO data = service.getDetail(dataNum);
		logger.info("CONTROLmodify(dataNum={},VO{})", dataNum, boardVo);

		data.setTitle(boardVo.getTitle());
		data.setContents(boardVo.getContent());
		data.setWriter(memDto.getUserid());
		logger.info("data(dataNum={})", data);

		if (category.equals("R")) {

			if (boardVo.getBtrainer() > 0) {
				data.setUsersCode(boardVo.getBtrainer());
				boolean result = service.modifyTag(data);
				if (result) {
					return "redirect:/board/detail?category=" + category + "&dataNum=" + dataNum;

				} else {
					model.addAttribute("error", "?????? ???????????? ???????????? ????????????.");
					return "error/noExists";
				}
			} else if (boardVo.getBtrainer() == 0) {
				boolean result = service.modify(data);
				if (result) {
					return "redirect:/board/detail?category=" + category + "&dataNum=" + dataNum;

				} else {
					model.addAttribute("error", "?????? ???????????? ???????????? ????????????.");
					return "error/noExists";
				}
			}
		}
		boolean result = service.modify(data);
		if (result) {
			return "redirect:/board/detail?category=" + category + "&dataNum=" + dataNum;

		} else {
			model.addAttribute("error", "?????? ???????????? ???????????? ????????????.");
			return "error/noExists";
		}
	}

	@GetMapping(value = "/search")
	public String searchBoard(Model model, HttpSession session, @RequestParam(required = false) String keyword,
			@RequestParam(required = false) String category, @RequestParam(required = false) String type,
			@ModelAttribute BoardVO boardVo, @RequestParam(defaultValue = "1", required = false) int page) {
		logger.info("CONTROLsearchBoard(keyword={},category={},type={})", keyword, category, type);
		List datas;
		if(category.equals("ALL")) {
			datas = service.searchAll(boardVo);
			
		}else {
			datas = service.searchKeyword(boardVo);
		}
		model.addAttribute("category", category);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		Paging paging = new Paging(datas, page, 10);// ???????????? ????????? ???????????? ??????????????? ????????? ??????????????? ????????????
		model.addAttribute("datas", paging.getPageData());// ???????????? ????????? ????????? ??????????????????????????? ????????????
		model.addAttribute("pageData", paging);

		return "board/search";

	}

	@PostMapping(value = "/delete", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String delete(//@SessionAttribute("loginData") MemDTO memDto,
            @RequestParam int dataNum) {
        BoardDTO data = service.getDetail(dataNum);

        JSONObject json = new JSONObject();

        if (data == null) {
            json.put("code", "notExists");
            json.put("message", "?????? ?????? ??? ????????? ?????????.");
        } else {
            if (true) {
                boolean result = service.delete(dataNum);
                if (result) {
                    json.put("code", "success");
                    json.put("message", "?????? ??????");
                } else {
                    json.put("code", "fail");
                    json.put("message", "?????? ??? ????????????");
                }
            } else { // ?????????,???????????? ???
                json.put("code", "permissionError");
                json.put("message", "??????????????? ????????????.");
            }
        }

        return json.toJSONString();
    }

	@GetMapping(value = "/add")
	public String add(Model model, @RequestParam String category) {
		model.addAttribute("category", category);

		if (category.equals("R")) { /** ?????????????????? ???????????? ?????? ??????????????? ???????????? */
			List Tdata = service.getTrainer();
			logger.info("Tdata(Tdata={})", Tdata);

			model.addAttribute("Tdata", Tdata);
		}
		return "board/add";
	}

	@PostMapping(value = "/add")
	public String add(HttpServletRequest request,
			@SessionAttribute("loginData") MemDTO memDto,
			@ModelAttribute BoardVO boardVo) {
		logger.info("adddd(boardVo={})", boardVo);

		HttpSession session = request.getSession();
		//MemDTO memDto = session.getAttribute("loginData")==null?new MemDTO():(MemDTO) session.getAttribute("loginData");
		MemDTO nameData = service.Tname(boardVo.getBtrainer());

		BoardDTO data = new BoardDTO();
		data.setTitle(boardVo.getTitle());
		data.setContents(boardVo.getContent());
		//data.setWriter(memDto.getId());

		data.setWriter(memDto.getUserid());
		data.setCategory(boardVo.getCategory());

		if (boardVo.getBtrainer() > 0) {
			data.setUsersCode(boardVo.getBtrainer());
			int dataNum = service.addTag(data);
			if (dataNum != -1) {
				return "redirect:/board/detail?dataNum=" + dataNum;
			}
			request.setAttribute("error", "????????? ?????? ??????!");

			return "board/add";
		}

		int dataNum = service.add(data);

		if (dataNum != -1) {
			return "redirect:/board/detail?dataNum=" + dataNum;
		} else {
		}
		request.setAttribute("error", "????????? ?????? ??????!");

		return "board/add";
	}
	

	@PostMapping(value = "/comment/add")
    public String commnet(HttpServletRequest request,
            @SessionAttribute("loginData") MemDTO memDto,
            @RequestParam String content,
            @RequestParam(required = false) int dataNum,
            @RequestParam(required = false) String category
            ) {
        BoardStaticsDTO data = new BoardStaticsDTO();
        BoardDTO datas = new BoardDTO();

        System.out.println(datas);
        data.setCommentContents(content);
        data.setDataNum(dataNum);
		data.setCommentWriter(memDto.getUserid());
		 
        logger.info("xf(data={})", data);

        boolean result = service.comment(data);

        int commentCount = service.comCnt(dataNum);
        datas.setDataNum(dataNum);
        datas.setRecommend(commentCount);
        System.out.println(datas);
        logger.info("grgr(datas={})", datas.getRecommend());

        service.setComCnt(datas);
        return "redirect:/board/detail?category=" + category + "&dataNum=" + dataNum;

    }
	

	@PostMapping(value = "/comment/modify")
    @ResponseBody
    public Map<String, String> commnetModify(HttpServletRequest request,
            @SessionAttribute("loginData") MemDTO memDto,
            @ModelAttribute BoardCommentVO commentVo,
            @RequestParam(required = false) int dataNum,
            @RequestParam(required = false) String category
            ) {

        BoardStaticsDTO data = new BoardStaticsDTO();
        BoardDTO datas = new BoardDTO();

        data.setCommentContents(commentVo.getCommentContents());
        data.setDataNum(dataNum);
        data.setCommentNum(commentVo.getCommentNum());
        logger.info("?????????????????????????????? ?????????(commentVo={})", commentVo);



        service.commentModify(data);
        Map<String, String> resultMap = new HashMap<>();
        resultMap.put("value", data.getCommentContents());

        return resultMap;

    }
	
	@PostMapping(value = "/comment/delete")
	@ResponseBody
	public String commnetDelete(HttpServletRequest request,
			@SessionAttribute("loginData") MemDTO memDto,
			@ModelAttribute BoardCommentVO commentVo,
			@RequestParam(required = false) int dataNum,
			@RequestParam(required = false) String category
			) {
		
		service.commentDelete(commentVo.getCommentNum());
		service.comCnt(dataNum);
		
		return "redirect:/board/detail?category=" + category + "&dataNum=" + dataNum;

	}


}
