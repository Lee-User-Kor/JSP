package day03;

public class Member {
	// 자바 빈즈 : JSP에서 복잡하고 반복되는 로직을 생략하고 자동화하기 위해 만든 클래스
	// 일반적으로  private 멤버필드와 public getter/setter를 가지고
	// 반드시 기본생성자를 포함해야 한다
	
	private String id, pw, name, gender;
	private int age;
	
	@Override
	public String toString() {
		String format = ""
				+ "<ul>"
				+ "<li>%s</li>"
				+ "<li>%s</li>"
				+ "<li>%s</li>"
				+ "<li>%s</li>"
				+ "<li>%s</li>"
				+ "</ul>";
		return String.format(format, id, "********", name, age, gender);
	}
	
	// 생성자를 작성하지 않으면, 자바 가상머신이 (매개변수를 받지않는) 기본 생성자를 만들어준다
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
}
