Imports System.Data.SqlClient
Imports System.Drawing

Public Class Coupons1
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        insert()
        Response.Redirect("CouponsList")
    End Sub



    Public Sub insert()
        Dim AddProducts As String = "insert into Coupons (Name,MinimumAmmount,Discount) values (@Name,@MinimumAmmount,@Discount) "

        Dim cmd As SqlCommand = New SqlCommand(AddProducts, con)
        cmd.Parameters.AddWithValue("@Name", txtName.Text)
        cmd.Parameters.AddWithValue("@MinimumAmmount", Convert.ToInt32(txtMinAmount.Text))
        cmd.Parameters.AddWithValue("@Discount", Convert.ToInt32(txtDiscount.Text))


        con.Open()
        cmd.ExecuteNonQuery()
        'MsgBox("Data Stored Successfully", MsgBoxStyle.Information, "Success")

        con.Close()
    End Sub
End Class