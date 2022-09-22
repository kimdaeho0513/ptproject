package com.project.pt.board.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pt.board.model.BoardDAO;
import com.project.pt.board.model.BoardDTO;
import com.project.pt.board.model.BoardStaticsDTO;
import com.project.pt.board.vo.BoardVO;
import com.project.pt.mem.model.MemDTO;


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
		dao.countPlus(dataNum);
		return detail;
		
	}
	
	
	
	public List<BoardDTO> searchKeyword(BoardVO boardVo) {
		logger.info("searchKeyword(boardVo.getType={},boardVo.getKeyword()={})",boardVo.getType(),boardVo.getKeyword());
		List<BoardDTO> searchReslt;
		if(boardVo.getType().equals("title")) {	
			searchReslt = dao.searchKeyword(boardVo);
		} else if(boardVo.getType().equals("id")){
			searchReslt = dao.searchWriter(boardVo);
		} else {
			searchReslt = dao.searchWriter(boardVo);
		}
		return searchReslt;
	}
	

	public List<BoardDTO> searchAll(BoardVO boardVo) {
		logger.info("searchKeyword(boardVo.getType={},boardVo.getKeyword()={})",boardVo.getType(),boardVo.getKeyword());
		List<BoardDTO> searchReslt;
		if(boardVo.getType().equals("title")) {	
			searchReslt = dao.searchAllKeyword(boardVo);
		} else if(boardVo.getType().equals("id")){
			searchReslt = dao.searchAllWriter(boardVo);
		} else {
			searchReslt = dao.searchAllWriter(boardVo);
		}
		return searchReslt;
	}
	
	

	public boolean modify(BoardDTO data) {
		boolean result = dao.updateData(data);
		return result;
	}

	public boolean modifyTag(BoardDTO data) {
		boolean result = dao.updateDataTag(data);
		return result;
	}
	
	
	
	
	public boolean delete(int dataNum) {
		logger.info("delete(BoardVO={}",dataNum);

		BoardStaticsDTO staticsData = new BoardStaticsDTO();
		staticsData.setDateNum(dataNum);
		
		dao.deleteStaticsData(dataNum);
		boolean result = dao.deleteData(dataNum);
		
		return result;
	}

	@Transactional
	public void incViewCnt(HttpSession session, BoardDTO data) {
		data.setConut(data.getConut() + 1);
		
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
	
	
	
	
	public List getTrainer() {

		List<BoardDTO> tData = dao.getTrainer();
		logger.info("tData(tData={})",tData);

		return tData;
	}
	public MemDTO Tname(int btrainer) {
		MemDTO namedata = dao.getTranerNum(btrainer); 
		return namedata;
	}


	
	public int addTag(BoardDTO data) {
		int seq = dao.getNextSeq();
		data.setDataNum(seq);
		
		boolean result = dao.dataAddTag(data);
		
		if(result) {
			return data.getDataNum();
		}
		return -1;
	}


	public List getRBoard(int name) {
		List<BoardDTO> nameBoard = dao.getRborad(name);
		return nameBoard;
	}


	public List<BoardStaticsDTO> getComents(int dataNum) {
		List<BoardStaticsDTO> commnets = dao.getComments(dataNum);
		return commnets;
	}


	public boolean comment(BoardStaticsDTO data) {
		boolean result = dao.commentAdd(data);
		return result;
	}


	public int comCnt(int dataNum) {
		int commentCount = dao.comCnt(dataNum);
		return commentCount;
	}

	public int setComCnt(BoardDTO datas) {
		boolean result = dao.setComCnt(datas);
		if(result) {
			return datas.getDataNum();
		}
		return -1;
		

	}
}
