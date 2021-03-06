/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cecs323.jdbc;

import java.sql.*;
import java.util.*;

/**
 *
 * @author kermi
 */
public class CECS323Jdbc {
    
     // Database credentials
    static String USER;
    static String PASS;
    static String DBNAME;
    
    static String displayFormat;
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";
    // + "testdb;user=";
    static Connection conn;
    static String INPUT;
    static Scanner in;
    static PreparedStatement pstmt;

    
    public static String dispNull(String input) {
        //because of short circuiting, if it's null, it never checks the length.
        if (input == null || input.length() == 0) {
            return "N/A";
        } else {
            return input;
        }
    }
    
     public static void promptEnterKey() {
        System.out.println("Press \"ENTER\" to continue...");
        Scanner in = new Scanner(System.in);
        in.nextLine();
    }
    
    //1
    public static void listAllGroups()
    {
        try{
            pstmt = conn.prepareStatement("SELECT groupName FROM WritingGroup");
            
            ResultSet rs = pstmt.executeQuery();
            
            System.out.println("Group Name");
            System.out.println("----------");
            
            while(rs.next()){
                //Retrieve by column name
                String name = rs.getString("groupName");

                //Display values
                System.out.println(name);
            }               
        } catch(SQLException e)
        {
            e.printStackTrace();
        }       
    }
    
    //2
        public static void listSpecificGroup() {
        try {
            System.out.println("Input a group name: ");
            String groupName = in.nextLine();
            pstmt = conn.prepareStatement(
                    "SELECT * FROM WritingGroup WHERE groupName = ?"
            );
            pstmt.setString(1, groupName);
            ResultSet rs = pstmt.executeQuery();

            displayFormat = "%-30s%-30s%-30s%-30s\n";
            System.out.printf(displayFormat, "Group Name", "Head Writer", "Year Formed", "Subject");
            while (rs.next()) {
                //Retrieve by column name
                String name = rs.getString("groupName");
                String head = rs.getString("headWriter");
                String year = rs.getString("yearFormed");
                String subject = rs.getString("subject");

                //Display values
                System.out.printf(displayFormat,
                        dispNull(name), dispNull(head), dispNull(year), dispNull(subject));
            }

            rs.close();
            promptEnterKey();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        
    // 3
    public static void listAllPublishers() {
        try {
            pstmt = conn.prepareStatement(
                "SELECT publisherName FROM Publishers"
            );
            ResultSet rs = pstmt.executeQuery();

            System.out.println("Publisher Name");
            while (rs.next()) {
                //Retrieve by column name
                String name = rs.getString("publisherName");

                //Display values
                System.out.println(name);
            }

            rs.close();
            promptEnterKey();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     // 4
    public static void listSpecificPublisher() {
        try {
            System.out.println("Input a publisher name: ");
            String publisherName = in.nextLine();
            pstmt = conn.prepareStatement(
                "SELECT * FROM Publishers WHERE publisherName = ?"
            );
            pstmt.setString(1, publisherName);
            ResultSet rs = pstmt.executeQuery();

            displayFormat = "%-30s%-30s%-30s%-30s\n";
            System.out.printf(displayFormat, "Name", "Address", "Phone", "Email");
            System.out.printf(displayFormat, "----", "-------", "-----", "-----");
            
            while (rs.next()) {
                //Retrieve by column name
                String name = rs.getString("publisherName");
                String address = rs.getString("publisherAddress");
                String phone = rs.getString("publisherPhone");
                String email = rs.getString("publisherEmail");

                //Display values
                System.out.printf(displayFormat,
                        dispNull(name), dispNull(address), dispNull(phone), dispNull(email));
            }

            rs.close();
            promptEnterKey();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 5
    public static void listAllBooks() {
        try {
            pstmt = conn.prepareStatement(
                "SELECT bookTitle FROM Books"
            );
            ResultSet rs = pstmt.executeQuery();

            System.out.println("Book Title");
            System.out.println("----------");
            while (rs.next()) {
                //Retrieve by column name
                String title = rs.getString("bookTitle");

                //Display values
                System.out.println(title);
            }

            rs.close();
            promptEnterKey();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public static void displayOptions(){
        System.out.println("What would you like to do?");
        System.out.println("1 : List all writing groups");
        System.out.println("2 : List data for a specific group");
        System.out.println("3 : List all publishers");
        System.out.println("4 : List data for a specific publisher");
        System.out.println("5 : List all book titles");
        System.out.println("6 : List data for a particular book");
        System.out.println("7 : Insert a new book");
        System.out.println("8 : Remove a book");
    }
    
    /**
     * @param args the command line arguments
     */
        public static void main(String[] args) {
        //Prompt the user for the database name, and the credentials.
        //If your database has no credentials, you can update this code to
        //remove that from the connection string.
        Scanner in = new Scanner(System.in);
        INPUT = "";
               
        System.out.print("Name of the database (not the user account): ");
        DBNAME = in.nextLine();
        System.out.print("Database user name: ");
        USER = in.nextLine();
        System.out.print("Database password: ");
        PASS = in.nextLine();
        //Constructing the database URL connection string
        DB_URL = DB_URL + DBNAME + ";user="+ USER + ";password=" + PASS;
          //initialize the statement that we're using
        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            
  
            
            while(!INPUT.equals("q")){
                
                             
            displayOptions();
            System.out.print("Enter number: ");
            INPUT = in.nextLine();
            
            switch(INPUT){
                case "1": listAllGroups();
                    break;
                case "2": listSpecificGroup();
                    break;
                case "3": listAllPublishers();
                    break;
                case "4": listSpecificPublisher();
                    break;
                case "5": listAllBooks();
                    break;
                case "6":
                    //insertPublisher();
                    break;
            } 
           
//            if (INPUT.equals("3")){
//                System.out.println("Listing all publishers!");
//                listPublishers();
//            }
                
            
        }

            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main
    
}
