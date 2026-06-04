<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Live Auction System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background: linear-gradient(135deg,#0f172a,#1e293b);
            min-height:100vh;
            color:white;
        }

        .hero{
            padding:120px 0;
        }

        .hero-title{
            font-size:4rem;
            font-weight:800;
            color:#ffc107;
        }

        .hero-subtitle{
            font-size:1.3rem;
            color:#d1d5db;
        }

        .feature-card{
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(10px);
            border:none;
            border-radius:20px;
            transition:0.3s;
        }

        .feature-card:hover{
            transform:translateY(-8px);
        }

        .stats{
            font-size:2rem;
            font-weight:bold;
            color:#ffc107;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp" />

<div class="container hero text-center">

    <h1 class="hero-title">
        🚀 Live Online Auction System
    </h1>

    <p class="hero-subtitle mt-4">
        Buy. Sell. Compete.<br>
        Experience real-time online bidding from anywhere in the world.
    </p>

    <a href="register.jsp"
       class="btn btn-warning btn-lg px-5 mt-4">
        Get Started
    </a>

</div>

<div class="container pb-5">

    <div class="row text-center mb-5">

        <div class="col-md-3">
            <div class="stats">100+</div>
            <p>Active Auctions</p>
        </div>

        <div class="col-md-3">
            <div class="stats">500+</div>
            <p>Registered Users</p>
        </div>

        <div class="col-md-3">
            <div class="stats">₹10L+</div>
            <p>Total Bids</p>
        </div>

        <div class="col-md-3">
            <div class="stats">24/7</div>
            <p>Online Platform</p>
        </div>

    </div>

    <div class="row g-4">

        <div class="col-md-4">

            <div class="card feature-card p-4 text-center text-light">

                <h3>⚡ Real-Time Bidding</h3>

                <p>
                    Place bids instantly and compete with users live.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card feature-card p-4 text-center text-light">

                <h3>🔒 Secure Platform</h3>

                <p>
                    User authentication and secure auction management.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card feature-card p-4 text-center text-light">

                <h3>🌎 Anywhere Access</h3>

                <p>
                    Access auctions from any device around the world.
                </p>

            </div>

        </div>

    </div>

</div>

</body>
</html>
