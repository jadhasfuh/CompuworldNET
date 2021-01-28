Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI

Public Partial Class Account_Register
    Inherits Page
    Protected Sub CreateUser_Click(sender As Object, e As EventArgs)
        Dim manager = New UserManager()
        Dim user = New ApplicationUser() With {.UserName = userName.Text}
        Dim result = manager.Create(user, Password.Text)
        Dim userID As New dsNCWOferta.AspNetUsersDataTable
        If result.Succeeded Then
            IdentityHelper.SignIn(manager, user, isPersistent:=False)
            Dim TA As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
            Dim TA2 As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
            Try
                userID = TA2.GetDataUSER(UserName.Text)
                Response.Write("<script language=""javascript"">alert('Usuario creado exitosamente');</script>")
                TA.INICIOSESION(userID(0).UserName)
                If userID(0).UserName.Equals("Adrian") Then
                    Response.Redirect("/APages/AdministracionOferta.aspx")
                Else
                    Response.Redirect("/Inicio.aspx")
                End If
            Catch ex As Exception
                TA.CIERRESESION()
            End Try
        Else
            ErrorMessage.Text = result.Errors.FirstOrDefault()
        End If
    End Sub
End Class
