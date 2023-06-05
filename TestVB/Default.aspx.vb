Imports System.Data.SqlClient
Imports System.Drawing

Public Class _Default
    Inherits Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DisplayProducts()
            DisplayCategories()
        Else

            'process submitted data
        End If
    End Sub




    Public Sub DisplayProducts()
        con.Open()
        Dim idCatgeory As Integer = Convert.ToInt32(Request.QueryString("Category_ID"))
        Dim strProducts As String
        If idCatgeory = 0 Then
            strProducts = "select * from Products where Quantity <> 0"

        Else
            strProducts = "select * from Products where Quantity <> 0 and CategoryId= '" & idCatgeory & "'"

        End If


        Dim cmd As SqlCommand = New SqlCommand(strProducts, con)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        ddlProducts.DataSource = ds
        ddlProducts.DataBind()
        con.Close()
    End Sub

    Public Sub DisplayCategories()
        con.Open()
        Dim strProducts As String = "select * from Categories"
        Dim cmd As SqlCommand = New SqlCommand(strProducts, con)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        dlCateg.DataSource = ds
        dlCateg.DataBind()
        con.Close()
    End Sub



    Protected Sub dlReplies_ItemCommand(ByVal source As Object, ByVal e As DataListCommandEventArgs)
        If e.CommandName = "Add" Then

            If Session("Email") = "" Then 'معناها لما يجي يكبس على زر انه يشتري وما يكون عامل تسجيل دخول رح يخليه يسجل دخول بالأول ويوديه على صفحة اللوج اين
                Response.Redirect("LogIn.aspx")
            Else
                Dim IdProduct As Label = TryCast(e.Item.FindControl("lblIdProduct"), Label)
                Dim Name As Label = TryCast(e.Item.FindControl("lblName"), Label)
                Dim Price As Label = TryCast(e.Item.FindControl("lblPrice"), Label)
                Dim alert As Label = TryCast(e.Item.FindControl("lblAlert"), Label)
                Dim IdCategory As Label = TryCast(e.Item.FindControl("lblCategory"), Label)
                Dim Count As TextBox = TryCast(e.Item.FindControl("txtCount"), TextBox)

                'Dim Quantity As Label = TryCast(e.Item.FindControl("lblQuantity"), Label)




                con.Open()


                If CheckQuantityProduct(IdProduct.Text) >= Convert.ToInt32(Count.Text) Then 'بشوق الكمية المتوفرة من المنتج إذا تمام وفي كمية معناها بخليه يضيفلي الطلب
                    Dim str As String = "insert into Orders (NameProducts,NameCategories,BuyerUser,Price,Arrive,Count) Values (@NameProducts,@NameCategories,@BuyerUser,@Price,@Arrive,@Count)"

                    Dim cmd As SqlCommand = New SqlCommand(str, con)
                    cmd.Parameters.AddWithValue("@NameProducts", Name.Text)
                    cmd.Parameters.AddWithValue("@NameCategories", DisplayCateigores(IdCategory.Text))
                    cmd.Parameters.AddWithValue("@BuyerUser", Convert.ToString(Session("Email")))
                    cmd.Parameters.AddWithValue("@Price", Convert.ToSingle(Price.Text))
                    cmd.Parameters.AddWithValue("@Arrive", "No")
                    cmd.Parameters.AddWithValue("@Count", Convert.ToInt32(Count.Text))

                    alert.Text = "Buy Succeeded"

                    cmd.ExecuteNonQuery()


                    increaseProd(IdProduct.Text, Count.Text)
                Else 'اذا ما في كمية اظهرلي رسالة انه ما في كمية بالمخزن
                    alert.Text = "Out of stock"
                    alert.BackColor = Color.Red


                End If
                alert.Visible = True
                con.Close()

            End If
        End If
    End Sub


    Protected Function DisplayCateigores(IdCategory As String) As String

        Dim str As String = "select Name from Categories where ID= @ID "

        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(IdCategory))

        Dim result As String = Convert.ToString(cmd.ExecuteScalar())
        Return result
    End Function


    Protected Sub increaseProd(IdProduct As String, Count As String)



        Dim str As String = "update Products set Quantity = Quantity -" & Convert.ToInt32(Count) & " where ID= @IDProd AND Quantity > 0"

        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@IDProd", Convert.ToInt32(IdProduct))
        cmd.ExecuteNonQuery()




    End Sub


    Protected Function CheckQuantityProduct(IdProduct As String) As Int32 'هذي الفنكشن اللي من خلالها بجيب كم كل منتج عنده كمية بالمخزن

        Dim str As String = "select Quantity from Products where ID= @ID "

        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(IdProduct))

        Dim result As Int32 = CType(cmd.ExecuteScalar(), Int32)
        Return result
    End Function

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        con.Open()
        Dim strProducts As String

        strProducts = "select * from Products where Quantity <> 0 and Name Like '%" & txtSearch.Text & "%'"



        Dim cmd As SqlCommand = New SqlCommand(strProducts, con)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        ddlProducts.DataSource = ds
        ddlProducts.DataBind()
        con.Close()
    End Sub
End Class