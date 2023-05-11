<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SignUp.aspx.vb" Inherits="TestVB.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin: 20px 0px">
        <h1>Sign Up</h1>
        <hr />
        <div class="row" style="margin: 20px 0">
            <div class="col-md-6 p-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
            </div>
        </div>


        <div class="row" style="margin: 20px 0">
            <div class="col-md-6 p-5">
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="Date of Birth"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
            </div>
        </div>

        <div class="row" style="margin: 20px 0">

            <div class="col-md-6 p-5 ">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
            </div>

            <div class="col-md-6 p-5 ">
                <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row" style="margin: 20px 0">
            <div class="col-md-6 p-5 ">
                <asp:TextBox ID="txtPassword" runat="server" type="password" CssClass="form-control" placeholder="Password"></asp:TextBox>
            </div>
            <div class="col-md-6 p-5 ">
                <asp:TextBox ID="txtCPassword" runat="server" type="password" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
            </div>
        </div>


        <div class="row" style="margin: 20px 0">
            <div class="col-md-6 p-5 ">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
        </div>



    </div>
</asp:Content>
