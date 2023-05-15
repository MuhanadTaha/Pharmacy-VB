<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Users.aspx.vb" Inherits="TestVB.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />

   <div class="container cont pt-2 pb-2 ">
        <asp:GridView HeaderStyle-Height="20px"  Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="200px" RowStyle-Height="35px">
            <Columns>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">

                    <ItemTemplate>
                        <asp:Label ID="emaillbl" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="pt-1 pb-1 pl-1 pr-1" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="First Name" SortExpression="First Name">
                    <ItemTemplate>
                        <asp:Label ID="firstnamelbl" runat="server" Text='<%# Bind("fName") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Name" SortExpression="Last Name">
                    <ItemTemplate>
                        <asp:Label ID="lastnamelbl" runat="server" Text='<%# Bind("lName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile">
                    <ItemTemplate>
                        <asp:Label ID="mobillbl" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Authorize" SortExpression="Authorize">
                    <ItemTemplate>
                        <asp:Label ID="authlbl" runat="server" Text='<%# Bind("Authorized") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:TemplateField>



            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

            <RowStyle Height="35px"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PharmDBConnectionString %>" SelectCommand="SELECT * FROM [signup]"></asp:SqlDataSource>
    </div>
</asp:Content>
