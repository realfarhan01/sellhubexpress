Imports System.Data.OleDb
Imports System.IO
Partial Class Admin_WebsiteQueries
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'BindClass()
            bind()
        End If
    End Sub
    Sub bind()
        DataDisplay.DataSource = BLL.ExecDataTableProc("Prc_GetWebsiteQueries", "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
        DataDisplay.DataBind()
    End Sub

    Protected Sub DataDisplay_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DataDisplay.PageIndexChanging
        DataDisplay.PageIndex = e.NewPageIndex
        bind()
    End Sub
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "delete1" Then
            BLL.ExecNonQuery("Update tl_WebsiteQueries Set Deactivated=1 Where cnt=@cnt", "@cnt", e.CommandArgument)
        End If
        bind()
    End Sub

End Class
