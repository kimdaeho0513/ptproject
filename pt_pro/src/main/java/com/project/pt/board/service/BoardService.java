package com.project.pt.board.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pt.board.vo.BoardVO;
import com.project.pt.mem.model.MemDTO;
import com.project.pt.board.model.BoardDAO;
import com.project.pt.board.model.BoardDTO;
import com.project.pt.board.model.BoardStaticsDTO;

@Service
public class BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);

	@Autowired
	private BoardDAO dao;

	public List<BoardDTO> getBoard(String category){
		logger.info("getBoard(category={})",category);
		List<BoardDTO> board = dao.selectBoard(category);
		return board;
	}	
	public BoardDTO getDetail(int dataNum) {
		logger.info("getDetail(dataNum={}",dataNum);
		BoardDTO detail = dao.dataDetail(dataNum);

		return detail;
	}
	
	
	
	public List<BoardDTO> searchKeyword(BoardVO boardVo) {
		logger.info("searchKeyword(boardVo.getType={},boardVo.getKeyword()={})",boardVo.getType(),boardVo.getKeyword());
		
		if(boardVo.getType().equals("title")) {	
			List<BoardDTO> searchReslt = dao.searchKeyword(boardVo);
			return searchReslt;
		} else{
			List<BoardDTO> searchReslt = dao.searchWriter(boardVo);

		return searchReslt;
		}
	}
	
	
	public boolean remove(BoardDTO data) {
		logger.info("searchWriter(BoardVO={}",data);

		BoardStaticsDTO staticsData = new BoardStaticsDTO();
		staticsData.setDateNum(data.getDataNum());
		
		dao.deleteStaticsData(staticsData);
		boolean result = dao.deleteData(data);
		
		return result;
	}

	@Transactional
	public void incViewCnt(HttpSession session, BoardDTO data) {
		BoardStaticsDTO staticsData = new BoardStaticsDTO();
		staticsData.setbId(data.getWriter());
		//staticsData.setEmpId(((EmpDTO)session.getAttribute("loginData")).getEmpId());
		
		staticsData = dao.selectStatics(staticsData);
		
		boolean result = false;
		if(staticsData == null) {
			result = dao.updateViewCnt(data);
			if(!result) {
				throw new RuntimeException("조회수 통계 업데이트 처리에 문제가 발생 하였습니다.");
			}
			
			staticsData = new BoardStaticsDTO();
			staticsData.setbId(data.getWriter());
			//staticsData.setEmpId(((EmpDTO)session.getAttribute("loginData")).getEmpId());
			result = dao.insertStatics(staticsData);
			if(!result) {
				throw new RuntimeException("조회수 통계 추가 처리에 문제가 발생 하였습니다.");
			}
		} else {
			long timeDiff = new Date().getTime() - staticsData.getLatestViewDate().getTime();
			if(timeDiff / (1000 * 60 * 60 * 24) >= 7) {
				result = dao.updateViewCnt(data);
				if(!result) {
					throw new RuntimeException("조회수 업데이트 처리에 문제가 발생 하였습니다.");
				}
				result = dao.updateStatics(staticsData);
				if(!result) {
					throw new RuntimeException("조회수 통계 업데이트 처리에 문제가 발생 하였습니다.");
				}
			}
		}
		
		if(result) {
			data.setConut(data.getConut() + 1);
		}
	}
	
	public void incLike(HttpSession session, BoardDTO data) {
		MemDTO memData = new MemDTO(); //(MemDTO)session.getAttribute("loginData");
		
		BoardStaticsDTO staticsData = new BoardStaticsDTO();
		staticsData.setbId(data.getWriter());
		staticsData.setUserId(memData.getId());
		
		staticsData = dao.selectStatics(staticsData);
		
		if(staticsData.isLiked()) {
			staticsData.setLiked(false);
			data.setLiked(data.getLiked() - 1);
		} else {
			staticsData.setLiked(true);
			data.setLiked(data.getLiked() + 1);
		}
		
		dao.updateStaticsLike(staticsData);
		boolean result = dao.updateLike(data);
	}
	public List<BoardDTO> getBoards(String category) {
		logger.info("getBoard(category={})",category);
		List<BoardDTO> boards = dao.selectBoard(category);
		return boards;
	}
	public int add(BoardDTO data) {
		int seq = dao.getNextSeq();
		data.setDataNum(seq);
		
		boolean result = dao.dataAdd(data);
		
		if(result) {
			return data.getDataNum();
		}
		return -1;
	}	

}
