var visable = false;

$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'toggle':
				if (visable) {
					$('#wrap').hide();
				} else {
					$('#wrap').show();
				}

				visable = !visable;
				break;

			case 'close':
				$('#wrap').hide();
				visable = false;
				break;

			case 'toggleID':

				if (event.data.state) {
					$('td:nth-child(2),th:nth-child(2)').show();
					$('td:nth-child(4),th:nth-child(4)').show();
					$('td:nth-child(6),th:nth-child(6)').show();
					$('td:nth-child(8),th:nth-child(8)').show();
					$('td:nth-child(10),th:nth-child(10)').show();
					$('td:nth-child(12),th:nth-child(12)').show();
				}

				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;
				
				

				$('#player_count').html(jobs.player_count);

				$('#ambulance').html(jobs.ambulance);
				$('#offambulance').html(jobs.offambulance);
				$('#police').html(jobs.police);
				$('#offpolice').html(jobs.offpolice);
				$('#kmar').html(jobs.kmar);
				$('#offkmar').html(jobs.offkmar);
				$('#taxi').html(jobs.taxi);
				$('#mechanic').html(jobs.mechanic);
				$('#offmechanic').html(jobs.offmechanic);
				$('#maffia').html(jobs.maffia);
				$('#maffia2').html(jobs.maffia2);
				$('#motorclub').html(jobs.motorclub);
				$('#cardealer').html(jobs.cardealer);
				$('#realestateagent').html(jobs.realestateagent);
				break;

			case 'updatePlayerList':
				$('#playerlist tr:gt(0)').remove();
				$('#playerlist').append(event.data.players);
				//sortPlayerList();
				break;

			case 'updatePing':
				updatePing(event.data.players);
				break;
			case 'setplayerlist':
				$('tr.heading').show();
				break;
				
			case 'updateplayerID':
			
				$('#PlayerID').html(event.data.ID.spelerID);
				break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#max_players').html(event.data.maxPlayers);
				}

				if (event.data.uptime) {
					$('#server_uptime').html(event.data.uptime);
				}

				if (event.data.playTime) {
					$('#play_time').html(event.data.playTime);
				}

				break;

			default:
				console.log('esx_scoreboard: unknown action!');
				break;
		}
	}, false);
});

function applyPingColor() {
	$('#playerlist tr').each(function () {
		$(this).find('td:nth-child(2),td:nth-child(4),td:nth-child(6),td:nth-child(8),td:nth-child(10),td:nth-child(12)').each(function () {
			var ping = $(this).html();
			var color = 'green';

			if (ping > 150 && ping < 300) {
				color = 'orange';
			} else if (ping >= 300) {
				color = 'red';
			}

			$(this).css('color', color);
			$(this).html(ping + " <span style='color:white;'>ms</span>");
		});

	});
}

// Todo: not the best code
function updatePing(players) {
	jQuery.each(players, function (index, element) {
		if (element != null) {
			$('#playerlist tr:not(.heading)').each(function () {
				$(this).find('td:nth-child(2):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(2).html(element.ping);
				});
				$(this).find('td:nth-child(4):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(4).html(element.ping);
				});
				$(this).find('td:nth-child(6):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(6).html(element.ping);
				});
				$(this).find('td:nth-child(8):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(8).html(element.ping);
				});
				$(this).find('td:nth-child(10):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(10).html(element.ping);
				});
				$(this).find('td:nth-child(10):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(12).html(element.ping);
				});
			});
		}
	});
}

function sortPlayerList() {
	var table = $('#playerlist'),
		rows = $('tr:not(.heading)', table);

	rows.sort(function(a, b) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();

		return (keyA - keyB);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}
