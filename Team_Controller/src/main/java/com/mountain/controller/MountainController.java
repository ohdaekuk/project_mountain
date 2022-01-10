package com.mountain.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mountain.entity.Criteria;
import com.mountain.entity.DifficultyDto;
import com.mountain.entity.EntranceDto;
import com.mountain.entity.ForumDto;
import com.mountain.entity.ForumUser;
import com.mountain.entity.Image;
import com.mountain.entity.PageMakerDto;
import com.mountain.entity.QnaDto;
import com.mountain.entity.QnaUser;
import com.mountain.entity.ReplyForumDto;
import com.mountain.entity.ReplyForumUser;
import com.mountain.entity.ReplyQnaAdmin;
import com.mountain.entity.SanDto;
import com.mountain.entity.User;
import com.mountain.service.MountainService;

@Controller
public class MountainController {

	@Autowired
	MountainService mountainService;

	@GetMapping("mainlist") // ajax 테스트
	@ResponseBody
	public List<ForumUser> mainPost() {

		List<ForumUser> list =  mountainService.forumList();

		return list;
	}

	//주인국 추가내용
	@GetMapping("getSrc")
	public @ResponseBody String giveSrc(@RequestParam String id, Model model) {
		return mountainService.getImageSource(id);
	}

	//입구 정보 받기.
	@PostMapping("getEntranceList")
	public @ResponseBody List<EntranceDto> getEntranceList(@RequestParam String sanId, Model model){
		Long sanIdLong = Long.parseLong(sanId);
		return mountainService.getEntranceList(sanIdLong);
	}

	//주인국: 산 리스트 ajax로 보내주기.
	@PostMapping("mountain_main")
	public @ResponseBody
	List<SanDto> mountain_mainReturnSanData(){
		return mountainService.getSanList();
	}

	@GetMapping("mountain_page") // 산 개별 페이지으로 이동
	public String mountain_page(@RequestParam String id, Model model) { // 산 ID를 파라미터로 받아 페이지 이동
		if(id == null){
			id = "1";
		}else {
			Long idLong = Long.parseLong(id);
			SanDto san = mountainService.selectById(idLong);
			model.addAttribute("san", san);

			List<DifficultyDto> difficultyList = mountainService.levelList(idLong);

			model.addAttribute("List", difficultyList);
		}
		return "mountain/mountain_page";
	}

	//주인국: 메인
	@GetMapping("jsontest")
	public String gojsontest(){
		return "mountain/jsontest";
	}

	// 메인

	@GetMapping("main") // 메인 페이지로 이동
	public String main() {
		return "mountain/main";
	}


	@GetMapping("login") // 로그인 페이지로 이동
	public String login() {
		return "mountain/login";
	}

	@GetMapping("join") // 회원가입 페이지로 이동 
	public String join() {
		return "mountain/join";
	}

	@PostMapping("join_result") // 회원가입 결과
	public String join_result(User user, Model model) {

		String result = mountainService.userInsert(user);

		model.addAttribute("result", result);

		return "mountain/main";
	}

	@GetMapping("find") // 아이디, 비밀번호 찾기 페이지로 이동
	public String find() {
		return "mountain/find_id_password";
	}

	// 산

	@GetMapping("mountain_main") // 산 메인 페이지로 이동
	public String mountain_main(Model model) {
		String soeulBoundJson = mountainService.getSoeulBoundJson();
		model.addAttribute("soeulBoundJson", soeulBoundJson);
		return "mountain/mountain_main_page";

	}

	//	@GetMapping("mountain_page") // 산 개별 페이지으로 이동 
	//	public String mountain_page(Long id, Model model) { // 산 ID를 파라미터로 받아 페이지 이동
	//
	//		SanDto san = mountainService.selectById(id);	
	//
	//		model.addAttribute("san", san);
	//
	//		return "mountain/mountain_page";
	//	}

	// 게시판

	// qna게시판

	@GetMapping("qnaBoard_list") // qna게시판 리스트 페이지로 이동
	public String qnaBoard(Model model , Criteria cri) { 


		int total = mountainService.getQnaTotal();

		PageMakerDto qnaPageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", qnaPageMake);
		model.addAttribute("List", mountainService.qnaInfoPaging(cri));

		return "mountain/qnaList";
	}

	@GetMapping("qna_write") // qna게시판 글 작성 페이지로 이동
	public String qnaBoard_write() {
		return "mountain/qnaWrite";
	}

