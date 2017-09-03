package scit.master.planbe.VO;

public class ProjectVO {
	
	private int projectNo;
	private int userNo;
	private String projectName;
	private String projectContent;
	private String proejctStatus;
	private String startDate;
	private String dueDate;
	
	public ProjectVO(){}

	public ProjectVO(int projectNo, int userNo, String projectName, String projectContent, String proejctStatus,
			String startDate, String dueDate) {
		super();
		this.projectNo = projectNo;
		this.userNo = userNo;
		this.projectName = projectName;
		this.projectContent = projectContent;
		this.proejctStatus = proejctStatus;
		this.startDate = startDate;
		this.dueDate = dueDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectContent() {
		return projectContent;
	}

	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}

	public String getProejctStatus() {
		return proejctStatus;
	}

	public void setProejctStatus(String proejctStatus) {
		this.proejctStatus = proejctStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	@Override
	public String toString() {
		return "ProjectVO [projectNo=" + projectNo + ", userNo=" + userNo + ", projectName=" + projectName
				+ ", projectContent=" + projectContent + ", proejctStatus=" + proejctStatus + ", startDate=" + startDate
				+ ", dueDate=" + dueDate + "]";
	}

}
    

	

