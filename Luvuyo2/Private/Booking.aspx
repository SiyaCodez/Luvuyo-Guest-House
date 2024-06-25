<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Luvuyo2.Private.Delux" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        .image-slider {
            margin: 0 0 2rem 0;
            position: relative;
            max-width: 800px;
            margin: 0 auto;
            overflow: hidden;
            top: 120px;
            left: 0px;
        }

        .image-slider img {
            width: 100%;
            height: 100px;
            display: none;
            overflow: hidden;
        }

        .image-slider img.active {
            display: block;
        }

        .arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 30px;
            height: 30px;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
        }

        .text-content {
            opacity: 0;
            animation: slide-in 1s forwards;
            text-align: center;
            margin: 50px auto;
            max-width: 800px;
        }

        @keyframes slide-in {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        #content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

#content-container {
    text-align: center;
    padding: 30px;
    background-color: #f5f5f5;
    border-radius: 2px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#dates-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px;
}

#check-in-date, #check-out-date {
    background-color: #fff;
    padding: 15px;
    border: 1px solid #f1c232;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table[border="0"][cellpadding="2"][cellspacing="2"] {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
}

table[border="0"][cellpadding="2"][cellspacing="2"] th {
    background-color: #007bff;
    color: white;
    padding: 10px;
    text-align: center;
    font-size: 16px;
}

table[border="0"][cellpadding="2"][cellspacing="2"] td {
    padding: 10px;
    text-align: center;
    font-size: 14px;
    cursor: pointer;
}

table[border="0"][cellpadding="2"][cellspacing="2"] td a {
    display: block;
    padding: 10px;
    border-radius: 50%;
    transition: background-color 0.3s, color 0.3s;
}

table[border="0"][cellpadding="2"][cellspacing="2"] td a:hover {
    background-color: #007bff;
    color: white;
}

table[border="0"][cellpadding="2"][cellspacing="2"] .aspNetDisabled a {
    background-color: #ccc;
    cursor: not-allowed;
}

table[border="0"][cellpadding="2"][cellspacing="2"] .aspNetDisabled a:hover {
    background-color: #ccc;
    color: white;
}
.btn-book{
    margin: 2rem 0rem 0 15rem;
    font-family: Poppins-Regular, sans-serif;
font-weight: 800;
font-size: 16px;
letter-spacing: 1px;
display: inline-block;
padding: 10px 32px 12px 32px;
border-radius: 4px;
transition: 0.5s;
text-transform: uppercase;
line-height: 1;
color: #006666;
border: none;
background: rgb(255,215,105);
background: linear-gradient(90deg, rgba(255,215,105,1) 81%, rgba(241,143,1,1) 96%);
}
    </style>

    <div class="content-container">
    <div class="row">
        <div class="col-md-5" style="padding-top: 20rem;">
            <div id="dates-container">
    <div id="check-in-date" style="display: inline-block; margin-right: 20px;">
        <asp:Calendar ID="checkInDate" runat="server" OnSelectionChanged="checkInDate_SelectionChanged"></asp:Calendar>
    </div>
    <div id="check-out-date" style="display: inline-block;">
        <div>
        </div>
        <asp:Calendar ID="checkOutDate" runat="server" OnSelectionChanged="checkOutDate_SelectionChanged" Enabled="False"></asp:Calendar>
    </div>
</div>

<asp:Panel ID="BannerPanel" runat="server" Visible="False">
    <div class="Banner" style="border-style: solid; background-color: #808080; text-align: center;">
        <asp:Label ID="RoomNotAvailable" runat="server" Text=" Room Not Available In Specified Period" ForeColor="White" Visible="False"></asp:Label>
    </div>
</asp:Panel>
 <asp:Button class="btn-book" style="align-items: center;" ID="DeluxeRoomBookingButton" runat="server" Text=" Book this now " OnClick="BookingButton_Click" />
        
        </div>
        <div class="col-md-5">
            <div class="image-slider">
    <asp:Image ID="Image1" CssClass="active" runat="server" ImageUrl="~/images/Delux Suite.jpg" AlternateText="Room 1" Height="500px" style="margin-bottom: 0px" />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/bath2.jpg" AlternateText="Room 2" style="display:none;" Height="500px" />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/bath3.jpg" AlternateText="Room 3" style="display:none;" Height="500px" />

    <div class="arrow prev" onclick="prevSlide()">&#8249;</div>
    <div class="arrow next" onclick="nextSlide()">&#8250;</div>
</div>
        </div>

    </div>
</div>

    <div id="content-container">
        <br />
        
        

        <div class="text-content">
        </div>

       </div>
        <asp:SqlDataSource ID="MakeReservation" runat="server"></asp:SqlDataSource>
    

    <script>
        let slideIndex = 0;
        const slides = document.querySelectorAll('.image-slider img');

        function showSlides() {
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = 'none';
            }

            if (slideIndex >= slides.length) {
                slideIndex = 0;
            } else if (slideIndex < 0) {
                slideIndex = slides.length - 1;
            }

            slides[slideIndex].style.display = 'block';
        }

        function prevSlide() {
            slideIndex--;
            showSlides();
        }

        function nextSlide() {
            slideIndex++;
            showSlides();
        }

        showSlides();
    </script>
</asp:Content>
