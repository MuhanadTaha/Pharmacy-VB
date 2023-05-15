Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports Microsoft.Ajax.Utilities

Public Class Products
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim cmd As New SqlCommand
            cmd = New SqlCommand("SELECT id,Name FROM Categories", con)
            con.Open()
            ddlCategory.DataTextField = "Name"
            ddlCategory.DataValueField = "id"
            ddlCategory.DataSource = cmd.ExecuteReader()
            ddlCategory.DataBind()


            con.Close()


        Else

            'process submitted data
        End If



    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        insert()
        UploadImage()
        Response.Redirect("ProductsList")
    End Sub
    Public Sub insert()
        Dim AddProducts As String = "insert into Products (Name,CategoryId,Price,Description,Image) values (@NameCategories,@CategoryId,@Price,@Description,@ImageMainProducts) "

        Dim cmd As SqlCommand = New SqlCommand(AddProducts, con)
        cmd.Parameters.AddWithValue("@NameCategories", txtName.Text)
        cmd.Parameters.AddWithValue("@CategoryId", ddlCategory.SelectedValue)
        cmd.Parameters.AddWithValue("@Price", Convert.ToInt32(txtPrice.Text))
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text)

        If fuImage.FileName.IsNullOrWhiteSpace Then
            cmd.Parameters.AddWithValue("@ImageMainProducts", "void.png")
        Else
            cmd.Parameters.AddWithValue("@ImageMainProducts", fuImage.FileName)

        End If

        con.Open()
        cmd.ExecuteNonQuery()
        'MsgBox("Data Stored Successfully", MsgBoxStyle.Information, "Success")

        con.Close()
    End Sub


    Public Sub UploadImage()
        If fuImage.HasFile Then
            Dim fileName As String = Path.GetFileName(fuImage.PostedFile.FileName)
            fuImage.PostedFile.SaveAs(Server.MapPath("Image/ImageProducts/") & fileName)
            'Response.Redirect(Request.Url.AbsoluteUri)
            'lblAlert.Visible = True
            'lblAlert.Text = "Success"
        End If
    End Sub



    'Private Sub StartUpLoad()
    '    Dim imgName As String = fuImage.FileName
    '    Dim imgPath As String = "ImageStorage/" & imgName
    '    Dim imgSize As Integer = fuImage.PostedFile.ContentLength

    '    If fuImage.PostedFile IsNot Nothing AndAlso fuImage.PostedFile.FileName <> "" Then

    '        If fuImage.PostedFile.ContentLength > 10240 Then
    '            Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "Alert", "alert('File is too big.')", True)
    '        Else
    '            fuImage.SaveAs(Server.MapPath(imgPath))
    '            'Image1.ImageUrl = "~/" & imgPath
    '            Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "Alert", "alert('Image saved!')", True)
    '        End If
    '    End If
    'End Sub
End Class