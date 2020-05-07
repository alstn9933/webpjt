package photo.model.vo;

import java.sql.Date;

public class Photo {
	private int photoNo;
	private String photoWriter;
	private String photoContent;
	private String photoFilename;
	private String photoFilepath;
	private Date photoDate;
	private int photoReadcount;
	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Photo(int photoNo, String photoWriter, String photoContent, String photoFilename, String photoFilepath,
			Date photoDate, int photoReadcount) {
		super();
		this.photoNo = photoNo;
		this.photoWriter = photoWriter;
		this.photoContent = photoContent;
		this.photoFilename = photoFilename;
		this.photoFilepath = photoFilepath;
		this.photoDate = photoDate;
		this.photoReadcount = photoReadcount;
	}
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public String getPhotoWriter() {
		return photoWriter;
	}
	public void setPhotoWriter(String photoWriter) {
		this.photoWriter = photoWriter;
	}
	public String getPhotoContent() {
		return photoContent;
	}
	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}
	public String getPhotoFilename() {
		return photoFilename;
	}
	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}
	public String getPhotoFilepath() {
		return photoFilepath;
	}
	public void setPhotoFilepath(String photoFilepath) {
		this.photoFilepath = photoFilepath;
	}
	public Date getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}
	public int getPhotoReadcount() {
		return photoReadcount;
	}
	public void setPhotoReadcount(int photoReadcount) {
		this.photoReadcount = photoReadcount;
	}
}
