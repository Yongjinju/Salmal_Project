package kr.co.salmal.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.salmal.domain.RatingVO;



@Repository
public class RatingDAOImpl implements RatingDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkChoice(RatingVO vo) {
		return sqlSession.selectOne("rating.checkChoice", vo);
	}

	@Override
	public int selectChoice(int productnum) {
		return sqlSession.selectOne("rating.selectChoice", productnum);
	}

	@Override
	public int selectNChoice(int productnum) {
		return sqlSession.selectOne("rating.selectNChoice", productnum);
	}

	@Override
	public void insertChoice(RatingVO vo) {
		sqlSession.insert("rating.insertChoice",vo);
	}

	@Override
	public void insertNChoice(RatingVO vo) {
		sqlSession.insert("rating.insertNChoice",vo);
	}

}
