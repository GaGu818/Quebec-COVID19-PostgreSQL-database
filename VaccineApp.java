import java.sql.*;
import java.util.Scanner;

public class JDBC {
    static Connection connection = null;
    static Statement statement = null;
    static String url = "jdbc:db2://localhost:6666/cs421";
    static String user = "yxu283";
    static String password = "K<!VOg&w";
    static Scanner sc;
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        JDBC Query = new JDBC();
        sc=new Scanner(System.in);
        Query.getConnect();
        int choice = 0;
        while (choice!=4){
            System.out.println("============menu============");
            System.out.println("    1. Add a Person");
            System.out.println("    2. Assign a slot to a Person");
            System.out.println("    3. Enter Vaccination information");
            System.out.println("    4. Exit Application");
            System.out.print("Please Enter Your Option:");
            choice = sc.nextInt();
            sc.nextLine();
            switch(choice){
                case 1:Query.add();break;
                case 2:Query.assign();break;
                case 3:Query.enterVacc();break;
                case 4:break;
                default:
                    System.out.println("Your input is incorrect, please re-enter");
            }
        }
        ResultSet resultSet = statement.executeQuery("select * from nurse");
        while(resultSet.next()){
            String id = resultSet.getString(1);
            String name = resultSet.getString(2);
            System.out.println(id+"\t\t"+name);
        }
        resultSet.close();

