package day12;

public class Human implements Comparable<Human> {	// 자체적으로 정렬할 수 있는 기준을 정한다
	
	private String name;
	private int age;
	
	public Human() {}
	public Human(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	@Override
	public int compareTo(Human o) {	// 다른 Human 객체가 비교대상으로 전달되었을 때
		return this.age - o.age;	// 자신의 age와 다른 객체의 age를 비교하도록 한다
	}
	
	@Override
	public String toString() {
		return String.format("%s : %d", name, age);
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
