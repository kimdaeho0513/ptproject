package com.project.pt.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.board.vo.BoardVO;
import com.project.pt.mem.model.MemDTO;


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
			return review;//
		}
		
		public BoardDTO dataDetail(int dataNum) {
			logger.info("dataDetail(dataNum={})",dataNum);
			String mapperId =String.format(mapper,"dataDetail");
			BoardDTO detail = session.selectOne(mapperId, dataNum);
			return detail;//
		}
		public boolean dataModify(BoardDTO data) {
			logger.info("dataModify(data={})",data);
			String mapperId =String.format(mapper,"dataModify");
			
			int modify = session.update(mapperId, data);
			return modify == 1 ? true : false;//
		}
		
		
		public List<BoardDTO> searchKeyword(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchKeyword");
			logger.info("searchKeyword(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;//
		}
		public List<BoardDTO> searchWriter(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchWriter");
			logger.info("searchWriter(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;//
		}
		
		
		public boolean deleteData(int dataNum) {		
			logger.info("data={}",dataNum);
			String mapperId = String.format(mapper, "deleteData");
			int res = session.delete(mapperId, dataNum);
			return res == 1 ? true : false;//
		}
		
		
		
		
		public boolean dataAdd(BoardDTO data) {
			String mapperId = String.format(mapper, "dataAdd");
			int detail = session.insert(mapperId, data);
		
			return detail == 1 ? true : false;//
		}
		public boolean dataAddTag(BoardDTO data) {
			String mapperId = String.format(mapper, "dataAddTag");
			int detail = session.insert(mapperId, data);
		
			return detail == 1 ? true : false;
		}
		
		public int getNextSeq() {
			String mapperId = String.format(mapper, "getNextSeq");
			int seq = session.selectOne(mapperId);
			return seq;//
		}
		public List<MemDTO> getTrainer() {
			String mapperId = String.format(mapper, "getTrainer");
			List<MemDTO> tName = session.selectList(mapperId);
			return tName;
		}
		public MemDTO getTranerNum(int btrainer) {
			String mapperId = String.format(mapper, "getTrainer2");
			MemDTO tName = session.selectOne(mapperId,btrainer);
			return tName;
		}

		public boolean updateData(BoardDTO data) {
			String mapperId = String.format(mapper, "updateData");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		public boolean updateDataTag(BoardDTO data) {
			String mapperId = String.format(mapper, "updateDataTag");
			int res = session.update(mapperId, data);
			return res == 1 ? true : false;
		}
		public int countPlus(int dataNum) {
			String mapperId = String.format(mapper, "countPlus");
			int res = session.update(mapperId, dataNum);

			return res;//
		}
		public List<BoardDTO> getRborad(int name) {
			String mapperId =String.format(mapper,"getRborad");
			List<BoardDTO> review =session.selectList(mapperId,name);
			return review;//
		}
		public List<BoardStaticsDTO> getComments(int dataNum) {
			String mapperId =String.format(mapper,"getComments");
			List<BoardStaticsDTO> review =session.selectList(mapperId,dataNum);

			return review;//
		}
		public boolean commentAdd(BoardStaticsDTO data) {
			String mapperId =String.format(mapper,"commentAdd");
			int res = session.insert(mapperId, data);
			return res==1 ? true : false;//
		}
		public int comCnt(int dataNum) {
			String mapperId =String.format(mapper,"comCnt");
			int commentCount = session.selectOne(mapperId, dataNum);
			return commentCount;//
		}
		public boolean setComCnt(BoardDTO datas) {
			String mapperId =String.format(mapper,"setComCnt");
			int res = session.update(mapperId, datas);
			return res==1 ? true : false;//
		}
		
		public List<BoardDTO> searchAllKeyword(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchAllKeyword");
			logger.info("searchKeyword(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;//
		}
		public List<BoardDTO> searchAllWriter(BoardVO boardVo) {
			String mapperId =String.format(mapper,"searchAllWriter");
			logger.info("searchWriter(BoardDTO={},mapperId={})",boardVo,mapperId);
			List<BoardDTO> result =session.selectList(mapperId,boardVo);

			return result;//
		}

		public boolean deleteStaticsData(int dataNum) {
			String mapperId =String.format(mapper,"deleteStaticsData");

			int res = session.delete(mapperId, dataNum);

			return res==1 ? true : false;//

		}
		public boolean deleteStatics(int commentNum) {
			String mapperId =String.format(mapper,"deleteStatics");

			int res = session.delete(mapperId, commentNum);

			return res==1 ? true : false;//

		}

		public boolean commentModify(BoardStaticsDTO data) {
			String mapperId =String.format(mapper,"commentModify");
			int res = session.update(mapperId, data);

			
			return res==1 ? true : false;//
		}
		
}
