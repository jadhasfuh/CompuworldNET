
Partial Class APages_Ofertas
    Inherits System.Web.UI.Page

    Dim o As Integer = 0

    Private Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click

        Dim Productos As New dsNCWOferta.PRODUCTOSDataTable
        Dim TA As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter

        Try
            Productos = TA.GetDataBy1NOMBRE_PROD(txtNomProd.Text.Trim)
            txtPrecio.Text = Productos(0).PRECIO_PROD
            txtOferta.Text = Productos(0).PDESC_PROD
            txtPVenta.Text = (((Convert.ToDecimal(txtPrecio.Text)) - (Convert.ToDecimal(txtPrecio.Text)) * ((Convert.ToDecimal(txtOferta.Text))) / 100)) & ""
            Session("IDProd") = Productos(0).ID_PROD
            img.Visible = True
            imagen.ImageUrl = Productos(0).IMAGEN_PROD
        Catch ex As Exception
            Response.Write("<script> alert('Nombre no válido'); </script>")
            txtNomProd.Text = ""
            txtPrecio.Text = ""
            txtOferta.Text = ""
            txtPVenta.Text = ""
            Response.Redirect("~/APages/Ofertas.aspx")
            img.Visible = False
        End Try

    End Sub

    Private Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click

        Dim TA As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter

        Try
            If Convert.ToDecimal(txtOferta.Text) > 0 Then
                o = 1
            Else
                o = 0
            End If
            TA.MODOFER(o, txtOferta.Text, Session("IDProd"))
            fondo.Visible = False
            correcto.Visible = True
            incorrecto.Visible = False
            img.Visible = False
            txtNomProd.Text = ""
            txtPrecio.Text = ""
            txtOferta.Text = ""
            txtPVenta.Text = ""
        Catch ex As Exception
            fondo.Visible = False
            correcto.Visible = False
            incorrecto.Visible = True
            img.Visible = False
            txtNomProd.Text = ""
            txtPrecio.Text = ""
            txtOferta.Text = ""
            txtPVenta.Text = ""
        End Try

    End Sub

    Private Sub APages_Ofertas_Load(sender As Object, e As EventArgs) Handles Me.Load
        fondo.Visible = True
        correcto.Visible = False
        incorrecto.Visible = False
        img.Visible = False
    End Sub
End Class
