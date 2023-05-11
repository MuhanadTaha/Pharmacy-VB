<%@ Page Title="" Language="vb" EnableEventValidation="false" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CategoryList.aspx.vb" Inherits="TestVB.CategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
        <h1 class="text-dark">Categories List</h1>

    <div class="container cont pt-2 pb-2 ">
        <asp:GridView Width="100%"  ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="200px" RowStyle-Height="35px">
            <Columns>
                <asp:TemplateField HeaderText="ID" SortExpression="ID">
                    
                    <ItemTemplate>
                        <asp:Label ID="idlbl" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="pt-1 pb-1 pl-1 pr-1" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="namelbl" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="nametext" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
                    </ItemTemplate>

                     <EditItemTemplate>
                         <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />
                         <asp:Button ID="btnCancel" runat="server" Text="Cancel"  CommandName="Cancel" />
                    </EditItemTemplate>
                     <ControlStyle CssClass="btn btn-primary" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PharmDBConnectionString %>" SelectCommand="SELECT * FROM [Cateogries]"></asp:SqlDataSource>
    </div>
</asp:Content>
