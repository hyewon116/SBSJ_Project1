package kr.co.sbsj.util.dto;

public class Kakao_MemberDTO {

	private String nickname;
	private String email;
	private String age_range;
	private String join_kakao;
	
	
	public String toString() {
		return nickname + " : " + email + " : " + age_range + " : " + join_kakao;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAge_range() {
		return age_range;
	}


	public void setAge_range(String age_range) {
		this.age_range = age_range;
	}


	public String getJoin_kakao() {
		return join_kakao;
	}


	public void setJoin_kakao(String join_kakao) {
		this.join_kakao = join_kakao;
	}
	
	
	


	
	

}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
