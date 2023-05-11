<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.vb" Inherits="TestVB.Products" %>

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
                 <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" ></asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPrice" required="true"  runat="server" class="form-control" type="number"  placeholder="Enter Price"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:FileUpload ID="fuImage"  runat="server" class="form-control" accept="image/png, image/jpeg "/>
            </div>


            <div class="form-group">
                <asp:TextBox ID="txtDescription" required="true"  runat="server" placeholder="Description"  class="form-control"></asp:TextBox>
            </div>

            <div>
                <asp:Button ID="btnSubmit" required="true"  runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </section>


    </div>

</asp:Content>
