<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Luvuyo2.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

<style>
  .section-our-best {
    padding: 15px 0;
  }

  .our-best .img img {
    width: 100%;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .text {
    padding-top: 20px;
    opacity: 0;
    animation: fadeIn 1s forwards;
  }

  @keyframes fadeIn {
    0% {
      opacity: 0;
      transform: translateY(20px);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .text h2.heading {
    font-size: 36px;
    color: #333;
    margin-bottom: 20px;
  }

  .text p {
    font-size: 16px;
    color: #555;
    line-height: 1.8;
  }

  .fa-ul {
    padding-left: 0;
    list-style-type: none;
    font-weight:bold;
    font-family:Poppins-Regular;
  }

  .fa-ul li {
    position: relative;
    padding-left: 2em;
    margin-bottom: 10px;
  }

  .fa-ul li i {
    position: absolute;
    left: 0;
    top: 2px;
    color: #ffcc00; /* Adjust color as needed */
  }

/* Hero Content */
.hero-content {
    /*position: relative;
    width: 100%;*/
    height: 30vh; /* Adjust height as needed */
   background: url(images/img4.jpg);
   display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
text-align: center;
color: white;
animation: zoomIn 20s infinite alternate;
    position: relative;
     background-size: cover;
 background-position: center;
 background-repeat: no-repeat;
    z-index: 2;
    margin-bottom: 20px;
}

.hero-title {
    font-size: 3em;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
}

/* Main Content */
.main-content {
    padding: 20px;
}

/* Zoom-in Animation */
    @keyframes zoomIn {
        0% {
            background-size: 100%;
        }

        100% {
            background-size: 110%;
        }
    }
</style>

        <div class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">About Us</h1>
        </div>
    </div>


<section class="section-our-best bg-white" id="aboutUs">
  <div class="container">
    <div class="our-best">
      <div class="row">
        <div class="col-md-6 col-md-push-6">
          <div class="img" style="font-style: inherit; font-weight: normal">
              <img src="images/happyfolks.jpg" />


          </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
          <div class="text">
            <h2 class="heading" style="font-family: GrandHotel-Regular; font-weight: bold; text-transform: capitalize; color: #FF9900;";">ABOUT US</h2>
            <p style="font-family: Poppins-Regular; font-size: 14px; color: #000">
             Welcome to Luvuyo's Guest House, where a seamless fusion of comfort, charm, and genuine hospitality awaits you. Situated in the heart of Petermaritzburg at 51 Carbis RD Scottsville, our family-owned guest house offers more than just a place to rest – it's a true home away from home. Our dedicated team is committed to providing exceptional service, ensuring a warm and inviting atmosphere, elegantly decorated rooms, and personalized attention to fulfill your every need. Whether your visit is for business or leisure, we invite you to indulge in the perfect blend of modern conveniences and local essence that makes Luvuyo's Guest House a distinctive choice. We eagerly anticipate the opportunity to create unforgettable memories during your stay with us.
            </p>
              <hr />
                            <ul class="fa-ul">
  <li>
    <i class="fas fa-star"></i>
    <i class="fas fa-star"></i>
    <i class="fas fa-star"></i>
    3 Star Guest House
  </li>
  <li>
    <i class="fas fa-wifi"></i>
    Free WIFI
  </li>
  <li>
    <i class="fas fa-parking"></i>
    Free parking
  </li>
  <li>
    <i class="fas fa-swimming-pool"></i>
    Swimming Pool
  </li>
  <li>
    <i class="fas fa-shopping-bag"></i>
    Close to Scottsville Shopping Mall
  </li>
</ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>
