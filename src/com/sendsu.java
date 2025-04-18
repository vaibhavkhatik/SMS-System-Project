package com;
 

import java.io.UnsupportedEncodingException;

 

public class sendsu {
 
	public static void main(String[] args) throws UnsupportedEncodingException 
	{
	 
          String mobileNumbers = "9665662155";//(String)session.getAttribute("mobileNumber");
          String an=null;
          String tabID=null;
          java.util.Date dategot = new java.util.Date();
 
          StringRandomGen RT = new StringRandomGen();
          String RandNo = RT.generateRandomString();
          String OTP_date =  "";
           
           String msgC="OTP for your CaRP is "+RandNo +" Do not share with anyone.";
           String user ="mayurotp";
           String password = "123123";
           String sender = "CAPTCH";
           String PhoneNumber = mobileNumbers;
           
          String myURL = "http://www.smswave.in/panel/sendsms.php";
               
           /*    SimpleTextM sSMS = new SimpleTextM();
               sSMS.callURL(myURL, msgC, PhoneNumber);*/
           
           }
	}


