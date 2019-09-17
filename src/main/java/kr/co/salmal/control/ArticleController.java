package kr.co.salmal.control;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.salmal.domain.Criteria;
import kr.co.salmal.domain.PageVO;
import kr.co.salmal.domain.ProductVO;
import kr.co.salmal.domain.RatingVO;
import kr.co.salmal.domain.ReplyVO;
import kr.co.salmal.persistence.ArticleDAO;
import kr.co.salmal.persistence.RatingDAO;

@Controller
@RequestMapping("Salmal")
public class ArticleController {

	@Autowired
	private ArticleDAO dao;

	@Autowired
	private RatingDAO rdao;

	//게시글 1개 조회페이지로 이동
	@RequestMapping("/article")
	public String article(Model m, HttpSession session, int articleNum, Criteria cri) {

		if (session.getAttribute("login") == null) {
			return "main/login";
		}

		dao.articleHitsUp(articleNum); // 조회수 증가

		if (dao.selectRatingCount(articleNum) + dao.selectReplyCount(articleNum) == 0) {
			m.addAttribute("modify", "ok");
		} else {
			m.addAttribute("modify", "no");
		}
		
		if( Integer.parseInt(session.getAttribute("logNum").toString()) == dao.selectArticle(articleNum).getMemberNum() ) {
			m.addAttribute("check", "ok");
		} else {
			m.addAttribute("check", "no");
		}

		m.addAttribute("article", dao.selectArticle(articleNum));
		m.addAttribute("cri",cri);

		return "board/article";
	}

	// 추천조회
	@RequestMapping(value = "/selectChoice")
	public @ResponseBody Map<String, Integer> selectChoice(HttpSession session, int productNum) {

		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());

		RatingVO vo = new RatingVO(productNum, logNum, 1);
		Map<String,Integer> choice = new HashMap<String, Integer>();
		//선택안했으면 0, 좋아요수
		//선택했으면 1,좋아요수
		
