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

Partial Class Admin_departures
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer
    Public Image1 As String = ""
    Public Image2 As String = ""
    Public Image3 As String = ""
    Public Image4 As String = ""
    Public TourImg1 As String = ""
    Public TourImg2 As String = ""
    Public TourImg3 As String = ""
    Public TourImg4 As String = ""
    Public TourImg5 As String = ""
    Public TourImg6 As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfId.Value = 0
            div1.Visible = False
            div2.Visible = True
            div3.Visible = False
            showdata()
        End If
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim File1 As String = ""
            Dim File2 As String = ""
            Dim File3 As String = ""
            Dim File4 As String = ""
            Dim File5 As String = ""
            If FileUpload1.HasFile Then
                If Not BLL.isImage(FileUpload1.FileContent) Then
                    Exit Sub
                End If
                If FileUpload1.PostedFile.ContentType.Split("/")(0) = "image" Then
                    'File = FileUpload.FileName
                    File1 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName)
                    FileUpload1.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File1)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File1, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File1)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File1, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File1)
                End If
            End If
            If FileUpload2.HasFile Then
                If Not BLL.isImage(FileUpload2.FileContent) Then
                    Exit Sub
                End If
                If FileUpload2.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File2 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName)
                    FileUpload2.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File2)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File2)
                End If
            End If
            If FileUpload3.HasFile Then
                If Not BLL.isImage(FileUpload3.FileContent) Then
                    Exit Sub
                End If
                If FileUpload3.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File3 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName)
                    FileUpload3.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File3)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File3)
                End If
            End If
            If FileUpload4.HasFile Then
                If Not BLL.isImage(FileUpload4.FileContent) Then
                    Exit Sub
                End If
                If FileUpload4.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File4 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload4.PostedFile.FileName)
                    FileUpload4.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File4)
                    'CreateThumbnail(800, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File4)
                End If
            End If
            If FileUpload5.HasFile Then
                If Not BLL.isImage(FileUpload5.FileContent) Then
                    Exit Sub
                End If
                If FileUpload5.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File5 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FileUpload5.PostedFile.FileName)
                    FileUpload5.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File5)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File5)
                End If
            End If
            Dim user As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            Dim PageURL As String = BLL.GetPageURL(txtProductName.Text)
            'PageURL = BLL.GetAccentedStr(PageURL)

            'Dim FolderPath As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            Dim Result As String = BLL.AddUpdateTourDepartures(hfId.Value, txtProductName.Text, txtDate.Text, txtShortDesc.Text, txtProductDesc.Text, txtPackageItinerary.Text, txtPackageInclusion.Text, txtPackageDays.Text, txtPackagePricePP.Text, txtLocationEmbed.Text, txtRoadMap.Text, File5, File1, File2, File3, File4, user, ddlStatus.SelectedValue, PageURL)
            showdata()
            div1.Visible = False
            div2.Visible = True
            div3.Visible = False
            litmsg.Text = Notifications.SuccessMessage("Add/Update Successfull.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
        End Try

    End Sub
    'Sub CreateThumbnail(ByVal ThumbnailMax As Integer, ByVal OriginalImagePath As String, ByVal ThumbnailImagePath As String)
    '    ' Loads original image from file
    '    Dim imgOriginal As Image = Image.FromFile(OriginalImagePath)
    '    ' Finds height and width of original image
    '    Dim OriginalHeight As Single = imgOriginal.Height
    '    Dim OriginalWidth As Single = imgOriginal.Width
    '    ' Finds height and width of resized image
    '    Dim ThumbnailWidth As Integer
    '    Dim ThumbnailHeight As Integer
    '    If OriginalHeight > OriginalWidth Then
    '        ThumbnailHeight = ThumbnailMax
    '        ThumbnailWidth = (OriginalWidth / OriginalHeight) * ThumbnailMax
    '    Else
    '        ThumbnailWidth = ThumbnailMax
    '        ThumbnailHeight = (OriginalHeight / OriginalWidth) * ThumbnailMax
    '    End If
    '    ' Create new bitmap that will be used for thumbnail
    '    Dim ThumbnailBitmap As Bitmap = New Bitmap(ThumbnailWidth, ThumbnailHeight)
    '    Dim ResizedImage As Graphics = Graphics.FromImage(ThumbnailBitmap)
    '    ' Resized image will have best possible quality
    '    ResizedImage.InterpolationMode = InterpolationMode.HighQualityBicubic
    '    ResizedImage.CompositingQuality = CompositingQuality.HighQuality
    '    ResizedImage.SmoothingMode = SmoothingMode.HighQuality
    '    ' Draw resized image
    '    ResizedImage.DrawImage(imgOriginal, 0, 0, ThumbnailWidth, ThumbnailHeight)
    '    ' Save thumbnail to file
    '    ThumbnailBitmap.Save(ThumbnailImagePath)
    'End Sub
    Protected Sub DataDisplay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles DataDisplay.RowCommand
        If e.CommandName = "Delete1" Then
            BLL.ExecNonQuery("Update tblTourDepartures Set Deactivated=2 Where PackageId=@PackageId and UserName=@UserName", "@PackageId", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            showdata()
        ElseIf e.CommandName = "Deactivate1" Then
            hfId.Value = e.CommandArgument
            Dim dr As SqlDataReader = BLL.ExecDataReader("select * from tblTourDepartures where PackageId=@PackageId and UserName=@UserName", "@PackageId", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            If dr.Read Then
                txtProductName.Text = dr("PackageName").ToString()
                'txtPackageNameG.Text = dr("PackageName").ToString()
                txtShortDesc.Text = dr("ShortDesc").ToString()
                txtProductDesc.Text = dr("PackageDesc").ToString()
                txtPackageItinerary.Text = dr("PackageItinerary").ToString()
                txtPackageInclusion.Text = dr("PackageInclusion").ToString()
                txtPackageDays.Text = dr("PackageDays").ToString()
                txtPackagePricePP.Text = dr("PackagePricePP").ToString()
                txtLocationEmbed.Text = dr("LocationEmbed").ToString()
                txtRoadMap.Text = dr("RoadMap").ToString()
                'ddlCategory.SelectedValue = dr("CategoryId")
                ddlStatus.SelectedValue = dr("DeActivated")
                Image1 = dr("Image1").ToString()
                Image2 = dr("Image2").ToString()
                Image3 = dr("Image3").ToString()
                Image4 = dr("Image4").ToString()
                TourImg1 = dr("TourImg1").ToString()
                TourImg2 = dr("TourImg2").ToString()
                TourImg3 = dr("TourImg3").ToString()
                TourImg4 = dr("TourImg4").ToString()
                TourImg5 = dr("TourImg5").ToString()
                TourImg6 = dr("TourImg6").ToString()
                div1.Visible = True
                div2.Visible = False
                div3.Visible = True
            End If
            'BLL.ExecNonQuery("Update tbl_Gallary Set Deactivated=1 Where cnt=@cnt and UserName=@UserName", "@cnt", e.CommandArgument, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            'showdata()
        End If
    End Sub
    Sub showdata()
        DataDisplay.DataSource = BLL.ExecDataTable("Select *,(Case when DeActivated=0 then 'Active' Else 'DeActive' End)Status from tblTourDepartures Where Deactivated<=1 and UserName=@UserName", "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
        DataDisplay.DataBind()
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        div1.Visible = True
        div2.Visible = False
        div3.Visible = False
        litmsg.Text = ""
        hfId.Value = 0
    End Sub

    Protected Sub DataDisplay_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DataDisplay.RowDataBound
        'Dim img As Image
        'Dim hf As HiddenField
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    If e.Row.DataItem("ShowOnHomePage") = 1 Then
        '        For Each cell As TableCell In e.Row.Cells
        '            cell.BackColor = Drawing.Color.Aquamarine
        '        Next
        '    End If
        '    'img = e.Row.FindControl("ImageURL")
        '    'hf = e.Row.FindControl("hfimg")
        '    'img.ImageUrl = "~/" & hf.Value.ToString

        'End If
    End Sub

    Private Sub btnAddTourImages_Click(sender As Object, e As EventArgs) Handles btnAddTourImages.Click
        Try
            Dim File1 As String = ""
            Dim File2 As String = ""
            Dim File3 As String = ""
            Dim File4 As String = ""
            Dim File5 As String = ""
            Dim File6 As String = ""
            If FUImg1.HasFile Then
                If Not BLL.isImage(FUImg1.FileContent) Then
                    Exit Sub
                End If
                If FUImg1.PostedFile.ContentType.Split("/")(0) = "image" Then
                    'File = FileUpload.FileName
                    File1 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg1.PostedFile.FileName)
                    FUImg1.SaveAs(Context.Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath") & File1))
                    ResizeImageAndSave(1000, 625, Context.Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) & File1, System.Configuration.ConfigurationManager.AppSettings("productpath") + File1)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File1, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File1)
                End If
            End If
            If FUImg2.HasFile Then
                If Not BLL.isImage(FUImg2.FileContent) Then
                    Exit Sub
                End If
                If FUImg2.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File2 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg2.PostedFile.FileName)
                    FUImg2.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File2)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File2, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File2)
                End If
            End If
            If FUImg3.HasFile Then
                If Not BLL.isImage(FUImg3.FileContent) Then
                    Exit Sub
                End If
                If FUImg3.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File3 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg3.PostedFile.FileName)
                    FUImg3.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File3)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File3, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File3)
                End If
            End If
            If FUImg4.HasFile Then
                If Not BLL.isImage(FUImg4.FileContent) Then
                    Exit Sub
                End If
                If FUImg4.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File4 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg4.PostedFile.FileName)
                    FUImg4.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File4)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File4, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File4)
                End If
            End If
            If FUImg5.HasFile Then
                If Not BLL.isImage(FUImg5.FileContent) Then
                    Exit Sub
                End If
                If FUImg5.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File5 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg5.PostedFile.FileName)
                    FUImg5.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File5)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File5, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File5)
                End If
            End If
            If FUImg6.HasFile Then
                If Not BLL.isImage(FUImg6.FileContent) Then
                    Exit Sub
                End If
                If FUImg6.PostedFile.ContentType.Split("/")(0) = "image" Then
                    File6 = Guid.NewGuid().ToString & System.IO.Path.GetExtension(FUImg6.PostedFile.FileName)
                    FUImg6.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File6)
                    ResizeImageAndSave(1000, 625, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File6, (System.Configuration.ConfigurationManager.AppSettings("productpath")) + File6)
                    'CreateThumbnail(600, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productactualpath")) + File6, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings("productpath")) + File6)
                End If
            End If
            Dim user As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            'Dim PageURL As String = BLL.GetPageURL(txtProductName.Text)
            'Dim FolderPath As String = System.Configuration.ConfigurationManager.AppSettings("UserName")
            Dim Result As String = BLL.UpdateTourImages(hfId.Value, File1, File2, File3, File4, File5, File6)
            showdata()
            'div1.Visible = False
            'div3.Visible = False
            'div2.Visible = True
            litmsg.Text = Notifications.SuccessMessage("Add/Update Successfull.")
        Catch ex As Exception
            litmsg.Text = Notifications.ErrorMessage("Sorry For Inconvenience. Please Try Again Later")
        End Try

    End Sub

    Private Sub btnList_Click(sender As Object, e As EventArgs) Handles btnList.Click
        div1.Visible = False
        div2.Visible = True
        div3.Visible = False
        litmsg.Text = ""
        hfId.Value = 0
    End Sub
    Public Function ResizeImageAndSave(ByVal Width As Integer, ByVal Height As Integer, ByVal imageUrl As String, ByVal destPath As String) As String
        Dim fullsizeImage As System.Drawing.Image = System.Drawing.Image.FromFile(imageUrl)
        Dim newWidth As Integer = Width
        Dim maxHeight As Integer = Height
        Dim newHeight As Integer
        newHeight = maxHeight
        'fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone)
        'fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone)

        'If fullsizeImage.Width <= newWidth Then
        '    newWidth = fullsizeImage.Width
        'End If

        'Dim newHeight As Integer = fullsizeImage.Height * newWidth / fullsizeImage.Width

        'If newHeight > maxHeight Then
        '    newWidth = fullsizeImage.Width * maxHeight / fullsizeImage.Height
        '    newHeight = maxHeight
        'End If

        Dim newImage As System.Drawing.Image = fullsizeImage.GetThumbnailImage(newWidth, newHeight, Nothing, IntPtr.Zero)
        newImage.Save(HttpContext.Current.Server.MapPath(destPath), ImageFormat.Jpeg)
        fullsizeImage.Dispose()
        Return ""
    End Function
End Class
