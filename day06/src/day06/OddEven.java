package day06;

public class OddEven {
	public static void main(String[] args) {
		
		// 1부터 10까지의 정수를 한줄씩 출력하세요
		for(int i = 1; i <= 10; i++) {
			if(i % 2 == 0) {
				System.out.println(i + " : 짝수");
			}else {
				System.out.println(i + " : 홀수");
			}
		}
	}
}