		if (rdao.checkChoice(vo) == 0) {// 선택안했으면
			choice.put("c", 0);

		} else {//선택 했으면
			choice.put("c", 1);
		}
		choice.put("cnt", rdao.selectChoice(productNum));
		System.out.println(choice);
		return choice;
	}

	// 비추천조회
	@RequestMapping(value = "/selectNChoice")
	public @ResponseBody Map<String, Integer> selectNChoice(HttpSession session, int productNum) {

		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());

		RatingVO vo = new RatingVO(productNum, logNum, 1);
		Map<String,Integer> nchoice = new HashMap<String, Integer>();
		//선택안했으면 0, 좋아요수
		//선택했으면 1,좋아요수
		
		if (rdao.checkChoice(vo) == 0) {// 선택안했으면
			nchoice.put("c", 0);

		} else {//선택 했으면
			nchoice.put("c", 1);
		}
		nchoice.put("cnt", rdao.selectNChoice(productNum));
		System.out.println(nchoice);
		return nchoice;
	}

	@RequestMapping("/proInsert")
	public @ResponseBody String proInsert(int productNum, HttpSession session) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());

		RatingVO vo = new RatingVO(productNum, logNum, 1);
		
		if (rdao.checkChoice(vo) != 0) {
			return "fasle";
		} else {
			rdao.insertChoice(vo);
		}

		return "success";
	}
	
	@RequestMapping("/conInsert")
	public @ResponseBody String conChoice(int productNum, HttpSession session) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());

		RatingVO vo = new RatingVO(productNum, logNum, 1);

		if (rdao.checkChoice(vo) != 0) {
			return "fasle";
		} else {
			rdao.insertNChoice(vo);
		}
		return "success";
	}

	@RequestMapping("/article2") // YJ
	public String article2(Model m, HttpSession session, int articleNum, Criteria cri) {

		if (session.getAttribute("login") == null) {
			return "main/login";
		}
		dao.articleHitsUp(articleNum);

		if (dao.selectRatingCount(articleNum) + dao.selectReplyCount(articleNum) == 0) {
			m.addAttribute("modify", "ok");
		} else {
			m.addAttribute("modify", "no");
		}

		List<Map<String, Object>> list = dao.selectArticle2(articleNum);
		articleHead(list);

		m.addAttribute("articleList", list);
		m.addAttribute("cri",cri);
		
		Map<String,Integer> reply = new HashMap<String, Integer>();
		String field = String.valueOf(list.get(0).get("PRODUCTNUM"));
		String field2 = String.valueOf(list.get(0).get("ARTICLENUM"));
		reply.put("productNum", Integer.parseInt(field));
		reply.put("articleNum", Integer.parseInt(field2));
		m.addAttribute("article", reply);
		
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		int membernum = Integer.parseInt((dao.selectArticle2(articleNum).get(0).get("MEMBERNUM").toString()));
		if( logNum == membernum ) {
			m.addAttribute("check", "ok");
		} else {
			m.addAttribute("check", "no");
		}
		
		return "board/article2";
	}
	
	   @GetMapping("/mainArticle")
	   public String selectListWithPaging(Model m, PageVO vo, Criteria cri) {

	      if (cri.getArticleHeader() != null &&cri.getArticleHeader().equals("#이거어때?")) {
	            cri.setProductCnt(1);
	      } else if (cri.getArticleHeader() != null && cri.getArticleHeader().equals("#골라줘")) {
	            cri.setProductCnt(2);
	      }
	      
	      List<Map<String, Object>> list = dao.selectListWithPaging(cri);
	      
	      
	      for (Map<String, Object> map : list) {
	         String name = map.get("PRODUCTCNT").toString();
	         
	         if (name.equals("1")) {
	            map.put("PRODUCTCNT", "#이거어때?");
	         } else {
	            map.put("PRODUCTCNT", "#골라줘");
	         }
	      }
	      
	      int total = dao.selectSearchArticle(cri);
	      
	      m.addAttribute("list", list);
	      m.addAttribute("pageMaker", new PageVO(cri, total));
	      
	      return "board/mainArticle";
	   }

	@GetMapping("/inputArticle1")
	public String inputForm() {
		return "board/inputArticle1";
	}

	@GetMapping("/updateArticle")
	public String updateArticle(int articleNum, Model m) {
		m.addAttribute("article", dao.selectArticleForUpdate(articleNum));
		m.addAttribute("category", dao.selectCategoryName());
		return "board/updateArticle";
	}

	@GetMapping("/updateOnlyArticleContent")
	public String updateOnlyArticleContentForm(int articleNum, Model m) {
		m.addAttribute("article", dao.selectArticleForUpdate(articleNum));
		return "board/updateOnlyArticleContent";
	}

	@PostMapping("/updateOnlyArticleContent")
	public String updateOnlyArticleContent(int articleNum, String articleContent) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("articleNum", articleNum);
		map.put("articleContent", articleContent);
		dao.updateOnlyArticleContent(map);
		return "redirect:/Salmal/mainArticle";
	}

	@RequestMapping("/deleteArticle")
	public String deleteArticle(int articleNum, String productImage) {
		File deleteFile = new File(productImage);
		if (deleteFile.exists()) {
			deleteFile.delete();
			dao.deleteArticle(articleNum);
		}
		return "redirect:/Salmal/mainArticle";
	}

	@RequestMapping(value = "/replyList")
	public @ResponseBody List<ReplyVO> replyList1(ReplyVO vo, HttpSession session,int articleNum, String replyType) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		RatingVO rvo = new RatingVO(vo.getProductNum(), logNum, 1);
		if(replyType.equals("1")) {
			if (rdao.checkChoice(rvo) == 0 && logNum != dao.selectArticle(articleNum).getMemberNum()) {// 선택안했으면
				return null;
			} else {
				return dao.selectReply(vo);
			}
		} else {
			if (rdao.checkChoice(rvo) == 0 && logNum != Integer.parseInt((dao.selectArticle2(articleNum).get(0).get("MEMBERNUM").toString()))) {// 선택안했으면
				return null;
			} else {
				return dao.selectReply(vo);
			}
		}
	}

	// 댓글 추가
	@RequestMapping(value = "/addReply")
	public @ResponseBody String replyAdd(String replyContent, HttpSession session, ReplyVO vo) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		vo.setMemberNum(logNum);
		dao.addReply(vo);
		return "success";
	}

	// 댓글 삭제
	@RequestMapping("/delReply")
	public @ResponseBody String delReply(int replyNum) {
		dao.delReply(replyNum);
		return "success";
	}

	// 댓글 수정
	@RequestMapping("/updReply")
	public @ResponseBody String updReply(ReplyVO vo) {
		dao.updReply(vo);
		return "success";
	}

	public void articleHead(List<Map<String, Object>> list) // article에 달린 product 갯수로 구별 따로 뺌 (YJ)
	{
		for (Map<String, Object> map : list) {
			String name = map.get("PRODUCTCNT").toString();
			if (name.equals("1")) {
				map.put("PRODUCTCNT", "#이거어때?");
			} else {
				map.put("PRODUCTCNT", "#골라줘!");
			}
		}
	}

}
