<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Coupons.aspx.vb" Inherits="TestVB.Coupons1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="container cont">
        <section class="col-md-6 pt-2 pb-2">

            <div class="form-group">
                <asp:TextBox ID="txtName" required="true" runat="server" class="form-control"  placeholder="Enter Name"></asp:TextBox>
            </div>


            <div class="form-group">
                <asp:TextBox ID="txtMinAmount" required="true"  runat="server" class="form-control" type="number"  placeholder="Enter Minimum Amount"></asp:TextBox>
            </div>


            <div class="form-group">
                <asp:TextBox ID="txtDiscount" type="number" required="true"  runat="server" placeholder="Discount"  class="form-control"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="lblAlert" runat="server" class="text-danger" Text="" Visible="false"></asp:Label>
                <asp:Button ID="btnSubmit" required="true"  runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </section>


    </div>
</asp:Content>
