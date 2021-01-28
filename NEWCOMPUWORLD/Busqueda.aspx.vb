
Partial Class Busqueda
    Inherits System.Web.UI.Page

    Dim querys1 As String
    Dim querys2 As String
    Dim querys3 As String

    Private Sub Reload()
        btnAlma.Visible = False
        btnCabc.Visible = False
        btnComp.Visible = False
        btnEnfri.Visible = False
        btnGabi.Visible = False
        btnGame.Visible = False
        btnImpr.Visible = False
        btnMer.Visible = False
        btnAudio.Visible = False
        btnHerra.Visible = False
        btnLimpi.Visible = False
        btnMoni.Visible = False
        btnIlumi.Visible = False
        btnEscof.Visible = False
        btnMochi.Visible = False
        btnPapcar.Visible = False
        btnAcce.Visible = False
        btnCelu.Visible = False
        btnFunda.Visible = False
        btnTable.Visible = False
    End Sub

    Private Sub Busqueda_Load(sender As Object, e As EventArgs) Handles Me.Load
        Reload()
        If Session("BusHecha") Then
            querys1 = "SELECT [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD], [SUBCATEGORIA_PROD], [CATEGORIA_PROD] FROM [PRODUCTOS] WHERE [NOMBRE_PROD] LIKE '%" & Session("BucarProducto") & "%'"
            Session("BusHecha") = False
            LabelC.Visible = False
            CatName.Visible = False
            LabelProductos.Text = "'" & Session("BucarProducto") & "'"
            Application("NombreCat") = ""
        ElseIf Session("BusSub") Then
            querys1 = "SELECT [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD], [SUBCATEGORIA_PROD], [CATEGORIA_PROD] FROM [PRODUCTOS] WHERE [SUBCATEGORIA_PROD] = '" & Session("Subcategoria") & "'"
            querys2 = "SELECT [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD] FROM [PRODUCTOS] WHERE [SUBCATEGORIA_PROD] = '" & Session("Subcategoria") & "' ORDER BY [CLICS] DESC OFFSET 1 ROWS"
            querys3 = "SELECT TOP 1 [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD] FROM [PRODUCTOS] WHERE [SUBCATEGORIA_PROD] = '" & Session("Subcategoria") & "' ORDER BY [CLICS] DESC"
            Session("BusSub") = False
            LabelC.Visible = True
            CatName.Visible = True
            LabelProductos.Text = "Todos los productos"
        Else
            querys1 = "SELECT [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD], [SUBCATEGORIA_PROD], [CATEGORIA_PROD] FROM [PRODUCTOS] WHERE [CATEGORIA_PROD] = '" & Application("NombreCat") & "'"
            querys2 = "SELECT [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD] FROM [PRODUCTOS] WHERE [CATEGORIA_PROD] = '" & Application("NombreCat") & "' ORDER BY [CLICS] DESC OFFSET 1 ROWS"
            querys3 = "SELECT TOP 1 [ID_PROD], [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD] FROM [PRODUCTOS] WHERE [CATEGORIA_PROD] = '" & Application("NombreCat") & "' ORDER BY [CLICS] DESC"
            LabelProductos.Text = "Todos los productos"
            LabelC.Visible = True
            CatName.Visible = True
        End If
        If String.Compare(Application("NombreCat"), "HARDWARE") = 0 Then
            CatName.Text = "Hardware"
            btnAlma.Visible = True
            btnCabc.Visible = True
            btnComp.Visible = True
            btnEnfri.Visible = True
            btnGabi.Visible = True
            btnGame.Visible = True
            btnImpr.Visible = True
            btnMer.Visible = True
        ElseIf String.Compare(Application("NombreCat"), "ELECTRONICA") = 0 Then
            CatName.Text = "Electrónica"
            btnAudio.Visible = True
            btnHerra.Visible = True
            btnLimpi.Visible = True
            btnMoni.Visible = True
            btnIlumi.Visible = True
        ElseIf String.Compare(Application("NombreCat"), "PAPELERIA") = 0 Then
            CatName.Text = "Papelería"
            btnEscof.Visible = True
            btnMochi.Visible = True
            btnPapcar.Visible = True
        ElseIf String.Compare(Application("NombreCat"), "GADGETS") = 0 Then
            CatName.Text = "Gadgets"
            btnAcce.Visible = True
            btnCelu.Visible = True
            btnFunda.Visible = True
            btnTable.Visible = True
        Else
            Reload()
        End If
    End Sub

    Private Sub SqlProductos_Load(sender As Object, e As EventArgs) Handles SqlProductos.Load
        SqlProductos.SelectCommand = querys1
        SqlProductos2.SelectCommand = querys2
        SqlProductos3.SelectCommand = querys3
    End Sub

    Private Sub SqlProductos_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlProductos.Selected
        If e.AffectedRows.ToString.Equals("0") Then
            Response.Redirect("NotFound")
        End If
    End Sub

    Private Sub RSubcat(subcat As String)
        Session("Subcategoria") = subcat
        Session("BusSub") = True
        If subcat.Equals("RAM") Or subcat.Equals("Impresoras") Or subcat.Equals("Gamepads") Or subcat.Equals("Almacenamiento") Or subcat.Equals("Cables") Or subcat.Equals("Computadoras") Or subcat.Equals("Enfriamiento") Or subcat.Equals("Gabinetes") Then
            Application("NombreCat") = "HARDWARE"
        End If
        If subcat.Equals("Accesorios") Or subcat.Equals("Celulares") Or subcat.Equals("Fundas") Or subcat.Equals("Tabletas") Then
            Application("NombreCat") = "GADGETS"
        End If
        If subcat.Equals("Audio") Or subcat.Equals("Herramientas") Or subcat.Equals("Iluminacion") Or subcat.Equals("Limpieza") Or subcat.Equals("Monitores") Then
            Application("NombreCat") = "ELECTRONICA"
        End If
        If subcat.Equals("PAPECART") Or subcat.Equals("Mochilas") Or subcat.Equals("ESCOFFICE") Then
            Application("NombreCat") = "PAPELERIA"
        End If
        Response.Redirect("Busqueda")
    End Sub

    Private Sub btnAcce_Click(sender As Object, e As EventArgs) Handles btnAcce.Click
        RSubcat("ACCESORIOS")
    End Sub

    Private Sub btnAlma_Click(sender As Object, e As EventArgs) Handles btnAlma.Click
        RSubcat("ALMACENAMIENTO")
    End Sub

    Private Sub btnAudio_Click(sender As Object, e As EventArgs) Handles btnAudio.Click
        RSubcat("AUDIO")
    End Sub

    Private Sub btnCabc_Click(sender As Object, e As EventArgs) Handles btnCabc.Click
        RSubcat("CABLES")
    End Sub

    Private Sub btnCelu_Click(sender As Object, e As EventArgs) Handles btnCelu.Click
        RSubcat("CELULARES")
    End Sub

    Private Sub btnComp_Click(sender As Object, e As EventArgs) Handles btnComp.Click
        RSubcat("COMPUTADORAS")
    End Sub

    Private Sub btnEnfri_Click(sender As Object, e As EventArgs) Handles btnEnfri.Click
        RSubcat("ENFRIAMIENTO")
    End Sub

    Private Sub btnEscof_Click(sender As Object, e As EventArgs) Handles btnEscof.Click
        RSubcat("ESCOFFICE")
    End Sub

    Private Sub btnFunda_Click(sender As Object, e As EventArgs) Handles btnFunda.Click
        RSubcat("FUNDAS")
    End Sub

    Private Sub btnGabi_Click(sender As Object, e As EventArgs) Handles btnGabi.Click
        RSubcat("GABINETES")
    End Sub

    Private Sub btnGame_Click(sender As Object, e As EventArgs) Handles btnGame.Click
        RSubcat("GAMEPADS")
    End Sub

    Private Sub btnHerra_Click(sender As Object, e As EventArgs) Handles btnHerra.Click
        RSubcat("HERRAMIENTAS")
    End Sub

    Private Sub btnIlumi_Click(sender As Object, e As EventArgs) Handles btnIlumi.Click
        RSubcat("ILUMINACION")
    End Sub

    Private Sub btnImpr_Click(sender As Object, e As EventArgs) Handles btnImpr.Click
        RSubcat("IMPRESORAS")
    End Sub

    Private Sub btnLimpi_Click(sender As Object, e As EventArgs) Handles btnLimpi.Click
        RSubcat("LIMPIEZA")
    End Sub

    Private Sub btnMer_Click(sender As Object, e As EventArgs) Handles btnMer.Click
        RSubcat("RAM")
    End Sub

    Private Sub btnMochi_Click(sender As Object, e As EventArgs) Handles btnMochi.Click
        RSubcat("MOCHILAS")
    End Sub

    Private Sub btnMoni_Click(sender As Object, e As EventArgs) Handles btnMoni.Click
        RSubcat("MONITORES")
    End Sub

    Private Sub btnPapcar_Click(sender As Object, e As EventArgs) Handles btnPapcar.Click
        RSubcat("PAPECART")
    End Sub

    Private Sub btnTable_Click(sender As Object, e As EventArgs) Handles btnTable.Click
        RSubcat("TABLETAS")
    End Sub
    Dim TA As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter
    Private Sub RepProds_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles RepProds.ItemCommand
        If e.CommandName = "ComprarP" Then
            Dim item As RepeaterItem = e.Item '`REFERENCE THE CONTROLS
            Dim prodID As String = (TryCast(item.FindControl("lblIDPD"), Label)).Text 'AQUI ESTA EL ID
            Application("Articulo") = prodID
            TA.INCREMENTOCLIC(Application("Articulo"))
            Response.Redirect("Previa")
        End If
    End Sub

    Private Sub RepVendi_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles RepVendi.ItemCommand
        If e.CommandName = "ComprarP" Then
            Dim item As RepeaterItem = e.Item
            Dim prodID As String = (TryCast(item.FindControl("lblIDPD"), Label)).Text 'AQUI ESTA EL ID
            Application("Articulo") = prodID
            TA.INCREMENTOCLIC(Application("Articulo"))
            Response.Redirect("Previa")
        End If
    End Sub

    Private Sub RepVendi2_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles RepVendi2.ItemCommand
        If e.CommandName = "ComprarP" Then
            Dim item As RepeaterItem = e.Item
            Dim prodID As String = (TryCast(item.FindControl("lblIDPD"), Label)).Text 'AQUI ESTA EL ID
            Application("Articulo") = prodID
            TA.INCREMENTOCLIC(Application("Articulo"))
            Response.Redirect("Previa")
        End If
    End Sub
End Class
