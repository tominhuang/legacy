<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page contentType="text/html;charset=MS950" %>

<html>
<head>
  <title>CH18 - JavaMail2.jsp</title>
</head>
<body>

<h2>利用JavaMail來傳送電子郵件 - 附加檔案</h2>

<%
	InternetAddress[] address = null;
	
	request.setCharacterEncoding("MS950");
	MultipartRequest multi = new MultipartRequest(request , "." , 5*1024*1024 , "MS950");

	String mailserver   = "nccu.edu.tw";
	String From         = multi.getParameter("From");
	String to           = multi.getParameter("To");
	String Subject      = multi.getParameter("Subject");
	String type	    = multi.getParameter("Type");
	String messageText  = multi.getParameter("Message");
	String FileName     = multi.getFilesystemName("FileName");
	
  	boolean sessionDebug = false;

	try {

  		// 設定所要用的Mail 伺服器和所使用的傳送協定
  		java.util.Properties props = System.getProperties();
 
  		props.put("mail.host",mailserver);
  		props.put("mail.transport.protocol","smtp");
  
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
  		msg.setSubject(Subject);
  
  		// 設定送信的時間
  		msg.setSentDate(new Date());

  		if (FileName != null)
  		{
    	  		File file = new File(FileName);	
              
	  		// 如果有附加檔案時，先將郵件內容部份先存起來
          		MimeBodyPart mbp1 = new MimeBodyPart();
	      
 	  		// 設定郵件內容的型態為 text/plain 或 text/html
  			mbp1.setContent(messageText, type + ";charset=MS950");

          		// 再來對檔案作處理
          		MimeBodyPart mbp2 = new MimeBodyPart();
          		FileDataSource fds = new FileDataSource(FileName);
          		mbp2.setDataHandler(new DataHandler(fds));
          		mbp2.setFileName(MimeUtility.encodeText(fds.getName(), "MS950", "B"));

          		// 最後再將二者整合起來，當作一份郵件送出
          		Multipart mp = new MimeMultipart();
          		mp.addBodyPart(mbp1);
          		mp.addBodyPart(mbp2);
          		msg.setContent(mp);
   		}
   		else
   		{
          		// 若沒有檔案時，就直接存郵件內容          
         		 msg.setContent(messageText,type + ";charset=MS950");
   		}

  		Transport.send(msg);
		out.println("郵件己順利傳送");
	
	}
    	catch (MessagingException mex) 
    	{
		mex.printStackTrace();
	}
%>

</body>
</html>