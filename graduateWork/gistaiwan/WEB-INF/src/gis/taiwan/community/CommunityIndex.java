package gis.taiwan.community;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public final class CommunityIndex extends Action {
	private final String DATE_FORMAT = "yyyy-MM-dd HH:mm";//時間格式
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		String xmlResponse = "";
		DateFormat dateParser = new SimpleDateFormat(DATE_FORMAT);
		
		//接收變數  
        String all = req.getParameter("all");		

		//設定輸出編碼
        res.setContentType("text/html; charset=utf-8");			
		res.setCharacterEncoding("utf-8");
		
		//print
		PrintWriter out = res.getWriter();//務必宣告在utf-8後面..				
				
        try{
        	sql = "SELECT *, count(cr.rid) as reply FROM community c left outer join community_reply cr on c.cid=cr.cid group by c.cid order by update_time desc limit 20";
        	if(all!=null && all.equals("yes")){
        		sql = "SELECT *, count(cr.rid) as reply FROM community c left outer join community_reply cr on c.cid=cr.cid group by c.cid order by update_time desc limit 1000";        		
        	}
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();			
			
			int i=0;
			
			while(rs.next()){
				
				if(++i%2==1){					
			    	xmlResponse += "<div class=\"community_content_table_odd\" id=\"z" + rs.getString("cid") + "\">";
				}else{
			    	xmlResponse += "<div class=\"community_content_table_even\" id=\"z" + rs.getString("cid") + "\">";	
				}
				
				String id = rs.getString("id");
				if(id.equals("gis_team_2009") || id.equals("huang7127") ){
					id = "GIS Team 2009";					
				}				

		    	xmlResponse += "<span class=\"no\">" + rs.getString("cid") + ".</span>";
		    	xmlResponse += "<span class=\"title\">" + rs.getString("title") + "</span>";
		    	xmlResponse += "<span class=\"author\">" + id + "</span>";
		    	xmlResponse += "<span class=\"replycontent\">" + rs.getString("reply") + "</span>";
		    	xmlResponse += "<span class=\"update\">" + dateParser.format(rs.getTimestamp("update_time")) + "</span>";
		    	xmlResponse += "</div>";				
				
		    	
		    	if(i%2==1){
		    		xmlResponse += "<div class=\"community_content_table_post_odd\" id=\"x" + rs.getString("cid") + "\">";
		    	}else{
		    		xmlResponse += "<div class=\"community_content_table_post_even\" id=\"x" + rs.getString("cid") + "\">";		    		
		    	}
		    			    			    			    	
		    	xmlResponse += "<span class=\"community_content_table_post_content\">" + rs.getString("content").replaceAll("\n", "<br/>") + "</span>";		    			    			    	
			    xmlResponse += "<div class=\"community_content_table_reply\" id=\"replyLayout" + rs.getString("cid") + "\">";
			    xmlResponse += "</div>";
			    
			    xmlResponse += "<div class=\"community_content_table_reply_hint_group\">";
			    xmlResponse += "<span class=\"community_content_table_reply_hint\">" + "<a id=\"showCommentLink\" onclick=\"showCommentRequest()\">Comment this topic</a></span>";
			    xmlResponse += "<span class=\"community_content_table_reply_hint\">" + "<a id=\"hideTopicLink\" onclick=\"hideCurrentTopic()\">Hide this topic</a></span>";
			    xmlResponse += "</div>";
			    xmlResponse += "<div class=\"community_content_table_post_date\">" + "Topic No." + rs.getString("cid") + ": " + rs.getString("title") +  " / Posted by " + rs.getString("id") + " at UTC/GMT + 08:00 " + dateParser.format(rs.getTimestamp("create_time")) + "</div>";
			    
		    	xmlResponse += "</div>";		    			    	
						    					
			}
			out.print(xmlResponse);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{			
			//close sql
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}  			
		}
		

		return null;
	}	
}
