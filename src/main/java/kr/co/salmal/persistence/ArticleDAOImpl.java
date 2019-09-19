package kr.co.salmal.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.salmal.domain.ArticleForSelectVO;
import kr.co.salmal.domain.ArticleVO;
import kr.co.salmal.domain.Criteria;
import kr.co.salmal.domain.ProductVO;
import kr.co.salmal.domain.ReplyVO;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListWithPaging(Criteria cri) {

		RowBounds bounds = new RowBounds((cri.getPageNum() - 1) * cri.getAmount(), cri.getAmount());

		return sqlSession.selectList("article.selectListAll", cri, bounds);

	}

	@Override
	public void insertArticle(Map<String, String> map) {
		sqlSession.insert("article.insertArticle", map);
	}

	@Override
	public void insertProduct(Map<String, String> map) {
		sqlSession.insert("article.insertProduct", map);
	}

	@Override
	public List<Map<String, Object>> selectListAllbyDate() {
		return sqlSession.selectList("article.selectListAllbyDate");
	}// 날짜별

	@Override
	public List<Map<String, Object>> selectListAllbyHits() {
		return sqlSession.selectList("article.selectListAllbyHits");
	}// 조회별

	@Override
	public ArticleForSelectVO selectArticle(int articleNum) {
		return sqlSession.selectOne("article.selectArticle", articleNum);
	}

	@Override
	public void deleteArticle(int articleNum) {
		sqlSession.delete("article.deleteArticle", articleNum);
	}

	@Override
	public List<ArticleForSelectVO> selectArticleForUpdate(int articleNum) {
		return sqlSession.selectList("article.selectArticleForUpdate", articleNum);
	}

	@Override
	public void updateArticle(Map<String, String> map) {
		sqlSession.update("article.updateArticle", map);
	}

	@Override
	public void updateProduct(Map<String, String> map) {
		sqlSession.update("article.updateProduct", map);
	}

	@Override
	public void updateOnlyArticleContent(Map<String, Object> map) {
		sqlSession.update("article.updateOnlyArticleContent", map);
	}

	@Override
	public List<String> selectCategoryName() {
		return sqlSession.selectList("article.selectCategoryName");
	}

	@Override
	public int selectRatingCount(int articleNum) {
		return sqlSession.selectOne("article.selectRatingCount", articleNum);
	}

	@Override
	public int selectReplyCount(int articleNum) {
		return sqlSession.selectOne("article.selectReplyCount", articleNum);
	}

	@Override
	public void articleHitsUp(int articleNum) {
		sqlSession.update("article.articleHitsUp", articleNum);

	}

	@Override
	public int selectSearchArticle(Criteria cri) {

		return sqlSession.selectOne("article.selectSearchArticle", cri);
	}

	@Override
	public List<Map<String, Object>> selectArticle2(int articleNum) {
		int Num = articleNum;
		return sqlSession.selectList("article.selectArticle2", Num);
	}

}
