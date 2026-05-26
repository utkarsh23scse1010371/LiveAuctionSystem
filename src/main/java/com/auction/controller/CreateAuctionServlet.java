package com.auction.controller;

import com.auction.dao.AuctionDAO;
import com.auction.model.Auction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/createAuction")
public class CreateAuctionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String seller = (String) session.getAttribute("user");

        String title = request.getParameter("title");

        String description =
                request.getParameter("description");

        double startingPrice =
                Double.parseDouble(
                        request.getParameter("startingPrice")
                );

        String endTime =
                request.getParameter("endTime");

        Auction auction = new Auction();

        auction.setTitle(title);

        auction.setDescription(description);

        auction.setStartingPrice(startingPrice);

        auction.setSeller(seller);

        auction.setEndTime(endTime);

        AuctionDAO dao = new AuctionDAO();

        boolean status = dao.createAuction(auction);

        if (status) {

            response.sendRedirect("auctions.jsp");

        } else {

            response.getWriter()
                    .println("Auction Creation Failed!");
        }
    }
}