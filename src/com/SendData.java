package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  

 
import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;

import com.github.sarxos.webcam.Webcam;
import com.util.DbConnection;
import com.util.SendAttachmentInEmail;
public class SendData {
	
	static final String DB_URL = "jdbc:mysql://localhost:3306/intrusion_otp";
	   static final String USER = "root";
	   static final String PASS = "";
	
	public void send(String msg) {

		try {

			String username ="", usb = null, web = null, directory = null, date = null;
			int userId=0;

			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from tempp");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				usb = rs.getString("usb");
//				web = rs.getString("web");
				directory = rs.getString("directory");
				date = rs.getString("date");
				username = rs.getString("username");
				userId = rs.getInt("user_id");
			}

			if (msg.equals("usb")) {
				if (usb.equals("no")) {
					capture(userId,username);
				}
			} else if (msg.equals("date")) {
				if (date.equals("no")) {
					System.out.println("Captured"); 
					capture(userId,username);
				}
			} 
//			else if (msg.equals("web")) {
//				if (web.equals("no")) {
//					System.out.println("Captured");
//					capture();
//				}
//			}
			else if (msg.equals("directory")) {
				if (directory.equals("no")) {
					System.out.println("Captured");
					capture(userId,username);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
 
	}

	public void capture(int userId, String username) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
		   LocalDateTime now = LocalDateTime.now();
		   String image1 = dtf.format(now)+".png";
	
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		         Statement stmt = conn.createStatement();
		      ) {		      
			
			  
			   DateTimeFormatter adtf = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
			   LocalDateTime anow = LocalDateTime.now();
			   String image = adtf.format(anow)+".png";
			   DateTimeFormatter ddtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
			   LocalDateTime nnow = LocalDateTime.now();
			   String ndate = ddtf.format(nnow);
			   String add = "2";
			   String image2 = adtf.format(anow)+add+".png";

		         // Execute a query
		         System.out.println("Inserting records into the table...");          
		         String sql = "INSERT INTO user_activities (username, user_id, activity, added_on, ip_address,image1,image2,status)"
    + " VALUES ('"+username+"','image1','image1','"+ndate+"','image1','"+image+"','"+image2+"','image1')";

		         stmt.executeUpdate(sql);
		         System.out.println("Inserted records into the table...");   	  
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } 
		try {
			BufferedImage image = new Robot()
					.createScreenCapture(new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));
			ImageIO.write(image, "png", new File("D:/iids/IIDS/WebContent/Activity//"+image1));
			
			String add = "2";
			
			DateTimeFormatter edtf = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
			   LocalDateTime enow = LocalDateTime.now();
			   String image2 = edtf.format(enow)+add+".png";
			
			Webcam webcam = Webcam.getDefault();
			webcam.open();
			ImageIO.write(webcam.getImage(), "png", new File("D:/iids/IIDS/WebContent/Activity//"+image2));
		

			webcam.close();
	            

			SendAttachmentInEmail s = new SendAttachmentInEmail();// D:\\WebTest.png
			s.EmailSending("ramdherange30@gmail.com", "Test", "Test", "D:/Activity\\curr.png", "D:/Activity\\WebTest.png");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
