package day15quiz;

public class Book {
	
	private String name;
	private String writer;
	private String publisher;
	private String writtenDate;
	private int count;
	
	public String getName() {
		return name;
	}
	public String getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(String writtendate) {
		this.writtenDate = writtendate;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
