<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Private1.aspx.cs" Inherits="Luvuyo2.Private.Private1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- 
    <style>
        /* Define the animation keyframes for the sliding animation */
        @keyframes slideIn {
            from {
                transform: translateX(-100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
      
        .section-sub-banner {
            padding-top: 80px;
        }

        .bg-9 img {
           
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .bg-9-2 img {
            width: 60%;
            animation: slideIn 2s; /* Apply the slide animation to the images */
        }

        .text-container {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #fff;
        }
        iythombe{
            align-items:center;
        }

        .text-container h2 {
            font-family: Aptos;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .text-container p {
            font-size: 16px;
            margin-bottom: 8px;
        }

        .button-container {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .button-container button {
            padding: 12px 24px;
            background-color: #fff;
            color: #000;
            border: none;
            cursor: pointer;
        }

        .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        section {
            position: relative;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    
        /* your existing styles */
        .section-sub-banner {
            position: relative;
             display: flex;
           
        }

        .button-container {
            position: absolute;
            bottom: 20px; /* adjust the distance from the bottom as needed */
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            z-index: 2;
        }

        .button-container button {
            padding: 12px 24px;
            background-color: #fff;
            color: #000;
            border: none;
            cursor: pointer;
            margin: 0 10px; /* adjust the horizontal margin as needed */
        }
        h5 {
            color: aqua;
            text-align:center;
            font-size:large;
            margin: 5px 0;
           
        }
        h6{
           
            color:aqua;
            text-align:center;
            font-size:large;
        }
    
    </style>
        --%>
    <style>
.breadcrumb {
    position: relative;
    background-image: url('images/img-4.jpg'); 
    background-size: cover; 
    background-position: center; 
    height: 200px; 
    color: white; 
    text-align: center; 
    display: flex;
    align-items: center;
    justify-content: center;
}

.breadcrumb-content {
    max-width: 800px; 
    padding: 20px;
}

.breadcrumb h1 {
    margin: 0;
    font-size: 2.5rem;
}

.breadcrumb p {
    margin: 10px 0 0; 
    font-size: 1.2rem; 
}
    </style>
    <div class="breadcrumb">
    <div class="breadcrumb-content">
        <h1 class="breadcrumb-title">Rooms & Rates</h1>
        <p>Affordable and Quick Checkout Process</p>
    </div>
</div>
</div>

    
    <%-- Accomodations --%>
    <section class="section__container room__container">
      <div class="room__grid">
        <div class="room__card">
          <div class="room__card__image">
            <img src="images/Luxury-Suite.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="fa fa-heart" aria-hidden="true"></i></span>
              <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
              <span><i class="fa fa-shield" aria-hidden="true"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Delux Suite</h4>
            <p>
              Bask in luxury with breathtaking ocean views from your private
              suite.
            </p>
            <h5>Price :<span>R1100,00</span></h5>
            <h5>Capacity : 1</h5>
            <a href="Booking.aspx?RoomType=Delux Suite" class="btn-card" OnClick="dlx_Click">Book Now</a>
          </div>
        </div>
          <div class="room__card">
  <div class="room__card__image">
    <img src="~/images/Delux-Suite.jpg" alt="room" />
    <div class="room__card__icons">
      <span><i class="fa fa-heart" aria-hidden="true"></i></span>
      <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
      <span><i class="fa fa-shield" aria-hidden="true"></i></span>
    </div>
  </div>
  <div class="room__card__details">
    <h4>Luxury Suite</h4>
    <p>
      Experience urban elegance and modern comfort in the heart of the city.
    </p>
    <h5> Price : <span>R2500,00</span></h5>
    <h5>Capacity : 3</h5>
    <a href="Booking.aspx?RoomType=Luxury Suite" class="btn-card">Book Now</a>
  </div>
</div><div class="room__card">
  <div class="room__card__image">
    <img src="~/images/Premier.jpg" alt="room" />
    <div class="room__card__icons">
      <span><i class="fa fa-heart" aria-hidden="true"></i></span>
      <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
      <span><i class="fa fa-shield" aria-hidden="true"></i></span>
    </div>
  </div>
  <div class="room__card__details">
    <h4>Premier Suite</h4>
    <p>
      Spacious and inviting, perfect for creating cherished memories with loved ones.
    </p>
    <h5>Price : <span>R2100,00</span></h5>
    <h5>Capacity : 2</h5>
    <a href="Booking.aspx?RoomType=Premier Suite" class="btn-card">Book Now</a>
  </div>
</div>
  </div>
</section>

        <%-- 
    <section class="section-sub-banner bg-9-2">
        <div class= "section-sub-banner">
            <div class="bg-9-2" style="position: relative;">
               <a href="Booking.aspx?RoomType=Delux Suite"> <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Delux Suite.jpg" Width="500px" OnClick="dlx_Click" /></a>
                <div class="image-overlay" style="width: 200px;"></div>
            </div>
            <div class="container">
                <div class="text-container">
                   
                </div>
            </div>
        </div>
    </section>
       
            <h5 style="top: 32px">DELUX SUITE</h5>
            <h6>PRICE: R1100</h6>
            <h6>CAPACITY: 1</h6>
      
    <section class="section-sub-banner bg-9-2">
        <div class ="sub-banner">
            <div class="bg-9-2" style="position: relative;">
                   <a href="Booking.aspx?RoomType=Luxury Suite">  <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Luxury Suite.jpg" Width="500px" /></a>
           
               
                <div class="image-overlay" style="width: 200px;"></div>
                  
        
            </div>
              

            <div class="container">
               
                 
                </div>
            </div>
        </div>
             
    </section>

          <h5>LUXURY SUITE</h5>
            <h6 style="top: 32px">PRICE: R2500</h6>
            <h6>CAPACITY: 3</h6>
      
    <section class="section-sub-banner bg-9-2">
        <div class ="sub-banner">
            <div class="bg-9-2" style="position: relative;">
              <a href="Booking.aspx?RoomType=Premier Suite">  <asp:Image ID="Image3" runat="server" ImageUrl="~/images/Premier Suite.jpg" Width="500px" /></a>
                <div class="image-overlay" style="width: 200px;"></div>
            </div>
            <div class="container">
                <div class="text-container">
                   
                </div>
            </div>
        </div>
    </section>
     
          <h5>PREMIER SUITE</h5>
          <h6>PRICE: R2100</h6>
          <h6>CAPACITY: 2</h6>

</div>

            --%>
</asp:Content>
