package com.mountain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mountain.entity.AdminDto;
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
import com.mountain.entity.ReplyQnaDto;
import com.mountain.entity.SanDto;
import com.mountain.entity.User;

@Mapper
public interface MountainMapper {

	// 산

	// 산 정보 ID로 가져오기
	@Select("select id, name, info, lat, lon, san_img from san where id = ${id}")
	public SanDto sanInfo(Long mountainId);

	//주인국: 산 리스트 가져오기 c
	@Select("select id, name, info, lat, lon, san_img from san")
	public List<SanDto> getSanList();

	//주인국: 산 입구 리스트 가져오기 c
	@Select("select id, san_id, name, latitude, longitude from entrance where san_id = ${sanId}")
	public List<EntranceDto> getEntranceList(Long sanId);

	//산 개별 전체 난이도 리스트
	@Select("select d.id, d.san_id, d.user_id, d.level, d.text , d.write_date from diffi d join san s on d.san_id= s.id join user u on d.user_id=u.id where d.san_id=\"${sanId}\"")
	public List<DifficultyDto> levelList(Long sanId);

	//산 개별 난이도작성
	@Insert("insert into diffi(id, san_id, user_id, level, text , write_date) values(0, ${sanId}, ${userId}, \"${level}\",\"${text}\",\"${writeDate}\")")
	public int levelInsert(DifficultyDto difficultyDto);


	// 게시판

	// 자유게시판 글 작성
	@Insert("insert into forum(id, title, content, u_id, write_date, img) values(0, \"${title}\", \"${content}\", ${userId}, \"${writeDate}\", \"${img}\")")
	public int forumInsert(ForumDto forumDto);

	// 자유게시판 글 수정
	@Update("update forum set title = \"${title}\", content = \"${content}\", img = \"${img}\" where id = ${id} and u_id = ${userId}")
	public int forumUpdate(ForumDto forumDto);

	// 자유게시판 글 삭제
	@Delete("delete from forum where id = ${id} and u_id = ${userId}")
	public int forumDelete(@Param("id") Long forumId, @Param("userId") Long userId);

	// 자유게시판 전체 리스트 가져오기 자유게시판 리스트 페이지용
	@Select("select f.id, f.title, u.user_id ,f.write_date from forum f join user u on f.u_id = u.id")
	public List<ForumUser> forumInfo();

	// 자유게시판 자유게시판 ID로 정보 가져오기
	@Select("select f.id, f.title, f.content, f.u_id, f.img, u.user_id ,f.write_date from forum f join user u on f.u_id = u.id where f.id = ${id}")
	public ForumUser forumInfoById(@Param("id") Long forumId);

	// 자유게시판 페이징
	@Select("select * from (select f.id, f.title, u.user_id ,f.write_date from forum f join user u on f.u_id = u.id order by f.id desc) as T1 limit #{skip}, #{amount}")
	public List<ForumUser> forumInfoPaging(Criteria cri);

	// 자유게시판 페이징 => 검색용
	@Select("select * from (select f.id, f.title, u.user_id ,f.write_date from forum f join user u on f.u_id = u.id where ${select} like \"%${search}%\" order by f.id  desc) as T1 limit ${skip}, ${amount}")
	public List<ForumUser> forumInfoPagingForSearch(@Param("select") String select, @Param("search") String search, @Param("skip") int skip, @Param("amount") int amount);

	// 자유게시판 총 갯수
	@Select("select count(*) from forum")
	public int getTotal();

	// 자유게시판 댓글 작성
	@Insert("insert into reply_forum(id, content, user_id, forum_id, write_date) values(0, \"${content}\", ${userId}, ${forumId}, \"${writeDate}\")")
	public int forumReplyInsert(ReplyForumDto replyForumDto);

	// 자유게시판 댓글 수정
	@Update("update reply_forum set content = \"${content}\" where id = ${id} and user_id = ${userId} and forum_id = ${forumId}" )
	public int forumReplyUpdate(ReplyForumDto replyForumDto);

	// 자유게시판 댓글 1개 가져오기
	@Select("select id, content, user_id, forum_id, write_date from reply_forum where user_id = ${userId} and id = ${id} and forum_id = ${forumId}")
	public ReplyForumDto forumReplyByUserId(@Param("userId") Long userId,@Param("id") Long id, @Param("forumId") Long forumId);

	// 자유게시판 댓글 auto_increment 초기화
	@Update("alter table reply_forum auto_increment = 1")
	public int forum_replyAuto_increment();

	// 자유게시판 auto_increment 초기화
	@Update("alter table forum auto_increment = 1")
	public int forumAuto_increment();

	// 자유게시판 댓글 전체 삭제
	@Delete("delete from reply_forum where forum_id = ${forumId}")
	public int forum_replyDelete(Long forumId);

	// 자유게시판 댓글 하나 삭제
	@Delete("delete from reply_forum where forum_id = ${forumId} and user_id = ${userId} and id = ${id}")
	public int forum_replyDelete_one(@Param("forumId") Long forumId, @Param("userId") Long userId, @Param("id") Long id);

