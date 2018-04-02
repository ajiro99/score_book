window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    ctx.canvas.height = 100;
    myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
          labels: ["シュート", "CK", "FK"],
          datasets: [
            { label: "鹿島アントラーズ", data: gon.result, backgroundColor: "rgba(255, 99, 132, 0.2)", borderColor: "rgba(255,99,132,1)",borderWidth: 1 },
            { label: gon.opponent_name, data: gon.opponent_result, backgroundColor: "rgba(54, 162, 235, 0.2)", borderColor: "rgba(54, 162, 235, 1)", borderWidth: 1 }
          ]
        },
        options: {
            title: {
                display: true,
                text: 'データ'
            }
        }
    })

window.goal_rank_graph = ->
    ctx = document.getElementById("goal_rank_graph").getContext('2d');

    goal_rank_graph = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: gon.goal_players,
        datasets: [{
          backgroundColor: [
            "#2ecc71",
            "#3498db",
            "#95a5a6",
            "#9b59b6",
            "#f1c40f",
            "#e74c3c"
          ],
          data: gon.goals
        }]
      },
      options: {
          legend: {
            labels: {
               fontColor: 'white'
            }
          }
      }
    });

window.leage_rank_graph = ->
    ctx = document.getElementById("leage_rank_graph").getContext('2d');

    leage_rank_graph = new Chart(ctx, {
      type: 'line',
      data: {
          labels: gon.leage_section,
          datasets: [{
              label: 'リーグ順位'
              tension: 0.1,
              fill: false,
              borderColor: "rgba(255,255,51,1)",
              data: gon.leage_rank,
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  gridLines: {
                      display: false,
                  },
                  scaleLabel: {
                      display: true,
                      labelString: '順位',
                      fontColor: 'white'
                  },
                  ticks: {
                      reverse: true,
                      fontColor: 'white'
                  }
              }],
              xAxes: [{
                  gridLines: {
                      display: false,
                      fontColor: 'white'
                  },
                  scaleLabel: {
                      display: true,
                      labelString: '節',
                      fontColor: 'white'
                  },
                  ticks: {
                      fontColor: 'white'
                  }
              }]
          },
          legend: {
              labels: {
                  fontColor: 'white'
              }
          }
      }
    });

###
window.goal_rank_graph = ->
    ctx = document.getElementById("goal_rank_graph").getContext('2d');

    goal_rank_graph = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ["M", "T", "W", "R", "F"],
        datasets: [{
          label: 'TOP10',
          data: [12, 19, 3, 17, 28]
                   'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)'
        }]
      }
    });

window.goal_rank_graph = ->
    ctx = document.getElementById("goal_rank_graph").getContext('2d')
    ctx.canvas.height = 100;
    goal_rank_graph = new Chart(ctx, {
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
                text: 'テストです'
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