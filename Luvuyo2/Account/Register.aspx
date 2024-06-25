<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Luvuyo2.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal" style=" margin: 35px 20px 35px 20px ;">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox style="border: 1px solid #f1c232" runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox style="border: 1px solid #f1c232" runat="server" ID="Surname"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname"
                    CssClass="text-danger" ErrorMessage="The surname field is required." />
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox style="border: 1px solid #f1c232" runat="server" ID="Phone" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The phone field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox style="border: 1px solid #f1c232" runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox style="border: 1px solid #f1c232" runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox  style="border: 1px solid #f1c232" runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>

        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button style="    font-family: Poppins-Regular, sans-serif;font-weight: 800; font-size: 16px; letter-spacing: 1px; display: inline-block; padding: 10px 32px 12px 32px; border-radius: 4px;transition: 0.5s;line-height: 1; margin: 10px; color: #006666;animation-delay: 0.8s;text-transform: uppercase;border: 2px solid #bf9000;background: rgb(255,215,105);
    background: linear-gradient(90deg, rgba(255,215,105,1) 81%, rgba(241,143,1,1) 96%);" runat="server" OnClick="CreateUser_Click" Text="Register" />
            </div>
        </div>
    </div>

</asp:Content>
