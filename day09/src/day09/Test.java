package day09;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		
		System.out.println("version : " + System.getProperty("java.version"));
		// 자바 버전이 1.8 이상인 경우 람다식을 사용하여 함수형 인터페이스 객체를 생성할 수 있다
		
		Runnable in1 = () -> {System.out.println("Hello");};
		new Thread(in1).start();	// 람다식 객체생성이 잘 작동하는가 확인
		
		String[] arr = {"리모컨", "커피", "오메가3"};		// 배열
		List<String> list = Arrays.asList(arr);		// 배열 -> 리스트
		
		list.forEach((element) -> {
			System.out.println(element);
		});
		list.forEach( element -> System.out.println(element) );
		list.forEach( System.out::println );
		System.out.println();
		
		for(String element : list) {
			System.out.println(element);
		}System.out.println();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rc", "리모컨");
		map.put("coffee", "커피");
		map.put("omega3", "오메가3");
		
		map.forEach((key, value) -> {
			System.out.println(key + " : " + value);
		});
		
		
		
		
		
	}
}
