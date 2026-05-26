<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user =
            (String) session.getAttribute("user");

    if (user == null) {

        response.sendRedirect("login.jsp");

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Create Auction</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="bg-dark text-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card shadow-lg">

                <div class="card-body">

                    <h2 class="mb-4">

                        Create Auction

                    </h2>

                    <form action="createAuction"
                          method="post">

                        <div class="mb-3">

                            <label>Title</label>

                            <input type="text"
                                   name="title"
                                   class="form-control">

                        </div>

                        <div class="mb-3">

                            <label>Description</label>

                            <textarea name="description"
                                      class="form-control"></textarea>

                        </div>

                        <div class="mb-3">

                            <label>Starting Price</label>

                            <input type="number"
                                   name="startingPrice"
                                   class="form-control">

                        </div>

                        <div class="mb-3">

                            <label>End Time</label>

                            <input type="datetime-local"
                                   name="endTime"
                                   class="form-control">

                        </div>

                        <button class="btn btn-dark w-100">

                            Create Auction

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>