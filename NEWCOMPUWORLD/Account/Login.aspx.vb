Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.Owin.Security

Public Partial Class Account_Login
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register"
        Session("NomUsuario") = ""
        Dim TA As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
        Try
            TA.CIERRESESION()
        Catch ex As Exception
            TA.CIERRESESION()
        End Try
        OpenAuthLogin.ReturnUrl = Request.QueryString("ReturnUrl")
        Dim returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
        If Not [String].IsNullOrEmpty(returnUrl) Then
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" & returnUrl
        End If
    End Sub

    Protected Sub LogIn(sender As Object, e As EventArgs)
        If IsValid Then
            ' Validar la contraseña del usuario
            Dim manager = New UserManager()
            Dim user As ApplicationUser = manager.Find(UserName.Text, Password.Text)
            If user IsNot Nothing Then
                IdentityHelper.SignIn(manager, user, RememberMe.Checked)
                Dim TA As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
                Session("NomUsuario") = UCase(UserName.Text)
                Try
                    TA.INICIOSESION(Session("NomUsuario"))
                Catch ex As Exception
                    TA.CIERRESESION()
                End Try
                If Session("NomUsuario") = "ADRIAN" Then
                    Response.Redirect("~/APages/AdministracionOferta.aspx")
                ElseIf Application("canProd") = 0 Then
                    Response.Redirect("~/Inicio.aspx")
                Else
                    Response.Redirect("~/Account/Carrito.aspx")
                End If
            Else
                FailureText.Text = "Nombre de usuario o contraseña no válidos."
                ErrorMessage.Visible = True
            End If
        End If
    End Sub
End Class
