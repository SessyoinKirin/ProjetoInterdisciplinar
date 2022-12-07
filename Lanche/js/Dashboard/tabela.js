google.charts.load('current', { 'packages': ['table'] });
google.charts.setOnLoadCallback(drawTable);

function drawTable() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'TOP-4 Produto');
    data.addColumn('number', 'Quantidade');
    //data.addColumn('boolean', 'Full Time Employee');
    data.addRows([
        ['Hamburguer', 32],
        ['Frango Assado', 13],
        ['Fígado de asno', 11],
        ['Cauda de peixe', 4]
    ]);

   

    var table = new google.visualization.Table(document.getElementById('table_div'));

    table.draw(data, { showRowNumber: true, width: '100%', height: '100%' });
}