package com.c.illy.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.cart.CartService;
import com.c.illy.cart.CartVO;
import com.c.illy.member.MemberService;
import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductFileVO;
import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;
import com.c.illy.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CartService cartService; 
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService; 

	
	@GetMapping("bestReview")
	public String getSelectBestReview()throws Exception{
		return "review/bestReview"; 
	}
	
	@GetMapping("reviewAll")
	public String getSelecReviewAll()throws Exception{
		return "review/reviewAll";
	}
	
	/*
	 * @GetMapping("reviewAllAj") public ModelAndView reviewAllAj(ModelAndView
	 * mv,Pager pager)throws Exception{ List<ReviewVO> ar =
	 * reviewService.getReviewList(pager); List<ProductFileVO> par = new
	 * ArrayList<ProductFileVO>(); List<ReviewFileVO> rfVO = new
	 * ArrayList<ReviewFileVO>();
	 * 
	 * //꺼낼데이터타입 변수명 : 어디서꺼낼지 for(ReviewVO rlist: ar) {
	 * 
	 * List<ReviewFileVO>
	 * orifile=reviewService.reviewSelectFile(rlist.getReview_id());
	 * rfVO.addAll(orifile);
	 * 
	 * MemberVO memberVO=new MemberVO();
	 * 
	 * rlist.setMemberVO(memberService.getSelectUsername(rlist.getMemberVO().
	 * getMember_id()));
	 * 
	 * ProductVO productVO=new ProductVO();
	 * productVO.setProduct_id(rlist.getProductVO().getProduct_id());
	 * List<ProductFileVO>
	 * pfList=productService.getSelectProductFileList(productVO);
	 * par.add(pfList.get(0)); }
	 * 
	 * mv.addObject("refileList", rfVO); mv.addObject("rList", ar);
	 * mv.addObject("pfList", par); mv.setViewName("review/reviewAllAj");
	 * mv.addObject("pager", pager); return mv; }
	 */
	@GetMapping("reviewAllAj")
	public ModelAndView reviewAllAj(ModelAndView mv,Pager pager)throws Exception{
		List<ReviewVO> ar = reviewService.getReviewList(pager);
		List<ProductFileVO> par = new ArrayList<ProductFileVO>(); 
		//List<ReviewFileVO> rfVO = new ArrayList<ReviewFileVO>();

		//꺼낼데이터타입  변수명 : 어디서꺼낼지
		for(ReviewVO rlist: ar) {
			//Integer review_id=rlist.getReview_id();
			//rfVO=reviewService.reviewFiles(review_id);
			ProductVO productVO=new ProductVO();
			productVO.setProduct_id(rlist.getProductVO().getProduct_id());
			List<ProductFileVO> pfList=productService.getSelectProductFileList(productVO);
			par.add(pfList.get(0));
			MemberVO memberVO=new MemberVO();
			rlist.setMemberVO(memberService.getSelectUsername(rlist.getMemberVO().getMember_id()));
			
		}
		//System.out.println(rfVO.size());
		
		//mv.addObject("rfVO", rfVO);
		mv.addObject("rList", ar);
		mv.addObject("pfList", par);
		mv.setViewName("review/reviewAllAj");
		mv.addObject("pager", pager);	
		return mv; 
	}
	
	
	
	
	
}