var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: ['Semester 1', 'Semester 2', 'Semester 3', 'Semester 4', 'Semester 5', 'Semester 6'],
		datasets: [{
			label: 'CGPA',
			backgroundColor: 'rgba(0, 255, 255, 0.2)',
			borderColor: 'rgba(0, 255, 255, 1)',
			data: [3.5, 3.7, 3.8, 3.9, 4.0, 4.0]
		}]
	},
	options: {
		responsive: true, // disable responsive resizing
		maintainAspectRatio: true,
		legend: {
			labels: {
				fontColor: '#000000',
				fontSize: 18,
				boxWidth: 30,
				padding: 20
			}
		},
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true,
					fontColor: '#000000',
					fontSize: 18
				},
				scaleLabel: {
					display: true,
					labelString: 'CGPA',
					fontColor: '#000000',
					fontSize: 24,
					padding: 10
				}
			}],
			xAxes: [{
				ticks: {
					fontColor: '#000000',
					fontSize: 18
				},
				scaleLabel: {
					display: true,
					labelString: 'Semesters',
					fontColor: '#000000',
					fontSize: 24,
					padding: 10
				},
				barPercentage: 20, // set the width of the bars to fill the chart width
				categoryPercentage: 1, // set the width of the bars to fill the chart width
				maxBarThickness: 100 // set the maximum bar width to the chart width,
				
			}]
		}
	}
});
