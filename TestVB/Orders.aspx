<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Orders.aspx.vb" Inherits="TestVB.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="container cont pt-2 pb-2">
        <asp:GridView ID="GridView1" OnRowCommand="GV_OnRowCommand" Style="width: 100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IdOrder" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="IdOrder" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="IdOrder" />
                <asp:BoundField DataField="NameProducts" HeaderText="Product" SortExpression="NameProducts" />
                <asp:BoundField DataField="NameCategories" HeaderText="Category" SortExpression="NameCategories" />
                <asp:BoundField DataField="BuyerUser" HeaderText="Buyer" SortExpression="BuyerUser" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Arrive" HeaderText="Arrive" SortExpression="Arrive" />
                <asp:ButtonField ButtonType="Button" Text="Done" CommandName="OkCommand">
                    <ControlStyle CssClass="btn btn-success btn-sm" />
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PharmDBConnectionString %>" SelectCommand="SELECT [IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price],[Arrive] FROM [Orders] WHERE ([BuyerUser] = @BuyerUser)">
            <SelectParameters>
                <asp:SessionParameter Name="BuyerUser" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
