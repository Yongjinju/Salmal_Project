
package kr.co.salmal.persistence;

import java.util.List;
import java.util.Map;

import kr.co.salmal.domain.ArticleForSelectVO;
import kr.co.salmal.domain.ArticleVO;
import kr.co.salmal.domain.Criteria;
import kr.co.salmal.domain.ProductVO;
import kr.co.salmal.domain.ReplyVO;

public interface ArticleDAO {
	public List<Map<String, Object>> selectListWithPaging(Criteria cri);
	public void insertArticle(Map<String, String> articleMap); //Moon
	public void insertProduct(Map<String, String> productMap); //Moon
	public ArticleForSelectVO selectArticle(int articleNum); //Moon
	public List<ArticleForSelectVO> selectArticleForUpdate(int articleNum); //Moon
	public void updateArticle(Map<String, String> articleMap); //Moon
	public void updateProduct(Map<String, String> productMap); //Moon
	public void updateOnlyArticleContent(Map<String, Object> articleMap); //Moon
	public void deleteArticle(int articleNum); //Moon
	public List<String> selectCategoryName(); //Moon
	public int selectRatingCount(int articleNum); //Moon
	public int selectReplyCount(int articleNum); //Moon
	public List<Map<String, Object>> selectListAllbyHits();
	public List<Map<String, Object>> selectListAllbyDate();
	public void articleHitsUp(int articleNum);
	
	public int selectSearchArticle(Criteria cri);
	public List<Map<String, Object>> selectArticle2(int articleNum);//골라줘 페이지 상품 조회문, YJ
}
