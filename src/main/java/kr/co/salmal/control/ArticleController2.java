package kr.co.salmal.control;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.salmal.domain.ArticleForSelectVO;
import kr.co.salmal.domain.PageVO;
import kr.co.salmal.domain.RatingVO;
import kr.co.salmal.domain.ReplyVO;
import kr.co.salmal.persistence.ArticleDAO;
import kr.co.salmal.persistence.RatingDAO;

@Controller
@RequestMapping("Salmal")
public class ArticleController2 {
	
	@Autowired
	private ArticleDAO dao;
	
	@GetMapping("/inputArticle2")
	public String inputForm2() {
		return "board/inputArticle2";
	}
	
	@GetMapping("/updateArticle2")
	public String updateArticle2(int articleNum, Model m ) {
		m.addAttribute("article", dao.selectArticleForUpdate(articleNum));
		m.addAttribute("category", dao.selectCategoryName());
		return "board/updateArticle2";
	}
	
	@GetMapping("/updateOnlyArticleContent2")
	public String updateOnlyArticleContentForm2(int articleNum, Model m ) {
		m.addAttribute("article", dao.selectArticleForUpdate(articleNum));
		return "board/updateOnlyArticleContent2";
	}
	
	@PostMapping("/updateOnlyArticleContent2")
	public String updateOnlyArticleContent2(int articleNum, String articleContent) {
		HashMap<String, Object> map = new HashMap<>();
			map.put("articleNum", articleNum);
			map.put("articleContent", articleContent);
		dao.updateOnlyArticleContent(map);
		return "redirect:/Salmal/mainArticle";
	}
	
	@RequestMapping("/deleteArticle2")
	public String deleteArticle2(String productImage1, String productImage2, int articleNum) {
		File deleteFile1 = new File(productImage1);
		File deleteFile2 = new File(productImage2);
		if (deleteFile1.exists() && deleteFile2.exists()) {
			deleteFile1.delete();
			deleteFile2.delete();
			dao.deleteArticle(articleNum);
		}
		return "redirect:/Salmal/mainArticle";
	}
}
