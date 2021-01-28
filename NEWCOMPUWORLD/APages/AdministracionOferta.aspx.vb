Partial Class APages_AdministracionOferta
    Inherits System.Web.UI.Page

    Private Sub btnMasVistos_Click(sender As Object, e As ImageClickEventArgs) Handles btnMasVistos.Click
        Response.Redirect("~/APages/MasVistos.aspx")
    End Sub

    Private Sub btnOfertas_Click(sender As Object, e As ImageClickEventArgs) Handles btnOfertas.Click
        Response.Redirect("~/APages/Ofertas.aspx")
    End Sub

    Private Sub btnInventario_Click(sender As Object, e As ImageClickEventArgs) Handles btnInventario.Click
        Response.Redirect("~/APages/Existencias.aspx")
    End Sub
End Class
