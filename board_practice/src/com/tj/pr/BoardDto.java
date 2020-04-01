package com.tj.pr;

public class BoardDto {
	private int 	num;
	private int 	ref;
	private int 	re_step;
	private int 	re_level;
	private String 	writer;
	private String 	pw;
	private String 	content;
	private int 	hit;
	private String 	ip;
	public BoardDto() {}
	public BoardDto(int num, int ref, int re_step, int re_level, String writer, String pw, String content, int hit,
			String ip) {
		this.num = num;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.writer = writer;
		this.pw = pw;
		this.content = content;
		this.hit = hit;
		this.ip = ip;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "Boarddto [num=" + num + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level + ", writer="
				+ writer + ", pw=" + pw + ", content=" + content + ", hit=" + hit + ", ip=" + ip + "]";
	}
	
	
}
