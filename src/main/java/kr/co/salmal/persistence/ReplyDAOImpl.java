package kr.co.salmal.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.salmal.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> selectReply(ReplyVO vo) {
		return sqlSession.selectList("reply.selectReply", vo);
	}

	@Override
	public void addReply(ReplyVO vo) {
		sqlSession.insert("reply.addReply", vo);
	}

	@Override
	public void delReply(int replyNum) {
		sqlSession.delete("reply.delReply", replyNum);
	}

	@Override
	public void updReply(ReplyVO vo) {
		sqlSession.update("reply.updReply",vo);
	}

}
