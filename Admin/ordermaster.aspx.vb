Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class Admin_ordermaster
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfId.Value = 0
            showdata()
        End If
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim user As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            Dim Result As String = BLL.AddUpdateOrderMaster(hfId.Value, txtTrackingNo.Text, txtAWBNo.Text, txtShippingDate.Text, txtServiceProvider.Text, txtDestination.Text, txtConsigneeName.Text, ddlStatus.SelectedValue)
            showdata()
            div1.Visible = False
            div2.Visible = True
            div3.Visible = False
            litmsg.Text = Notifications.SuccessMessage("Added Successfully.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
        End Try

    End Sub
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "Delete1" Then
            BLL.ExecNonQuery("Update OrderMaster Set Deactivated=getdate() Where OrderId=@OrderId", "@OrderId", e.CommandArgument)
            showdata()
        ElseIf e.CommandName = "Edit1" Then
            hfId.Value = e.CommandArgument
            Dim dr As SqlDataReader = BLL.ExecDataReader("select *,convert(varchar(20),ShippingDate,103) Dated from OrderMaster where OrderId=@OrderId", "@OrderId", e.CommandArgument)
            If dr.Read Then
                txtShippingDate.Text = dr("Dated").ToString()
                txtAWBNo.Text = dr("AWBNo").ToString()
                txtConsigneeName.Text = dr("ConsigneeName").ToString()
                txtDestination.Text = dr("Destination").ToString()
                txtServiceProvider.Text = dr("ServiceProvider").ToString()
                txtTrackingNo.Text = dr("TrackingNo").ToString()
                ddlStatus.SelectedValue = dr("DeliveryStatus")
                div1.Visible = True
                div2.Visible = False
                div3.Visible = False
            End If
            'BLL.ExecNonQuery("Update tbl_Gallary Set Deactivated=1 Where cnt=@cnt and UserName=@UserName", "@cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            'showdata()
        ElseIf e.CommandName = "Add1" Then
            hfId.Value = e.CommandArgument
            Dim dr As SqlDataReader = BLL.ExecDataReader("select *,convert(varchar(20),ShippingDate,103) Dated from OrderMaster where OrderId=@OrderId", "@OrderId", e.CommandArgument)
            If dr.Read Then
                LitAWBNo.Text = dr("AWBNo").ToString()
                LitTrackingNo.Text = dr("TrackingNo").ToString()

                gvdetails.DataSource = BLL.ExecDataTable("Select *,convert(varchar(20),OnDate,103) Dated from OrderDetails Where OrderId=@OrderId Order by Cnt desc", "@OrderId", e.CommandArgument)
                gvdetails.DataBind()
                div1.Visible = False
                div2.Visible = False
                div3.Visible = True
            End If
        End If
    End Sub
    Sub showdata()
        DataDisplay.DataSource = BLL.ExecDataTable("Select *,convert(varchar(20),ShippingDate,103) Dated from OrderMaster Where Deactivated is Null Order by ShippingDate desc")
        DataDisplay.DataBind()
    End Sub
    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        div1.Visible = True
        div2.Visible = False
        txtAWBNo.Text = ""
        txtConsigneeName.Text = ""
        txtDestination.Text = ""
        txtServiceProvider.Text = ""
        txtShippingDate.Text = Date.Now.ToString("dd/MM/yyyy")
        txtTrackingNo.Text = ""
        ddlStatus.SelectedValue = "Shipment Booked"
        litmsg.Text = ""
        hfId.Value = 0
    End Sub
    Private Sub btnList_Click(sender As Object, e As EventArgs) Handles btnList.Click
        div1.Visible = False
        div2.Visible = True
        div3.Visible = False
        litmsg.Text = ""
        hfId.Value = 0
    End Sub
    Private Sub btnList2_Click(sender As Object, e As EventArgs) Handles btnList2.Click
        div1.Visible = False
        div2.Visible = True
        div3.Visible = False
        litmsg.Text = ""
        hfId.Value = 0
    End Sub

    Private Sub btnAddDetails_Click(sender As Object, e As EventArgs) Handles btnAddDetails.Click
        Try
            Dim Result As String = BLL.AddOrderDetails(hfId.Value, txtDate1.Text, ddlDeliveryStatus1.SelectedValue, txtDeliveryDetails1.Text)
            showdata()
            div1.Visible = False
            div2.Visible = True
            div3.Visible = False
            litmsg.Text = Notifications.SuccessMessage("Added Successfully.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
        End Try
    End Sub

    'Protected Sub DataDisplay_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DataDisplay.RowDataBound
    '    Dim img As Image
    '    Dim hf As HiddenField
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        img = e.Row.FindControl("ImageURL")
    '        hf = e.Row.FindControl("hfimg")
    '        img.ImageUrl = "~/" & hf.Value.ToString

    '    End If
    'End Sub
End Class
