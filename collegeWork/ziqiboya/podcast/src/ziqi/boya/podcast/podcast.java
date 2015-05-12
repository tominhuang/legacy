package ziqi.boya.podcast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;


public class podcast extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public  final void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{	
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("big5");
		response.setContentType("text/html;charset=big5");
		String CONFIG_BUNDLE_NAME = "path";
		String user = (String)request.getParameter("user");
		String radio = (String)request.getParameter("radio");
	
		
		if(user==null)user="tomin";
		if(radio==null)radio="預設電台";
		
		// 從path.properties檔中取得使用者根目錄
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle(CONFIG_BUNDLE_NAME);
	    String AUDIO_ROOT = bundle.getString("audio-root");
		
		//建立一個root元素，並設其為XML文件的根元素
		Element root = new Element("playlist");
		Document doc = new Document(root);
		root.setAttribute(new Attribute("version", "1"));

		//建立元素及其子元素
		Element trackList = new Element("trackList");
		Element track;

	    // Create a directory; all ancestor directories must exist
	    boolean success = new File(AUDIO_ROOT+user).mkdir();
	    if (!success) {
	        // Directory creation failed
	    }			

	    // Create a directory; all ancestor directories must exist
	    success = new File(AUDIO_ROOT+user+"/source").mkdir();
	    if (!success) {
	        // Directory creation failed
	    }		
		

		Vector<String> vDirList = new Vector<String>();
		File dir = new File(AUDIO_ROOT+user+"/source"); 
		String sDirList[] = dir.list();
		if (sDirList.length >0){
			for (int i =0; i < sDirList.length; i++){
				vDirList.add(sDirList[i]);
			}
		}

		for(int i=0; i<vDirList.size(); i++) {
			String sFileName = (String)vDirList.get(i);
		
			track = new Element("track");
			track.addContent(new Element("title").addContent(sFileName));
			track.addContent(new Element("creator").addContent(radio));
			track.addContent(new Element("location").addContent("./"+user+"/source/"+sFileName));
			track.addContent(new Element("info").addContent("http://tw.yahoo.com"));
			trackList.addContent(track);//先把track裝進tracklist
		} 

		root.addContent(trackList);//再把 tracklist裝進root

		//宣告一個Format物件來接XML的屬性值
		Format format = Format.getPrettyFormat();
		format.setEncoding("utf-8");

		//用一個XMLOutputter來為我們輸出XML文件
		XMLOutputter outputter = new XMLOutputter();
		outputter.setFormat(format);// ←把剛剛設定的Format設給XMLOutputter	
		

		//用這個才能輸出utf-8格式的檔案，FileWriter不行
		OutputStream os1= new FileOutputStream(AUDIO_ROOT+user+"/"+user+".xml");
		OutputStreamWriter writer = new OutputStreamWriter(os1,"utf-8");		
		

		outputter.output(doc, writer);
		writer.close();
		
		//out.print(radio);
		response.sendRedirect("index.jsp?user="+user+"&radio="+radio);
	}

}
