<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Luvuyo2.Private.WebForm1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>   
    footer,.navbar{
        display:none;
    }
    .buttons-s{
        margin-top: 10px;
        align-items: center;
        font-family: Poppins-Regular;
font-size: 1.3rem;
text-transform: uppercase;
color: #fff;
background: #006666;
border: none;
border-radius: 5px;
padding: 0.7rem 1.5rem;
cursor: pointer;
transition: all 0.4s ease;
    }
    .buttons-s:hover{
        opacity: 0.8;
    }
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 3;
  left: 0;
   background: rgb(0,102,102);
 background: linear-gradient(115deg, rgba(0,102,102,1) 39%, rgba(10,155,155,0.8156512605042017) 88%);
  /*overflow-x: hidden;*/
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #f1f1f1;
  display: block;
        height: 32px;
        width: 160px;
    }

.sidenav a.view-link {
  font-size: 18px;
}

.sidenav a.view-guest {
  font-size: 16px;
}

.sidenav a:hover {
  color: #000000;
}



@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.Contents{
    margin-left:200px;
             
}

.grid-view-container {
            border-color: #008080;
            border-style: solid;
            float: left;
            width: 50%;
        }

        .details-view-container {
            border-color: #800000;
            border-style: solid;
            float: right;
            width: 40%;
            text-align: left;
        }
 .image-container {
    display: flex;
}

.image {
    width: 350px; /* Adjust the width as needed */
    height: 300px; /* Adjust the height as needed */
    margin-right: 10px; /* Adjust the margin as needed */
    transition: transform 0.3s; /* Add a smooth transition effect */

}

.image:hover {
    transform: scale(1.1); /* Increase the size on hover */
    /* You can also add other styles for the hover effect */
}
 .main-container {
        display: flex;
    }

    .grid-container {
        flex: 1;
        margin-right: 20px; /* Adjust the margin as needed */
    }

    .add-perishables-container {
        width: 264px; /* Adjust the width as needed */
    }
    .input{
        display:flex;
    }
    .lbl{
        font-family: Poppins-Regular;
        color:cadetblue;
        font-size:medium;
    }
    .btn{
        background-color:white;
        color:black;
    }
</style>
   

    


<div class="admin-page">
    <div class="sidenav" style="float:left">
    <h3 style="text-decoration: underline">Management</h3>
        <asp:Button ID="Button1" runat="server" Text="Guest Information" OnClick="Button1_Click" CssClass="btn" style="margin-bottom: 10px; margin-left: 5px" Width="192px" />
        <asp:Button ID="Button2" runat="server" Text="Room Information" OnClick="Button2_Click" CssClass="btn" style="margin-bottom: 10px; margin-left: 5px" Width="192px" />
        <asp:Button ID="Button3" runat="server" Text="Stock Information" OnClick="Button3_Click" CssClass =" btn" style="margin-bottom: 10px; margin-left: 5px" Width="192px"/>
        <asp:Button ID="Button8" runat="server" Text="Reports" CssClass =" btn" style="margin-bottom: 10px; margin-left: 7px" Width="192px" OnClick="Button8_Click1"/>
        <asp:Button ID="Button10" runat="server" Text="↩ Go Back" CssClass="btn" style="margin-bottom: 10px; margin-left: 7px" Width="192px" OnClick="Button10_Click" />
</div>
<%--<div class="main">
  <h2>Luvuyos Guest House Admin Side</h2>

