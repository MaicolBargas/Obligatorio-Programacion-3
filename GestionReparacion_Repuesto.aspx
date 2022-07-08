<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionReparacion_Repuesto.aspx.cs" Inherits="Taller_Mecanico.GestionReparacion_Repuesto" %>

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
            <asp:Label ID="Label1" runat="server" Text="Agregar Repuestos a Reparacion"></asp:Label>
            </div>
            <hr />
            <div class="formulario">
                <div class="datos">
                    <asp:TextBox ID="txtIdReparacion" runat="server" CssClass="inputs" placeHolder="Id Reparacion"></asp:TextBox>

                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="inputs" placeHolder="Descripcion"></asp:TextBox>

                    <asp:DropDownList ID="txtRepuesto" runat="server" CssClass="inputs" height="40px">
                    </asp:DropDownList>

                    <asp:TextBox ID="txtCantidad" type="numeric" runat="server" CssClass="inputs" placeHolder="Cantidad"></asp:TextBox>
                </div>
                <div class="buttons" style="margin-left:25%;">
                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" CssClass="btn" Text="Agregar Repuesto" />
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" CssClass="btn" Text="Limpiar" />
                </div>
            </div>
            
            <div class="grid">
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
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdReparacion") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
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
                <div class="containerAlerts">
                    <asp:Label ID="lblAlertas" CssClass="alerts" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
