package kr.co.sbsj.cs;

public class QnaDTO {
	private String qa_question_id;
	private String qa_question_title;
	private String member_id;
	private String member_nick;
	private String member_email;
	private String qa_question_content;
	private String qa_question_viewcnt;
	private String qa_question_date;
	private String open_yn;
	private String qa_question_category;
	
    //계층형 게시판을 위한 추가 필드 : originNo[원글 번호], groupOr[원글(답글포함)에 대한 순서], groupLayer[답글 계층] 
    private int originNo;
    private int groupOrd;
    private int groupLayer;
    
	public String getQa_question_id() {
		return qa_question_id;
	}
	public void setQa_question_id(String qa_question_id) {
		this.qa_question_id = qa_question_id;
	}
	public String getQa_question_title() {
		return qa_question_title;
	}
	public void setQa_question_title(String qa_question_title) {
		this.qa_question_title = qa_question_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getQa_question_content() {
		return qa_question_content;
	}
	public void setQa_question_content(String qa_question_content) {
		this.qa_question_content = qa_question_content;
	}
	public String getQa_question_viewcnt() {
		return qa_question_viewcnt;
	}
	public void setQa_question_viewcnt(String qa_question_viewcnt) {
		this.qa_question_viewcnt = qa_question_viewcnt;
	}
	public String getQa_question_date() {
		return qa_question_date;
	}
	public void setQa_question_date(String qa_question_date) {
		this.qa_question_date = qa_question_date;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
	public String getQa_question_category() {
		return qa_question_category;
	}
	public void setQa_question_category(String qa_question_category) {
		this.qa_question_category = qa_question_category;
	}
	public int getOriginNo() {
		return originNo;
	}
	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}
	public int getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}
	public int getGroupLayer() {
		return groupLayer;
	}
	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}
    
	
	
	
}
