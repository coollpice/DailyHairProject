package daily.admin.bi.vo;


public class AdminBiVO {

	private String rest_hairdate; //날짜
	private int rest_totalprice; //매출액
	private String fromDate;
	private String toDate;
	
	private int minDate;
	
	
	
	public int getMinDate() {
		return minDate;
	}
	public void setMinDate(int minDate) {
		this.minDate = minDate;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getRest_hairdate() {
		return rest_hairdate;
	}
	public void setRest_hairdate(String rest_hairdate) {
		this.rest_hairdate = rest_hairdate;
	}
	public int getRest_totalprice() {
		return rest_totalprice;
	}
	public void setRest_totalprice(int rest_totalprice) {
		this.rest_totalprice = rest_totalprice;
	}

	
	
	
}
