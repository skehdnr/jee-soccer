var app = (()=>{
	return {
		init : (ctx)=>{
			playerService.login(ctx);
			playerService.join(ctx);
			playerService.moveJoin(ctx);
			playerService.positions(ctx);
			playerService.backpositions(ctx);
			playerService.findByTeamidPosition(ctx);
		}
	};
})();

var player = (()=>{
	var _playerId, _playerName, _teamId, _ePlayerName, _nickname, _joinYyyy,
	_position, _backNo, _nation, _birthDate, _solar, _height, _weight;
	var setPlayerId = (playerId)=>{this._playerId = playerId;}
	var setSolar = (solar)=>{this._solar = solar;}
	var getPlayerId = ()=>{return this._playerId;}
	var getSolar = ()=>{return this._solar;}
	return {
		setPlayerId : setPlayerId,
		setSolar : setSolar,
		getPlayerId : getPlayerId,
		getSolar : getSolar
	};
})();
var playerService = (()=>{
	return {
		login: (ctx)=>{
			$('#login_btn').click(()=>{
				if($('#username').val()==='' || 
						$('#solar').val()===''){
					alert('필수값이 없습니다.');
				}else{
					alert('입력한 아이디 값: '+$('#username').val());
					$('#login_form').attr('action', ctx+'/player.do' );
					$('#login_form').attr('method','POST');
					$('#login_form').submit();	
				}
				
			});
		}, 
		join: (ctx)=>{
			$('#join_btn').click(()=>{
				if($('#join_playerId').val()==='' || 
						$('#join_solar').val()===''){
					alert('필수값이 없습니다.');
				}else{
					alert('입력한 아이디 값: '+$('#join_playerId').val());
					$('#join_form').attr('action', ctx+'/player.do' );
					$('#join').attr('method','POST');
					$('#join_form').submit();	
				}
			});
		},
		moveJoin: (ctx)=>{
			$('#a_join').click(()=>{
				location.assign(ctx+'/facade.do?action=move&page=join');
			});
		},
		positions: (ctx)=>{
			$('#a_position').click(()=>{
				location.assign(ctx+'/player.do?action=position&page=2_positions_a');
			});
		},
		backpositions: (ctx)=>{
			$('#a_backposition').click(()=>{
				alert('ssssssssssssssssssssssssss');
				location.assign(ctx+'/player.do?action=position&page=2_positions_q');
			});
		},
		findByTeamidPosition: (ctx)=>{
			$('#a_find').click(()=>{
				location.assign(ctx+'/player.do?action=move&page=4_find_by_teamid_position');
			});
		}
	};
})();