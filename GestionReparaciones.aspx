<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionReparaciones.aspx.cs" Inherits="Taller_Mecanico.GestionReparaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="css/forms.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="navbar">
                <asp:LinkButton ID="linkMenu" runat="server" CssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Gestionar Reparaciones"></asp:Label>            
            </div>
            <hr />
            
                
    
            <div class="formulario" style="height: 500px;">
                <div class="datos">
                    <asp:TextBox ID="txtId" CssClass="inputs" runat="server"></asp:TextBox>

                    <asp:DropDownList ID="txtVehiculo"  CssClass="inputs" runat="server" Height="40px">
                    </asp:DropDownList>

                    <asp:TextBox ID="txtFchEntrada" runat="server"  CssClass="inputs" type="date" ></asp:TextBox>
           
                     <asp:TextBox ID="txtFchSalida" runat="server"  CssClass="inputs" type="date"></asp:TextBox>
         
                    <asp:DropDownList ID="txtMecanico"  CssClass="inputs" runat="server" Height="40px">
                    </asp:DropDownList>
     
                    <asp:TextBox ID="txtDscEntrada" CssClass="inputs" runat="server"></asp:TextBox>
         
                    <asp:TextBox ID="txtDscSalida"  CssClass="inputs" runat="server"></asp:TextBox>
        
                    <asp:TextBox ID="txtKms"  CssClass="inputs" runat="server"></asp:TextBox>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div class="buttons">
                    <asp:Button ID="btnAlta" runat="server" CssClass="btn" Text="Alta" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server"  CssClass="btn" Text="Baja" OnClick="btnBaja_Click" />
                    <asp:Button ID="btnModificar" runat="server"  CssClass="btn" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server"  CssClass="btn" Text="Limpiar" OnClick="btnLimpiar_Click" />

                </div>
            </div>


            <div class="gridAgenda">
                <h2>Reparaciones por ser agendadas</h2>
                <asp:GridView ID="GridAgenda" runat="server" AutoGenerateColumns ="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="IdVehiculo" HeaderText="Vehiculo" />
                        <asp:BoundField DataField="DscEntrada" HeaderText="Descripcion" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkConfirmar" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="linkSeleccionarAgenda_Click" >Confirmar Agenda</asp:LinkButton>
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



            <div class="gridReparacion">
                <asp:GridView ID="GridReparaciones" runat="server" AutoGenerateColumns ="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="IdReparacion" HeaderText="Id" />
                        <asp:BoundField DataField="IdVehiculo" HeaderText="Vehiculo" />
                        <asp:BoundField DataField="FchEntrada" HeaderText="Fecha Entrada" />
                        <asp:BoundField DataField="FchSalida" HeaderText="Fecha Salida" />
                        <asp:BoundField DataField="IdMecanico" HeaderText="Mecanico" />
                        <asp:BoundField DataField="DscEntrada" HeaderText="Desc. Entrada" />
                        <asp:BoundField DataField="DscSalida" HeaderText="Desc. Salida" />
                        <asp:BoundField DataField="KmsEntrada" HeaderText="KMS" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdReparacion") %>' OnClick="link_OnClick" >Ver detalle</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>                    
                <asp:Button ID="btnAgregarRepuestos" runat="server"  CssClass="btnAgregar" OnClick="btnAgregarRepuestos_Click" Text="Agregar Repuestos" />

                <div class="containerAlerts">
                    <asp:Label ID="lblAlertas" CssClass="alerts" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
               
