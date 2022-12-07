var chartData;
//google.charts.load('current', { 'packages': ['bar'] });
//google.charts.setOnLoadCallback(drawChart);
google.load("current", "1", {package:["bar"]})

$(document).ready(function () {
    $.ajax({
        url: "AdminHome.aspx/GetChartData",
        data: "",
        dataType: "json",
        type: "POST",
        contentType: "application/json; chartset=utf-8",
        success: function (data) {
            chartData = data.d;
        },
        error: function () {
            alert("Error loading data! Try again.");
        }
    }).done(function () {
        drawChart();
    })
})



function drawChart() {
    var data = google.visualization.arrayToDataTable(chartData);

    var options = {
        chart: {
            title: 'Relatório de venda nos último sete dias',
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
            
        },
        colors: ['#0dcffa', '#f23005'],
        fontName: 'Times-Roman',
    };

    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}