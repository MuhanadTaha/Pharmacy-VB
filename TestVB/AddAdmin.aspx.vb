Imports System.Data.SqlClient

Public Class AddAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dr As SqlDataReader


        con.ConnectionString = "Data Source=(localdb)\mssqllocaldb;Initial Catalog=PharmDB;Integrated Security=True"
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "select * from signup where email = '" & txtEmail.Text & "' "

        dr = cmd.ExecuteReader
        If dr.HasRows Then
            MsgBox("Email Already Exist", MsgBoxStyle.Critical)
            con.Close()
        Else
            con.Close()

            con.Open()
            cmd = New SqlCommand("insert into signup values('" & txtFirstName.Text & "'  , '" & txtLastName.Text & "' , '" & txtMobile.Text & "' ,  '" & txtDOB.Text & "' ,  '" & txtEmail.Text & "',  '" & txtPassword.Text & "' , '" & txtCPassword.Text & "' , '" & ddlGender.Text & "' ,'admin')", con)
            If txtEmail.Text = "" And txtPassword.Text = "" And txtFirstName.Text = "" And txtLastName.Text = "" And txtCPassword.Text = "" And txtDOB.Text = "" And txtMobile.Text = "" And ddlGender.Text = "" Then
                MsgBox("Plese Enter the Details")
            Else
                cmd.ExecuteNonQuery()
                MsgBox("Successfully", MsgBoxStyle.Information, "Success")
                Response.Redirect("LogIn.aspx")
            End If
            con.Close()
        End If
        con.Close()

    End Sub

End Class