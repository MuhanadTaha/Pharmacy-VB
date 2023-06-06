<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Orders.aspx.vb" Inherits="TestVB.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .corners {
            border: 0px solid blue;
            -moz-border-radius: 8px;
            border-radius: 7px;
            overflow: hidden;
            -webkit-border-radius: 8px;
        }
    </style>
    <br />
    <br />


    <div class="row">
        <div class="col-md-2">

            <asp:Button ID="btnConfime" runat="server" CssClass="btn btn-success" Text="Confime" />

        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtCoupon" placeholder="Enter Your Coupon..." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnAddCoupon" runat="server" Text="Add Coupon" CssClass="btn btn-sm btn-danger" />
        </div>

        <div class="col-md-2">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info" style="color:#000" data-toggle="modal" data-target="#exampleModal">
                Invoice
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-fullscreen" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="exampleModalLabel">View all invoices</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <div class="corners ">
                                    <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TotalOrder" HeaderText="Total Order" SortExpression="TotalOrder" />
                                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <a runat="server" id="link" class="btn btn-success btn-sm" href='<%# Eval("id", "OrderDetails.aspx?ID={0}") %>'>View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#0A81CA" Font-Bold="True" ForeColor="White" Height="60px" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="60px" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PharmDBConnectionString %>" SelectCommand="SELECT [Id] ,[TotalOrder], [Username], [Date] FROM [Invoice] WHERE ([Username] = @Username) ORDER BY DATE DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Username" SessionField="Email" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />
    <br />




    <div class="container cont pt-2 pb-2 ">
        <asp:GridView ID="GridView1" OnRowCommand="GV_OnRowCommand" Style="width: 100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IdOrder" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="IdOrder" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="IdOrder" />
                <asp:BoundField DataField="NameProducts" HeaderText="Product" SortExpression="NameProducts" />
                <asp:BoundField DataField="NameCategories" HeaderText="Category" SortExpression="NameCategories" />
                <asp:BoundField DataField="BuyerUser" HeaderText="Buyer" SortExpression="BuyerUser" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" />
                <asp:BoundField DataField="Arrive" HeaderText="Arrive" SortExpression="Arrive" />

                <asp:ButtonField ButtonType="Button" Text="Done" CommandName="OkCommand">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PharmDBConnectionString %>" SelectCommand="SELECT [IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price],[Arrive],[Count] FROM [Orders] WHERE ([BuyerUser] = @BuyerUser)">
            <SelectParameters>
                <asp:SessionParameter Name="BuyerUser" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


        <br />



    </div>


    <div class="text-center pt-5">
        <strong class="table-bordered img-rounded alert-danger" style="padding: 30px; font-size: 30px;">
            <asp:Label ID="Totallbl" runat="server" Text="Total" CssClass="text-primary"></asp:Label>:
                <asp:Label ID="resultTotalLbl" runat="server" Text="" CssClass="text-primary"></asp:Label>
            Shekel
        </strong>
    </div>








</asp:Content>
