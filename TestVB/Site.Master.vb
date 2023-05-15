Imports System.Data.SqlClient
Imports System.Drawing
Imports Microsoft.Ajax.Utilities

Public Class SiteMaster
    Inherits MasterPage
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Authantication()
            Authorization()
        Else
            'process submitted data
        End If
    End Sub

    Protected Sub btnOut_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session.Abandon()
        Session.Clear()
        Session.RemoveAll()
        Response.Redirect("~/LogIn.aspx")
    End Sub

    Protected Sub Authantication()
        Dim str As String = "select email from signup where Email= '" & Session("Email") & "' "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        con.Open()
        Dim Result As String = cmd.ExecuteScalar()

        If Result.IsNullOrWhiteSpace Then
            ddlAdmin.Visible = False

        Else
            btnOut.Visible = True
            btnLogin.Visible = False
            btnSignUp.Visible = False
        End If
        con.Close()
    End Sub

    Protected Sub Authorization()
        Dim str As String = "select authorized from signup where Email= '" & Session("Email") & "' "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        con.Open()
        Dim Result As String = cmd.ExecuteScalar()

        If Result = "admin" Then
            ddlAdmin.Visible = True

        Else
            ddlAdmin.Visible = False
        End If
        con.Close()
    End Sub

End Class