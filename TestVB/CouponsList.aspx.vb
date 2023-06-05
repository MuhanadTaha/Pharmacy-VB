Imports System.Data.SqlClient
Imports System.Drawing

Public Class Coupons
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGrad()
        Else
            'process submitted data
        End If
    End Sub
    Protected Sub BindGrad()

        Dim cmd As New SqlCommand("select * from coupons", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable

        da.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        BindGrad()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        BindGrad()

    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        Dim Id As Label = TryCast(GridView1.Rows(e.RowIndex).FindControl("idlbl"), Label)
        Dim Name As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("nametext"), TextBox)
        Dim MinAmmount As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("Mintxt"), TextBox)
        Dim discount As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("distxt"), TextBox)


        'Dim cmd As New SqlCommand("select * from Cateogries", con)

        Dim cmd As New SqlCommand


        con.Open()
        cmd.Connection = con
        cmd.CommandText = "update [Coupons]  set Name = @nm, MinimumAmmount = @MinimumAmmount, Discount = @Discount  where ID =@id1 "
        cmd.Parameters.AddWithValue("@id1", Id.Text)
        cmd.Parameters.AddWithValue("@nm", Name.Text)
        cmd.Parameters.AddWithValue("@MinimumAmmount", MinAmmount.Text)
        cmd.Parameters.AddWithValue("@Discount", discount.Text)

        cmd.Connection = con
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()


    End Sub






    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim l1 As Label = TryCast(GridView1.Rows(e.RowIndex).FindControl("idlbl"), Label)
        Dim cmd As New SqlCommand
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "delete from [Coupons] where ID =@id1 "
        cmd.Parameters.AddWithValue("@id1", l1.Text)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()
    End Sub
End Class