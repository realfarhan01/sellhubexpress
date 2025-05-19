Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D

Partial Class Admin_cabs
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfId.Value = 0
            div1.Visible = False
            div2.Visible = True
            showdata()
        End If
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim File As String = ""
            If FileUpload.HasFile Then
                If Not BLL.isImage(FileUpload.FileContent) Then
                    Exit Sub
                End If
                If FileUpload.PostedFile.ContentType.Split("/")(0) = "image" Then
                    'File = FileUpload.FileName
                    File = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload.PostedFile.FileName)
                    FileUpload.SaveAs(Server.MapPath("../images/vehicles/actual/" + File))
                    ResizeImageAndSave(800, 800, Context.Server.MapPath("../images/vehicles/actual/" & File), "../images/vehicles/" + File)
                End If
            End If
            Dim user As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            'Dim FolderPath As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            Dim Result As String = BLL.AddUpdateCabs(hfId.Value, txtDestination.Text, txtProductDesc.Text, File, user, ddlStatus.SelectedValue)
            showdata()
            div1.Visible = False
            div2.Visible = True
            litmsg.Text = Notifications.SuccessMessage("Add/Update Successfull.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
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
        If e.CommandName = "Delete1" Then
            BLL.ExecNonQuery("Update tblCabs Set Deactivated=2 Where Cnt=@Cnt and UserName=@UserName", "@Cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            showdata()
        ElseIf e.CommandName = "Edit1" Then
            hfId.Value = e.CommandArgument
            Dim dr As SqlDataReader = BLL.ExecDataReader("select * from tblCabs where Cnt=@Cnt and UserName=@UserName", "@Cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            If dr.Read Then
                txtDestination.Text = dr("VehicleName").ToString()
                txtProductDesc.Text = dr("DetailDesc").ToString()
                ddlStatus.SelectedValue = dr("DeActivated")
                div1.Visible = True
                div2.Visible = False
            End If
            'BLL.ExecNonQuery("Update tbl_Gallary Set Deactivated=1 Where cnt=@cnt and UserName=@UserName", "@cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            'showdata()
        End If
    End Sub
    Sub showdata()
        DataDisplay.DataSource = BLL.ExecDataTable("Select *,(Case when DeActivated=0 then 'Active' Else 'DeActive' End)Status from tblCabs Where Deactivated<=1 and UserName=@UserName", "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
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
