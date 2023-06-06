Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Security.Cryptography
Imports Microsoft.Ajax.Utilities

Public Class Orders
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmDBConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            resultTotalLbl.Text = TotalPrice()
        Else

            'process submitted data
        End If
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

    Protected Function TotalPrice() As Int32
        Dim str As String = "SELECT Sum(Price * Count) FROM Orders where BuyerUser = '" & Session("Email") & "' "


        Dim cmd As SqlCommand = New SqlCommand(str, con)
        con.Open()

        Dim result As Object = cmd.ExecuteScalar() 'هان عشان إذا رجعلي قيمة نال يعني ما في منتجات مشتريها أحولها لصفر من غير ما يضرب الكود
        If result.[GetType]() <> GetType(DBNull) Then
            result = CType(result, Integer?)
        Else
            result = 0
        End If
        con.Close()
        Return result
    End Function

    Protected Sub btnConfime_Click(sender As Object, e As EventArgs) Handles btnConfime.Click
        Dim str As String = "delete from Orders where BuyerUser ='" & Session("Email") & "' "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        Invoce()
        con.Open()

        Dim idInvoice As Int32 = LastId() ' رح يجيب أي دي الفاتورة اللي انضافت حالا
        btnAddinHistory(idInvoice)

        cmd.ExecuteNonQuery()
        con.Close()

        Response.Redirect("~/Orders")
    End Sub


    Protected Sub Invoce()
        If TotalPrice() > 0 Then

            Dim str As String = "INSERT INTO Invoice ([TotalOrder], [Username], [Date]) values (" & resultTotalLbl.Text & " ,'" & Session("Email") & "', '" & DateTime.Now & "')"
            Dim cmd As SqlCommand = New SqlCommand(str, con)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If


    End Sub
    Protected Sub btnAddinHistory(LastIdInvoice) ' بمرر براميتار اي دي الفاتورة عشان اضيفهن لكل المنتجات اللي بدهن يروحن على الهيستوري
        Dim str As String = "INSERT INTO HistoryOrders ([NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive], [Count] ,[IdInvoice]) SELECT [NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive], [Count] ,'" & LastIdInvoice & "' FROM Orders  WHERE Orders.BuyerUser='" & Session("Email") & "' "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        cmd.ExecuteNonQuery()

    End Sub


    Protected Function LastId() As Int32 'عشان أجيب الأي دي اللي نضاف بجدول الفاتورة  لأني بدي أستخدمه كفورين كي بتيبل الهيستوري
        Dim str As String = "SELECT Top(1) id FROM Invoice where username = '" & Session("Email") & "'  ORDER BY [DATE] DESC "
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        Dim Res As Int32 = cmd.ExecuteScalar()
        Return Res
    End Function

    Protected Sub btnAddCoupon_Click(sender As Object, e As EventArgs) Handles btnAddCoupon.Click

        con.Open()
        Dim str As String = "Select Discount From Coupons where Name = '" & txtCoupon.Text & "'"
        Dim cmd As SqlCommand = New SqlCommand(str, con)
        Dim res As Int32 = Convert.ToInt32(cmd.ExecuteScalar())

        Dim strMinimum As String = "Select MinimumAmmount From Coupons where Name = '" & txtCoupon.Text & "'"
        Dim cmdMinimum As SqlCommand = New SqlCommand(strMinimum, con)
        Dim resMinimum As Int32 = Convert.ToInt32(cmdMinimum.ExecuteScalar())
        con.Close()

        Dim Fin
        If str <> "" Then
            If TotalPrice() >= resMinimum Then 'هذا الكلام معناه الخصم باشتغل بس لما تتحاوز فيمة المتشريات مبلغ معين
                Fin = TotalPrice() - res 'بروح بطرح مجموع المشتريات مع القيمة اللي بخصمها الكوبون 
                resultTotalLbl.Text = Fin

            End If


        End If


    End Sub
End Class