package com.artauction.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artauction.domain.CategoryVO;
import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.UserVO;
import com.artauction.service.MemberService;
import com.artauction.service.RegisterService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/register/")
@AllArgsConstructor
public class RegisterController {
	private RegisterService regService;
	private MemberService memService;
	
	@GetMapping("/goods")
	@PreAuthorize("isAuthenticated()")
	public String getRegister(Principal principal, Model model) {
		UserVO uVo = new UserVO();
		uVo.setUserid(principal.getName());
		uVo = regService.getUserAccount(uVo);
		System.out.println(uVo);
		model.addAttribute("userData", uVo);
		return "/register/register";
	}
	
	@PostMapping("/goods")
	public String postRegister(RedirectAttributes rttr, GoodsVO gVo, UserVO uVo, CategoryVO cVo, ImageVO iVo) {
		
		System.out.println("0720테스트gVo :"+gVo);
		System.out.println("0720테스트uVo :"+uVo);
		
		System.out.println("!!! gVo : "+gVo);
		regService.insert(gVo);
		
		System.out.println("은행 : " + uVo.getBankname());
		System.out.println("계좌번호 : " + uVo.getBankaccount());
		
		// 만약 계정에 입력된 은행, 계좌번호가 다르다면 정보를 수정함 -> 로그인 구현되면
		regService.checkUserAccount(uVo);
		
		// 신용도 계산을 위한 거래게시를 알림
		memService.reliabilityInput(uVo.getUserid(), "TRADE_TRY");
		
		rttr.addFlashAttribute("result", "상품"+gVo.getGno()+"이 등록되었습니다");

		// 임시방편 -> get페이지로 넘어가야함
		return "redirect:/";
	}
	
	
 	@PostMapping(value = "/files", 
	  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ImageVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		/* 
		 * 파일선택 or 드래그 시 서버에 업로드
		 */
 		List<ImageVO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		// 폴더생성(연)
		String uploadFolderPathYear = getFolderPrev2();
		File uploadPath3 = new File(uploadFolder, uploadFolderPathYear);
		if(uploadPath3.exists() == false) {
			uploadPath3.mkdir();
			System.out.println("upload 폴더("+uploadFolderPathYear+")생성....");
		}
		
		// 폴더생성(월)
		String uploadFolderPathMonth = getFolderPrev();
		File uploadPath2 = new File(uploadFolder, uploadFolderPathMonth);
		if(uploadPath2.exists() == false) {
			uploadPath2.mkdir();
			System.out.println("upload 폴더("+uploadFolderPathMonth+")생성....");
		}
		
		// 폴더생성(일)
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();
			System.out.println("upload 폴더("+uploadPath+")생성....");
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			ImageVO attachDTO = new ImageVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

			// attachDTO에 정보 저장
			attachDTO.setFilename(uploadFileName);
			
			//uuid 생성
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				System.out.println("파일저장...."+uploadFileName);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadpath(uploadFolderPath);
				System.out.println(attachDTO);
				//리스트에 추가
				list.add(attachDTO);
				
			}catch(Exception e) {
				System.out.println(" !!!!!!!!!!!!! 업로드 에러 : "+e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
 	private String getFolderPrev2() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
 	private String getFolderPrev() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
}
