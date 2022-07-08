<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="Taller_Mecanico.Admins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/AdminsHome.css" />

    </head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <nav class="navbar">
                <asp:LinkButton ID="linkUsuarios" runat="server" CssClass="links" OnClick="LinkButton1_Click">Usuarios</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="links" OnClick="LinkButton1_Click1">Admins</asp:LinkButton>
                <asp:LinkButton ID="linkProveedores" runat="server" CssClass="links" OnClick="linkProveedores_Click" >Proveedores</asp:LinkButton>                   
                <asp:LinkButton ID="linkRepuestos" runat="server" CssClass="links" OnClick="linkRepuestos_Click">Repuestos</asp:LinkButton>
                <asp:LinkButton ID="linkVehiculos" runat="server" CssClass="links" OnClick="linkVehiculos_Click">Vehiculos</asp:LinkButton>
                <asp:LinkButton ID="linkMecanicos" runat="server" CssClass="links" OnClick="linkMecanicos_Click">Mecanicos</asp:LinkButton>
                <asp:LinkButton ID="linkReparaciones" runat="server" CssClass="links" OnClick="linkReparaciones_Click">Reparaciones</asp:LinkButton>
                <asp:LinkButton ID="linkAgregarRepuesto" runat="server" CssClass="links" OnClick="linkAgregarRepuesto_Click">Agregar Repuestos a Reparacion</asp:LinkButton>
                <asp:LinkButton ID="linkLogin" runat="server" CssClass="cerrarSesion" OnClick="linkLogin_Click">Cerrar Sesion</asp:LinkButton>
            </nav>
            <hr />
            <div class="Filtrar"> 
               <h4>Filtrar por fecha</h4>
               <p>Inicio Reparacion :<asp:TextBox ID="txtFechaInicio" runat="server" type="date" />
                Fin Reparación : <asp:TextBox ID="txtFechaFin" runat="server" type="date" /> </p> 
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btnFiltrar" OnClick="btnFiltrar_Click" Text="Filtrar" />
            </div>
            <div style="display:flex;">
                <div class="gridReparaciones">
                    <h2>LISTA DE REPARACIONES</h2>
                     <asp:GridView ID="GridReparaciones" runat="server" AutoGenerateColumns ="False" Width="633px" Height="60px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
                        <Columns>
                            <asp:BoundField DataField="IdReparacion" HeaderText="Id" />
                            <asp:BoundField DataField="IdVehiculo" HeaderText="Vehiculo" />
                            <asp:BoundField DataField="FchEntrada" HeaderText="Fecha Entrada" />
                            <asp:BoundField DataField="IdMecanico" HeaderText="Mecanico" />
                            <asp:BoundField DataField="DscEntrada" HeaderText="Desc. Entrada" />
                            <asp:BoundField DataField="KmsEntrada" HeaderText="KMS" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdReparacion") %>' OnClick="link_OnClick" >Ver Detalles</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                         <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                         <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                         <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F1F1F1" />
                         <SortedAscendingHeaderStyle BackColor="#594B9C" />
                         <SortedDescendingCellStyle BackColor="#CAC9C9" />
                         <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </div>
                <br />
                <div id="divDetalle" aria-disabled="False" class="detalle" aria-pressed="false">
                        <h3>Detalle de reparacion</h3>
                       <p> <asp:Label ID="txt1" runat="server" CssClass="label" Text="Descripcion de la reparación :" Visible="False"></asp:Label>
                        <asp:Label ID="txtDsc" CssClass="datos" runat="server"></asp:Label></p>

                       <p>  <asp:Label ID="txt2" runat="server" CssClass="label" Text="Fecha de inicio:" Visible="False"></asp:Label>
                        <asp:Label ID="txtFecha" CssClass="datos" runat="server"></asp:Label></p>
 
                       <p>  <asp:Label ID="txt3" runat="server" CssClass="label" Text="Marca y modelo del vehiculo :" Visible="False"></asp:Label>
                        <asp:Label ID="txtMarca" CssClass="datos" runat="server"></asp:Label></p>
 
                       <p>  <asp:Label ID="txt4" runat="server" CssClass="label" Text="Matricula del vehiculo  :" Visible="False"></asp:Label>
                        <asp:Label ID="txtVehiculo" CssClass="datos" runat="server"></asp:Label></p>

                       <p>  <asp:Label ID="txt5" runat="server" CssClass="label" Text="Dueño del vehiculo :" Visible="False"></asp:Label>
                        <asp:Label ID="txtDueno" CssClass="datos" runat="server"></asp:Label></p>
            
                       <p>  <asp:Label ID="txt7" runat="server" CssClass="label" Text="Mecanico a cargo:" Visible="False" ></asp:Label>
                        <asp:Label ID="txtMecanico" CssClass="datos" runat="server"></asp:Label></p>
          
                        <p class="auto-style3"><asp:Label ID="txt6" CssClass="label" runat="server" Text="Repuestos utilizados :" Visible="False"></asp:Label></p>
                       <div class="grid">
                            <asp:GridView ID="GridRepuestos" runat="server" AutoGenerateColumns ="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="IdRepuesto" HeaderText="Id" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                    <asp:BoundField DataField="Costo" HeaderText="Costo" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                              </asp:GridView>
                        </div>
                
                    </div>
                </div>
                      <div class="Estadisticas">                          
                          <h2>Estadisticas</h2>
                          <hr />
                          <asp:Button ID="btnRepuesto" runat="server" CssClass="btnRepuesto" OnClick="btnRepuesto_Click" Text="Ver Repuesto mas usado" />
                     <asp:GridView ID="GridRepuestoMasUsado" runat="server" AutoGenerateColumns ="False" Width="251px" Height="22px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
                        <Columns>
                            <asp:BoundField DataField="IdRepuesto" HeaderText="Id" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="Costo" HeaderText="Costo" />
                        </Columns>
                         <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                         <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                         <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                         <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F1F1F1" />
                         <SortedAscendingHeaderStyle BackColor="#594B9C" />
                         <SortedDescendingCellStyle BackColor="#CAC9C9" />
                         <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </div>

            
        </div>
       
&nbsp;</form>
</body>
</html>
