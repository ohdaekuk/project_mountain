package com.mountain.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mountain.entity.Criteria;
import com.mountain.entity.DifficultyDto;
import com.mountain.entity.EntranceDto;
import com.mountain.entity.ForumDto;
import com.mountain.entity.ForumUser;
import com.mountain.entity.QnaDto;
import com.mountain.entity.QnaUser;
import com.mountain.entity.ReplyForumDto;
import com.mountain.entity.ReplyForumUser;
import com.mountain.entity.ReplyQnaAdmin;
import com.mountain.entity.SanDto;
import com.mountain.entity.User;
import com.mountain.mapper.MountainMapper;

@Service
public class MountainService {

	@Autowired
	MountainMapper mountainMapper;

	//주인국이 작성한 서비스
	public String getImageSource(String id){
		WebDriver driver = null;
		String findImageUrl = "https://place.map.kakao.com/" + id;
		String returnUrl = "";
		try{
			//driver 설정(주소 같이 맞추기) src/main/resources/chromedriver
			System.setProperty("webdriver.chrome.driver", "C:\\Users\\tj\\dk\\Team\\Team_Controller\\src\\main\\resources\\chromedriver.exe");
			//Chrome 드라이버 인스턴스 설정
			driver = new ChromeDriver();
			//스크립트를 사용하기 위한 캐스팅
			JavascriptExecutor js = (JavascriptExecutor)driver;
			//블로그 URL로 접속
			driver.get(findImageUrl);
			//대기 설정
			driver.manage().timeouts().implicitlyWait(300, TimeUnit.SECONDS);
			//xpath로 element를 찾는다. 이 xpath는 명월일지 블로그 왼쪽의
			Thread.sleep(1000);
			WebElement element = driver.findElement(By.xpath("/html/body/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/a/span[1]"));

			returnUrl = element.getAttribute("style");
			returnUrl = returnUrl.substring(25, returnUrl.length()-3);


			return returnUrl;


		}catch (Exception e){
			e.printStackTrace();
			//없는 파일에 디폴트로 전송할 사진
			return "none";



		}finally {
			driver.close();
		}
	}

	//입구 리스트 가져오기
	public List<EntranceDto> getEntranceList(Long sanId){
		return mountainMapper.getEntranceList(sanId);
	}

	//산 리스트 가져오기
	public List<SanDto>  getSanList(){
		return mountainMapper.getSanList();
	}

