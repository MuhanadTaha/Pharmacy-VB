Imports System.Data.SqlClient

Public Class AddCategory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dr As SqlDataReader


        con.ConnectionString = "Data Source=(localdb)\mssqllocaldb;Initial Catalog=PharmDB;Integrated Security=True"
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "select * from Cateogries where Name = '" & txtCategory.Text & "' "

        dr = cmd.ExecuteReader
        If dr.HasRows Then
            MsgBox("Category Already Exist", MsgBoxStyle.Critical)
            con.Close()
        Else
            con.Close()

            con.Open()
            cmd = New SqlCommand("insert into Cateogries values('" & txtCategory.Text & "' )", con)
            If txtCategory.Text = "" Then
                MsgBox("Please Enter the category name")
            Else
                cmd.ExecuteNonQuery()
                MsgBox("Successfully", MsgBoxStyle.Information, "Success")
                Response.Redirect("CategoryList.aspx")
            End If
            con.Close()
        End If
        con.Close()
    End Sub
End Class