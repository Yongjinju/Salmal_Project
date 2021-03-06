
package kr.co.salmal.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.salmal.domain.MemberVO;
import kr.co.salmal.domain.RatingVO;
import kr.co.salmal.persistence.ArticleDAO;
import kr.co.salmal.persistence.MemberDAO;

@Controller
@RequestMapping("Salmal")
public class MainController {

	@Autowired
	private ArticleDAO dao;

	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/main")
	public String mainView(Model m) {

		List<Map<String, Object>> listDate = dao.selectListAllbyDate();
		List<Map<String, Object>> listHits = dao.selectListAllbyHits();

		  for (Map<String, Object> map : listDate) { String name =
		  map.get("PRODUCTCNT").toString();
		  
		  if (name.equals("1")) {
		  
		  map.put("PRODUCTCNT", "#이거어때?"); } else { map.put("PRODUCTCNT", "#골라줘"); } }
		  
		  for (Map<String, Object> map : listHits) { String name =
				  map.get("PRODUCTCNT").toString();
				  
				  if (name.equals("1")) {
				  
				  map.put("PRODUCTCNT", "#이거어때?"); } else { map.put("PRODUCTCNT", "#골라줘"); } }
		 
		m.addAttribute("listDate", listDate);
		m.addAttribute("listHits", listHits);
		return "main/main";
	}

	public String mainView(HttpSession session) {
		return "main/main";
	}

	// 회원 가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp() {
		return "main/signUp";
	}
	
	@RequestMapping("/checkEmail")
	public @ResponseBody int checkEmail(String email) {
		return  mdao.checkEmail(email);
	
	}
	
	@RequestMapping("/checkNickname")
	public @ResponseBody int checkNickname(String nickname) {
		return mdao.checkNickname(nickname);
	
	}
	
	// 회원가입 처리 (DB에 회원 정보 insert)
	@PostMapping("/signUp")
	public String insertMember(MemberVO member) {
		mdao.insert(member);
		System.out.println("member정보 : "+member);
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("SalkkaMalkka <salkkamalkkainfo@gmail.com>");
				helper.setTo(member.getEmail()); //받는사람 이메일
				helper.setSubject("[살까말까]살까말까 회원가입을 환영합니다"); //제목
				helper.setText("살까말까 회원가입을 축하합니다."); // 내용
			}
		};
		
		mailSender.send(preparator);
		
		return "redirect:welcome";
	}
	
	// 회원가입 성공후 환영 페이지 출력
	@GetMapping("/welcome")
	public String welcome() {
		return "main/welcome";
	}
	
	// 로그인 페이지 이동
	@RequestMapping("/login")
	public String login() {
		return "main/login";
	}

	@RequestMapping("/loginMember")
	public String loginMember(HttpSession session, String email, String password, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 1. 아이디 비밀번호 불일치 2. 아이디 비밀번호 일치, 사용자 아이디 3. 아이디 비밀번호 일치, 관리자 아이디

		if (!password.equals(mdao.selectLogin(email))) {// 1. 아이디 비밀번호 불일치
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

			return "main/login";

		} else {
			// 2. 아이디 비밀번호 일치, 사용자 아이디
			session.setAttribute("login", "success");
			session.setAttribute("logNum", mdao.selectlogNum(email));
			session.setAttribute("nickname", mdao.selectNickname(email));
		}
		return "redirect:main";
	}

	// 마이 페이지 이동
	@RequestMapping("/myPage")
	public String myPage(Model m, HttpSession session) {
		int logNum = Integer.parseInt(session.getAttribute("logNum").toString());
		m.addAttribute("member", mdao.selectMemberInfo(logNum));
		String nickname = (String) session.getAttribute("nickname");
		
		System.out.println("lognum = "+logNum);
		System.out.println("nickname = "+nickname);
		
		
		List<Map<String, Object>> myArticleList =  mdao.selectMyArticlelist(logNum); 
		System.out.println("마이페이지 article리스트>>"+ myArticleList);
		
		for (Map<String, Object> map : myArticleList) { 
			String name = map.get("PRODUCTCNT").toString();
			
			if (name.equals("1")) {
				map.put("PRODUCTCNT", "#이거어때?");
				} else {
					map.put("PRODUCTCNT", "#골라줘");
					}
			}
		
		List<Map<String, Object>> articleWithMyReplyList =  mdao.selectArticleWithMyReply(logNum); 
		System.out.println("내가댓글단 article리스트>>"+ articleWithMyReplyList);
		
		for (Map<String, Object> map : articleWithMyReplyList) { 
			String name = map.get("PRODUCTCNT").toString();
			
			if (name.equals("1")) {
				map.put("PRODUCTCNT", "#이거어때?");
			} else {
				map.put("PRODUCTCNT", "#골라줘");
			}
		}
		
		
		m.addAttribute("myArticleList", myArticleList);
		m.addAttribute("articleWithMyReplyList", articleWithMyReplyList);
		m.addAttribute("myPoint",  mdao.selectPoint(logNum));		
		return "main/myPage";
	}
	
//	// 관리자 페이지 이동
//	@RequestMapping("/admin")
//	public String admin() {
//		return "main/admin";
//	}
	
	// 회원정보수정 페이지 이동
	@GetMapping("/updateForm")
	public String admin(HttpSession session , Model m) {
		int lognum = Integer.parseInt(session.getAttribute("logNum").toString());
		System.out.println("lognum : "+ lognum);
		MemberVO vo =  mdao.selectMemberInfo(lognum);
		System.out.println("멤버 VO정보 : "+vo);
		m.addAttribute("member", vo);
		return "main/updateMember";
	}
	
	//회원정보 수정 작업
	@PostMapping("/update")
	public String update(HttpSession session, MemberVO vo) {
		System.out.println("MemberVO : "+ vo);
		mdao.update(vo);
		return "redirect:myPage";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	// 회원 탈퇴
	@RequestMapping("/withdraw")
	public String withdraw(String email, HttpSession session, HttpServletResponse response) throws IOException {
		mdao.delete(email);
		session.invalidate();
		return "redirect:main";
	}
	

}
