package gis.taiwan.mail;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class SimgleMailTest {

	/**
	 * @param args
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	public static void main(String[] args) throws AddressException, MessagingException, IOException, SQLException {
		
		String words = "This is an auto-generated letter from Global Initiatives Symposium in Taiwan 2009 (GIS Taiwan 2009).\n\n"
			+ "Your PIN is <font size=\"+5\">" + "333" + "</font>.\n"
			   + "Word count and PIN should be disclosed at the beginning of first page, in the upper left-hand corner. EX: Word count: 1,899/PIN: 10001.\n\n"
			   + "If you've registered for GIS Taiwan, please click the hyperlink below to finish the registration:\n"
			   + "" + "validate.do?key=" + ""
			   + "\n\n\n\n"
			   + "If not, just ingore this letter.\n\n"
			   + "--\n"
			   + "Please do not reply this letter.\n"
			   + "GIS Taiwan: " + "";
		
		Mail test = new Mail();
		
		
		test.SimpleMail("noking@gmail.com", "嗨", words);
		//test.SimpleMail("noking@gmail.com", "嗨", "簡單的測試！<br/>^_^");		
		//test.SimpleMailFile("noking@gmail.com", "嗨嗨", "DoubleEgg.html");
		
		
		
		//new Mail().SimpleMail("noking@gmail.com", "標題", "我是內容");
		for(int i=0;i<2;i++){
			//new Mail().SimpleMailFile("noking@gmail.com", "你的信箱夠大嗎？！", "DoubleEgg.html");
		}
	}

}
