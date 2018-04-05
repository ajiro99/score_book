window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')
  ctx.canvas.height = 100;
  myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: ["シュート", "CK", "FK"],
      datasets: [
        {
          label: "鹿島アントラーズ",
          data: gon.result,
          backgroundColor: "rgba(255, 99, 132, 0.2)",
          borderColor: "rgba(255,99,132,1)",
          borderWidth: 1
        },
        {
          label: gon.opponent_name,
          data: gon.opponent_result,
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderColor: "rgba(54, 162, 235, 1)",
          borderWidth: 1
        }
      ]
    },
    options: {
      scales: {
        xAxes: [{
          ticks: {
            min: 0,
          }
        }],
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
          "rgb(255, 99, 132)",
          "rgb(54, 162, 235)",
          "rgb(255, 205, 86)",
          "rgb(255, 255, 0)",
          "rgb(0, 128, 0)"
          "rgb(128, 128, 128)"
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
        borderColor: "rgba(255, 99, 132)",
        borderWidth: 4,
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
        label: "ホーム入場者数",
        data: gon.visitors_rank,
        backgroundColor: "rgba(255, 99, 132)",
        borderColor: "white",
        borderWidth: 2 }
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
      labels: ["鹿島アントラーズ","対戦相手"],
      datasets: [{
        backgroundColor: [
          "rgb(255, 99, 132)",
          "rgb(54, 162, 235)",
        ],
        data: gon.ave_dominance_rate
      }]
    },
    options: {
      cutoutPercentage: 60,
      rotation: 3.143,
      circumference: 3.143,
      legend: {
        labels: {
           fontColor: 'white'
        }
      },
      title: {
          display: true,
          text: '全試合平均支配率',
          position: 'bottom',
          padding: -20,
          fontColor: 'white'
      },
      tooltips: {
        callbacks: {
          label:  (tooltipItem, data) ->
            return data.labels[tooltipItem.index] + ": " + data.datasets[0].data[tooltipItem.index] + " %";
        }
      }
    }
  });

window.home_ave_dominance_rate_graph = ->
  ctx = document.getElementById("home_ave_dominance_rate_graph").getContext('2d');

  home_ave_dominance_rate_graph = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["鹿島アントラーズ","対戦相手"],
      datasets: [{
        backgroundColor: [
          "rgb(255, 99, 132)",
          "rgb(54, 162, 235)",
        ],
        data: gon.home_ave_dominance_rate
      }]
    },
    options: {
      cutoutPercentage: 60,
      rotation: 3.143,
      circumference: 3.143,
      legend: {
        labels: {
           fontColor: 'white'
        }
      },
      title: {
          display: true,
          text: 'HOME平均支配率',
          position: 'bottom',
          padding: -20,
          fontColor: 'white'
      },
      tooltips: {
        callbacks: {
          label:  (tooltipItem, data) ->
            return data.labels[tooltipItem.index] + ": " + data.datasets[0].data[tooltipItem.index] + " %";
        }
      }
    }
  });