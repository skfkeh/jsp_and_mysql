package sub_proj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAO {
	String dbURL ="jdbc:mysql://localhost:3306/SUB_PROJECT?useUnicode=true&characterEncoding=utf8";
	String dbUSER = "crawler";
	String dbPW = "tmdghks7";
	
	public Boolean readUser(String id, String pw) {
		userDTO dto = new userDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbUSER, dbPW);
			String sql = "SELECT * FROM userinfo WHERE id = ? and pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			int id_cnt = 0;
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				id_cnt += 1;
			}
			if(id_cnt == 1) {
				return true;
			} else {
				return false;
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
		
		return false;
	}
	
	public void insertUser(userDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbUSER,dbPW);
			String sql ="INSERT INTO userinfo VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
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
	private static void printData(ResultSet srs, String col1, String col2, String col3) throws SQLException {
		while (srs.next()) {
			if(!col1.equals(""))
				System.out.print(srs.getString("ID"));
			if(!col2.equals(""))
				System.out.print("\t\t" + srs.getString("PW"));
			if(!col3.equals(""))
				System.out.println("\t\t" + srs.getString("NAME"));
			else
				System.out.println();
		}
	}

}
