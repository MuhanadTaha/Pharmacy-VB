<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="TestVB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Abdulrahman Pharmacy</h1>
    </div>


    <center>
        <asp:DataList ID="dlCateg" RepeatDirection="Horizontal" RepeatColumns="10" runat="server" >
            <ItemTemplate>
                <div class="pr-1" runat="server">
                    <center>
                        <a class="btn btn-primary" href="Default.aspx?Category_ID=<%# Eval("Id")%>"> <%#Eval("Name") %>  </a>
                    </center>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </center>

    <br />

    <asp:DataList ID="ddlProducts" RepeatDirection="Horizontal" RepeatColumns="4" runat="server" OnItemCommand="dlReplies_ItemCommand">
        <ItemTemplate>
            <div style="border-radius: 5px; padding: 10px; margin: 10px; border: solid 1px" runat="server">
                <center>
                    <table style="width: 250px">
                        <tr>
                            <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("CategoryId") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblIdProduct" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity") %>' Visible="false"></asp:Label>



                            <asp:Image ID="imgCategories" runat="server" Style="width: 230px; height: 180px; object-fit: cover; border: solid 1px #bbbbbb" ImageUrl='<%# "~/Image/ImageProducts/" + Eval("Image") %>' />
                            <br />
                            <br />
                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' Style="font-weight: bold;"></asp:Label>
                            $
                    <br />
                            <br />
                            <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("Description") %>' Style="font-weight: bold;"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnBuy" CommandName="Add" runat="server" Text="Buy" CssClass="btn btn-primary btn-sm"></asp:Button>
                            <br />
                            <br />
                            <asp:Label ID="lblAlert" runat="server" Text="" CssClass="alert alert-success" Visible="false" Style="font-weight: bold;"></asp:Label>

                        </tr>
                    </table>
                </center>
            </div>
        </ItemTemplate>
    </asp:DataList>




    <%--    <div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