	// 자유게시판 댓글 리스트 가져오기
	@Select("select r.id, u.user_id, r.content, r.forum_id, r.write_date from reply_forum r join user u on r.user_id = u.id where r.forum_id = ${forumId}")
	public List<ReplyForumUser> forumReplyList(Long forumId);



	// 문의게시판 글 작성
	@Insert("insert into qna(id, title, content, u_id, img, write_date) values(0, \"${title}\", \"${content}\", ${userId}, \"${img}\", \"${writeDate}\")")
	public int qnaInsert(QnaDto qnaDto);

	// 문의게시판 글 수정
	@Update("update qna set title = \"${title}\", content = \"${content}\", img = \"${img}\" where id = ${id} and u_id = ${userId}")
	public int qnaUpdate(QnaDto qnaDto);

	// 문의게시판 글 삭제
	@Delete("delete from qna where id = ${id} and u_id = ${uId}")
	public int qnaDelete(@Param("id") Long qnaId, @Param("uId") Long userId);

	// 문의게시판 auto_increment 초기화
	@Update("alter table qna auto_increment = 1")
	public int qnaAuto_increment();

	// 문의게시판 댓글 auto_increment 초기화
	@Update("alter table reply_qna auto_increment = 1")
	public int qna_replyAuto_increment();

	// 문의게시판 댓글 전체 삭제
	@Delete("delete from reply_qna where qna_id = ${qnaId}")
	public int qna_replyDelete(Long qnaId);

	// 문의게시판 전체 리스트 가져오기 문의게시판 리스트 페이지용
	@Select("select q.id, q.title, u.user_id ,q.write_date from qna q join user u on q.u_id = u.id")
	public List<QnaUser> qnaInfo();

	// 문의게시판 문의게시판 ID로 정보 가져오기
	@Select("select q.id, q.title, q.content, q.u_id, q.img, u.user_id , q.write_date from qna q join user u on q.u_id = u.id where q.id = ${id}")
	public QnaUser qnaInfoById(@Param("id") Long qnaId);

	// 문의게시판 페이징
	@Select("select * from (select q.id, q.title, u.user_id ,q.write_date from qna q join user u on q.u_id = u.id order by q.id desc) as T1 limit #{skip}, #{amount}")
	public List<ForumUser> qnaInfoPaging(Criteria cri);

	// 문의게시판 페이징 => 검색용
	@Select("select * from (select q.id, q.title, u.user_id ,q.write_date from qna q join user u on q.u_id = u.id where ${select} like \"%${search}%\" order by q.id desc) as T1 limit #{skip}, #{amount}")
	public List<ForumUser> qnaInfoPagingForSearch(@Param("select") String select, @Param("search") String search, @Param("skip") int skip, @Param("amount") int amount);

	// 문의게시판 총 갯수
	@Select("select count(*) from qna")
	public int getQnaTotal();

	// 문의게시판 답변 작성
	@Insert("insert into reply_qna(id, qna_id, content, write_date, admin_id) values(0, ${qnaId}, \"${content}\", \"${writeDate}\", 1)")
	public int qnaReplyInsert(ReplyQnaAdmin replyQnaAdmin);

	// 문의게시판 답변 수정
	@Update("update reply_qna set content = \"${content}\" where id = ${id}")
	public String qnaReplyUpdate(Long replyQnaId);

	// 문의게시판 답변 리스트 가져오기
	@Select("select r.id, a.admin_id, r.content, r.qna_id, write_date from reply_qna r join admin a on r.admin_id = a.id where r.qna_id = ${qnaId}")
	public List<ReplyQnaAdmin> qnaReplaylist(Long qnaId);




	// 로그인(User)
	@Select("select id, user_id, password, name, email from user where user_id = \"${userId}\"") // 유저정보 가져오기
	public User userInfo(String userId);

	// 유저정보 insert하기 (회원가입)
	@Insert("insert into user(id, user_id, password, name, email) value(0, \"${userId}\", \"${password}\", \"${name}\", \"${email}\")") 
	public int userJoin(User user);

	// 유저정보 insert (관리자 계정)
	@Insert("insert into admin(id, user_id, password, email, name) values(0, ${userId}, ${password}, ${name}, ${email})")
	public int adminJoin(AdminDto adminDto);

	// 아이디 찾기
	@Select("select user_id from user where name = \"${name}\" and email = \"${email}\"")
	public User findId(@Param("name") String name, @Param("email") String email);

	// 비밀번호 찾기
	@Select("select password from user where name = \"${name}\" and user_id = \"${userId}\" and email = \"${email}\"")
	public User findPassword(@Param("name") String name, @Param("userId") String userId, @Param("email") String email);

	//	// 유저정보 delete하기 (회원탈퇴)
	//	@Delete("delete from user where user_id = ${userId}")
	//	public int userDelete(String userId);



}
