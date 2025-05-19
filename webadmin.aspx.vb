﻿
Partial Class webadmin
    Inherits System.Web.UI.Page
    Dim BLL As New BusinessLogicLayer
    Dim enc As New Encryption64
    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        'If txtcode.Text = ViewState("scode").ToString Then
        Session.Clear()
        Dim Dr As SqlDataReader = BLL.CheckAdminLogin(txtlogin.Text, txtPassword.Text, Request.ServerVariables("REMOTE_ADDR"))
        If Dr.Read Then
            'Dim Dr2 As SqlDataReader = BLL.ExecDataReaderProc("sp_ChkNotification", "@User", "Admin")
            'If Dr2.Read Then
            '    Session("userid") = txtlogin.Text
            '    Session("admpwd") = txtPassword.Text
            '    Response.Redirect("admin_notification.aspx", False)
            'Else
            Session("Menustr") = Dr("Menustr")
            If Session("Menustr") = "" Or IsNothing(Session("Menustr")) Then
                Response.Redirect("/?m=Invalid User Id/Password", False)
            Else
                Dim arr() As String
                arr = Left(Session("Menustr").ToString(), Session("Menustr").ToString.Length - 1).Split(",")
                arr = BLL.GetDistinctValues(arr)
                Session("Menustr") = Join(arr, ",") + ","
                Session("User") = "Admin"
                Session("Operator") = Dr("UserName")
                Session("Loginid") = txtlogin.Text
                Session("userid") = txtlogin.Text
                Response.Redirect("Admin/home.aspx", False)
            End If
            'End If
        Else
            litmsg.Text = Notifications.ErrorMessage("invalid userid or password")
        End If

        'Else
        'Response.Redirect("/?m=Email code", False)
        'End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("User") = "Admin" Then
                'Response.Redirect("../Welcome.aspx", False)
                If Not Request.QueryString("Id") Is Nothing Then
                    Dim LoginId As String = Server.UrlDecode(enc.Decrypt(Request.QueryString("ID")))
                    Dim Dr As SqlDataReader = BLL.ExecDataReader("select * from Usermaster where LoginId=@LoginId", "@LoginId", LoginId)
                    If Dr.Read Then
                        Session("Menustr") = Dr("Menustr")
                        If Session("Menustr") = "" Or IsNothing(Session("Menustr")) Then
                            Response.Redirect("/?m=Invalid User Id/Password", False)
                        Else
                            Dim arr() As String
                            arr = Left(Session("Menustr").ToString(), Session("Menustr").ToString.Length - 1).Split(",")
                            arr = BLL.GetDistinctValues(arr)
                            Session("Menustr") = Join(arr, ",") + ","
                            Session("User") = "Admin"
                            Session("Operator") = Dr("UserName")
                            Session("Loginid") = txtlogin.Text
                            Session("userid") = txtlogin.Text
                            Response.Redirect("Admin/home.aspx", False)
                        End If
                    Else
                        litmsg.Text = Notifications.ErrorMessage("invalid userid or password")
                    End If
                Else
                    Session.Abandon()
                    Response.Redirect("webadmin.aspx")
                End If
            Else
                Session.Abandon()

            End If
        End If
    End Sub
End Class
