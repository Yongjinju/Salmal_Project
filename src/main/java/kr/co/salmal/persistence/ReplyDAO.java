package kr.co.salmal.persistence;

import java.util.List;

import kr.co.salmal.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> selectReply(ReplyVO vo); //댓글 목록
	public void addReply(ReplyVO vo); //댓글 추가
	public void delReply(int delNum); //댓글 삭제
	public void updReply(ReplyVO vo); //댓글 수정
}
