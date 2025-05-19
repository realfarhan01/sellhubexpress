Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class Admin_placemaster
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfId.Value = 0
            div1.Visible = False
            div2.Visible = True
            BindState()
            showdata()
        End If
    End Sub
    Sub BindState()
        ddlState.DataSource = BLL.BindState()

        ddlState.DataTextField = "State"
        ddlState.DataValueField = "State"
        ddlState.DataBind()
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim Result As String = BLL.AddUpdatePlace(hfId.Value, txtPlace.Text, ddlState.SelectedValue, ddlStatus.SelectedValue)
            showdata()
            div1.Visible = False
            div2.Visible = True
            txtPlace.Text = ""
            litmsg.Text = Notifications.SuccessMessage("Add/Update Successfull.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
        End Try

    End Sub
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "Delete1" Then
            BLL.ExecNonQuery("Update tblPlace Set Deactivated=2 Where Cnt=@Cnt", "@Cnt", e.CommandArgument)
            showdata()
        ElseIf e.CommandName = "Edit1" Then
            hfId.Value = e.CommandArgument
            Dim dr As SqlDataReader = BLL.ExecDataReader("select * from tblPlace where Cnt=@Cnt", "@Cnt", e.CommandArgument)
            If dr.Read Then
                txtPlace.Text = dr("Place").ToString()
                ddlState.SelectedValue = dr("State")
                ddlStatus.SelectedValue = dr("DeActivated")
                div1.Visible = True
                div2.Visible = False
            End If
            'BLL.ExecNonQuery("Update tbl_Gallary Set Deactivated=1 Where cnt=@cnt and UserName=@UserName", "@cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            'showdata()
        End If
    End Sub
    Sub showdata()
        DataDisplay.DataSource = BLL.ExecDataTable("Select *,(Case when DeActivated=0 then 'Active' Else 'DeActive' End)Status from tblPlace Where Deactivated<=1 order by [State],Place")
        DataDisplay.DataBind()
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        div1.Visible = True
        div2.Visible = False
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
