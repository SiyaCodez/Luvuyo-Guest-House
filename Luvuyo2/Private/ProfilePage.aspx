<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="Luvuyo2.Private.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .textB{
            margin-left:50px;
        }
        .textB2{
            margin-left:84px;
        }
        .textB3{
            margin-left:78px;
        }
    </style>
<div>
    <br /><br />
    <h1 style="text-decoration: underline; font-family: 'Arial Rounded MT Bold'">Account Information.</h1>
</div>
 <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                     <h3 style="text-decoration: underline; font-family: 'Arial Rounded MT Bold'">Update Personal Information.</h3>
                    <div class="text-label">
                        <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Width="266px" CssClass="textB"></asp:TextBox>
                    </div>
                    <div class="text-label">
                        <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="266px" CssClass="textB"></asp:TextBox>
                    </div>
                    <div class="text-label">
                        <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Width="266px" CssClass="textB2"></asp:TextBox>
                    </div>
                    <div class="text-label">
                        <asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" Width="266px" CssClass="textB3"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" BackColor="#003300" ForeColor="#CC9900" Width="79px"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="History" OnClick="Button3_Click" BackColor="#003300" ForeColor="#CC9900" Width="79px"/>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <h3 style="text-decoration: underline; font-family: 'Arial Rounded MT Bold'">Booking History.</h3>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RoomId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="819px" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ReservationDate" DataFormatString="{0:d}" HeaderText="Booking Date" SortExpression="ReservationDate" />
                            <asp:BoundField DataField="RoomId" HeaderText="Room" SortExpression="RoomId" />
                            <asp:BoundField DataField="CheckInDate" DataFormatString="{0:d}" HeaderText="Check In" SortExpression="CheckInDate" />
                            <asp:BoundField DataField="CheckOutDate" DataFormatString="{0:d}" HeaderText="Check Out" SortExpression="CheckOutDate" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <hr />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RoomID" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Width="815px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="RoomNumber" HeaderText="Room" SortExpression="RoomNumber" />
                            <asp:BoundField DataField="RoomType" HeaderText="Room Type" SortExpression="RoomType" />
                            <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT RoomNumber, RoomType, capacity, Price, RoomID FROM Rooms WHERE (RoomID = @roomid)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="roomid" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Guest.GuestEmail, Reservation.ReservationDate, ReservationRoom.RoomId, ReservationRoom.CheckInDate, ReservationRoom.CheckOutDate FROM Guest INNER JOIN Reservation ON Guest.GuestID = Reservation.GuestID INNER JOIN ReservationRoom ON Reservation.ReservationID = ReservationRoom.ReservationId WHERE (Guest.GuestEmail = @Email)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox3" Name="Email" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" BackColor="#003300" ForeColor="#CC9900" Width="79px"/>
                </asp:View>
</asp:MultiView>
</asp:Content>
