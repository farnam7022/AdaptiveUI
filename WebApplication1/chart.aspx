<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chart.aspx.cs" Inherits="WebApplication1.chart" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <form id="form1" runat="server">
        <div id="chart_div" style="margin-top:300px"></div>
             

            <script type="text/javascript">
                google.charts.load('current', { packages: ['corechart', 'bar'] });
                google.charts.setOnLoadCallback(drawTitleSubtitle);
                
                var val = <%=JavaScript.Serialize(this.val) %>;
                  var val2 = <%=JavaScript.Serialize(this.user) %>;
                     console.log("hi");
                     console.log(val);
                     console.log(val2);
    
                function drawTitleSubtitle() {
                    var data = new google.visualization.DataTable();
                   
                    data.addColumn('string', 'User ID');
                    data.addColumn('number', 'The Number of Updates');

                    for(i = 0; i < val.length; i++)
                        data.addRow([val2[i], val[i]]);

                  /*  var options = {
                        chart: {
                            title: 'Motivation and Energy Level Throughout the Day',
                            subtitle: 'Based on a scale of 1 to 10'
                        },
                        hAxis: {
                            title: 'Time of Day',
                            format: 'h:mm a',
                            viewWindow: {
                                min: [7, 30, 0],
                                max: [17, 30, 0]
                            }
                        },
                        vAxis: {
                            title: 'Rating (scale of 1-10)'
                        }
                    };*/

                    var material = new google.charts.Bar(document.getElementById('chart_div')).draw(data, {});
                }






                </script>
        </form>
        </body>
</html>
