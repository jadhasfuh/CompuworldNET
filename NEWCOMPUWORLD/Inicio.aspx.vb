
Partial Class _Default
    Inherits Page

    Private Sub lblDescSem_Load(sender As Object, e As EventArgs) Handles lblDescSem.Load
        If Application("DescuentoInicio") <> "" Then
            lblDescSem.Text = Application("DescuentoInicio")
        Else
            lblDescSem.Text = "30"
        End If
    End Sub

    Private Sub btnElectronica_Click(sender As Object, e As EventArgs) Handles btnElectronica.Click
        Application("NombreCat") = "ELECTRONICA"
        Response.Redirect("~/Busqueda.aspx")
    End Sub

    Private Sub btnEquiposComputo_Click(sender As Object, e As EventArgs) Handles btnEquiposComputo.Click
        Application("NombreCat") = "HARDWARE"
        Response.Redirect("~/Busqueda.aspx")
    End Sub

    Private Sub btnHarware_Click(sender As Object, e As EventArgs) Handles btnHarware.Click
        Application("NombreCat") = "HARDWARE"
        Response.Redirect("~/Busqueda.aspx")
    End Sub

    Private Sub btnPapeleria_Click(sender As Object, e As EventArgs) Handles btnPapeleria.Click
        Application("NombreCat") = "PAPELERIA"
        Response.Redirect("~/Busqueda.aspx")
    End Sub
    Dim TA As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter
    Private Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand
        If e.CommandName = "ComprarP" Then
            Dim item As RepeaterItem = e.Item
            Dim prodID As String = (TryCast(item.FindControl("lblIDPD"), Label)).Text 'AQUI ESTA EL ID
            Application("Articulo") = prodID
            TA.INCREMENTOCLIC(Application("Articulo"))
            Response.Redirect("Previa")
        End If
    End Sub

    Private Sub Repeater2_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater2.ItemCommand
        If e.CommandName = "ComprarP" Then
            Dim item As RepeaterItem = e.Item
            Dim prodID As String = (TryCast(item.FindControl("lblIDPD"), Label)).Text 'AQUI ESTA EL ID
            Application("Articulo") = prodID
            TA.INCREMENTOCLIC(Application("Articulo"))
            Response.Redirect("Previa")
        End If
    End Sub

End Class