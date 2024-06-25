<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Luvuyo2.Gallary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style>
    h2 {
        text-align: center;
        padding-top: 20px;
    }

    .gallery {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 20px;
    }

    .gallery-item {
        position: relative;
        overflow: hidden;
        width: 300px;
        height: 300px;
        margin: 10px;
        cursor: pointer;
        transition: transform 0.2s;
    }

    .gallery-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .gallery-item h2 {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        background: rgba(0, 0, 0, 0.7);
        color: #fff;
        padding: 10px 5px;
        margin: 0;
        opacity: 0;
        transform: translateY(50%);
        transition: opacity 0.2s, transform 0.2s;
    }

    .gallery-item:hover {
        transform: scale(1.05);
    }

    .gallery-item:hover h2 {
        opacity: 1;
        transform: translateY(0);
    }

  
</style>



<div>
    <hr style="margin-top: 20px;">
    <h2>Gallery</h2>
    <hr>
</div>
    <h1 style="font-family: Poppins-Bold; font-size: 35px; font-weight: bold; text-transform: capitalize; position: relative; LEFT: 780px; color: #FF9900;">A LOOK AT OUR FACILITIES</h1>
<div class="gallery">
    <div class="gallery-item">
        <img src="images/Luxury Suite.jpg" alt="Luxury Room">
        <h2>Luxury Room</h2>
    </div>
    <div class="gallery-item">
        <img src="images/Delux Suite.jpg" alt="Deluxe Room">
        <h2>Deluxe Room</h2>
    </div>
    <div class="gallery-item">
        <img src="images/R3.jpg" alt="Superior Room">
        <h2>Superior Room</h2>
    </div>
    <div class="gallery-item">
        <img src="images/R4.jpg" alt="Premium Room">
        <h2>Premium Room</h2>
    </div>
    <div class="gallery-item">
        <img src="images/Outside.jpg" alt="Outside View">
        <h2>Outside View</h2>
    </div>
     <div class="gallery-item">
         <img src="images/out.jpg" alt="Pool Area" />
        <h2>Pool Area</h2>
    </div>
     <div class="gallery-item">
         <img src="images/parking.jpg" alt="Parkimg Area">
        <h2>Parking Area</h2>
    </div>
     <div class="gallery-item">
      "<img src="images/reception.jpg" alt="Reception" />
        <h2>Reception</h2>
    </div>
     <div class="gallery-item">
         <img src="images/view.jpg" alt="Night View" />
        <h2>Night View</h2>
    </div>
     <div class="gallery-item">
         <img src="images/home.jpg"  alt="" />
        <h2>Bathroom </h2>
    </div>
</div>
<br />
  
    <%--   <h1 style="font-family: 'Times New Roman', Times, serif; font-size: xx-large; font-weight: bold; text-transform: capitalize; position: relative; LEFT: 780px; color: #FF9900;">LUVUYO'S GUESTHOUSE</h1>
    
        --%>
        



</asp:Content>
