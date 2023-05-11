﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LogIn.aspx.vb" Inherits="TestVB.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px 0px">
        <h1>Login</h1>
        <hr />
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" ></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" type="password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" />
    </div>
</asp:Content>
