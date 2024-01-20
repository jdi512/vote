package com.google.vote.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private String city; //시도
	private String district; //시군구(선거구)
	
	private Long id; //선거코드
	private Long code; //선거유형코드
	
		//?vno=1&id=12345678&code=
		//?vno=선거번호&id=선거코드&code=선거유형코드
	public String get() {
		UriComponentsBuilder builder 
				= UriComponentsBuilder.fromPath("")
					.queryParam("code", this.code)
					.queryParam("id", this.id);	
		return builder.toUriString();
	}
		//?vno=1&id=12345678&code=2&dno=22&dno=123&&city=땡땡도&district=땡땡시을
		//?vno=선거번호&id=선거코드&code=선거유형코드&dno=지역번호&city=지역&district=지역구
	public String result() {
		UriComponentsBuilder builder 
				= UriComponentsBuilder.fromPath("")
					.queryParam("code", this.code)
					.queryParam("id", this.id)
					.queryParam("city", this.city)
					.queryParam("district", this.district);
		
		return builder.toUriString();
	}
}
