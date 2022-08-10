package kr.co.sbsj.util.dto;

public class Naver_MemberDTO {

	private String name;
	private String nickname;
	private String email;
	private String mobile;
	private String birthyear;
	private String join_naver;
	
	public String toString() {
		return name + " : " + nickname + " : " + email + " : " + mobile + " : " + birthyear + " : " + join_naver;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getBirthyear() {
		return birthyear;
	}

	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}

	public String getJoin_naver() {
		return join_naver;
	}

	public void setJoin_naver(String join_naver) {
		this.join_naver = join_naver;
	}
	
	
	
	
	

}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
