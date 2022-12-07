<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/Sitecustomi.css" rel="stylesheet" />
<%--coluna--%>
    <div class="corpoDashboard" style="background:#2c2c2c;">
        <div class="">
            <%--pizza--%>
            <div class="dashes centro">
            
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" EnableViewState="True" Width="800px" BackColor="Gray" BackGradientStyle="HorizontalCenter" BackSecondaryColor="Silver" BorderlineColor="OrangeRed" BorderlineDashStyle="Solid" BorderlineWidth="4" Palette="None" PaletteCustomColors="242, 48, 5">
                <Series>
                    <asp:Series Name="Item total vendida" XValueMember="dta" YValueMembers="Column1" Font="Microsoft YaHei UI, 9.75pt">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Quantidade" TitleFont="Microsoft Sans Serif, 14.25pt">
                        </AxisY>
                        <AxisX Title="Data" TitleFont="Microsoft Sans Serif, 14.25pt">
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Title="Legenda" BackColor="Transparent">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Font="Microsoft YaHei, 20.25pt" Name="Title1" Text="Itens vendidos">
                        </asp:Title>
                    </Titles>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LanchoneteDBConnectionString1 %>" 
                SelectCommand="SELECT pag_data as dta,count(pag_cartotal) FROM Pagamento where pag_status='Concluido' group by pag_data"></asp:SqlDataSource>
            </div>
            <%--pizza--%>



            <%--pizza--%>
            <div class="dashes centro">
                
                <asp:chart runat="server" ID="ctl00" DataSourceID="pizza" Width="800px" BackColor="Gray" BackGradientStyle="HorizontalCenter" BackSecondaryColor="Silver" BorderlineColor="OrangeRed" BorderlineDashStyle="Solid" BorderlineWidth="4" Palette="None" PaletteCustomColors="242, 48, 5">
                    <Series>
                        <asp:Series Name="Valor total vendido" XValueMember="dta" YValueMembers="Column1" YValuesPerPoint="2" Font="Microsoft YaHei UI, 9.75pt"></asp:Series>
                     </Series>
                    <ChartAreas><asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Valor (R$)" TitleFont="Microsoft Sans Serif, 14.25pt">
                        </AxisY>
                        <AxisX Title="Data" TitleFont="Microsoft Sans Serif, 14.25pt">
                        </AxisX>
                        </asp:ChartArea></ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Title="Legenda" BackColor="Transparent">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Font="Microsoft YaHei, 20.25pt" Name="Title1" Text="Valor vendidos">
                        </asp:Title>
                    </Titles>
                </asp:chart>
                <asp:SqlDataSource ID="pizza" runat="server" ConnectionString="<%$ ConnectionStrings:LanchoneteDBConnectionString1 %>" SelectCommand="SELECT pag_data as dta,sum(pag_cartotal) FROM Pagamento where pag_status='Concluido' group by pag_data"></asp:SqlDataSource>
            </div>
            <%--pizza--%>
        </div>
    </div>

    

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="js/Dashboard/grafico.js"></script>
    <script src="js/Dashboard/tabela.js"></script>
    
    
    <script src="js/Dashboard/Dinamico.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<%--<figure class="highcharts-figure">
  <div id="container"></div>
  <p class="highcharts-description">
  
   
  </p>
</figure>--%>
</asp:Content>