</div>--%>

    <div class="Contents" style="border-color:#f1c232; border: 1px solid #f1c232;margin-left:200px;width:100%;height:100%">
       <h1 style="font-family: GrandHotel-Regular; text-align: center; text-decoration: none; color: #f1c232;">Luvuyo Management System</h1>
        <hr />
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="view1" runat="server">
                <h1 style="font-family: Poppins-Regular; text-decoration: none; color: #006666;"> Rooms Currently Occupied.</h1>
                <hr style="color: #008080" />
                <div style="float: left; margin-right:10px;">
 
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RoomID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="774px" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:CommandField ShowSelectButton="True" />
                          <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                          <asp:BoundField DataField="RoomType" HeaderText="Room Type" SortExpression="RoomType" />
                          <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
                          <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                      </Columns>
                      <EditRowStyle BackColor="#7C6F57" />
                      <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#E3EAEB" />
                      <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#F8FAFA" />
                      <SortedAscendingHeaderStyle BackColor="#246B61" />
                      <SortedDescendingCellStyle BackColor="#D4DFE1" />
                      <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" DeleteCommand="DELETE FROM [Guest] WHERE [GuestID] = @original_GuestID AND [GuestSurname] = @original_GuestSurname AND [GuestName] = @original_GuestName AND [GuestEmail] = @original_GuestEmail AND [GuestContact] = @original_GuestContact" InsertCommand="INSERT INTO [Guest] ([GuestSurname], [GuestName], [GuestEmail], [GuestContact]) VALUES (@GuestSurname, @GuestName, @GuestEmail, @GuestContact)" OldValuesParameterFormatString="original_{0}" SelectCommand="  select * from Rooms where RoomID IN(select Reservation.RoomID from Reservation,ReservationRoom where Reservation.ReservationID=ReservationRoom.ReservationId and Reservation.RoomID=ReservationRoom.RoomId and convert(date,CheckInDate) &lt;= convert(date,getdate()) and convert(date,CheckOutDate) &gt; convert(date,getdate()));" UpdateCommand="UPDATE [Guest] SET [GuestSurname] = @GuestSurname, [GuestName] = @GuestName, [GuestEmail] = @GuestEmail, [GuestContact] = @GuestContact WHERE [GuestID] = @original_GuestID AND [GuestSurname] = @original_GuestSurname AND [GuestName] = @original_GuestName AND [GuestEmail] = @original_GuestEmail AND [GuestContact] = @original_GuestContact">
                        <DeleteParameters>
                            <asp:Parameter Name="original_GuestID" Type="Int32" />
                            <asp:Parameter Name="original_GuestSurname" Type="String" />
                            <asp:Parameter Name="original_GuestName" Type="String" />
                            <asp:Parameter Name="original_GuestEmail" Type="String" />
                            <asp:Parameter Name="original_GuestContact" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="GuestSurname" Type="String" />
                            <asp:Parameter Name="GuestName" Type="String" />
                            <asp:Parameter Name="GuestEmail" Type="String" />
                            <asp:Parameter Name="GuestContact" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="GuestSurname" Type="String" />
                            <asp:Parameter Name="GuestName" Type="String" />
                            <asp:Parameter Name="GuestEmail" Type="String" />
                            <asp:Parameter Name="GuestContact" Type="Int32" />
                            <asp:Parameter Name="original_GuestID" Type="Int32" />
                            <asp:Parameter Name="original_GuestSurname" Type="String" />
                            <asp:Parameter Name="original_GuestName" Type="String" />
                            <asp:Parameter Name="original_GuestEmail" Type="String" />
                            <asp:Parameter Name="original_GuestContact" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
                <div style="float:left;margin-left:20px; height: 258px;">

                    <asp:DetailsView ID="DetailsView1" runat="server" Height="184px" Width="435px" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="GuestID" DataSourceID="SqlDataSource5" GridLines="Vertical" ForeColor="Black">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="GuestSurname" HeaderText="Last name" SortExpression="GuestSurname" />
                            <asp:BoundField DataField="GuestName" HeaderText="First Name" SortExpression="GuestName" />
                            <asp:BoundField DataField="GuestEmail" HeaderText="Email" SortExpression="GuestEmail" />
                            <asp:BoundField DataField="GuestContact" HeaderText="Phone" SortExpression="GuestContact" />
                        </Fields>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select * from Guest where GuestID IN(select Reservation.GuestID FROM Reservation,ReservationRoom where Reservation.ReservationID = ReservationRoom.ReservationId and Reservation.RoomID = ReservationRoom.RoomId and Reservation.RoomID = @id and convert(date,CheckInDate) &lt;= convert(date,getdate()) and convert(date,CheckOutDate) &gt; convert(date,getdate()));">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                     <div >
                    <asp:Button ID="Button4" class="buttons-s" runat="server" Text="Check Out" OnClick="Button4_Click" Visible="False" />

                </div>
                </div>
                
                
                <div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" SelectCommand="SELECT Guest.GuestID, Rooms.RoomType, ReservationRoom.CheckInDate, ReservationRoom.CheckOutDate, Rooms.RoomNumber, Rooms.Price, Reservation.ReservationID FROM Guest INNER JOIN Reservation ON Guest.GuestID = Reservation.GuestID INNER JOIN Rooms ON Reservation.RoomID = Rooms.RoomID INNER JOIN ReservationRoom ON Reservation.ReservationID = ReservationRoom.ReservationId WHERE (Guest.GuestID = @id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
             </asp:View>
    <nbsp>
    </nbsp>

            <asp:View ID="view2" runat="server">
              <h1 style="font-family: Poppins-Regular; color: #006666">Booking History Per Room.</h1>
                <div style="height: 274px">

             
         <div style="border-color:#008080; border-style: solid; float: left; margin-right:10px;">

                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RoomID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="776px" Height="115px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                        <asp:BoundField DataField="RoomType" HeaderText="Room Type" SortExpression="RoomType" />
                        <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
             
                </div>
                <div style="float:left;margin-left:30px;height:115px">
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RoomID" DataSourceID="SqlDataSource9" ForeColor="Black" GridLines="Vertical" Height="16px" Width="753px" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="GuestName" HeaderText="First Name" SortExpression="GuestName" />
                            <asp:BoundField DataField="GuestSurname" HeaderText="Last Name" SortExpression="GuestSurname" />
                            <asp:BoundField DataField="GuestEmail" HeaderText="Email" SortExpression="GuestEmail" />
                            <asp:BoundField DataField="GuestContact" HeaderText="Phone" SortExpression="GuestContact" />
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
                    <asp:Button ID="Button9" class="buttons-s" runat="server" Text="Check Out" OnClick="Button9_Click" BorderColor="#0066677" Visible="False" />
                 </div>
                    <br /><br /><br /><br />
                </div>
                <br /><br />
                <div style="float:left;width:100%" class="update-room-info">
                    <div style="float:left; width: 1091px;">
                        <h3 style="font-family: Poppins-Regular; color: #006666">Update Room Information </h3>
                       
                        <asp:Label ID="Label4" CssClass="lbl" runat="server" Text="Room Type"></asp:Label>
                        <div class="input" style="width:100%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="760px" Height="30px"></asp:TextBox>
                         </div>
                        <asp:Label ID="Label8" CssClass="lbl" runat="server" Text="Price"></asp:Label>
                                  <div class="input">
                                  <asp:TextBox ID="TextBox5" runat="server" Width="760px" Height="30px"></asp:TextBox>
                             </div>
                        <asp:Button ID="Button7" class="buttons-s" runat="server" Text="Update"  Height="32px"  Width="117px" OnClick="Button7_Click" />
                        <br />
                         <h3 style="font-family: Poppins-Regular; color: #006666">Add New Room.</h3>
                     
                        <asp:Label ID="Label7" CssClass="lbl" runat="server" Text="Room Type"></asp:Label>
                        <div class="input">
                            <asp:TextBox ID="TextBox4" runat="server" Width="760px" Height="30px"></asp:TextBox>
                         </div>
                         <asp:Label ID="Label5" CssClass="lbl" runat="server" Text="Capacity"></asp:Label>
                          <div class="input">
                               <asp:TextBox ID="TextBox2" runat="server" Width="760px" Height="30px"></asp:TextBox>
                              </div>
                                  

                                  <asp:Label ID="Label6" CssClass="lbl" runat="server" Text="Price"></asp:Label>
                                  <div class="input">
                                  <asp:TextBox ID="TextBox3" runat="server" Width="761px" Height="30px"></asp:TextBox>
                             </div>
                          
                        <asp:Button ID="Button6" class="buttons-s" runat="server" Text="Save" Height="32px" OnClick="Button6_Click" Width="117px" />
                    </div>
                </div>
         
               
                <div>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" SelectCommand="SELECT Reservation.RoomID, ReservationRoom.CheckInDate, ReservationRoom.CheckOutDate, Guest.GuestName, Guest.GuestSurname, Rooms.RoomNumber, Rooms.RoomType FROM Rooms INNER JOIN ReservationRoom ON Rooms.RoomID = ReservationRoom.RoomId INNER JOIN Reservation ON Rooms.RoomID = Reservation.RoomID INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID WHERE (Reservation.RoomID = @id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView3" Name="id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style=" margin-bottom: 20px">                  
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" SelectCommand="SELECT Reservation.RoomID, Rooms.RoomType, ReservationRoom.RoomId AS Expr1, Rooms.RoomNumber FROM Reservation INNER JOIN ReservationRoom ON Reservation.ReservationID = ReservationRoom.ReservationId INNER JOIN Rooms ON Reservation.RoomID = Rooms.RoomID ORDER BY Rooms.RoomType, Reservation.RoomID"></asp:SqlDataSource>
                </div>
     </asp:View>

         

            <asp:View ID="view3" runat="server">
               <h1 style="font-family: Poppins-Regular; color: #006666">Perishables Management.</h1>
                <div class="image-container"style="margin-bottom: 50px;">
                    <asp:Image ID="Image1" runat="server" CssClass="image" ImageUrl="~/Images/Bodyloation.png"/>
                    <asp:Image ID="Image2" runat="server" CssClass="image" ImageUrl="~/Images/hand1.jpg" />
                    <asp:Image ID="Image3" runat="server" CssClass="image" ImageUrl="~/Images/shower1.jpg" />
                    <asp:Image ID="Image4" runat="server" CssClass="image" ImageUrl="~/Images/tissue2.jpg" />
         
                </div>
                <div>
                    <nbsp>

                    </nbsp>
                    
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Inventory_ID" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" Width="1000px" Height="194px" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Item_Name" HeaderText="Item" SortExpression="Item_Name" />
                            <asp:BoundField DataField="Stock_Quantity" HeaderText="Quantity" SortExpression="Stock_Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit Price" SortExpression="Unit_Price" />
                            <asp:BoundField DataField="Total_Price" HeaderText="Total Price" SortExpression="Total_Price" />
                            <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier" SortExpression="Supplier_Name" />
                            <asp:BoundField DataField="Supplier_Email" HeaderText="Supplier Email" SortExpression="Supplier_Email" />
                            <asp:BoundField DataField="Supplier_Phone" HeaderText="Supplier Phone" SortExpression="Supplier_Phone" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" DeleteCommand="DELETE FROM [Inventory] WHERE [Inventory_ID] = @original_Inventory_ID AND [Item_Name] = @original_Item_Name AND [Stock_Quantity] = @original_Stock_Quantity AND [Unit_Price] = @original_Unit_Price AND [Total_Price] = @original_Total_Price" InsertCommand="INSERT INTO [Inventory] ([Item_Name], [Stock_Quantity], [Unit_Price], [Total_Price]) VALUES (@Item_Name, @Stock_Quantity, @Unit_Price, @Total_Price)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Inventory.Item_Name, Inventory.Stock_Quantity, Inventory.Unit_Price, Inventory.Total_Price, Inventory.Inventory_ID, Inventory.SupplierID, Supplier.Supplier_Name, Supplier.Supplier_Email, Supplier.Supplier_Phone FROM Inventory INNER JOIN Supplier ON Inventory.SupplierID = Supplier.Supplier_ID" UpdateCommand="UPDATE [Inventory] SET [Item_Name] = @Item_Name, [Stock_Quantity] = @Stock_Quantity, [Unit_Price] = @Unit_Price, [Total_Price] = @Total_Price WHERE [Inventory_ID] = @original_Inventory_ID AND [Item_Name] = @original_Item_Name AND [Stock_Quantity] = @original_Stock_Quantity AND [Unit_Price] = @original_Unit_Price AND [Total_Price] = @original_Total_Price">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Inventory_ID" Type="Int32" />
                            <asp:Parameter Name="original_Item_Name" Type="String" />
                            <asp:Parameter Name="original_Stock_Quantity" Type="Int32" />
                            <asp:Parameter Name="original_Unit_Price" Type="Decimal" />
                            <asp:Parameter Name="original_Total_Price" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Item_Name" Type="String" />
                            <asp:Parameter Name="Stock_Quantity" Type="Int32" />
                            <asp:Parameter Name="Unit_Price" Type="Decimal" />
                            <asp:Parameter Name="Total_Price" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Item_Name" Type="String" />
                            <asp:Parameter Name="Stock_Quantity" Type="Int32" />
                            <asp:Parameter Name="Unit_Price" Type="Decimal" />
                            <asp:Parameter Name="Total_Price" Type="Decimal" />
                            <asp:Parameter Name="original_Inventory_ID" Type="Int32" />
                            <asp:Parameter Name="original_Item_Name" Type="String" />
                            <asp:Parameter Name="original_Stock_Quantity" Type="Int32" />
                            <asp:Parameter Name="original_Unit_Price" Type="Decimal" />
                            <asp:Parameter Name="original_Total_Price" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                     <div style="float: right">
                         .<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" SelectCommand="SELECT [Item_Name], [Stock_Quantity] FROM [Inventory]"></asp:SqlDataSource>

                     </div>
                </div>
                <div>
                    

    <div>
         <h3 style="font-family: Poppins-Regular; color: #006666">Add Perishable.</h3>
                     
                        <asp:Label ID="Label1" CssClass="lbl" runat="server" Text="Item Name: "></asp:Label>
                        <div class="input">
                            <asp:TextBox ID="TextBox6" runat="server" Width="760px" Height="30px"></asp:TextBox>
                         </div>
                         <asp:Label ID="Label2" CssClass="lbl" runat="server" Text="Quantity"></asp:Label>
                          <div class="input">
                               <asp:TextBox ID="TextBox7" runat="server" Width="760px" Height="30px"></asp:TextBox>
                              </div>
                        <asp:Label ID="Label3" CssClass="lbl" runat="server" Text="Unit Price:"></asp:Label>
                          <div class="input">
                               <asp:TextBox ID="TextBox8" runat="server" Width="760px" Height="30px"></asp:TextBox>

                              </div>
                             <asp:Label ID="Label9" CssClass="lbl" runat="server" Text="Supplier"></asp:Label>
                          <div class="input">
                              <asp:DropDownList Width="760px" Height="30px" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource10" DataTextField="Supplier_Name" DataValueField="Supplier_ID"></asp:DropDownList>
                              
                              <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Supplier_ID], [Supplier_Name] FROM [Supplier]"></asp:SqlDataSource>
                              
                              </div >
    </div>
  </div>
 <div style=" margin-right: 50px;">
        <asp:Button ID="Button5" class="buttons-s" runat="server" Text="Save" Height="32px"  Width="117px" OnClick="Button5_Click" />
  <div>
</div>
</div>
</asp:View>
</asp:MultiView>
</div> </div>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Guest.GuestSurname, Guest.GuestName, Guest.GuestEmail, Guest.GuestContact, Rooms.RoomNumber, ReservationRoom.CheckInDate, ReservationRoom.CheckOutDate, Rooms.RoomType, Rooms.RoomID FROM Guest INNER JOIN Reservation ON Guest.GuestID = Reservation.GuestID INNER JOIN ReservationRoom ON Reservation.ReservationID = ReservationRoom.ReservationId INNER JOIN Rooms ON Reservation.RoomID = Rooms.RoomID WHERE (Rooms.RoomID = @roomId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView3" Name="roomId" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupPmb5ConnectionString %>" DeleteCommand="DELETE FROM [Rooms] WHERE [RoomID] = @original_RoomID AND [RoomNumber] = @original_RoomNumber AND [RoomType] = @original_RoomType AND [capacity] = @original_capacity AND [Availability] = @original_Availability AND [Price] = @original_Price" InsertCommand="INSERT INTO [Rooms] ([RoomNumber], [RoomType], [capacity], [Availability], [Price]) VALUES (@RoomNumber, @RoomType, @capacity, @Availability, @Price)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RoomNumber], [RoomType], [capacity], [Availability], [Price], [RoomID] FROM [Rooms]" UpdateCommand="UPDATE [Rooms] SET [RoomNumber] = @RoomNumber, [RoomType] = @RoomType, [capacity] = @capacity, [Availability] = @Availability, [Price] = @Price WHERE [RoomID] = @original_RoomID AND [RoomNumber] = @original_RoomNumber AND [RoomType] = @original_RoomType AND [capacity] = @original_capacity AND [Availability] = @original_Availability AND [Price] = @original_Price">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RoomID" Type="Int32" />
                        <asp:Parameter Name="original_RoomNumber" Type="Int32" />
                        <asp:Parameter Name="original_RoomType" Type="String" />
                        <asp:Parameter Name="original_capacity" Type="Int32" />
                        <asp:Parameter Name="original_Availability" Type="String" />
                        <asp:Parameter Name="original_Price" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RoomNumber" Type="Int32" />
                        <asp:Parameter Name="RoomType" Type="String" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                        <asp:Parameter Name="Availability" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomNumber" Type="Int32" />
                        <asp:Parameter Name="RoomType" Type="String" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                        <asp:Parameter Name="Availability" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="original_RoomID" Type="Int32" />
                        <asp:Parameter Name="original_RoomNumber" Type="Int32" />
                        <asp:Parameter Name="original_RoomType" Type="String" />
                        <asp:Parameter Name="original_capacity" Type="Int32" />
                        <asp:Parameter Name="original_Availability" Type="String" />
                        <asp:Parameter Name="original_Price" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="ReservationCancelDs" runat="server"></asp:SqlDataSource>


</asp:Content>
