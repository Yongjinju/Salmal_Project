package kr.co.salmal.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.salmal.persistence.ArticleDAO;

@Controller
@RequestMapping("Salmal")
public class UploadController {
	
	@Autowired
	private ArticleDAO dao;

	@PostMapping("/inputArticle1")
	public String inputArticle1(String articleTitle, String articleContent,	String categoryName, String productName, 
			String productLink, HttpSession session, MultipartFile uploadFile) {
		HashMap<String, String> inputMap = new HashMap<>();
			inputMap.put("memberNum", (String)session.getAttribute("logNum"));
			inputMap.put("articleTitle", articleTitle);
			inputMap.put("articleContent", articleContent);
			inputMap.put("categoryName", categoryName);
		dao.insertArticle(inputMap);
		
			inputMap.put("productName", productName);
			inputMap.put("productLink", productLink);
			inputMap.put("productImage", saveFile(uploadFile));
		dao.insertProduct(inputMap);
		
		return "redirect:/Salmal/mainArticle";
	}
	
	@PostMapping("/inputArticle2")
	public String inputArticle2(String articleTitle, String articleContent, String categoryName, String productName1, String productName2, 
			String productLink1, String productLink2, HttpSession session, MultipartFile uploadFile1, MultipartFile uploadFile2) {
		HashMap<String, String> inputMap = new HashMap<>();
			inputMap.put("memberNum", (String)session.getAttribute("logNum"));
			inputMap.put("articleTitle", articleTitle);
			inputMap.put("articleContent", articleContent);
			inputMap.put("categoryName", categoryName);
		dao.insertArticle(inputMap);
		
			inputMap.put("productName", productName1);
			inputMap.put("productLink", productLink1);
			inputMap.put("productImage", saveFile(uploadFile1));
		dao.insertProduct(inputMap);
		
			inputMap.put("productName", productName2);
			inputMap.put("productLink", productLink2);
			inputMap.put("productImage", saveFile(uploadFile2));
		dao.insertProduct(inputMap);
		
		return "redirect:/Salmal/mainArticle";
	}
	
	@PostMapping("/updateArticle")
	public String update(String articleNum, String articleTitle, String articleContent, String categoryName, String productName,
			String productLink, String oldProductNum, MultipartFile uploadFile) {
		HashMap<String, String> updateMap = new HashMap<>();
		
			updateMap.put("articleTitle", articleTitle);
			updateMap.put("articleContent", articleContent);
			updateMap.put("categoryName", categoryName);
			updateMap.put("articleNum", articleNum);
		dao.updateArticle(updateMap);
		
			updateMap.put("oldProductNum", oldProductNum);
			updateMap.put("productName", productName);
			updateMap.put("productLink", productLink);

		if(!uploadFile.getOriginalFilename().equals("")) {
			updateMap.put("productImage", saveFile(uploadFile));
		}
		dao.updateProduct(updateMap);
		
		return "redirect:/Salmal/mainArticle";
	}
	
	@PostMapping("/updateArticle2")
	public String updateArticle2(String articleNum, String articleTitle, String articleContent, String categoryName,
			String productName1, String productName2, String productLink1, String productLink2, 
			String oldProductNum1, String oldProductNum2, MultipartFile uploadFile1, MultipartFile uploadFile2) {
		HashMap<String, String> updateMap = new HashMap<>();
		
			updateMap.put("articleTitle", articleTitle);
			updateMap.put("articleContent", articleContent);
			updateMap.put("categoryName", categoryName);
			updateMap.put("articleNum", articleNum);
		dao.updateArticle(updateMap);
		
		
			updateMap.put("oldProductNum", oldProductNum1);
			updateMap.put("productName", productName1);
			updateMap.put("productLink", productLink1);
		if(!uploadFile1.getOriginalFilename().equals("")) {
			updateMap.put("productImage", saveFile(uploadFile1));
		}
		dao.updateProduct(updateMap);
		
			updateMap.put("oldProductNum", oldProductNum2);
			updateMap.put("productName", productName2);
			updateMap.put("productLink", productLink2);
		if(!uploadFile2.getOriginalFilename().equals("")) {
			updateMap.put("productImage", saveFile(uploadFile2));
		}
		dao.updateProduct(updateMap);
		
		return "redirect:/Salmal/mainArticle";
	}
	
	private String saveFolder = "/upload/";
	private String saveFile(MultipartFile multipartFile) {
		String savePath = null;

		try {
			File folder = new File(saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			String originFileName = multipartFile.getOriginalFilename();
			String extension = originFileName.substring(originFileName.lastIndexOf("."));
			String saveFileName = generateSaveFileName(extension);

			writeFile(multipartFile, saveFileName);
			savePath = saveFolder + saveFileName;
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		return savePath;
	}

	private String generateSaveFileName(String extension) {
		String saveFileName = "";

		Calendar calendar = Calendar.getInstance();
		saveFileName += calendar.get(Calendar.YEAR);
		saveFileName += calendar.get(Calendar.MONTH);
		saveFileName += calendar.get(Calendar.DATE);
		saveFileName += calendar.get(Calendar.HOUR);
		saveFileName += calendar.get(Calendar.MINUTE);
		saveFileName += calendar.get(Calendar.SECOND);
		saveFileName += calendar.get(Calendar.MILLISECOND);
		saveFileName += extension;
		
		return saveFileName;
	}

	private boolean writeFile(MultipartFile multipartFile, String saveFileName) throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(saveFolder + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	}
	
}
	
