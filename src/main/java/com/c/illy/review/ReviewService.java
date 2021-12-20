package com.c.illy.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.cart.CartRepository;
import com.c.illy.cart.CartVO;
import com.c.illy.member.MemberRepository;
import com.c.illy.member.MemberVO;
import com.c.illy.member.point.PointRepository;
import com.c.illy.member.point.PointVO;
import com.c.illy.notice.NoticeFileVO;
import com.c.illy.notice.NoticeVO;
import com.c.illy.util.FileManager;
import com.c.illy.util.Pager;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private PointRepository pointRepository;

	@Autowired
	private FileManager fileManager;

	// 전체 리뷰 조회하기
	public List<ReviewVO> getReviewList(Pager pager) throws Exception {
		pager.makeRow();
		Long totalCount=reviewRepository.reviewTotalCount(pager);
		pager.makeNum(totalCount);
		System.out.println(totalCount);
		return reviewRepository.getReviewList(pager);
	}

	//리뷰 하나 조회하기 
	public ReviewVO reviewSelectOne(Integer cart_id)throws Exception{
		return reviewRepository.reviewSelectOne(cart_id);
	}
	
	
	// 리뷰 추가하기
	public int reviewInsert(MemberVO memberVO,ReviewVO reviewVO, MultipartFile[] multipartFiles) throws Exception {
		reviewRepository.reviewInsert(reviewVO);

		for (MultipartFile file : multipartFiles) {
			if (file.getSize() == 0L) {
				continue;
			}
			String fileName = fileManager.getUseClassPathResource("upload/review", file);
			// *** 이미지 저장 위치 [workspace]\[project]\target\classes\static
			ReviewFileVO reviewFileVO = new ReviewFileVO();
			reviewFileVO.setReview_id(reviewVO.getReview_id());
			reviewFileVO.setReviewFile_name(fileName);
			reviewFileVO.setReviewFile_oriName(file.getOriginalFilename());
			reviewRepository.reviewFileInsert(reviewFileVO);
		}

		  Integer point = memberVO.getMember_point() + 100; //구매할 때 적립받은 포인트 차감
			
		java.sql.Date today= new java.sql.Date(new java.util.Date().getTime());//오늘 날짜 표현
		  System.out.println(reviewVO.getReview_regDate());
		  PointVO pointVO = new PointVO();
		
		  
		  pointVO.setMember_id(memberVO.getMember_id()); //로그인 한 아이디 넣기
		  pointVO.setPoint_date(today); //리뷰 등록 날짜 / 상품 취소 날짜 / 상품 구매 날짜 적기
		  pointVO.setPoint_type("add"); //적립은 "add", 차감은 "use"로 표현 - 리뷰는 only 적립만..?
		  pointVO.setPoint_history("(리뷰 등록) 포인트 적립"); //"(리뷰 등록) 포인트 적립" 이런 식으로
		  pointVO.setPoint_addOrUse(100); //적립포인트 100, 200, 300 ...
		  pointVO.setPoint_totalPoint(point); //기존포인트+적립포인트
		  
		  pointRepository.setPointHistory(pointVO);
		
		  
		  memberVO.setMember_point(point); 
		  memberRepository.setAddBean(memberVO); //포인트 update
		  return 0;
	}

	//리뷰 하나의 파일리스트 조회하기 
	public List<ReviewFileVO> reviewSelectFile(Integer review_id)throws Exception{
		return reviewRepository.reviewSelectFile(review_id);
	}
	
	
	
	// 리뷰 수정하기
	public int reviewUpdate(ReviewVO reviewVO) throws Exception {
		return reviewRepository.reviewUpdate(reviewVO);
	}

	// 리뷰 삭제하기
	public int reviewDelete(ReviewVO reviewVO) throws Exception {
		return reviewRepository.reviewDelete(reviewVO);
	}
}