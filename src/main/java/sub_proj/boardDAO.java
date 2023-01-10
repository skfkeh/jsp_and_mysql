package sub_proj;
import java.sql.*;

public class boardDAO {
	String dbURL ="jdbc:mysql://localhost:3306/SUB_PROJECT?useUnicode=true&characterEncoding=utf8";
	String dbUSER = "crawler";
	String dbPW = "tmdghks7";
	
	public boardDTO readContent(int txt_id) {
		boardDTO dto = new boardDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbUSER, dbPW);
			String sql = "SELECT * FROM text_board WHERE txt_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, txt_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setTxt_title(rs.getString("txt_title"));
				dto.setTxt_user(rs.getString("txt_user"));
				dto.setTxt_pw(rs.getString("txt_pw"));
				dto.setTxt_content(rs.getString("txt_content"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
				rs.close();    rs = null;
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public String makeList() {
		String line = "";
		int id = 0;
		String title = "";
		String name = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbUSER, dbPW);
			String sql ="SELECT * FROM text_board;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getInt("TXT_ID");
				title = rs.getString("TXT_TITLE");
				name = rs.getString("TXT_USER");
				String newLine="<tr><td>"+id+"</td><td><a href='readForm.jsp?id="+id+"'>"+title+"</a></td><td>"+name+"</td></tr>";
				line += newLine;
			}
			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
				rs.close();    rs=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		
		return line;
	}
	
	public int indexNum() {
		int idx = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbUSER,dbPW);
			String sql ="SELECT max(txt_id) mNum FROM text_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx=rs.getInt("mNum")+1;
			}			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
				rs.close();    rs=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		
		return idx;
	}
	
	public boolean insertBoard(boardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbUSER,dbPW);
			String sql ="INSERT INTO text_board VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getTxt_id());
			pstmt.setString(2, dto.getTxt_title());
			pstmt.setString(3, dto.getTxt_user());
			pstmt.setString(4, dto.getTxt_pw());
			pstmt.setString(5, dto.getTxt_content());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.getStackTrace();
			return false;
		}finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
			}catch(Exception e) {
				e.getStackTrace();
				return false;
			}
		}
		return true;
	}
	
	public void deleteContent(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbUSER,dbPW);
			String sql ="DELETE FROM text_board WHERE txt_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
	}
	
	public boolean updateContent(boardDTO dtoo) {
//		boardDTO dto = dtoo;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbUSER,dbPW);
			String sql ="UPDATE text_board SET txt_title=?, txt_content=? WHERE txt_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dtoo.getTxt_title());
			pstmt.setString(2, dtoo.getTxt_content());
			pstmt.setInt(3, dtoo.getTxt_id());
			pstmt.executeUpdate();
			
			return true;
		}catch(Exception e) {
			e.getStackTrace();
			return false;
		}finally {
			try {
				conn.close();  conn = null;
				pstmt.close(); pstmt = null;
			}catch(Exception e) {
				e.getStackTrace();
				return false;
			}
		}
	}
	
	private static void printData(ResultSet srs, String col1, String col2, String col3) throws SQLException {
		while (srs.next()) {
			if(!col1.equals(""))
				System.out.print(srs.getString("ID"));
			if(!col2.equals(""))
				System.out.print("\t\t" + srs.getString("TITLE"));
			if(!col3.equals(""))
				System.out.println("\t\t" + srs.getString("NAME"));
			else
				System.out.println();
		}
	}
}
