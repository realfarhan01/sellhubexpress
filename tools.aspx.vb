
Partial Class tools
    Inherits System.Web.UI.Page

    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim Result As Decimal = 0
        Result = (Val(txtHeight.Text) * Val(txtLength.Text) * Val(txtWidth.Text)) / 5000
        LitResult.Text = Result
        divresult.Visible = True
    End Sub
End Class
