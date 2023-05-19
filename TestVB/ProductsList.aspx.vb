Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Ajax.Utilities

Public Class ProductsList
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

        Dim cmd As New SqlCommand("select * from Products", con)
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
        Dim tName As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("nametext"), TextBox)
        Dim tPrice As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("pricetext"), TextBox)
        Dim tDesc As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("desctext"), TextBox)
        Dim tQuantity As TextBox = TryCast(GridView1.Rows(e.RowIndex).FindControl("Quantitytxt"), TextBox)
        Dim fUpload As FileUpload = TryCast(GridView1.Rows(e.RowIndex).FindControl("FileUpload1"), FileUpload)


        Dim cmd As New SqlCommand


        con.Open()
        cmd.Connection = con
        If fUpload.FileName.IsNullOrWhiteSpace Then
            cmd.CommandText = "update [Products]  set Name = @nm, price = @price, Description = @Description, quantity=@quantity where ID =@id1 "

        Else
            cmd.CommandText = "update [Products]  set Name = @nm, price = @price, Description = @Description, Image=@image, quantity=@quantity where ID =@id1 "
            cmd.Parameters.AddWithValue("@image", fUpload.FileName)

        End If
        cmd.Parameters.AddWithValue("@id1", l1.Text)
        cmd.Parameters.AddWithValue("@nm", tName.Text)
        cmd.Parameters.AddWithValue("@price", tPrice.Text)
        cmd.Parameters.AddWithValue("@Description", tDesc.Text)
        cmd.Parameters.AddWithValue("@quantity", tQuantity.Text)




        cmd.Connection = con
        UploadImage(fUpload)
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()
        con.Close()

    End Sub

    Public Sub UploadImage(fUpload)


        If fUpload.HasFile Then
            Dim fileName As String = Path.GetFileName(fUpload.PostedFile.FileName)
            fUpload.PostedFile.SaveAs(Server.MapPath("Image/ImageProducts/") & fileName)
            fUpload.Visible = True
        End If
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim l1 As Label = TryCast(GridView1.Rows(e.RowIndex).FindControl("idlbl"), Label)
        Dim cmd As New SqlCommand

        con.Open()
        cmd.Connection = con
        cmd.CommandText = "delete from [Products] where ID =@id1 "
        cmd.Parameters.AddWithValue("@id1", l1.Text)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        BindGrad()
    End Sub




End Class