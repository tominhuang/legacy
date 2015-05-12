import com.sun.syndication.feed.synd.*;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedOutput;
import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.output.DOMOutputter;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
 
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.*;
 
/**
* Sample Servlet that serves a feed created with Rome.
* <p>
* The feed type is determined by the 'type' request parameter, if the parameter is missing it defaults
* to the 'default.feed.type' servlet init parameter, if the init parameter is missing it defaults to 'atom_0.3'
* <p>
* @author Alejandro Abdelnur
*
*/
public class rss2 extends HttpServlet {
 
    private static final String DEFAULT_FEED_TYPE = "default.feed.type";
    private static final String FEED_TYPE = "type";
    private static final String MIME_TYPE = "text/html; charset=big5";//設置輸出的type
    private static final String COULD_NOT_GENERATE_FEED_ERROR = "Could not generate feed";
 
    //private static final String DATE_FORMAT = "yyyy-MM-dd";
 
    private String _defaultFeedType;
 
    public void init() {
        _defaultFeedType = getServletConfig().getInitParameter(DEFAULT_FEED_TYPE);
        _defaultFeedType = (_defaultFeedType!=null) ? _defaultFeedType : "rss_2.0";
    }
 
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
				
        try {
			String username = (String)req.getParameter("user");
            SyndFeed feed = getFeed(req, username);	
			ServletContext con= this.getServletContext(); 			
 
            String feedType = req.getParameter(FEED_TYPE);
            feedType = (feedType!=null) ? feedType : _defaultFeedType;
            feed.setFeedType(feedType);
			feed.setEncoding("big5"); 
            res.setContentType(MIME_TYPE);			
			res.setCharacterEncoding("big5");
			SyndFeedOutput output = new SyndFeedOutput();

			//xml文件路徑
			//String path=req.getRealPath("/"); //API Deprecated.
			String path=con.getRealPath("");
			path = path+"\\rss\\"+username+".xml";			
			Writer writer = new FileWriter(path);
			
			output.output(feed,writer);
			writer.close();
			
			
			PrintWriter out = res.getWriter();
			output.output(feed,out);
			//res.sendRedirect("./rss/"+username+".xml");
			
		    }
        catch (FeedException ex) {
            String msg = COULD_NOT_GENERATE_FEED_ERROR;
            log(msg,ex);
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,msg);
        }	
		
    }
 
    protected SyndFeed getFeed(HttpServletRequest req, String username) throws IOException,FeedException,ServletException {
        //DateFormat dateParser = new SimpleDateFormat(DATE_FORMAT);
 		//String username = (String)req.getParameter("user");
		//System.out.println("hello"+username);
        SyndFeed feed = new SyndFeedImpl();
		//關於feed 的描述
        feed.setTitle("Ziqi Boya - " + username);
        feed.setLink("http://140.119.19.130:8080/ziqiboya/");
        feed.setDescription("歡迎使用Ziqi Boya！");
 
        List entries = new ArrayList();
        SyndEntry entry;//文字連結
		//SyndImage image;//圖片
        SyndContent description;
 
		///////////從資料庫捉資料
		try{
			req.setCharacterEncoding("big5");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://140.119.19.130:3306/ziqiboya?user=ziqi&password=boya2007");
			
			Statement stmt = con.createStatement();			
			String sql = "select s.song_id,title,artist,album,username,last_played from played_song p join song s on s.song_id=p.song_id join user u on u.user_id=s.user_id where p.user_id=(select user_id from user where username='" + username +"')  order by last_played desc limit 20 ";    
			ResultSet rs = stmt.executeQuery(sql);
    
			while(rs.next()){

		        entry = new SyndEntryImpl();
		        entry.setTitle(rs.getString(3)+" - "+rs.getString(2));
		        entry.setLink("http://140.119.19.130:8080/ziqiboya/song/info.do?s="+rs.getString(1));
		        //entry.setPublishedDate(rs.getDate(6));
				
		        //description = new SyndContentImpl();
		        //description.setType("text/plain");
		        //description.setValue("");//可以放comment
		        //entry.setDescription(description);
		        entries.add(entry);
				
				/*******   圖片放不進list Q_Q   *******
				image = new SyndImageImpl();
			        image.setTitle(rs.getString(3)+" - "+rs.getString(2));
			        image.setLink("http://140.119.19.130:8080/ziqiboya/song/info.do?s="+rs.getString(1));
			        image.setUrl("http://140.119.19.130:8080/ziqiboya/user/"+rs.getString(5)+"/cover/c"+rs.getString(1)+"_75.jpg");
				entries.add(image);
				************************************/
			}
			rs.close();	
			stmt.close();
			con.close();
			

			}catch (ClassNotFoundException e) {
					 throw new UnavailableException("不能載入驅動程式");
			}catch (SQLException e) {
					   throw new UnavailableException("資料庫連線失敗");
			}catch (Exception e) {
					  System.out.println("發生了" + e + "例外");
		}				
		//////////////////
      
 
        feed.setEntries(entries);
 
        return feed;
    }
 
 
}