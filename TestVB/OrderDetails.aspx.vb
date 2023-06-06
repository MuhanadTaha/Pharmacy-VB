Imports System.Data.SqlClient
Imports System.Drawing

Public Class OrderDetails
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DisplayProducts()
        Else

            'process submitted data
        End If
    End Sub



    Public Sub DisplayProducts()
        con.Open()
        Dim idInvoice As Integer = Convert.ToInt32(Request.QueryString("ID"))
        Dim strHistoryOrder As String
        strHistoryOrder = "select * from [HistoryOrders] where BuyerUser = '" & Session("Email") & "' and [IdInvoice] = " & idInvoice & ""




        Dim cmd As SqlCommand = New SqlCommand(strHistoryOrder, con)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        ddlProducts.DataSource = ds
        ddlProducts.DataBind()
        con.Close()
    End Sub

End Class