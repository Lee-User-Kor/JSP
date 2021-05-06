package day07;

public class Book {
	// 도서이름, 저자, 출판사, 출판일자, 수량
	
	private String name, author, publisher, date;
	private int count;
	
	public Book() {}
	
	public Book(String name, String author, String publisher, String date, int count) {
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.date = date;
		this.count = count;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
