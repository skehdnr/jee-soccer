var app = (()=>{
	return{
		init : (ctx)=>{
			$('#login_form').submit(()=>{
				alert('from 태그에 들어왔다 !!');
			});
			$('#a_join').click(()=>{
				alert('회원가입 이동');
				location.assign(ctx+'/player.do?action=move&page=join');
			});
			$('#back').click(()=>{
				location.assign(ctx+'/player.do?action=move&page=login');
				alert('회원가입 으로 다시 이동');
			});
		}
		
	};
})();

	

