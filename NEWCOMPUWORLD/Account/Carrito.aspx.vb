
Partial Class Carrito
    Inherits System.Web.UI.Page

    Dim TA1 As New dsNCWOfertaTableAdapters.CARRITOTableAdapter
    Dim TA2 As New dsNCWOfertaTableAdapters.AspNetUsersTableAdapter
    Dim TA3 As New dsNCWOfertaTableAdapters.VENTATableAdapter
    Dim TA4 As New dsNCWOfertaTableAdapters.DETALLEVENTATableAdapter
    Dim TA5 As New dsNCWOfertaTableAdapters.PRODUCTOSTableAdapter

    Private Sub Carrito_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim usuario As New dsNCWOferta.AspNetUsersDataTable
        carritoVacio.Visible = False
        carritoLleno.Visible = True
        lblusID.Visible = False

        Try
            usuario = TA2.GetDataUSER(Session("NomUsuario"))
            lblusID.Text = usuario(0).Id
            lblSubtotal.Text = String.Format("{0:C}", TA1.OBTSUBTOT(usuario(0).Id))
            If lblSubtotal.Text.Trim.Equals("") Then
                carritoVacio.Visible = True
                carritoLleno.Visible = False
            End If
            lblTotal.Text = lblSubtotal.Text
        Catch ex As Exception
            Response.Redirect("~/NotFound.aspx")
        End Try

    End Sub

    Private Sub btnComprarM_Click(sender As Object, e As EventArgs) Handles btnComprarM.Click

        Dim carritoT As New dsNCWOferta.CARRITODataTable
        Dim usuario As New dsNCWOferta.AspNetUsersDataTable
        Dim ventaN As New dsNCWOferta.VENTADataTable

        Dim filas As Integer

        Try
            'OBTENEMOS EL ID DEL USUARIO
            usuario = TA2.GetDataUSER(Session("NomUsuario"))
            carritoT = TA1.GetDataByCARRITO(usuario(0).Id)
            'CREAMOS LA VENTA
            TA3.INSERTAVENTA(System.DateTime.Now.ToString("yyyy/MM/dd"), CDec(lblTotal.Text), usuario(0).Id)
            'AHORA CREAMOS LOS DETALLES
            'PRIMERO ENCONTRAMOS EL NUMERO DE ROWS
            filas = TA1.GETNUMROWS()
            'LUEGO EL ID DE LA ULTIMA VENTA
            ventaN = TA3.GetLASTV()
            Dim index As Integer = 0
            Do While index < filas
                'PRIMERO INSERTAMOS EL DETALLE 
                TA4.INSERTADETALLE(CInt(carritoT(index).CANTIDAD_CARR), CDec(carritoT(index).PRECIO_PROD), CDec(carritoT(index).DESCU_PROD), ventaN(0).ID_VENT, carritoT(index).ID_PROD)
                'LUEGO RESTAMOS EXISTENCIAS
                TA5.RESTAREXIS(CInt(carritoT(index).CANTIDAD_CARR), CInt(carritoT(index).ID_PROD))
                index += 1
            Loop
            TA1.DeleteCARRITO(usuario(0).Id)
            Response.Redirect("~/Account/Carrito.aspx")
        Catch ex As Exception
            Response.Redirect("~/NotFound.aspx")
        End Try

    End Sub

End Class
