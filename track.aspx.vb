
Partial Class track
    Inherits System.Web.UI.Page
    Dim BLL As New BusinessLogicLayer

    'Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
    '    Try
    '        If txtTrackingNo.Text <> "" Then
    '            Dim dr As SqlDataReader = BLL.ExecDataReaderProc("Prc_GetOrderDetails", "@TrackingNo", txtTrackingNo.Text)
    '            If dr.Read Then
    '                Dim OrderId As Integer = dr("OrderId")
    '                LitServiceProvider.Text = dr("ServiceProvider").ToString
    '                LitServiceProvider2.Text = dr("ServiceProvider").ToString
    '                LitShippingDate.Text = dr("Dated").ToString
    '                LitTrackingNo.Text = dr("TrackingNo").ToString
    '                LitTrackingNo2.Text = dr("TrackingNo").ToString
    '                LitAWBNo.Text = dr("AWBNo").ToString
    '                LitAWBNo2.Text = dr("AWBNo").ToString
    '                LitConsigneeName.Text = dr("ConsigneeName").ToString
    '                LitDeliveryStatus.Text = dr("DeliveryStatus").ToString
    '                LitDeliveryStatus2.Text = dr("DeliveryStatus").ToString
    '                LitDestination.Text = dr("Destination").ToString
    '                LitProcessBar.Text = dr("ProcessBar").ToString
    '                divdetail.Visible = True
    '                litmsg.Text = ""
    '                Dim rpt As DataTable = BLL.ExecDataTable("Select *,convert(varchar(20),OnDate,106) Dated from OrderDetails Where OrderId=@OrderId Order by Cnt desc", "@OrderId", OrderId)
    '                rptData.DataSource = rpt
    '                rptData.DataBind()
    '            Else
    '                litmsg.Text = "No Data Found !!"
    '            End If
    '        Else
    '            litmsg.Text = "Please Enter Tracking Id !!"
    '        End If
    '    Catch ex As Exception
    '        litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
    '    End Try
    'End Sub
End Class
