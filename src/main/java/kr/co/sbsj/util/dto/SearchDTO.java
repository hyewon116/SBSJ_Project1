package kr.co.sbsj.util.dto;

public class SearchDTO {

	private String searchOption;
	private String searchWord;
	private int limitNum;
	private String md_id;
	private String md_category;
	private String md_sweet;
	private String md_sour;
	private String md_sparkling;
	private String md_use;
	private double md_ratingAvg;
	private String member_id;
	private String member_name;
	
	private String searchOption1;
	private String searchWord1;
	
	private String order_id;
	private String order_status;
	
	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return searchOption + " : " + searchWord;
	}
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	public String getMd_id() {
		return md_id;
	}
	public void setMd_id(String md_id) {
		this.md_id = md_id;
	}
	public String getMd_category() {
		return md_category;
	}
	public void setMd_category(String md_category) {
		this.md_category = md_category;
	}
	public String getMd_sweet() {
		return md_sweet;
	}
	public void setMd_sweet(String md_sweet) {
		this.md_sweet = md_sweet;
	}
	public String getMd_sour() {
		return md_sour;
	}
	public void setMd_sour(String md_sour) {
		this.md_sour = md_sour;
	}
	public String getMd_sparkling() {
		return md_sparkling;
	}
	public void setMd_sparkling(String md_sparkling) {
		this.md_sparkling = md_sparkling;
	}
	public String getMd_use() {
		return md_use;
	}
	public void setMd_use(String md_use) {
		this.md_use = md_use;
	}
	public double getMd_ratingAvg() {
		return md_ratingAvg;
	}
	public void setMd_ratingAvg(double md_ratingAvg) {
		this.md_ratingAvg = md_ratingAvg;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setSearchOption1(String searchOption1) {
		this.searchOption1 = searchOption1;
	}

	public String getSearchOption1() {
		return searchOption1;
	}
	
	public void setSearchWord1(String searchWord1) {
		this.searchWord1 = searchWord1;
	}


	public String getSearchWord1() {
		return searchWord1;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	
	
	
}//class
