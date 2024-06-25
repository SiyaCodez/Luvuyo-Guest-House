<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Private2.aspx.cs" Inherits="Luvuyo2.Private.Private2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





    <div class="guest-form">
        <h2 style=" padding-top: 6rem; text-align: center; color: #006666; font-family: Poppins-Bold; font-size: 40px; font-weight: bold; padding-bottom: 10px;">Booking History</h2>
        <div class="form-group">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" SelectCommand="SELECT Rooms.RoomNumber AS [Room Number], Rooms.RoomType AS [Room Type], Payment.PaymentDate AS [Payment Date], Payment.PaymentAmount AS Total, Reservation.ReservationDate AS [Booking Date], ReservationRoom.CheckInDate AS [Check In], ReservationRoom.CheckOutDate AS [Check Out], Reservation.GuestID FROM Rooms INNER JOIN Reservation ON Rooms.RoomID = Reservation.RoomID INNER JOIN ReservationRoom ON Rooms.RoomID = ReservationRoom.RoomId AND Reservation.ReservationID = ReservationRoom.ReservationId INNER JOIN Payment ON Reservation.PaymentID = Payment.PaymentId WHERE (Payment.GuestId = @guest) AND (Reservation.GuestID = @guest)">
                <SelectParameters>
                    <asp:SessionParameter Name="guest" SessionField="userLogged" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group">
        </div>
      

    </div>
    <div class="form-container">
      <div class="form-group" style="align-items: center;text-align: center; padding-top: 20px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="Horizontal" HorizontalAlign="Center" Width="1163px">
                <Columns>
                    <asp:BoundField DataField="Room Number" HeaderText="Room Number" SortExpression="Room Number" />
                    <asp:BoundField DataField="Room Type" HeaderText="Room Type" SortExpression="Room Type" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    <asp:BoundField DataField="Payment Date" DataFormatString="{0:d}" HeaderText="Payment Date" SortExpression="Payment Date" />
                    <asp:BoundField DataField="Booking Date" DataFormatString="{0:d}" HeaderText="Booking Date" SortExpression="Booking Date" />
                    <asp:BoundField DataField="Check In" DataFormatString="{0:d}" HeaderText="Check In" SortExpression="Check In" />
                    <asp:BoundField DataField="Check Out" DataFormatString="{0:d}" HeaderText="Check Out" SortExpression="Check Out" />
                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
       </div>
    <div id="reservationDetailsContainer" runat="server" class="reservation-details"></div>

    <style>
        .form-container{
            width: 80%; 
            margin: 0 auto; 
            text-align: center; 
        }
        .form-container .aspNet-GridView {
            width: 100%;
        }
        .guest-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f9f9f9;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .label-text {
            display: block;
            color: #555;
            font-family: Poppins-Regular;
            font-size: 16px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border: 1px solid #007bff;
        }

        .reservation-details {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f9f9f9;
        }
    </style>



</asp:Content>
