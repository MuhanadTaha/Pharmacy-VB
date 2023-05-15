Imports System.Data.SqlClient
Imports System.Drawing

Public Class Orders
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GV_OnRowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim crow As Integer
        crow = Convert.ToInt32(e.CommandArgument.ToString())
        Dim ID As Integer = Convert.ToInt32(GridView1.Rows(crow).Cells(0).Text)
        con.Open()

        If e.CommandName = "OkCommand" Then
            Confirmed(ID)
        End If

        con.Close()
        Response.Redirect("Orders.aspx")
    End Sub


    Protected Sub Confirmed(ByVal _ID As Integer)
        Dim str As String = "update orders set arrive = @arrive where idOrder =" & _ID & " "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@arrive", "Yes")
        cmd.ExecuteNonQuery()
    End Sub
End Class