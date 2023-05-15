Imports System.Data.SqlClient

Public Class LogIn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        con.ConnectionString = "Data Source=(localdb)\mssqllocaldb;Initial Catalog=PharmDB;Integrated Security=True"

        Dim objcon As SqlConnection = Nothing
        Dim objcmd As SqlCommand = Nothing

        objcon = New SqlConnection("Data Source=(localdb)\mssqllocaldb;Initial Catalog=PharmDB;Integrated Security=True")

        objcon.Open()
        Dim stmt As String = "select * from signup where email = '" & txtEmail.Text & "'  and password = '" & txtPassword.Text & "' "
        objcmd = New SqlCommand(stmt, objcon)

        Dim reader As SqlDataReader = objcmd.ExecuteReader

        If reader.Read Then
            'MsgBox("Login Success")
            Session("Email") = txtEmail.Text
            Response.Redirect("Default.aspx")
        Else
            MsgBox("Invalid Password or Email ...")
        End If
    End Sub
End Class