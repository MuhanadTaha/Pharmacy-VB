Imports System.Data.SqlClient
Imports System.Data

Public Class CategoryList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGrad()
        Else
            'process submitted data
        End If


    End Sub


    Protected Sub BindGrad()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select * from Cateogries", con)
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

        Dim l1 As Label = TryCast(GridView1.Rows(e.RowIndex).FindControl("idlbl"), Label)
        Dim t1 As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("nametext"), TextBox)

        'Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)
        'Dim cmd As New SqlCommand("select * from Cateogries", con)

        Dim con As New SqlConnection
        Dim cmd As New SqlCommand


        con.ConnectionString = "Data Source=(localdb)\mssqllocaldb;Initial Catalog=PharmDB;Integrated Security=True"
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "update [Cateogries]  set Name = @nm where ID =@id1 "
        cmd.Parameters.AddWithValue("@id1", l1.Text)
        cmd.Parameters.AddWithValue("@nm", t1.Text)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()


    End Sub
End Class