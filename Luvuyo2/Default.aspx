<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Luvuyo2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



   <div class="hero-container" id="hero">
      <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active" style="background-image: url(images/Homee.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h1 class="animate__animated animate__fadeInDown">Welcome to</h1>
                <h2 class="animate__animated animate__fadeInDown">Luvuyo's Guest House</h2>
                <p class="animate__animated animate__fadeInUp">Experience comfort and charm in our cozy retreat. Book your stay with us and feel right at home. Explore, relax, and enjoy!</p>
                <div>
                  <a href="#accomodation" class="btn-get-started animate__animated animate__fadeInUp scrollto">View Accomodations</a>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div style="background: rgb(0,102,102);
background: linear-gradient(115deg, rgba(0,102,102,1) 39%, rgba(10,155,155,0.8156512605042017) 88%); border-radius: 0px 0 15px 15px; margin-left: 30px; margin-right: 30px; margin-top: -20px;margin-bottom:20px">
        <h2 style="color: #f1c232; padding-top: 40px; font-family: GrandHotel-Regular; letter-spacing: 2px; font-size: 45px; text-align: center;">Best For Your Partner, Friend and Family Get Away</h2>
        <p style="color:#fff; font-size: 15px; text-align: center;" >We eagerly anticipate the opportunity to create unforgettable memories during your stay with us</p>
        <h3 id="accomodation" style=" font-family: GrandHotel-Regular;padding-top: 5px; padding-bottom: 40px; font-size: 25px; font-weight: 300; text-align: center; position: relative;  color: #f1c232;"> View Available Accomodation</h3>
    </div>
 
               
    
    <asp:MultiView runat="server"></asp:MultiView>

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
            <h5>Starting from <span>R1100,00</span></h5>
            <a href="Private/Booking.aspx?RoomType=Delux Suite" class="btn-card">Book Now</a>
          </div>
        </div>
          <div class="room__card">
  <div class="room__card__image">
    <img src="images/Delux-Suite.jpg" alt="room" />
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
    <h5>Starting from <span>R2500,00</span></h5>
    <a href="Private/Booking.aspx?RoomType=Luxury Suite" class="btn-card">Book Now</a>
  </div>
</div><div class="room__card">
  <div class="room__card__image">
    <img src="images/Premier.jpg" alt="room" />
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
    <h5>Starting from <span>R2100,00</span></h5>
    <a href="Private/Booking.aspx?RoomType=Premier Suite" class="btn-card">Book Now</a>
  </div>
</div>
          <div class="room__card">
  <div class="room__card__image">
    <img src="images/Del.jpg" alt="room" />
    <div class="room__card__icons">
      <span><i class="fa fa-heart" aria-hidden="true"></i></span>
      <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
      <span><i class="fa fa-shield" aria-hidden="true"></i></span>
    </div>
  </div>
  <div class="room__card__details">
    <h4>Deluxe View</h4>
    <p>
      Bask in luxury with breathtaking ocean views from your private
      suite.
    </p>
    <h5>Starting from <span>R2500,00</span></h5>
    <a href="Private/Booking.aspx?RoomType=Delux Suite" class="btn-card">Book Now</a>
  </div>
</div>
        <div class="room__card">
          <div class="room__card__image">
            <img src="images/lux.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="fa fa-heart" aria-hidden="true"></i></span>
              <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
              <span><i class="fa fa-shield" aria-hidden="true"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Luxury Suite View</h4>
            <p>
              Experience urban elegance and modern comfort in the heart of the
              city.
            </p>
            <h5>Starting from <span>R2100,00</span></h5>
            <a href="Private/Booking.aspx?RoomType=Luxury Suite" class="btn-card">Book Now</a>
          </div>
        </div>
        <div class="room__card">
          <div class="room__card__image">
            <img src="images/premm.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="fa fa-heart" aria-hidden="true"></i></span>
              <span><i class="fa fa-trophy" aria-hidden="true"></i></span>
              <span><i class="fa fa-shield" aria-hidden="true"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Family Retreat</h4>
            <p>
              Spacious and inviting, perfect for creating cherished memories
              with loved ones.
            </p>
            <h5>Starting from <span>R5000,00</span></h5>
              <a href="Private/Booking.aspx?RoomType=Premier Suite" class="btn-card">Book Now</a>
          </div>
        </div>
      </div>
    </section>

    <%-- Counter Section --%>
    <div style="background-image : url(images/Delux-Suite-Lounge.jpg); background-size: cover;" class="counter-wrapper">
            <div class="counter">
                <h1 class="count" data-target="1530">1530</h1>
                <p>Current Guest Stay</p>
            </div>
            <div class="counter">
                <h1 class="count" data-target="2040">2040</h1>
                <p>Guest Visits</p>
            </div>
            <div class="counter">
                <h1 class="count" data-target="10">10</h1>
                <p>Parking Available</p>
            </div>
            <div class="counter">
                <h1 class="count" data-target="6">6</h1>
                <p>Professional Friendly Staff</p>
            </div>
        </div>

        <%-- Customer Reviews --%>
     <div class="testimonial__container">
      <div class="preamble">
        <p></p>
        <h1>What our guest's say about us</h1>
      </div>
      <div class="testimonials__grid">
        <div class="card">
          <span><i class="ri-double-quotes-l"></i></span>       
          <p>
            "Absolutely loved my stay! The room was clean, cozy, and beautifully decorated. The staff were incredibly friendly and helpful, always ready with a smile. The location was perfect, close to the beach and local attractions. I highly recommend this place to anyone looking for a relaxing getaway."
          </p>
            <p class="rating">★★★★★</p>
          <hr />
          <img src="images/pic1.jpg" alt="user" />
          <p class="name">Sthembile Sithole</p>
        </div>
        <div class="card">
          <span><i class="ri-double-quotes-l"></i></span>
          <p>
            "Great guest house with a very homely feel. The breakfast was delicious, and the garden area was a lovely spot to relax in the evenings. The only downside was the slightly noisy air conditioning unit, but it didn’t detract too much from an otherwise wonderful stay. Would definitely come back!"
          </p>
            <p class="rating">★★★★★</p>
          <hr />
          <img src="images/pic2.jpg" alt="user" />
          <p class="name">Carey Van Stock</p>
        </div>
        <div class="card">
          <span><i class="ri-double-quotes-l"></i></span>
          <p>
           "The guest house was nice, and the staff were very polite. The room was spacious and had a comfortable bed. However, I found the Wi-Fi to be quite slow, which was a bit inconvenient as I had some work to do. Overall, a decent place to stay if you don’t need fast internet."
          </p>
            <p class="rating">★★★★☆</p>
          <hr />
          <img src="images/pic3.jpg" alt="user" />
          <p class="name"> Mohammed Ramkisson</p>
        </div>
      </div>
      <div class="Book-Us">
        <h4> Stay with us</h4>
        <p>
         Enjoy cozy, beautifully decorated rooms, delicious breakfasts, and a friendly staff ready to make your stay memorable.
        </p>
      </div>
    </div>
        
</asp:Content>
