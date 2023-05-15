Imports System.Data.SqlClient
Imports System.Drawing

Public Class _Default
    Inherits Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DisplayProducts()
        Else

            'process submitted data
        End If
    End Sub


    Public Sub DisplayProducts()
        con.Open()
        Dim strProducts As String = "select * from Products"
        Dim cmd As SqlCommand = New SqlCommand(strProducts, con)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        ddlProducts.DataSource = ds
        ddlProducts.DataBind()
        con.Close()
    End Sub


    Protected Sub dlReplies_ItemCommand(ByVal source As Object, ByVal e As DataListCommandEventArgs)
        If e.CommandName = "Add" Then

            If Session("Email") = "" Then 'معناها لما يجي يكبس على زر انه يشتري وما يكون عامل تسجيل دخول رح يخليه يسجل دخول بالأول ويوديه على صفحة اللوج اين
                Response.Redirect("LogIn.aspx")
            Else
                Dim Name As Label = TryCast(e.Item.FindControl("lblName"), Label)
                Dim Price As Label = TryCast(e.Item.FindControl("lblPrice"), Label)
                Dim alert As Label = TryCast(e.Item.FindControl("lblAlert"), Label)
                Dim IdCategory As Label = TryCast(e.Item.FindControl("lblCategory"), Label)

                con.Open()

                Dim str As String = "insert into Orders (NameProducts,NameCategories,BuyerUser,Price,Arrive) Values (@NameProducts,@NameCategories,@BuyerUser,@Price,@Arrive)"
                Dim cmd As SqlCommand = New SqlCommand(str, con)
                cmd.Parameters.AddWithValue("@NameProducts", Name.Text)
                cmd.Parameters.AddWithValue("@NameCategories", DisplayCateigores(IdCategory.Text))
                cmd.Parameters.AddWithValue("@BuyerUser", Convert.ToString(Session("Email")))
                cmd.Parameters.AddWithValue("@Price", Convert.ToSingle(Price.Text))
                cmd.Parameters.AddWithValue("@Arrive", "No")
                alert.Text = "Buy Succeeded"
                alert.Visible = True

                cmd.ExecuteNonQuery()
                con.Close()
            End If
        End If
    End Sub


    Protected Function DisplayCateigores(IdCategory As String) As String

        Dim str As String = "select Name from Categories where ID= @ID "

        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(IdCategory))

        Dim result As String = Convert.ToString(cmd.ExecuteScalar())
        Return result
    End Function
End Class