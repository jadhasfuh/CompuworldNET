
Partial Class Previa
    Inherits System.Web.UI.Page
    Dim Productos As New dsNCWOferta.PRODUCTOSDataTable
    Dim Usuarios As New dsNCWOferta.AspNetUsersDataTable
    Dim TA1 As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter
    Dim TA2 As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
    Dim TA3 As New dsNCWOfertaTableAdapters.CARRITOTableAdapter

    Private Sub Previa_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblSinEx.Visible = False
        lblSinCa.Visible = False

        Try
            Productos = TA1.GetDataByID(Application("Articulo"))
            lblNombreProd.Text = Productos(0).NOMBRE_PROD
            lblDescripcion.Text = Productos(0).DESCRIPCION_PROD
            lblDesc.Text = Productos(0).PDESC_PROD & "%"
            lblPrecio.Text = String.Format("{0:C}", Productos(0).PRECIO_PROD)
            lblExistencias.Text = Productos(0).EXISTENCIAS_PROD
            imgProd1.ImageUrl = Productos(0).IMAGEN_PROD
            imgProd2.ImageUrl = Productos(0).IMAGEN_PROD

        Catch ex As Exception
            Response.Redirect("~/NotFound.aspx")
        End Try

    End Sub

    Private Sub btnCarrito_Click(sender As Object, e As EventArgs) Handles btnCarrito.Click
        If txtCan.Text = "" Then
            txtCan.Text = "0"
        End If
        If Session("NomUsuario") <> "" Then
            Productos = TA1.GetDataByID(Application("Articulo")) 'OBTIENE DATOS DEL ARTICULO
            Usuarios = TA2.GetDataUSER(Session("NomUsuario"))
            Try
                If CInt(txtCan.Text) > 0 And CInt(txtCan.Text) <= CInt(lblExistencias.Text) Then
                    TA3.INSERTCARRITO(CInt(txtCan.Text), Productos(0).PRECIO_PROD, Productos(0).PDESC_PROD, CInt(Application("Articulo")), Usuarios(0).Id)
                    Response.Redirect("~/Account/Carrito.aspx")
                ElseIf CInt(txtCan.Text) > CInt(lblExistencias.Text) Then
                    lblSinEx.Visible = True
                ElseIf CInt(txtCan.Text) <= 0 Then
                    lblSinCa.Visible = True
                End If
            Catch ex As Exception
                Response.Write("<SCRIPT LANGUAGE=""JavaScript"">  alert('Error');</script>")
            End Try
        Else
            Response.Redirect("~/Account/Login.aspx")
        End If

    End Sub

End Class
