<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="OrderDetails.aspx.vb" Inherits="TestVB.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:DataList ID="ddlProducts" RepeatDirection="vertical" RepeatColumns="2" runat="server" Width="100%">
        <ItemTemplate>
            <li class="list-group-item d-flex justify-content-between">
                <div>
                    <h4 style="font-weight: 700" class="my-0">Product:
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("NameProducts") %>'></asp:Label>
                        <hr>
                    </h4>
                    <h6 class="my-0">Category:
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("NameCategories") %>'></asp:Label>

                    </h6>

                    <small class="text-muted">Quantity:
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Count") %>' Style="font-weight: bold;"></asp:Label>

                    </small>
                </div>

                <span class="text-muted">Price:
                   (<%#Eval("Price") %> * <%#Eval("Count") %>)  Shekel

                </span>

            </li>
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
