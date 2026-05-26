package com.auction.dao;

import com.auction.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BidDAO {

    public boolean placeBid(int auctionId,
                            String bidder,
                            double bidAmount) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement check =
                    con.prepareStatement(

                            "SELECT current_price FROM auctions WHERE id=?"

                    );

            check.setInt(1, auctionId);

            ResultSet rs = check.executeQuery();

            double currentPrice = 0;

            if (rs.next()) {

                currentPrice =
                        rs.getDouble("current_price");
            }

            if (bidAmount > currentPrice) {

                PreparedStatement bidPs =
                        con.prepareStatement(

                                "INSERT INTO bids(auction_id,bidder,bid_amount) VALUES(?,?,?)"

                        );

                bidPs.setInt(1, auctionId);

                bidPs.setString(2, bidder);

                bidPs.setDouble(3, bidAmount);

                bidPs.executeUpdate();

                PreparedStatement updatePs =
                        con.prepareStatement(

                                "UPDATE auctions SET current_price=? WHERE id=?"

                        );

                updatePs.setDouble(1, bidAmount);

                updatePs.setInt(2, auctionId);

                updatePs.executeUpdate();

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}