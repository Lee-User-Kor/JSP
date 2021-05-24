package day18;

public class ImageDTO {
//	TABLE : IMAGE
//	idx                 number          primary key,
//  originalFileName    varchar2(255)   not null,
//  storedFileName      VARCHAR2(255)   not null
	
	private int idx;
	private String originalFileName, storedFileName;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
}
