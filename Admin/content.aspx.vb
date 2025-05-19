Imports System.Drawing
Imports System.Drawing.Drawing2D
Partial Class content
    Inherits BasePage
    Dim BLL As New BusinessLogicLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Page.Title = "Advance MLM Softwares - Contact"
            'Page.MetaDescription = "Contact Advance MLM Softwares for Best MLM Software Development in India. Our support team will get back to you during standard business hours."
            'Page.MetaKeywords = "Contact Advance MLM Softwares, MLM Software Development Company, Multi Level Marketing, MLM Plan Demo, MLM Software Demo"

            ddlContent.DataSource = BLL.ExecDataTable("select contentid,PageName from tblcontent Where UserName=@UserName and Deleted=0", "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
            ddlContent.DataValueField = "contentid"
            ddlContent.DataTextField = "PageName"
            ddlContent.DataBind()

            showData()
        End If

    End Sub
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsave.Click
        Dim File As String = ""
        If FileUpload.HasFile Then
            'File = txtPageURL.Text
            If Not BLL.isImage(FileUpload.FileContent) Then
                Exit Sub
            End If
            If FileUpload.PostedFile.ContentType.Split("/")(0) = "image" Then
                File = BLL.GetPageURL(ddlContent.SelectedItem.Text)
                'File = FileUpload.FileName
                File = File & System.IO.Path.GetExtension(FileUpload.PostedFile.FileName)
                FileUpload.SaveAs(Server.MapPath("../images/content/") + File)
                CreateThumbnail(400, Server.MapPath("../images/content/") + File, Server.MapPath("../images/content/thumbnail/") + File)
            End If
        End If
        BLL.ExecNonQueryProc("Prc_UpdateContent", "@ContentId", ddlContent.SelectedValue, "@Content", txtcontent.Text, "@MetaTag", txtMetaTag.Text, "@PageTitle", txtPageTitle.Text, "@MetaDescription", txtMetaDescription.Text, "@MetaKeywords", txtMetaKeywords.Text, "@Deactivated", 0, "@ImageName", File, "@UserName", System.Configuration.ConfigurationManager.AppSettings("UserName"))
    End Sub
    Private Sub showData()

        Dim dr As SqlDataReader = BLL.ExecDataReader("select Content,Deactivated,PageURL,MetaTag,PageTitle,MetaDescription,MetaKeywords from tblcontent where contentid=@ContentId", "@ContentId", ddlContent.SelectedValue)
        While dr.Read
            txtcontent.Text = dr("Content")
            txtMetaTag.Text = dr("MetaTag")
            txtPageURL.Text = dr("PageURL")
            txtPageTitle.Text = dr("PageTitle")
            txtMetaDescription.Text = dr("MetaDescription")
            txtMetaKeywords.Text = dr("MetaKeywords")
            'chkshow.Checked = False
            'If dr("Content").ToString() = "1" Then
            '    chkshow.Checked = True
            'End If
        End While

    End Sub

    Protected Sub ddlContent_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlContent.SelectedIndexChanged
        showData()
    End Sub
    Sub CreateThumbnail(ByVal ThumbnailMax As Integer, ByVal OriginalImagePath As String, ByVal ThumbnailImagePath As String)
        ' Loads original image from file
        Dim imgOriginal As Image = Image.FromFile(OriginalImagePath)
        ' Finds height and width of original image
        Dim OriginalHeight As Single = imgOriginal.Height
        Dim OriginalWidth As Single = imgOriginal.Width
        ' Finds height and width of resized image
        Dim ThumbnailWidth As Integer
        Dim ThumbnailHeight As Integer
        If OriginalHeight > OriginalWidth Then
            ThumbnailHeight = ThumbnailMax
            ThumbnailWidth = (OriginalWidth / OriginalHeight) * ThumbnailMax
        Else
            ThumbnailWidth = ThumbnailMax
            ThumbnailHeight = (OriginalHeight / OriginalWidth) * ThumbnailMax
        End If
        ' Create new bitmap that will be used for thumbnail
        Dim ThumbnailBitmap As Bitmap = New Bitmap(ThumbnailWidth, ThumbnailHeight)
        Dim ResizedImage As Graphics = Graphics.FromImage(ThumbnailBitmap)
        ' Resized image will have best possible quality
        ResizedImage.InterpolationMode = InterpolationMode.HighQualityBicubic
        ResizedImage.CompositingQuality = CompositingQuality.HighQuality
        ResizedImage.SmoothingMode = SmoothingMode.HighQuality
        ' Draw resized image
        ResizedImage.DrawImage(imgOriginal, 0, 0, ThumbnailWidth, ThumbnailHeight)
        ' Save thumbnail to file
        ThumbnailBitmap.Save(ThumbnailImagePath)
    End Sub
End Class
