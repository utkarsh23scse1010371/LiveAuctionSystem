package com.auction.dao;

import com.auction.model.Auction;
import com.auction.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AuctionDAO {

    public boolean createAuction(Auction auction) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(

                    "INSERT INTO auctions(title,description,starting_price,current_price,seller,end_time) VALUES(?,?,?,?,?,?)"

            );

            ps.setString(1, auction.getTitle());

            ps.setString(2, auction.getDescription());

            ps.setDouble(3, auction.getStartingPrice());

            ps.setDouble(4, auction.getStartingPrice());

            ps.setString(5, auction.getSeller());

            ps.setString(6, auction.getEndTime());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    public List<Auction> getAllAuctions() {

    List<Auction> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(
                        "SELECT * FROM auctions"
                );

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Auction auction = new Auction();

            auction.setId(rs.getInt("id"));

            auction.setTitle(rs.getString("title"));

            auction.setDescription(
                    rs.getString("description")
            );

            auction.setStartingPrice(
                    rs.getDouble("starting_price")
            );

            auction.setCurrentPrice(
                    rs.getDouble("current_price")
            );

            auction.setSeller(
                    rs.getString("seller")
            );

            auction.setEndTime(
                    rs.getString("end_time")
            );

            list.add(auction);
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return list;
}
}