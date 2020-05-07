package daily.client.member.service;

import javax.servlet.http.HttpServletRequest;

public interface MailService {
	
	public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request);


}	
