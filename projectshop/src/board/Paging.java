package board;

import java.util.Scanner;

public class Paging {

	private final int perpage = 15;

	private int pageCount;
	private int boardCount;
	private int offset;
	private int page;
	
	private final int perSection = 10;
	private int begin;
	private int end;
	private int section;
	
	private boolean prev;
	private boolean next;
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	


	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPerpage() {
		return perpage;
	}

	public int getPerSection() {
		return perSection;
	}
	
	public Paging(int page, int boardCount) {           // 요청받은 페이지 번호와 총 게시글 수를 전달받는다
		this.page = page;
		this.boardCount = boardCount;
		pageCount = boardCount / perpage;				// 총 페이지의 수
		pageCount += (boardCount % perpage == 0) ? 0 : 1;   // 나머지가 있으면 +1
 		
		offset = (page - 1) * perpage;				// 건너뛸 게시글의 개수
//		last = first + perpage - 1;						// 마지막 글
		
		section = (page - 1) / 10;					    // 현재 페이지가 속하는 페이징 번호의 섹션(1~10, 11~20)
		begin = 10 * section + 1;						// 11, 21, 31...
		end = begin + perSection - 1;					// 20, 30, 40
		end = end > pageCount ? pageCount : end;		// 만약 총 페이지 수가 부족하면 마지막 페이지까지만 (ex.38)
		
		prev = section != 0;							// 현재 섹션이 0번 섹션이면 이전 페이지는 존재하지 않는다
		next = boardCount > perpage * end;				// 총 게시글이 현재 마지막 섹션 수 * 화면당 게시글 수와 비교하여 적으면 다음이 없다
	}
	
	public static void main(String[] aegs) {
		
		final int perpage = 10;
		int pageCount = 0;
		int boardCount = 44;
		int first;
		int last;
		int page;
		
		Scanner sc = new Scanner(System.in);
		System.out.print("페이지 번호 입력 : ");
		page = sc.nextInt();
		
		// 페이지 번호와 총 게시글 수가 주어질 때, first와 last를 구하여 출력할 수 있도록 코드를 작성해보세요
		pageCount = boardCount / perpage;
		pageCount += (boardCount % perpage == 0) ? 0 : 1;
		first = (page - 1) * perpage + 1;
		last = first + perpage - 1;
		last = last < boardCount ? last : boardCount;
		
		System.out.println("현재 페이지 : " + page);
		System.out.println("총 게시글 수 :" + boardCount);
		System.out.println("총 페이지 수 : " + pageCount);
		System.out.println("첫 글 번호 : " + first);
		System.out.println("마지막 글 번호 : " + last);
		
		sc.close();
	}
}














