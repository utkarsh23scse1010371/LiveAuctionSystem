package com.auction.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://hopper.proxy.rlwy.net:18420/railway";

    private static final String USER = "root";

    private static final String PASSWORD = "PLbeesdCnTasaxFMUPfYLYBRyAuYqhXn";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}