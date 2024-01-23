package com.taskmanage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TaskDBUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insertTask(String taskname, String description, String date) {

        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "insert into task values(0,'" + taskname + "','" + description + "','" + date + "')";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return isSuccess;
    }

    public static List<Task> getTaskDetails(String Id) {

        int convertedID = Integer.parseInt(Id);
        ArrayList<Task> tas = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from task where id='" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String taskname = rs.getString(2);
                String description = rs.getString(3);
                String date = rs.getString(4);

                Task t = new Task(id, taskname, description, date);
                tas.add(t);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return tas;

    }

    public static List<Task> getAllTasks() {
        ArrayList<Task> tasks = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM task";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String taskname = rs.getString(2);
                String description = rs.getString(3);
                String date = rs.getString(4);

                Task t = new Task(id, taskname, description, date);
                tasks.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tasks;
    }
}
