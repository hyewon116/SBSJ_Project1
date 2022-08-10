package kr.co.sbsj.util.dto;

public class SearchDTO {

	private String searchOption;
	private String searchWord;
	private int limitNum;
	private String md_id;
	
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
	
}//class
