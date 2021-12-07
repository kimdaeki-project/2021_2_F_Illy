package com.c.illy.util;

import java.sql.Date;

import lombok.Data;

@Data
public class Pager {
	// --------------------------------------검색창 관련 
	private String kind; //검색할때 조건 설정 
	private String search; //검색어 
	
	
	//검색창에 값이 null 이어도 예외 발생 시키지 않기 
	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return this.search;
	}
	
	// ---------------------------------------pager 관련 
	private Integer pn; //페이지 번호 
	private Integer perPage; //한페이지에 데이터 몇개씩 
	private Integer startRow; //페이지에 뿌려주는 데이터의 시작번호 
	private Long startNum; //분리된 페이지 블럭 중 한 블럭의 시작되는 페이지 번호 
	private Long lastNum; //분리된 페이지 블럭 중 한 블럭의 마지막 페이지 번호
	private boolean lastCheck; //true면 마지막 블럭 / false면 마지막 블럭x
	
	//--변수로 추가한거(분리된 페이지 블럭의 현재 번호) 리스트 맨앞으로 보내기,맨뒤로 보내기 버튼때문에 필요함
	private Long curBlock;
	private Long totalPage; //마지막 페이지번호
	
	//페이지 번호 시작 1로 설정하기 
	public Integer getPn() {
		if(this.pn==null || this.pn<1) {
			this.pn=1; 
		}
		return pn; 
	}
	
	//한페이지에 데이터 몇개씩 보여줄건지 설정하기 
	public Integer getPerPage() {
		if(this.perPage==null ||this.perPage<1) {
			//일단 5개로 설정 
			this.perPage=5;
		}
		return perPage; 
	}
	
	//한페이지에서 데이터의 시작 번호 구하기 
	public void makeRow() {
		this.startRow=(this.getPn()-1)*this.getPerPage();
	}
	
	//
	public void makeNum(Long totalCount) { //totalCount = 데이터의 총 갯수 
		//1. 전체 페이지 수 구하기 
		totalPage = totalCount/this.getPerPage();   //totalCount를 '한페이지당 뿌려줄 데이터 개수' 로 나누기
		//위에 나눈 값의 나머지가 0이 아니면 딱 나눠떨어지지 않고 남아있는 데이터가 있다는 거니까 한페이지 더 추가 
		if(totalCount%this.getPerPage() != 0) {
			totalPage++; 
		}
		
		//2.총 블럭의 갯수 구하기 (ex) 예를 들어 100개의 데이터를 한페이지에 10개씩 보여주기로 했으면 총 10페이지, 한번에 페이지 선택 탭을5개씩으로 할거면 총 블럭의 갯수는 2개)
		//----한번에 블럭 몇개씩 보여줄지 설정 하기
		//----(ex)만약에 perBlock이 5이면 위에 예시의 경우 1,2,3,4,5 페이지 번호 보여준 후 NEXT 버튼 눌러야 6,7,8,9,10 페이지 번호 보임  
		Long perBlock = 10L;   //10개씩으로 설정 
		Long totalBlock = totalPage/perBlock; 
		if(totalPage%perBlock != 0){
			totalBlock++; 
		}
		//3.pn으로 현재 블럭 번호 구하기 
		curBlock = this.getPn()/perBlock; //현재 블럭은 지금 페이지 나누기 설정된 블럭단위의 몫 
		if(this.getPn() % perBlock !=0){//현재페이지 나누기 블럭단위 한 수식의 나머지가 0이 아니면 현재 블럭번호 +1
			curBlock ++; 
		}
		//4.curBlock으로 한블럭내의 시작페이지번호와 끝페이지번호 구하기
		lastNum=curBlock*perBlock; 
		startNum =(curBlock-1)*perBlock+1;
		// 현재 블럭이 총 블럭의 번호와 같다면 lastCheck에 true를 대입해주고, 페이지의 마지막 번호를 totalPage값으로 설정해준다. 
		if(curBlock==totalBlock) {
			lastCheck=true;
			lastNum=totalPage; 
		}
		
	}
	
	
	
	
	
	
	
}
