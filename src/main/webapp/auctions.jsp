<%@ page import="java.util.List" %>
<%@ page import="com.auction.dao.AuctionDAO" %>
<%@ page import="com.auction.model.Auction" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    AuctionDAO dao = new AuctionDAO();

    List<Auction> auctions = dao.getAllAuctions();
%>

<!DOCTYPE html>
<html>

<head>

    <title>Auctions</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="bg-dark text-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5">

    <h1 class="mb-4 text-warning">

        Live Auctions 🔥

    </h1>

    <div class="row">

        <%
            for (Auction auction : auctions) {
        %>

        <div class="col-md-4 mb-4">

            <div class="card shadow-lg h-100">

                <div class="card-body">

                    <h3 class="card-title">

                        <%= auction.getTitle() %>

                    </h3>

                    <p class="card-text">

                        <%= auction.getDescription() %>

                    </p>

                    <h5 class="text-success">

                        ₹ <%= auction.getCurrentPrice() %>

                    </h5>

                    <p>

                        Seller:
                        <%= auction.getSeller() %>

                    </p>

                    <p class="countdown"
                      data-end="<%= auction.getEndTime() %>">

                    </p>

                    <a href="bid.jsp?id=<%= auction.getId() %>"
                       class="btn btn-dark">

                       Place Bid

                    </a>

                </div>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>
<script>

    const countdowns =
        document.querySelectorAll(".countdown");

    countdowns.forEach(countdown => {

        const endTime =
            new Date(
                countdown.dataset.end
            ).getTime();

        function updateTimer() {

            const now = new Date().getTime();

            const distance =
                endTime - now;

            if (distance < 0) {

                countdown.innerHTML =
                    "Auction Ended";

                return;
            }

            const hours =
                Math.floor(
                    (distance % (1000 * 60 * 60 * 24))
                    / (1000 * 60 * 60)
                );

            const minutes =
                Math.floor(
                    (distance % (1000 * 60 * 60))
                    / (1000 * 60)
                );

            const seconds =
                Math.floor(
                    (distance % (1000 * 60))
                    / 1000
                );

            countdown.innerHTML =
                `Ends in: ${hours}h ${minutes}m ${seconds}s`;

        }

        updateTimer();

        setInterval(updateTimer, 1000);
    });

</script>

</body>
</html>