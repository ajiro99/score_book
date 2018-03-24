window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    ctx.canvas.height = 100;
    myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
          labels: ["シュート", "CK", "FK"],
          datasets: [
            { label: "鹿島アントラーズ",    data: gon.result,  backgroundColor: "rgba(255, 0, 0, 1)" },
            { label: gon.opponent_name, data: gon.opponent_result, backgroundColor: "rgba(0, 0, 255, 0.5)" }
          ]
        },
        options: {
            title: {
                display: true,
                text: 'スタッツ比較'
            }
        }
    })

###
window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["シュート", "シュート（相手）", "CK", "CK（相手）", "FK", "FK（相手）"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
            title: {
                display: true,
                text: 'Custom Chart Title'
            }
            layout: {
                padding: {
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            }
        }
    })
###