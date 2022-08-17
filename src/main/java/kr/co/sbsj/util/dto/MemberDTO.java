package kr.co.sbsj.util.dto;

public class MemberDTO {

	private String member_id;
	private String member_name;
	private String member_email;
	private String member_pwd;
	private String member_nick;
	private String member_phone;
	
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
	private String member_joindate;
	
	private String email_agree;
	private String sms_agree;
	private String subs_yn;
	private String admin_yn;
	
	private String join_naver;
	private String join_kakao;
	
	public String toString() {
		return member_id+ ":"+member_name + " : " + member_email + " : " + member_pwd + " : " + member_nick + " : " + member_phone + " : " + member_addr1 + " : " + member_addr2 + " : " + member_addr3 + " : " + email_agree + " : " + sms_agree;
	}
	
	
	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_addr1() {
		return member_addr1;
	}
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public String getMember_addr3() {
		return member_addr3;
	}
	public void setMember_addr3(String member_addr3) {
		this.member_addr3 = member_addr3;
	}
	public String getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}
	public String getEmail_agree() {
		return email_agree;
	}
	public void setEmail_agree(String email_agree) {
		this.email_agree = email_agree;
	}
	public String getSms_agree() {
		return sms_agree;
	}
	public void setSms_agree(String sms_agree) {
		this.sms_agree = sms_agree;
	}
	public String getSubs_yn() {
		return subs_yn;
	}
	public void setSubs_yn(String subs_yn) {
		this.subs_yn = subs_yn;
	}
	public String getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}


	public String getJoin_naver() {
		return join_naver;
	}


	public void setJoin_naver(String join_naver) {
		this.join_naver = join_naver;
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
