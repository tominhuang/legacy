package gis.taiwan.mail;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;



/**
 * 
 * @author tomin
 *
 */
public class Mail extends Action {

	private static final String MAIL_CONFIG_BUNDLE_NAME = "mailconfig.mail";
	
	/**
	 * @param args
	 * @throws MessagingException 
	 * @throws AddressException 
	 * @throws IOException 
	 * @throws SQLException 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException, SQLException {

		
				return null;
	}

	

	
	public void SimpleMail(String to, String subject, String messageText) throws AddressException, MessagingException, IOException, SQLException {

		
		// 從mail.properties檔中取得設定
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle(MAIL_CONFIG_BUNDLE_NAME);
	    String mailserver = bundle.getString("mailserver");	
		String From         = bundle.getString("From");
		String loginid      = bundle.getString("loginid");
		String loginpw      = bundle.getString("loginpw");
		
		InternetAddress[] address = null;	
		
		//********************************* SMTP必要的設定  **********************// 
	    boolean sessionDebug = false;

	    // 設定所要用的Mail 伺服器和所使用的傳送協定
        java.util.Properties props = System.getProperties();
	    props.put("mail.host",mailserver);
		props.put("mail.transport.protocol","smtp");
		//採用SSL
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");    
		props.put("mail.smtp.auth","true");
 
		// 產生新的Session 服務
		javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props,null);
		mailSession.setDebug(sessionDebug);
		
		Message msg = new MimeMessage(mailSession);

		// 設定傳送郵件的發信人
		msg.setFrom(new InternetAddress(From));
		  
		// 設定傳送郵件至收信人的信箱
		address = InternetAddress.parse(to,false);
		msg.setRecipients(Message.RecipientType.TO, address);
			  
		// 設定信中的主題
		String subject2 = javax.mail.internet.MimeUtility.encodeText(subject,"UTF-8", null);
		msg.setSubject(subject2);
		
		// 設定送信的時間
		msg.setSentDate(new Date());
		
		//設定傳送信的MIME Type		
        Multipart mp = new MimeMultipart();
	    MimeBodyPart mbp = new MimeBodyPart();
	    
	    //設定郵件內容的型態
	    msg.setHeader("Content-Transfer-Encoding","utf-8");
	    mbp.setContent(messageText,"text/plain;charset=UTF-8");//設定郵件內容的型態為 text/plain			

	    
	    mp.addBodyPart(mbp);
	    msg.setContent(mp);

	    // 送信(不想寄就把這邊mark掉就好了)
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(mailserver, loginid, loginpw);		
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();
		
	}
	
	
	
	
	
}	