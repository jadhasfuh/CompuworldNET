
Partial Class NotFound
    Inherits System.Web.UI.Page

    Private Sub Articulo_Load(sender As Object, e As EventArgs) Handles Articulo.Load
        Articulo.Text = "Lo sentimos no encontramos '" & Session("BusquedaArt") & "' en nuestra lista de productos"
    End Sub
End Class
