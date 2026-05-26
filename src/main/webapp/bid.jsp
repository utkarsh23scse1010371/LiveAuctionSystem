<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user =
            (String) session.getAttribute("user");

    if (user == null) {

        response.sendRedirect("login.jsp");

        return;
    }
%>

<%
    String auctionId = request.getParameter("id");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Place Bid</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="bg-dark text-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card shadow-lg">

                <div class="card-body">

                    <h2 class="mb-4">

                        Place Your Bid

                    </h2>

                    <form action="placeBid"
                          method="post">

                        <input type="hidden"
                               name="auctionId"
                               value="<%= auctionId %>">

                        <div class="mb-3">

                            <label>Bid Amount</label>

                            <input type="number"
                                   name="bidAmount"
                                   class="form-control">

                        </div>

                        <button class="btn btn-dark w-100">

                            Submit Bid

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>