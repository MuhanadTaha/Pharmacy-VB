Imports System.Data.SqlClient


Public Class SignUp
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
            cmd = New SqlCommand("insert into signup values('" & txtFirstName.Text & "'  , '" & txtLastName.Text & "' , '" & txtMobile.Text & "' ,  '" & txtDOB.Text & "' ,  '" & txtEmail.Text & "',  '" & txtPassword.Text & "' , '" & txtCPassword.Text & "' , '" & ddlGender.Text & "' ,'customer')", con)
            If txtEmail.Text = "" Or txtPassword.Text = "" Or txtFirstName.Text = "" Or txtLastName.Text = "" Or txtCPassword.Text = "" Or txtDOB.Text = "" Or txtMobile.Text = "" Or ddlGender.Text = "" Then
                MsgBox("Plese Enter the Details")

            Else

                If txtCPassword.Text <> txtPassword.Text Then
                    MsgBox("Confirm password is not correct")
                Else
                    cmd.ExecuteNonQuery()
                    MsgBox("Successfully", MsgBoxStyle.Information, "Success")
                    Response.Redirect("LogIn.aspx")
                End If

            End If
            con.Close()
        End If
        con.Close()

    End Sub
End Class