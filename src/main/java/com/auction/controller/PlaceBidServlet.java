package com.auction.controller;

import com.auction.dao.BidDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/placeBid")
public class PlaceBidServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String bidder =
                (String) session.getAttribute("user");
                if (bidder == null) {

    response.sendRedirect("login.jsp");

    return;
}

        int auctionId =
                Integer.parseInt(
                        request.getParameter("auctionId")
                );

        double bidAmount =
                Double.parseDouble(
                        request.getParameter("bidAmount")
                );

        BidDAO dao = new BidDAO();

        boolean status =
                dao.placeBid(
                        auctionId,
                        bidder,
                        bidAmount
                );

        if (status) {

            response.sendRedirect("auctions.jsp");

        } else {

            response.getWriter().println(

                    "<h1>Bid must be higher than current price!</h1>"

            );
        }
    }
}