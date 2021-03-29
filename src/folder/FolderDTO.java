package folder;

public class FolderDTO {

	private String ID;
	private String folderType;
	private String main_cate;
	private String itemCode;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getFolderType() {
		return folderType;
	}

	public void setFolderType(String folderType) {
		this.folderType = folderType;
	}

	public String getCate() {
		return main_cate;
	}

	public void setCate(String main_cate) {
		this.main_cate = main_cate;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

}
