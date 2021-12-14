package com.c.illy.wish;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.illy.cart.CartProductVO;
import com.c.illy.cart.CartService;
import com.c.illy.cart.CartVO;
import com.c.illy.member.MemberVO;
import com.c.illy.util.Pager;

@Controller
@RequestMapping("/wish/**")
public class WishController {

	@Autowired
	private WishService wishService;
	@Autowired
	private CartService cartService;
	
	//찜하기
	@RequestMapping("wishInsert")
	@ResponseBody
	public String wishInsert(HttpServletRequest request, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		

		WishVO wishVO = new WishVO();
		
		String [] wish = request.getParameterValues("delArray");
		
		System.out.println(wish.length);
		for(int i=0; i<wish.length;i+=2) {
			wishVO.setProduct_id(Integer.parseInt(wish[i]));
			wishVO.setWish_cnt(Integer.parseInt(wish[i+1]));

			if(wishVO.getMember_id() == null) {
				wishVO.setMember_id(memberVO.getMember_id());
			}
			
			int result = wishService.setWish(wishVO);
		}
		
		return "/member/myPage/myWishList";
	}
	
	//수량변경
	@GetMapping("cntUpdate")
	public String setCnt(WishVO wishVO, Model model, @AuthenticationPrincipal MemberVO memberVO, Pager pager) throws Exception {
		int result = wishService.setCnt(wishVO); //수량변경
		
		List<WishVO> list = wishService.getWishList(pager, memberVO);
		
		model.addAttribute("list", list);
		return "member/myWishList/myWishListAjax";
		
	}
	
	//선택상품삭제하기 버튼
	@GetMapping("setDeleteMany")
	public String setDelete(HttpServletRequest request, Model model, @AuthenticationPrincipal MemberVO memberVO, Pager pager) throws Exception {
		String [] wish_id = request.getParameterValues("delArray");
		
		for(int i=0; i<wish_id.length;i++) {
			WishVO wishVO = new WishVO();
			wishVO.setWish_id(Integer.parseInt(wish_id[i]));
			int result = wishService.setDelete(wishVO);
		}
		
		List<WishVO> list = wishService.getWishList(pager, memberVO);
		
		model.addAttribute("list", list);
		return "member/myWishList/myWishListAjax";
	}
	
	//장바구니 버튼
	@GetMapping("setCartOne")
	public String setCartOne(HttpServletRequest request, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		
		String [] list = request.getParameterValues("delArray");
		CartVO cartVO = new CartVO();
		WishVO wishVO = new WishVO();
		for(int i=0; i<list.length;i+=4) {
			cartVO.setMember_id(Integer.parseInt(list[i]));
			cartVO.setCart_cnt(Integer.parseInt(list[i+1]));
			cartVO.setProduct_id(Integer.parseInt(list[i+2]));
			int result = cartService.setCart(cartVO, memberVO); //장바구니에 상품 넣기
			wishVO.setWish_id(Integer.parseInt(list[i+3]));
			result = wishService.setDelete(wishVO); //장바구니에 넣은 상품 찜리스트에서 삭제하기
		}
		
		return "member/myWishList/myWishListAjax";
	}
}
