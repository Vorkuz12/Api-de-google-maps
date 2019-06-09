<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mapa.aspx.cs" Inherits="GMAP.Mapa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<!--Boostraap y JQUERY-->
<head runat="server">

    <title>Ej Google Maps</title>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!--Api Key-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=''></script>
    <script src="js/locationpicker.jquery.js"></script>
    <!--Fin-->

</head>
<body>
    <!--HTML  CON BOOSTRAP-->
    <form id="form1" runat="server">
        <div class="container">
            <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn-default">
                <span class="glyphicon glyphicon-map-marker"></span><span id="ubicacion">Seleccione una ubicacíon</span>
            </button>
        </div>
        <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Ubicación:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="MapaModaladdres" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div id="modalMapClassPrevie" style="height: 400px; width: 100%;">
                                </div>
                                <div class="clearfix">&nbsp;</div>
                                <div class="m-t-small">
                                    <label class="p-r-small col-sm-1 control-label">Lat.:</label>
                                    <div class="m-t-small">
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="Latitud" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <label class="p-r-small col-sm-1 control-label">Long.:</label>
                                        <div class="m-t-small">
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="Longitud" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-3">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                                            </div>
                                        </div>
                                        <div class="clearfix">&nbsp;</div>
                                    </div>
                                    <!--HTML DISEÑADO POR BOOSTRAP-->
                                    <script>
                                        //Func del script de location pick en el mapa
                                        $('#modalMapClassPrevie').locationpicker({
                                            radius: 0,
                                            location: {
                                                latitude: 9.9333296,
                                                longitude: -84.0833282
                                            },
                                            //Este script guarda las cordenadas del marker , para guardarlas en una base de datos
                                            enableAutocComplete: true,
                                            inputBinding: {

                                                latitudeInput: $('#<%=Latitud.ClientID%>'),
                                                longitudeInput: $('#<%=Longitud.ClientID%>'),
                                                locationNameInput: $('#<%=MapaModaladdres.ClientID%>')

                                            },
                                            //Esta funcion de  se encarga de actualizar las cordendas en su input 
                                            onchanged: function (currectLocation, radius, isMarkerDropped) {
                                                $('#ubicacion').html($('#MapaModaladdres').val());
                                            }
                                        });
                                        $('ModalMap').on('show.bs.modal', function () {
                                            $('#modalMapClassPrevie').locationpicker('autosize');
                                        });

                                    </script>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>

</html>
