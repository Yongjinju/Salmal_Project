package kr.co.salmal.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.salmal.domain.RatingVO;
import kr.co.salmal.domain.ReplyVO;
import kr.co.salmal.persistence.ArticleDAO;
import kr.co.salmal.persistence.RatingDAO;
import kr.co.salmal.persistence.ReplyDAO;

@Controller
@RequestMapping("Salmal")
public class ReplyController {
	
	@Autowired
	private ReplyDAO dao;
	
	@Autowired
	private RatingDAO rdao;
	
	@Autowired
	private ArticleDAO adao;
	
	//댓글 리스트
	@RequestMapping(value = "/replyList")
	public @ResponseBody List<ReplyVO> replyList1(ReplyVO vo, HttpSession session,int articleNum, String replyType) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		RatingVO rvo = new RatingVO(vo.getProductNum(), logNum, 1);
		if(replyType.equals("1")) {
			if (rdao.checkChoice(rvo) == 0 && logNum != adao.selectArticle(articleNum).getMemberNum()) {// 선택안했으면
				return null;
			} else {
				return dao.selectReply(vo);
			}
		} else {
			if (rdao.checkChoice(rvo) == 0 && logNum != Integer.parseInt((adao.selectArticle2(articleNum).get(0).get("MEMBERNUM").toString()))) {// 선택안했으면
				return null;
			} else {
				return dao.selectReply(vo);
			}
		}
	}

	//댓글 추가
	@RequestMapping(value = "/addReply")
	public @ResponseBody String replyAdd(String replyContent, HttpSession session, ReplyVO vo) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		vo.setMemberNum(logNum);
		System.out.println("부모댓id : " + vo.getParentNum());
		if(vo.getParentNum()!=0) { //대댓글이면(부모 댓글id가 있다면) --> depth가 0이면 1로 저장, 1이면 2로 저장, 2이면 2로 저장
			vo.setDepth(1);
		}
		System.out.println("깊이 : " + vo.getDepth());
		dao.addReply(vo);
		return "success";
	}
	
//	//댓글 추가 --> 테스트
//	@RequestMapping(value = "/addReply2")
//	public @ResponseBody String replyAdd2(String replyContent, HttpSession session, ReplyVO vo) {
//		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
//		vo.setMemberNum(logNum);
//		System.out.println("부모댓id : " + vo.getParentNum());
//		if(vo.getParentNum()!=0) { //대댓글이면(부모 댓글id가 있다면)
//			vo.setDepth(1);
//		}
//		System.out.println("깊이 : " + vo.getDepth());
//		dao.addReply(vo);
//		return "success";
//	}

	//댓글 삭제
	@RequestMapping("/delReply")
	public @ResponseBody String delReply(int replyNum) {
		dao.delReply(replyNum);
		return "success";
	}

	//댓글 수정
	@RequestMapping("/updReply")
	public @ResponseBody String updReply(ReplyVO vo) {
		dao.updReply(vo);
		return "success";
	}
}