	@PostMapping("qna_write") // qna 글 작성
	public String qnaBoard_write_post(QnaDto qnaDto, Model model, Image image, HttpSession session, Criteria cri) {

		// 이미지
		MultipartFile img01 = image.getImage();

		if(!img01.isEmpty()) {
			String filePath ="C:\\Users\\tj\\dk\\Team\\Team_Controller\\src\\main\\webapp\\resources\\qna_img";
			String fileName = img01.getOriginalFilename();

			try {
				img01.transferTo(new File(filePath, fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 문의게시판 페이징


		int total = mountainService.getQnaTotal();

		PageMakerDto qnaPageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", qnaPageMake);

		// 문의게시판 정보 담아와 DB에 삽입

		Long userId = (Long) session.getAttribute("userId");

		String result = mountainService.qnaInsert(qnaDto, userId);

		model.addAttribute("result", result);
		model.addAttribute("List", mountainService.qnaInfoPaging(cri));


		return "mountain/qnaList";
	}

	@GetMapping("qna_Modify") // qna게시판 글 수정 페이지로 이동
	public String qnaBoard_modify(@Param("qnaId") Long qnaId, @Param("uId") Long uId, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");

		String result = "본인만 수정할 수 있습니다.";

		QnaUser qnaUser = mountainService.qnaSelectById(qnaId);

		if(userId != uId) {

			model.addAttribute("result", result);

			qnaUser = mountainService.qnaSelectById(qnaId);
			List<ReplyQnaAdmin> list = mountainService.qnaReplyList(qnaId);

			model.addAttribute("qna", qnaUser);
			model.addAttribute("replyList", list);

			return "mountain/qnaPost";

		}else {

			model.addAttribute("qna", qnaUser);
			return "mountain/qnaModify";

		}

	}

	@PostMapping("qna_modify") // qna게시판 수정
	public String qnaBoard_modify_result(QnaDto qnaDto, Model model, Image image, HttpSession session, Criteria cri) {

		// 이미지
		MultipartFile img01 = image.getImage();

		if(!img01.isEmpty()) {
			String filePath ="C:\\Users\\tj\\dk\\Team\\Team_Controller\\src\\main\\webapp\\resources\\qna_img";
			String fileName = img01.getOriginalFilename();

			try {
				img01.transferTo(new File(filePath, fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 문의게시판 페이징

		Long userId = (Long) session.getAttribute("userId");

		qnaDto.setUserId(userId);

		int total = mountainService.getQnaTotal();

		PageMakerDto qnaPageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", qnaPageMake);

		// 자유게시판 정보 담아와 DB 수정

		String result = mountainService.qnaUpdate(qnaDto);

		model.addAttribute("result", result);
		model.addAttribute("List", mountainService.qnaInfoPaging(cri));

		return "mountain/qnaList";
	}

	@GetMapping("qna_delete") // qna 글 삭제
	public String qna_delete(Long qnaId, HttpSession session, Model model, Criteria cri) {

		// qna 페이징

		int total = mountainService.getQnaTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", pageMake);


		// 글 삭제

		Long userId = (Long) session.getAttribute("userId");

		if(userId != null) {

			String result = mountainService.qnaDelete(qnaId, userId);

			model.addAttribute("result", result);
			model.addAttribute("List", mountainService.qnaInfoPaging(cri));

			return "mountain/qnaList";

		} else {

			String result = "본인만 삭제할 수 있습니다.";

			model.addAttribute("result", result);
			model.addAttribute("List", mountainService.qnaInfoPaging(cri));


			return "mountain/qnaList";
		}
	}

	@GetMapping("qna_search") // qna게시판 검색
	public String qna_search(Model model, Criteria cri, @Param("select") String select, @Param("search") String search) {

		// qna게시판 페이징

		int total = mountainService.getQnaTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("List", mountainService.qnaInfoPagingForSearch(select, search, cri));

		model.addAttribute("pageMaker", pageMake);

		return "mountain/qnaList";

	}

	@GetMapping("qna_reply") // qna 댓글 작성
	public String qna_reply_insert(ReplyQnaAdmin replyQnaAdmin, Long qnaId, Model model) {

		mountainService.qnaReplyInsert(replyQnaAdmin);

		QnaUser qnaOne = mountainService.qnaSelectById(qnaId);

		List<ReplyQnaAdmin> list = mountainService.qnaReplyList(qnaId);

		model.addAttribute("replyList", list);
		model.addAttribute("qna", qnaOne);

		return "mountain/qnaPost";

	}


	@GetMapping("qna_select") // qna 글로 이동
	public String qna_select(Long qnaId, Model model) {

		QnaUser qnaUser = mountainService.qnaSelectById(qnaId);
		List<ReplyQnaAdmin> list = mountainService.qnaReplyList(qnaId);

		model.addAttribute("qna", qnaUser);
		model.addAttribute("replyList", list);

		return "mountain/qnaPost";
	}

	// 자유게시판

	@GetMapping("forum_list") // 자유게시판 리스트 페이지로 이동
	public String freeBorad(Model model, Criteria cri) { 

		// 자유게시판 페이징

		int total = mountainService.getTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("List", mountainService.forumInfoPaging(cri));

		model.addAttribute("pageMaker", pageMake);

		return "mountain/list";
	}

	@GetMapping("forum_write") // 자유게시판 글 작성 페이지로 이동
	public String forum_write(HttpSession session, Model model, Criteria cri) {

		if(session.getAttribute("userId") == null) {

			String result = "로그인 해주세요.";

			model.addAttribute("List", mountainService.forumInfoPaging(cri));

			int total = mountainService.getTotal();

			PageMakerDto pageMake = new PageMakerDto(cri, total);

			model.addAttribute("result", result);
			model.addAttribute("pageMaker", pageMake);

			return "mountain/list";

		}else {

			return "mountain/write";

		}

	}

	@GetMapping("forum_select") // 자유게시판 글로 이동
	public String forum_select(Long forumId, Model model) {

		ForumUser forumOne = mountainService.forumSelectById(forumId);
		List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

		model.addAttribute("forum", forumOne);
		model.addAttribute("replyList" ,list);

		return "mountain/post";
	}

	@PostMapping("forum_write") // 자유게시판 글 작성
	public String forum_write_post(ForumDto forumDto, Model model, Image image, HttpSession session, Criteria cri) {

		// 이미지
		MultipartFile img01 = image.getImage();

		if(!img01.isEmpty()) {
			String filePath ="C:\\Users\\tj\\dk\\Team\\Team_Controller\\src\\main\\webapp\\resources\\forum_img";
			String fileName = img01.getOriginalFilename();

			try {
				img01.transferTo(new File(filePath, fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 자유게시판 페이징

		int total = mountainService.getTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", pageMake);

		// 자유게시판 정보 담아와 DB에 삽입

		Long userId = (Long) session.getAttribute("userId");

		String result = mountainService.forumInsert(forumDto, userId);

		model.addAttribute("result", result);
		model.addAttribute("List", mountainService.forumInfoPaging(cri));

		return "mountain/list";

	}

	@GetMapping("forum_modify") // 자유게시판 글 수정 페이지로 이동
	public String forum_modify(@Param("forumId") Long forumId, @Param("uId") Long uId, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");

		ForumUser forumOne = mountainService.forumSelectById(forumId);

		model.addAttribute("forum", forumOne);

		String result = "본인만 수정할 수 있습니다.";

		if(uId != userId) {

			model.addAttribute("result", result);

			forumOne = mountainService.forumSelectById(forumId);
			List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

			model.addAttribute("forum", forumOne);
			model.addAttribute("replyList" ,list);

			return "mountain/post"; 

		}else {

			return "mountain/modify";

		}

	}

	@PostMapping("forum_modify") // 자유게시판 글 수정
	public String forum_modifyResult(ForumDto forumDto, Model model, Image image, HttpSession session, Criteria cri) {

		// 이미지
		MultipartFile img01 = image.getImage();

		if(!img01.isEmpty()) {
			String filePath ="C:\\Users\\tj\\dk\\Team\\Team_Controller\\src\\main\\webapp\\resources\\forum_img";
			String fileName = img01.getOriginalFilename();

			try {
				img01.transferTo(new File(filePath, fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 자유게시판 페이징

		int total = mountainService.getTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", pageMake);

		// 자유게시판 정보 담아와 DB 수정

		Long userId = (Long) session.getAttribute("userId");

		forumDto.setUserId(userId);

		String result = mountainService.forumUpdate(forumDto);

		model.addAttribute("result", result);
		model.addAttribute("List", mountainService.forumInfoPaging(cri));

		return "mountain/list";

	}

	@GetMapping("forum_delete") // 자유게시판 글 삭제
	public String forum_delete(Long forumId, HttpSession session, Model model, Criteria cri) {

		// 자유게시판 페이징

		int total = mountainService.getTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("pageMaker", pageMake);

		Long userId = (Long)session.getAttribute("userId");

		// 글 삭제

		if(userId != null) {

			String result = mountainService.forumDelete(forumId, userId);

			model.addAttribute("result", result);
			model.addAttribute("List", mountainService.forumInfoPaging(cri));

			return "mountain/list";

		} else {

			String result = "본인만 삭제할 수 있습니다.";

			model.addAttribute("result", result);
			model.addAttribute("List", mountainService.forumInfoPaging(cri));

			return "mountain/list";
		}
	}

	@GetMapping("forum_search") // 자유게시판 검색
	public String forum_search(Model model, Criteria cri, @Param("select") String select, @Param("search") String search) {

		// 자유게시판 페이징

		int total = mountainService.getTotal();

		PageMakerDto pageMake = new PageMakerDto(cri, total);

		model.addAttribute("List", mountainService.forumInfoPagingForSearch(select, search, cri));

		model.addAttribute("pageMaker", pageMake);

		return "mountain/list";

	}

	@GetMapping("forum_reply") // 자유게시판 댓글 작성
	public String forum_reply_insert(ReplyForumDto replyForumDto, Long forumId, Model model, HttpSession session) {

		mountainService.forumReplyInsert(replyForumDto, session);

		ForumUser forumOne = mountainService.forumSelectById(forumId);

		List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

		model.addAttribute("forum", forumOne);
		model.addAttribute("replyList" ,list);

		return "mountain/post";
	}

	@GetMapping("form_reply_value") // 자유게시판 댓글 하나 가져오기 -> 수정하기 위함
	public String forum_reply_one(HttpSession session, Long id, Long forumId, Model model) {

		Long userId = (Long) session.getAttribute("userId");

		ReplyForumDto reply = mountainService.forumReplyByUserId(userId, id, forumId);

		String result = "댓글을 수정할 수 없습니다.";

		if(reply == null) {

			model.addAttribute("result", result);
			model.addAttribute("reply", reply);

			ForumUser forumOne = mountainService.forumSelectById(forumId);
			List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

			model.addAttribute("forum", forumOne);
			model.addAttribute("replyList" ,list);

			return "mountain/post"; 

		} else {

			model.addAttribute("reply", reply);

			return "mountain/post_modify";

		}

	}

	@GetMapping("forum_relpy_modify") // 자유게시판 댓글 수정
	public String forum_reply_modify(ReplyForumDto replyForumDto, Model model) {

		mountainService.forum_reply_update(replyForumDto);

		ForumUser forumOne = mountainService.forumSelectById(replyForumDto.getForumId());
		List<ReplyForumUser> list = mountainService.forumReplyList(replyForumDto.getForumId());

		model.addAttribute("forum", forumOne);
		model.addAttribute("replyList" ,list);

		return "mountain/post";

	}

	@GetMapping("forum_reply_delete_one") // 자유게시판 댓글 하나 삭제하기
	public String forum_reply_delete_one(HttpSession session, Model model, Long id, Long forumId) {

		Long userId = (Long) session.getAttribute("userId");

		String result = mountainService.forum_reply_delete_one(forumId, userId, id);

		if(result.equals("댓글을 삭제할 수 없습니다.")) {

			model.addAttribute("result", result);

			ForumUser forumOne = mountainService.forumSelectById(forumId);
			List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

			model.addAttribute("forum", forumOne);
			model.addAttribute("replyList" ,list);

			return "mountain/post"; 

		}else {

			ForumUser forumOne = mountainService.forumSelectById(forumId);
			List<ReplyForumUser> list = mountainService.forumReplyList(forumId);

			model.addAttribute("forum", forumOne);
			model.addAttribute("replyList" ,list);

			return "mountain/post";

		}
	}

	@PostMapping("mountain_page") // 난이도 작성
	public String levelInsert(DifficultyDto difficultyDto, Model model, Long sanId, Long userId, HttpSession session) {

		String result = mountainService.levelInsert(difficultyDto, sanId, session);

		SanDto san = mountainService.selectById(sanId);	

		model.addAttribute("san", san);

		List<DifficultyDto> difficultyList = mountainService.levelList(sanId);

		model.addAttribute("List", difficultyList);

		model.addAttribute("result", result);

		return "mountain/mountain_page";

	}

}
