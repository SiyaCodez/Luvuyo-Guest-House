<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Guest.aspx.cs" Inherits="Luvuyo2.Private.Guest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="guest-form">
        <h2>Enter Your Details for Booking</h2>
         <div class="form-group">
            <asp:Label ID="lblSurname" runat="server" Text="GuestSurname:"></asp:Label>
            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblName" runat="server" Text="GuestName:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="GuestEmail:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPhone" runat="server" Text="GuestContact:"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        </div>

    <div class="calendar-container">
    <div class="form-group">
        <div class="row">
            <div class="col-md-6">
                <br />
               
            </div>
            <div class="col-md-6">
                <br />

                <br />
               
            </div>
        </div>
        
    </div>
</div>

            <hr />
            <div class="form-group" style="height: 250px">
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
            </div>
       

        <div class="form-group" style="text-align: center">
            
        </div>
    

<asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

   



</asp:Content>
