Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net

Public Class Users
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

        Dim cmd As New SqlCommand("select * from signup where email <> '" & Session("Email") & "'", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable

        da.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
    End Sub


    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim l1 As Label = TryCast(GridView1.Rows(e.RowIndex).FindControl("emaillbl"), Label)
        Dim cmd As New SqlCommand

        con.Open()
        cmd.Connection = con
        cmd.CommandText = "delete from [signup] where email =@email"
        cmd.Parameters.AddWithValue("@email", l1.Text)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()
    End Sub


End Class