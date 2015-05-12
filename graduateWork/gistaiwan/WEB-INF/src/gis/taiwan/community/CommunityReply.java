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

public final class CommunityReply extends Action {
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
        String cid = req.getParameter("cid");	

		//設定輸出編碼
        res.setContentType("text/html; charset=utf-8");			
		res.setCharacterEncoding("utf-8");
		
		//print
		PrintWriter out = res.getWriter();//務必宣告在utf-8後面..				
				
        try{
        	sql = "SELECT * FROM community_reply where cid = ? order by reply_time asc limit 50";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, cid);
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				String id = rs.getString("id");
				if(id.equals("gis_team_2009") || id.equals("huang7127") ){
					id = "<font color=navy>GIS Team 2009</font>";					
				}
				
			    xmlResponse += "<div class=\"community_content_table_reply_beader\">" + id + " commented at " + dateParser.format(rs.getTimestamp("reply_time"))  + "</div>";			    
			    xmlResponse += "<div class=\"community_content_table_reply_content\">" + rs.getString("content_reply").replaceAll("\n", "<br/>") + "</div>";			    
			}
			xmlResponse += "<div class=\"community_content_table_reply_new\" id=\"replyForm" + cid + "\">";
			xmlResponse += "<div class=\"community_content_table_reply_new_beader\">Your comment:</div>";
			xmlResponse += "<textarea id=\"textarea" + cid + "\" name=\"textarea\" cols=\"73\" rows=\"6\"></textarea><br/>";
			xmlResponse += "<input id=\"button" + cid + "\" type=\"button\" name=\"Submit\" value=\"Post the comment\" onclick=\"postCommentRequest();\">";
			xmlResponse += "<span class=\"textareaErrorBox\" id=\"textareaErrorBox" + cid + "\" />";
			xmlResponse += "</div>";

			
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
