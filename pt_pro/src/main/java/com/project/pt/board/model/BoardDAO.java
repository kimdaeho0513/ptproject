package com.project.pt.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.board.vo.BoardVO;

@Repository
public class BoardDAO {

		private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
		
		@Autowired // 어노테이션 밑줄친 객체에 의존하기 위해만든다
		private SqlSession session;
		
		private String mapper = "boardMapper.%s";

		public List<BoardDTO> selectBoard(String category){//리뷰게시판 리스트 불러옴
			logger.info("selectBoard(category={})",category);
			String mapperId =String.format(mapper,"selectBoard");
			List<BoardDTO> review =session.selectList(mapperId,category);
			return review;
		}
		public BoardDTO dataDetail(int dateNum) {
			logger.info("dataDetail(dataNum={})",dateNum);
			String mapperId =String.format(mapper,"dataDetail");
			BoardDTO detail = session.selectOne(mapperId, dateNum);
			return detail;
		}
		public boolean dataModify(BoardDTO data) {
			logger.info("dataModify(data={})",data);
			String mapperId =String.format(mapper,"dataModify");
			
			int modify = session.update(mapperId, data);
			return modify == 1 ? true : false;
		}/*
		public List<BoardDTO> searchDatas(vo data){
			
		}
		 */
		
		
		public List<BoardDTO> searchKeyword(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchKeyword");
			logger.info("searchKeyword(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;
		}
		public List<BoardDTO> searchWriter(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchWriter");
			logger.info("searchWriter(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;
		}
		
		
		public boolean deleteData(BoardDTO data) {		
			String mapperId = String.format(mapper, "deleteData");
			int res = session.delete(mapperId, data);
			return res == 1 ? true : false;
		}
		public boolean deleteStaticsData(BoardStaticsDTO data) {
		String mapperId = String.format(mapper, "deleteStaticsData");
		int res = session.delete(mapperId, data);
		return res >= 0 ? true : false;
	}
		
		
		public BoardStaticsDTO selectStatics(BoardStaticsDTO data) {
			String mapperId = String.format(mapper, "selectStatics");
			BoardStaticsDTO res = session.selectOne(mapperId, data);
			return res;
		}
		
		
		public boolean insertStatics(BoardStaticsDTO data) {
			String mapperId = String.format(mapper, "insertStatics");
			int res = session.insert(mapperId, data);
			return res == 1 ? true : false;
		}
		
		
		public boolean updateStaticsLike(BoardStaticsDTO data) {
			String mapperId = String.format(mapper, "updateStaticsLike");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		
		
		
		
		public boolean updateLike(BoardDTO data) {
			String mapperId = String.format(mapper, "updateLike");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		public boolean updateViewCnt(BoardDTO data) {
			String mapperId = String.format(mapper, "updateViewCnt");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		public boolean updateStatics(BoardStaticsDTO data) {
			String mapperId = String.format(mapper, "updateStatics");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		public boolean dataAdd(BoardDTO data) {
			String mapperId = String.format(mapper, "dataAdd");
			int detail = session.insert(mapperId, data);
		
			return detail == 1 ? true : false;
		}
		
		public int getNextSeq() {
			String mapperId = String.format(mapper, "getNextSeq");
			int seq = session.selectOne(mapperId);
			return seq;
		}
}
