package com.ph4.s1.store.product.review;

public class ReviewPager {
	
	//***** 검색
	private String kind;
	private String search;
	
	
	private Integer curPage;
	
	private int startRow;
	private int lastRow;
	
	private int perPage;
	
	private long product_num;
	
	
	//JSP에서 사용
	private long startNum;
	private long lastNum;
	private boolean beforeCheck;
	private boolean nextCheck;
	
	
	
	private long totalCount;
	
	public ReviewPager() {
		this.perPage=10;
	}
	
	
	//****** startRow, lastRow 계산 하는 메서드
	public void makeRow() {
		

		//startRow
		startRow = (this.getCurPage()-1)*this.getPerPage()+1;
		//lastRow
		lastRow = this.getCurPage()*this.getPerPage();
		//********************************
		
	}
	
	//***** 페이징 계산 *****
	public void makePage() {
		//2. 전체 페이지의 갯수
		long totalPage = this.getTotalCount()/10;//112
		if(this.getTotalCount()%10 != 0) {
			totalPage++;
		}
		
		//3. 전체 블럭의 갯수 구하기
		long totalBlock = totalPage/5;
		if(totalPage%5 !=0) {
			totalBlock++;
		}
		//4. curPage를 이용해서 현재 블럭 번호 찾기
		long curBlock = this.getCurPage()/5;
		if(this.getCurPage()%5 !=0) {
			curBlock++;
		}
		
		//5. 현재블럭번호로 시작번호 끝 번호 계산
		this.startNum = (curBlock-1)*5+1;
		this.lastNum = curBlock*5;
		
		//6. 현재블럭번호와 전체블럭번호가 같은지 결정
		this.nextCheck=true;
		if(curBlock == totalBlock) {
			nextCheck = !nextCheck;
			//현재 블럭이 마지막 블럭이라면 lastNum 수정
			lastNum = totalPage;
		}
		
		beforeCheck = true;
		if(curBlock == 1) {
			beforeCheck = !beforeCheck;
		}
	}
	
	
	//*** setter, getter
	
	
	
	
	public long getStartNum() {
		return startNum;
	}


	public long getProduct_num() {
		return product_num;
	}


	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}


	public String getKind() {

		return kind;
	}


	public void setKind(String kind) {
		this.kind = kind;
	}


	public String getSearch() {
		if(search == null) {
			search = "";
		}
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}


	public long getLastNum() {
		return lastNum;
	}


	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}


	public boolean isBeforeCheck() {
		return beforeCheck;
	}


	public void setBeforeCheck(boolean beforeCheck) {
		this.beforeCheck = beforeCheck;
	}


	public boolean isNextCheck() {
		return nextCheck;
	}


	public void setNextCheck(boolean nextCheck) {
		this.nextCheck = nextCheck;
	}


	public int getPerPage() {
		return perPage;
	}


	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}


	public int getCurPage() {
		if(curPage==null) {
			curPage=1;
		}
		return curPage;
	}



	public void setCurPage(Integer curPage) {
		if(curPage == null) {
			curPage=1;
		}
		this.curPage = curPage;
	}



	public long getTotalCount() {
		if(this.totalCount==0) {
			this.totalCount=1;
		}
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	
	

}
