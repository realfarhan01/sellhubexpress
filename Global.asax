<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        If Not (Context.Request.IsSecureConnection) Then
            Response.Redirect(Context.Request.Url.ToString().Replace("http:", "https:"))
        End If
        Dim originalPath As String = HttpContext.Current.Request.Path.ToLower()
        Dim sPath As String = System.Web.HttpContext.Current.Request.Url.AbsolutePath.ToLower()
        Dim PageName As String = sPath.Replace("/", "")
        Dim originalPathAcurate As String = HttpContext.Current.Request.Path
        Dim sPathAcurate As String = System.Web.HttpContext.Current.Request.Url.AbsolutePath
        Dim PageNameAcurate As String = sPathAcurate.Replace("/", "")
        Dim CallPage As String = ""
        If Not originalPath.Contains(".jpg") AndAlso Not originalPath.Contains(".png") AndAlso Not originalPath.Contains(".jpeg") Then
            If originalPath.Contains("/contact-us") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "contact.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("/blogs") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "blogs.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "blogdetail.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("explore-") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "destination.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("tourpackages") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "TourPackageCategories.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("tour-packages") And Not originalPath.Contains("-blog") Then
                'GetAccentedStr = HttpUtility.UrlEncode(PageName)
                'originalPathAcurate = HttpUtility.UrlEncode(originalPathAcurate)
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "tourpackages.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("tourpackage-") And Not originalPath.Contains("-blog") Then
                'PageName = HttpUtility.UrlEncode(PageName)
                'originalPathAcurate = HttpUtility.UrlEncode(originalPathAcurate)
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "tourpackagedetail.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("activity-") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "activities.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("exploredestinations") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "exploredestinations.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("departures") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "departures.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("booking") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "booking.aspx")
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("privacy-policy") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "activities.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
            ElseIf originalPath.Contains("about-us") And Not originalPath.Contains("-blog") Then
                CallPage = originalPathAcurate.Replace(PageNameAcurate, "activities.aspx?page=" + PageName)
                Context.RewritePath(CallPage, False)
                'Else
                '    CallPage = originalPathAcurate.Replace(PageNameAcurate, "index.aspx")
                '    Context.RewritePath(CallPage, False)
            End If
        End If
    End Sub

</script>