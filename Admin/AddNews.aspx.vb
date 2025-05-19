Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports SD = System.Drawing
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Partial Class Admin_AddNews
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer
   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfId.Value = 0
            Panel1.Visible = False
            Panel2.Visible = True
            binddata()
        End If
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim RandomStr As String = BLL.GenerateRandomString(6)
            If FUImage.HasFile And BLL.isImage(FUImage.FileContent) Then
                If FUImage.PostedFile.ContentLength <= 2097152 And FUImage.PostedFile.ContentType.Split("/")(0) = "image" Then
                    RandomStr = "news_" & RandomStr & ".jpg"
                    FUImage.SaveAs(Server.MapPath("../images/news/origional/" + RandomStr))
                    ResizeImageAndSave(800, 800, Context.Server.MapPath("../images/news/origional/" & RandomStr), "../images/news/" + RandomStr)
                End If
            End If
            BLL.AddNews(hfId.Value, txttitle.Text, "", "News", RandomStr, txtDate.Text, txtToDate.Text, txtNews.Text, ddlStatus.SelectedValue)
            hfId.Value = 0
            litmsg.Text = Notifications.SuccessMessage("Added Successfully.")
            binddata()
            Panel1.Visible = False
            Panel2.Visible = True
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience.Please Try Again Later")
        End Try

    End Sub
    Public Function ResizeImageAndSave(ByVal Width As Integer, ByVal Height As Integer, ByVal imageUrl As String, ByVal destPath As String) As String
        Dim fullsizeImage As System.Drawing.Image = System.Drawing.Image.FromFile(imageUrl)
        Dim newWidth As Integer = Width
        Dim maxHeight As Integer = Height
        fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone)
        fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone)

        If fullsizeImage.Width <= newWidth Then
            newWidth = fullsizeImage.Width
        End If

        Dim newHeight As Integer = fullsizeImage.Height * newWidth / fullsizeImage.Width

        If newHeight > maxHeight Then
            newWidth = fullsizeImage.Width * maxHeight / fullsizeImage.Height
            newHeight = maxHeight
        End If

        Dim newImage As System.Drawing.Image = fullsizeImage.GetThumbnailImage(newWidth, newHeight, Nothing, IntPtr.Zero)
        newImage.Save(HttpContext.Current.Server.MapPath(destPath), ImageFormat.Jpeg)
        fullsizeImage.Dispose()
        Return ""
    End Function
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "edit1" Then
            Dim dr As SqlDataReader = BLL.ExecDataReader("select * from tbl_News where cnt=@cnt", "@cnt", e.CommandArgument)
            If dr.Read() Then
                txtNews.Text = dr("News")
                txttitle.Text = dr("Title")
                txtDate.Text = dr("NewsDate")
                txtToDate.Text = dr("ToDate")
                ddlStatus.SelectedValue = dr("Deactivated")
                hfId.Value = e.CommandArgument
                Panel1.Visible = True
                Panel2.Visible = False
            End If
        ElseIf e.CommandName = "delete1" Then
            BLL.ExecNonQuery("Update tbl_News Set Deactivated=2 Where cnt=@cnt", "@cnt", e.CommandArgument)
            Panel1.Visible = True
            Panel2.Visible = False
        End If
        binddata()
    End Sub
    Sub binddata()
        DataDisplay.DataSource = BLL.ExecDataTableProc("GetNews", "@User", "admin", "@NewsType", "news")
        DataDisplay.DataBind()
    End Sub

    Private Sub btnAddNew_Click(sender As Object, e As EventArgs) Handles btnAddNew.Click
        Panel1.Visible = True
        Panel2.Visible = False
        hfId.Value = 0
    End Sub

    Private Sub btnShowData_Click(sender As Object, e As EventArgs) Handles btnShowData.Click
        Panel1.Visible = False
        Panel2.Visible = True
        hfId.Value = 0
    End Sub
End Class