	//서울 영역 json으로 가져오기
	public String getSoeulBoundJson(){
		File file = new File("/Users/tj/dk/Team/Team_Controller/src/main/webapp/resources/kakaomap_bound/seoul.json");
		BufferedReader br = null;
		String soeulData = "";
		try {

			StringBuffer sb = new StringBuffer();
			br = new BufferedReader(new FileReader(file));
			while ((soeulData = br.readLine())!=null){
				sb.append(soeulData);
			}
			soeulData = sb.toString();
			return soeulData;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	///////////////////////////////////////////////////////////////////////////////////////////



	// 유저

	public User selectByUserId(String userId, String password) { // 로그인

		User user = mountainMapper.userInfo(userId);

		if(user == null) {

			return null;

		}else {

			if(user.getUserId().equals(userId) && user.getPassword().equals(password)) {

				return user;

			}else{

				return null;

			}

		}

	}

	public String userInsert(User user) { // 회원가입

		User user01 = mountainMapper.userInfo(user.getUserId());

		int result = 0;

		if(user01 != null) {

			return "동일한 아이디가 있습니다.";

		} else {

			result = mountainMapper.userJoin(user);

		}

		if(result == 1) {

			return "가입되었습니다.";

		}else {

			return "가입에 실패하였습니다.";

		}
	}

	public User findId(String name, String email) { // 아이디 찾기

		User user =	mountainMapper.findId(name, email);

		if(user != null) {

			return user;

		} else {

			return null;
		}


	}

	public User findPassword(String name, String userId, String email) { // 비밀번호 찾기

		User user = mountainMapper.findPassword(name, userId, email);

		if(user != null) {

			return user;

		} else {

			return null;
		}

	}

	// 산

	public SanDto selectById(Long id) { // 산 정보 가져오기 
		return mountainMapper.sanInfo(id);
	}

	// 게시판

	public String forumInsert(ForumDto forumDto, Long userId) { // 자유게시판 작성

		forumDto.setWriteDate(LocalDateTime.now());

		forumDto.setImg(forumDto.getImage().getOriginalFilename());

		forumDto.setUserId(userId);

		int result = mountainMapper.forumInsert(forumDto);

		if(result == 1) {
			return "작성되었습니다.";
		}else {
			return "작성에 실패하였습니다.";
		}

	}

	public List<ForumUser> forumList(){ // 자유게시판 리스트

		return mountainMapper.forumInfo();

	}

	public List<ForumUser> forumInfoPaging(Criteria cri){ // 자유게시판 리스트 페이징
		return mountainMapper.forumInfoPaging(cri);
	}

	public List<ForumUser> forumInfoPagingForSearch(String select, String search, Criteria cri){ // 자유게시판 리스트 페이징 => 검색용

		return mountainMapper.forumInfoPagingForSearch(select, search, cri.getSkip(), cri.getAmount());
	}

	public int getTotal() {// 게시물 총 갯수
		return mountainMapper.getTotal();
	}

	public ForumUser forumSelectById(Long forumId) { // 자유게시판 글 내용

		ForumUser forumOne = mountainMapper.forumInfoById(forumId);

		return forumOne;

	}

	public String forumUpdate(ForumDto forumDto) { // 자유게시판 수정

		forumDto.setImg(forumDto.getImage().getOriginalFilename());

		int result = mountainMapper.forumUpdate(forumDto);

		if(result == 1) {

			return "수정되었습니다.";

		}else {

			return "본인만 수정할 수 있습니다.";

		}
	}

	public String forumDelete(Long forumId, Long userId) { // 자유게시판 글 삭제

		int result = mountainMapper.forumDelete(forumId, userId);

		mountainMapper.forum_replyDelete(forumId);
		mountainMapper.forumAuto_increment();
		mountainMapper.forum_replyAuto_increment();

		if(result == 1) {

			return "삭제되었습니다.";

		} else {

			return "본인만 삭제할 수 있습니다.";
		}

	}

	public String forumReplyInsert(ReplyForumDto replyForumDto, HttpSession session) { // 자유게시판 댓글 작성

		replyForumDto.setWriteDate(LocalDateTime.now());

		Long userId = (Long) session.getAttribute("userId");

		if(userId == null) {

			return "로그인해주세요.";

		}else{

			replyForumDto.setUserId(userId);

			int result =  mountainMapper.forumReplyInsert(replyForumDto);

			if(result == 1) {

				return "댓글이 작성되었습니다.";

			} else {

				return "댓글이 작성되지 않았습니다.";
			}
		}


	}

	public List<ReplyForumUser> forumReplyList(Long forumId){ // 자유게시판 댓글 리스트

		List<ReplyForumUser> replyForum = mountainMapper.forumReplyList(forumId);

		if(!replyForum.isEmpty()) { // replyForum이 비어있지 않다면

			if(replyForum.get(0).getForumId().equals(forumId)) {

				return replyForum;

			} else {

				return null;

			}

		}else {

			return null;
		}
	}

	public ReplyForumDto forumReplyByUserId(Long userId, Long id, Long forumId) { // 자유게시판 댓글 1개 가져오기

		ReplyForumDto reply = mountainMapper.forumReplyByUserId(userId, id, forumId);

		return reply;

	}

	public String forum_reply_update(ReplyForumDto replyForumDto) { // 자유게시판 댓글 수정하기

		int result =  mountainMapper.forumReplyUpdate(replyForumDto);

		if(result == 1) {

			return "수정되었습니다.";

		}else {

			return "수정에 실패하였습니다.";
		}		
	}

	public String forum_reply_delete_one(Long forumId, Long userId, Long id) { // 자유게시판 댓글 1개 삭제하기

		int result = mountainMapper.forum_replyDelete_one(forumId, userId, id);
		mountainMapper.forum_replyAuto_increment();

		if(result == 1) {

			return "삭제되었습니다.";

		}else {

			return "댓글을 삭제할 수 없습니다.";

		}

	}

	public String qnaInsert(QnaDto qnaDto, Long userId) { // qna 작성

		qnaDto.setWriteDate(LocalDateTime.now());

		qnaDto.setImg(qnaDto.getImage().getOriginalFilename());

		qnaDto.setUserId(userId);

		int result = mountainMapper.qnaInsert(qnaDto);

		if(result == 1) {
			return "작성되었습니다.";
		}else {
			return "작성에 실패하였습니다.";
		}

	}

	public List<QnaUser> qnaList(){ // qna 리스트

		return mountainMapper.qnaInfo();

	}

	public List<ForumUser> qnaInfoPaging(Criteria cri){ //문의게시판 리스트 페이징
		return mountainMapper.qnaInfoPaging(cri);
	}

	public List<ForumUser> qnaInfoPagingForSearch(String select, String search, Criteria cri){ // 문의게시판 리스트 페이징 => 검색용

		return mountainMapper.qnaInfoPagingForSearch(select, search, cri.getSkip(), cri.getAmount());
	}

	public int getQnaTotal() { // 게시물 총 갯수
		return mountainMapper.getQnaTotal();
	}

	public QnaUser qnaSelectById(Long qnaId) { // qna 글 내용

		QnaUser qnaUser = mountainMapper.qnaInfoById(qnaId);

		return qnaUser;

	}

	public String qnaUpdate(QnaDto qnaDto) { // qna 수정

		qnaDto.setImg(qnaDto.getImage().getOriginalFilename());

		int result = mountainMapper.qnaUpdate(qnaDto);

		if(result == 1) {

			return "수정되었습니다.";

		}else {

			return "본인만 수정할 수 있습니다.";

		}
	}

	public String qnaDelete(Long qnaId, Long userId) { // qna 글 삭제

		int result = mountainMapper.qnaDelete(qnaId, userId);

		mountainMapper.qna_replyDelete(qnaId);
		mountainMapper.qnaAuto_increment();
		mountainMapper.qna_replyAuto_increment();

		if(result == 1) {

			return "삭제되었습니다.";

		} else {

			return "본인만 삭제할 수 있습니다.";
		}

	}

	public String qnaReplyInsert(ReplyQnaAdmin replyQnaAdmin) { // qna 댓글 작성

		replyQnaAdmin.setWriteDate(LocalDateTime.now());

		int result =  mountainMapper.qnaReplyInsert(replyQnaAdmin);

		if(result == 1) {

			return "댓글이 작성되었습니다.";

		} else {

			return "댓글이 작성되지 않았습니다.";
		}
	}

	public List<ReplyQnaAdmin> qnaReplyList(Long qnaId){ // qna 댓글 리스트

		List<ReplyQnaAdmin> replyQna = mountainMapper.qnaReplaylist(qnaId);

		if(!replyQna.isEmpty()) { // replyForum이 비어있지 않다면

			if(replyQna.get(0).getQnaId().equals(qnaId)) {

				return replyQna;

			} else {

				return null;

			}

		}else {

			return null;
		}
	}


	public List<DifficultyDto> levelList(Long sanId){ // 난이도 리스트 

		return mountainMapper.levelList(sanId);
	}


	public String levelInsert(DifficultyDto difficultyDto, Long sanId, HttpSession session) { // 난이도 작성

		Long userId = (Long) session.getAttribute("userId");		

		difficultyDto.setUserId(userId);

		difficultyDto.setSanId(sanId);

		difficultyDto.setWriteDate(LocalDate.now());		

		int result = mountainMapper.levelInsert(difficultyDto);

		if(result == 1) {
			return "작성되었습니다.";
		}else {
			return "작성에 실패하였습니다.";
		}

	}

}
