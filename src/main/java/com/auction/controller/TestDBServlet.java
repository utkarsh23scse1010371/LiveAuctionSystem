package com.auction.controller;

import com.auction.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/testdb")
public class TestDBServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Connection con = DBConnection.getConnection();

            if (con != null) {

                out.println("<h1>🔥 Database Connected Successfully!</h1>");

            } else {

                out.println("<h1>❌ Database Connection Failed!</h1>");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}