        Query.closeConnect();
    }
    void add() throws SQLException {
        String hinsurnum;
        String sql;
        System.out.print("Please input hinsurnum:");
        hinsurnum = sc.nextLine();
        sql = "select * from person WHERE hinsurnum="+hinsurnum;
        ResultSet resultSet = statement.executeQuery(sql);
        if(resultSet.next()){
            System.out.println("Already has data.");
            resultSet.close();
            System.out.print("whether the current person’s information must be updated(Yes/No):");
            String choice = sc.nextLine();
            if(!choice.equals("Yes")){
                return;
            }
            else {
                String type,name,gender,dob,phone,city,postalcd,streetaddr;
                System.out.print("Please input type:");
                type = sc.nextLine();
                System.out.print("Please input name:");
                name = sc.nextLine();
                System.out.print("Please input gender:");
                gender = sc.nextLine();
                System.out.print("Please input dob:");
                dob = sc.nextLine();
                System.out.print("Please input phone:");
                phone = sc.nextLine();
                System.out.print("Please input city:");
                city = sc.nextLine();
                System.out.print("Please input postalcd:");
                postalcd = sc.nextLine();
                System.out.print("Please input streetaddr:");
                streetaddr = sc.nextLine();
                sql = "UPDATE person SET cname='"+type+"',name='"+name+"',gender='"+gender+"',dob='"+dob+"',phone='"+phone+"',city='"+city+"',postalcd='"+postalcd+"',streetaddr='"+streetaddr+"'";
                try
                {
                    statement.executeUpdate(sql);
                    System.out.println("Successfully changed.");
                }
                catch (SQLException e) {
                    System.out.println("Error."+e.toString());
                }
                return;
            }

        }
        resultSet.close();
        String cname;
        System.out.print("Please input type of this person:");
        cname = sc.nextLine();
        sql = "select * from category WHERE cname='"+cname+"'";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("No such category.");
            resultSet.close();
            return;
        }
        resultSet.close();
        String name,gender,dob,phone,city,postalcd,streetaddr;
        System.out.print("Please input name:");
        name = sc.nextLine();
        System.out.print("Please input gender:");
        gender = sc.nextLine();
        System.out.print("Please input dob:");
        dob = sc.nextLine();
        System.out.print("Please input phone:");
        phone = sc.nextLine();
        System.out.print("Please input city:");
        city = sc.nextLine();
        System.out.print("Please input postalcd:");
        postalcd = sc.nextLine();
        System.out.print("Please input streetaddr:");
        streetaddr = sc.nextLine();
        sql = "INSERT INTO person VALUES ("+hinsurnum+",'"+name+"'"+",'"+gender+"'"+",'"+dob+"'"+",'"+phone+"'"+",'"+city+"'"+",'"+postalcd+"'"+",'"+streetaddr+"',now()"+",'"+cname+"')";
        try
        {
            statement.executeUpdate(sql);
            System.out.println("Insertion successfully.");
        }
        catch (SQLException e) {
            System.out.println("Error."+e.toString());
        }
    }
    void assign() throws SQLException {
        String hinsurnum;
        String sql;
        int times=0;
        System.out.print("Please input hinsurnum:");
        hinsurnum = sc.nextLine();
        sql = "select * from person WHERE hinsurnum="+hinsurnum;
        ResultSet resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            resultSet.close();
            System.out.println("No such person.");
            return;
        }
        sql = "select count(*) from vaccslot WHERE hinsurnum="+hinsurnum;
        resultSet = statement.executeQuery(sql);
        if(resultSet.next()){
            times = resultSet.getInt(1);
            resultSet.close();
            sql = "select vaccine.doses from vaccslot,vaccine WHERE hinsurnum="+hinsurnum+" AND vaccslot.vname=vaccine.vname";
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()) {
                if(times >= resultSet.getInt("doses")){
                    System.out.println("No more doses needed.");
                    resultSet.close();
                    return;
                }
            }
            resultSet.close();
        }
        String locname,vdate,vtime,vslot;
        System.out.print("Please input locname:");
        locname = sc.nextLine();
        System.out.print("Please input vdate:");
        vdate = sc.nextLine();
        System.out.print("Please input vtime:");
        vtime = sc.nextLine();
        System.out.print("Please input vslot:");
        vslot = sc.nextLine();
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"'";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("No such time option.");
            resultSet.close();
            return;
        }
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"' AND vdate >= now()";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("The time has passed.");
            resultSet.close();
            return;
        }
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"' AND hinsurnum is NULL";
        resultSet = statement.executeQuery(sql);
        if(resultSet.next()){
            resultSet.close();
            sql = "UPDATE vaccslot SET hinsurnum="+hinsurnum+", asgndate=now() WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"'";
            statement.executeUpdate(sql);
            System.out.println("Insertion successfully.");
        }
        else {
            resultSet.close();
            System.out.println("Already has person in this time.");
        }

    }
    void enterVacc() throws SQLException {
        String hinsurnum;
        String sql;
        System.out.print("Please input hinsurnum:");
        hinsurnum = sc.nextLine();
        sql = "SELECT * FROM vaccslot WHERE hinsurnum="+hinsurnum+" AND vname is NULL";
        ResultSet resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("No assignment record for this person.");
            return;
        }
        String locname,vdate,vtime,vslot;
        System.out.print("Please input locname:");
        locname = sc.nextLine();
        System.out.print("Please input vdate:");
        vdate = sc.nextLine();
        System.out.print("Please input vtime:");
        vtime = sc.nextLine();
        System.out.print("Please input vslot:");
        vslot = sc.nextLine();
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"' AND vdate >= now()";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("The time has passed.");
            resultSet.close();
            return;
        }
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"' AND licensenum is NULL";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("The time has been assigned.");
            resultSet.close();
            return;
        }
        sql = "SELECT * FROM vaccslot WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"' AND hinsurnum="+hinsurnum;
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            System.out.println("The time is not yours.");
            resultSet.close();
            return;
        }
        String licensenum,vname,batchno,vialid;
        System.out.print("Please input licensenum:");
        licensenum = sc.nextLine();
        System.out.print("Please input vname:");
        vname = sc.nextLine();
        System.out.print("Please input batchno:");
        batchno = sc.nextLine();
        System.out.print("Please input vialid:");
        vialid = sc.nextLine();
        sql = "SELECT vname FROM vaccslot WHERE hinsurnum='"+hinsurnum+"' AND vname is not NULL";
        resultSet = statement.executeQuery(sql);
        if(!resultSet.next()){
            resultSet.close();
            sql = "UPDATE vaccslot SET vname='"+vname+"', licensenum='"+licensenum+"',batchno='"+batchno+"', vialid='"+vialid+"' WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"'";
            statement.executeUpdate(sql);
            System.out.println("Insertion successfully.");
        }else {
            if(!vname.equals(resultSet.getString("vname"))){
                System.out.println("Different vaccination with last time.");
                return;
            }
            resultSet.close();
            sql = "UPDATE vaccslot SET vname='"+vname+"', licensenum='"+licensenum+"',batchno='"+batchno+"', vialid='"+vialid+"' WHERE locname='"+locname+"' AND vdate='"+vdate+"' AND vtime='"+vtime+"' AND vslot='"+vslot+"'";
            statement.executeUpdate(sql);
            System.out.println("Insertion successfully.");
        }
    }
    void getConnect() throws ClassNotFoundException, SQLException {
        Class.forName("com.ibm.db2.jcc.DB2Driver");
//        Class.forName("org.postgresql.Driver");
        connection= DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
    }
    void closeConnect() throws SQLException {
        statement.close();
        connection.close();
    }
}