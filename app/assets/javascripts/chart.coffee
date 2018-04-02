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
                      fontColor: 'white',
                      min: 1,
                      max: 18
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

window.visitors_rank_graph = ->
    ctx = document.getElementById("visitors_rank_graph").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: gon.home_section,
          datasets: [{
            label: "ホーム観客動員数",
            data: gon.visitors_rank,
            backgroundColor: "rgba(255,255,51,0.3)",
            borderColor: "rgba(255,255,51,1)",
            borderWidth: 3 }
          ]
        },
      options: {
          barPercentage: 0.1,
          scales: {
              yAxes: [{
                  scaleLabel: {
                      fontColor: 'white'
                  },
                  ticks: {
                      fontColor: 'white',
                      min: 0,
                  }
              }],
              xAxes: [{
                  barPercentage: 0.4,
                  categoryPercentage: 0.4,
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
    })

window.ave_dominance_rate_graph = ->
    ctx = document.getElementById("ave_dominance_rate_graph").getContext('2d');

    ave_dominance_rate_graph = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: ["全試合平均支配率","対戦相手"],
        datasets: [{
          backgroundColor: [
            "rgba(255,255,51,1)",
            "#3498db",
          ],
          data: gon.ave_dominance_rate
        }]
      },
      options: {
          cutoutPercentage: 50,
          rotation: 3.143,
          circumference: 3.143,
          legend: {
            labels: {
               fontColor: 'white'
            }
          }
      }
    });

window.home_ave_dominance_rate_graph = ->
    ctx = document.getElementById("home_ave_dominance_rate_graph").getContext('2d');

    home_ave_dominance_rate_graph = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: ["HOME平均支配率","対戦相手"],
        datasets: [{
          backgroundColor: [
            "rgba(255,255,51,1)",
            "#3498db",
          ],
          data: gon.ave_dominance_rate
        }]
      },
      options: {
          cutoutPercentage: 50,
          rotation: 3.143,
          circumference: 3.143,
          legend: {
            labels: {
               fontColor: 'white'
            }
          }
      }
    });