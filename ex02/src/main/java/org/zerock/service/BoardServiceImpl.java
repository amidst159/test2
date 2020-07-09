package org.zerock.service;

import java.util.List;
import org.zerock.domain.Criteria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
public class BoardServiceImpl {

	@Autowired
	private BoardMapper mapper;
	
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
		
	}


	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}

	
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board)==1;
	}


	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno)==1;
	}

	
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
	
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	

}

