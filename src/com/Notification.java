package com;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Notification {
    //A common method to connect to the DB
    private Connection connect() 
        { 
        	Connection con = null; 
        try
        { 
        	Class.forName("com.mysql.jdbc.Driver"); 
    
    //Provide the correct details: DBServer/DBName, username, password 
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electrogred", "root", "Shashini@1996"); 
    } 
    catch (Exception e) 
    {e.printStackTrace();
    } 
    return con; 
    } 
    /**
     * 
     * @param accountId
     * @param billId
     * @param amountToBePaiddouble
     * @param email
     * @param mobileNumber
     * @param subject
     * @param massage
     * @param dateNotify
     * @return
     */
    public String insertNotification(String accountId, String billId, String amountToBePaiddouble,
           String email, String mobileNumber, String subject, String massage, String dateNotify
            )
    { 
        String output = ""; 
       
            try
            { 
                Connection con = connect(); 
                if (con == null) 
                {
                	return "Error while connecting to the database for inserting.";
                } 
                
                //crate uuid for id
                Date dNow = new Date();
                SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
                String datetime = ft.format(dNow);
            
                // create a prepared statement
                String query = " insert into notification (`notificationId`,`accountId`,`billId`,`amountToBePaid`,`email`,`mobileNumber`,`subject`,`massage`,`dateNotify`)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
                PreparedStatement preparedStmt = con.prepareStatement(query); 
                // binding values
                preparedStmt.setString(1, "NI"+datetime); 
                preparedStmt.setString(2, accountId); 
                preparedStmt.setString(3, billId); 
                preparedStmt.setDouble(4, Double.parseDouble(amountToBePaiddouble) );  
                preparedStmt.setString(5, email); 
                preparedStmt.setString(6, mobileNumber); 
                preparedStmt.setString(7, subject);  
                preparedStmt.setString(8, massage); 
                preparedStmt.setString(9, dateNotify); 

                // execute the statement
                preparedStmt.execute();  
                con.close(); 
                String newAppointment = readNotification();
				output = "{\"status\":\"success\", \"data\": \"" + newAppointment + "\"}";
			}
			catch (Exception e)
			{
				output = "{\"status\":\"error\", \"data\": \"Error while inserting the appointment details. \"}";
				System.err.println(e.getMessage());
			}
			
			return output;
		} 
     /**
     * Get data User and bill database
     * @return
     */
    public String readNotification() 
    { 
    String output = ""; 
    try
    { 
        Connection con = connect(); 
        if (con == null) 
        {return "Error while connecting to the database for reading."; } 
        // Prepare the html table to be displayed
        output = "<table border='1'><tr>"
        		+ "<th>Notification ID</th>"
        		+ "<th>Account ID</th>" +
                "<th>Bill Id</th>" + 
                "<th>Amount To Be a paid</th>"+
                "<th>Email</th>" + 
                "<th>Mobile Number</th>" +
                "<th>Subject</th>" + 
                "<th>Massage</th>"+
                "<th>Date of Notify</th>"+ 
                "<th>First Name</th>"+
                "<th>NIC</th>"+"<th>Update</th>"+"<th>Remove</th></tr>" ;  
                 
        /**Use join query connect tree table */
        String query = "SELECT * FROM  notification INNER JOIN users ON users.accountId = notification.accountId"; 
        Statement stmt = con.createStatement(); 
        ResultSet rs = stmt.executeQuery(query); 
        // iterate through the rows in the result set
        while (rs.next()) 
        { 
            String notificationId  = rs.getString("notificationId"); 
            String accountId  = rs.getString("accountId"); 
            String billId  = rs.getString("billId"); 
            Double amountToBePaid  = rs.getDouble("amountToBePaid"); 
            String email  = rs.getString("email"); 
            String mobileNumber  = rs.getString("mobileNumber"); 
            String subject  = rs.getString("subject"); 
            String massage  = rs.getString("massage"); 
            String dateNotify  = rs.getString("dateNotify");
            String firstName  = rs.getString("firstName"); 
            String nic = rs.getString("nic"); 
            
            // Add into the html table
            output += "<tr><td>" + notificationId + "</td>"; 
            output += "<td>" + accountId + "</td>"; 
            output += "<td>" + billId + "</td>"; 
            output += "<td>" + amountToBePaid + "</td>"; 
            output += "<td>" + email + "</td>"; 
            output += "<td>" + mobileNumber + "</td>"; 
            output += "<td>" + subject + "</td>"; 
            output += "<td>" + massage + "</td>";
            output += "<td>" + dateNotify + "</td>"; 
            output += "<td>" + firstName + "</td>";  
            output += "<td>" + nic + "</td>";
         // buttons
			output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
					+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-id='"
							 + notificationId + "'>" + "</td></tr>";
					
		}
		
		con.close();
		
		// Complete the html table
		output += "</table>";
	}
	catch (Exception e)
	{
		output = "Error while reading the appointment details.";
		System.err.println(e.getMessage());
	}
	return output;
}
    
   
   
    public String updateNotification(String notificationId , String accountId , String billId , String amountToBePaiddouble ,
    String email , String mobileNumber , String subject , String massage , String dateNotify )  
    
    { 
        String output = ""; 
    try
    { 
        Connection con = connect(); 
        if (con == null) 
    { 
	return "Error while connecting to the database for updating."; } 
    // create a prepared statement
    String query = "UPDATE notification SET notificationId=?,accountId=?,billId=?,amountToBePaid=?,email=?,mobileNumber=?,subject=?,massage=?,dateNotify=? WHERE notificationId=?"; 
    PreparedStatement preparedStmt = con.prepareStatement(query); 
        // binding values
        preparedStmt.setString(1, notificationId); 
        preparedStmt.setString(2, accountId); 
        preparedStmt.setString(3, billId); 
        preparedStmt.setDouble(4, Double.parseDouble(amountToBePaiddouble));  
        preparedStmt.setString(5, email); 
        preparedStmt.setString(6, mobileNumber);
        preparedStmt.setString(7, subject); 
        preparedStmt.setString(8, massage);
        preparedStmt.setString(9, dateNotify); 
        preparedStmt.setString(10, notificationId);
      
    // execute the statement
    preparedStmt.execute(); 
    con.close(); 
    //output = "Updated successfully"; 
    String newAppointment = readNotification();
	output = "{\"status\":\"success\", \"data\": \"" + newAppointment + "\"}";
    } 
        catch (Exception e) 
    { 
        //output = "Error while updating the Notification."; 
        	output = "{\"status\":\"error\", \"data\": \"Error while updating the appointment details. \"}";
        	
        System.err.println(e.getMessage()); 
    } 
        return output; 
    } 

    
    /**
     * remove the Notification details from the table
     * @param BillId
     * @return
     */
    public String deleteNotice(String BillId) 
    { 
	    String output = ""; 
	    try
	    { 
	    	Connection con = connect(); 
		    if (con == null) 
		    	{return "Error while connecting to the database for deleting."; } 
			    // create a prepared statement
			    String query = "delete from notification where notificationId=?"; 
			    PreparedStatement preparedStmt = con.prepareStatement(query); 
			    // binding values
			    preparedStmt.setString(1, BillId); 
			    // execute the statement
			    preparedStmt.execute(); 
			    con.close(); 
			    String newNotifi = readNotification();
				output = "{\"status\":\"success\", \"data\": \"" + newNotifi + "\"}";
			}
			catch (Exception e)
			{
				output = "{\"status\":\"error\", \"data\":\"Error while deleting the appointment.\"}"; 		
				System.err.println(e.getMessage());
			}
			
			return output;
			}

}
