Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class Admin_statemaster
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            showdata()
        End If
    End Sub
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "Edit1" Then
            BLL.ExecNonQuery("Update tblState Set Deactivated=(Case when Deactivated=1 then 0 else 1 End) Where StCode=@StCode", "@StCode", e.CommandArgument)
            showdata()
        End If
    End Sub
    Sub showdata()
        DataDisplay.DataSource = BLL.ExecDataTable("Select *,(Case when DeActivated=0 then 'Active' Else 'DeActive' End)Status from tblState Where Deactivated<=1")
        DataDisplay.DataBind()
    End Sub
End Class
