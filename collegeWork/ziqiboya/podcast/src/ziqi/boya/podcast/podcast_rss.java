package ziqi.boya.podcast;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;

import com.sun.syndication.feed.rss.Enclosure;
import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEnclosure;
import com.sun.syndication.feed.synd.SyndEnclosureImpl;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndFeedImpl;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SAXBuilder;
import com.sun.syndication.io.SyndFeedOutput;
 
/**
* Sample Servlet that serves a feed created with Rome.
* <p>
* The feed type is determined by the 'type' request parameter, if the parameter is missing it defaults
* to the 'default.feed.type' servlet init parameter, if the init parameter is missing it defaults to 'atom_0.3'
* <p>
* @author Alejandro Abdelnur
*
*/
public class podcast_rss extends HttpServlet {
 

	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_FEED_TYPE = "default.feed.type";
    private static final String FEED_TYPE = "type";
    private static final String MIME_TYPE = "text/html; charset=utf-8";//設置輸出的type
    private static final String COULD_NOT_GENERATE_FEED_ERROR = "Could not generate feed";
    
     
    private String _defaultFeedType;
 
    public void init() {
        _defaultFeedType = getServletConfig().getInitParameter(DEFAULT_FEED_TYPE);
        _defaultFeedType = (_defaultFeedType!=null) ? _defaultFeedType : "rss_2.0";
    }
 
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
				
        try {        	
			String username = (String)req.getParameter("user");
			String feedType = req.getParameter(FEED_TYPE);
            feedType = (feedType!=null) ? feedType : _defaultFeedType;
            
            //列印設定
            res.setContentType(MIME_TYPE);			
			res.setCharacterEncoding("utf-8");            
            PrintWriter out = res.getWriter();
            
            //取得feed!!
            SyndFeed feed = getFeed(req, res, username);
            
//			if(feed==null)out.print("null");
//			else out.print("not null");
			
            //設定feed
            feed.setFeedType(feedType);
			feed.setEncoding("utf-8"); 

			
			//輸出feed
			SyndFeedOutput output = new SyndFeedOutput();

			//xml文件路徑
			//輸出成檔案
/*			ServletContext con= this.getServletContext(); 
			String path=con.getRealPath("");
			path = path+"\\rss\\"+username+".xml";			
			Writer writer = new FileWriter(path);
			
			output.output(feed,writer);
			writer.close();*/
			
			
			//直接印出來						
			//out.print(feed);
			output.output(feed,out);
			//res.sendRedirect("./rss/"+username+".xml");
			
		    }
        catch (FeedException ex) {
            String msg = COULD_NOT_GENERATE_FEED_ERROR;
            log(msg,ex);
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,msg);
        } catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
    }
 
    protected SyndFeed getFeed(HttpServletRequest req, HttpServletResponse res, String username) throws IOException,FeedException,ServletException, JDOMException {
                
        SyndFeed feed = new SyndFeedImpl();
        //PrintWriter out = res.getWriter();
		//從path.properties檔中取得使用者根目錄
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle("path");
	    String site_url = bundle.getString("site-url");//來源是- 變數是_        
	    String podcast = bundle.getString("podcast");
	    String podcast_mp3 = bundle.getString("podcast_mp3");
	    
		//關於feed 的描述
		feed.setTitle("Ziqi Boya - "+ username + " - Podcast");
        feed.setLink(site_url);
        feed.setDescription("歡迎使用Ziqi Boya Podcast！");
 
	  	String path=podcast+username+"/"+username+".xml";
		FileInputStream fi = new FileInputStream(path);		

		SAXBuilder sb = new SAXBuilder(false);
		Document doc = sb.build(fi);
		Element root = doc.getRootElement(); // 得到根元素
		Element trackListEl = root.getChild("trackList"); // 得到根元素的trackList節點
		List trackEls = trackListEl.getChildren();// 得到trackList的所有track子元素
		Element track = null;// 用來放舊的track元素

		
        List<SyndEntry> entries = new ArrayList<SyndEntry>();//放很多資料的陣列

        
        for (int i = 0; i < trackEls.size(); i++) {// 走訪所有track
        	
            SyndEntry entry = new SyndEntryImpl();            
            SyndContent description = new SyndContentImpl();        	
        	track = (Element) trackEls.get(i); // 得到該元素
        	
	        entry.setTitle(track.getChild("title").getText());
	        entry.setLink(podcast_mp3+username+"/source/"+track.getChild("title").getText());
	        description.setType("text/plain");
	        description.setValue("");//可以放comment
	        entry.setDescription(description);

	        
	        List<SyndEnclosure> lstEnc = new Vector<SyndEnclosure> ();
	        SyndEnclosure enc = new SyndEnclosureImpl();
	        enc.setUrl(podcast_mp3+username+"/source/"+track.getChild("title").getText());
	        enc.setType("audio/mpeg");
	        enc.setLength(trackEls.size());
	        
	        lstEnc.add(enc);
	        entry.setEnclosures(lstEnc);
	        
	        //out.print(enc+"1234<br/>");
	        //out.print(lstEnc+"<br/>");
	        
	        entries.add(entry);	
		
	    }		
        
        //out.print(entries);

        feed.setEntries(entries);
 
        return feed;
    }
 
 
}