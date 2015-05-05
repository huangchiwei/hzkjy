package com.gzjr.hzkjy.util.mail;

import com.armysoft.hzkjy.base.common.Constants;

public class UpdatepMailSender extends Thread {

	private String email;
	private String userNo;
	private String pwd;

	public UpdatepMailSender(String email, String userNo, String pwd) {
		this.email = email;
		this.userNo = userNo;
		this.pwd = pwd;
	}

	@Override
	public void run() {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost(Constants.mailPros
				.getProperty("mail.serverHost"));
		mailInfo.setMailServerPort(Constants.mailPros
				.getProperty("mail.serverPort"));
		mailInfo.setValidate(true);
		mailInfo.setUserName(Constants.mailPros.getProperty("mail.userName"));
		mailInfo.setPassword(Constants.mailPros.getProperty("mail.password"));// 您的邮箱密码
		mailInfo.setFromAddress(Constants.mailPros
				.getProperty("mail.fromAddress"));
		mailInfo.setToAddress(email);
		mailInfo.setSubject("广州市海珠科技产业园信息提示"); // 邮箱标题
		// String
		// resetUrl=Constants.mailPros.getProperty("mail.resetUrl")+"userNo="+sysUser.get("UserNo").toString()+"&mailSeq="+sysUser.get("MailSeq").toString();
		mailInfo.setContent("尊敬的用户" + ",您好，"+userNo+"您的账号密码已重置,密码为888888");

		// 这个类主要来发送邮件
		SimpleMailSender sms = new SimpleMailSender();
		sms.sendTextMail(mailInfo);// 发送文体格式
		// sms.sendHtmlMail(mailInfo);//发送html格式
	}
}