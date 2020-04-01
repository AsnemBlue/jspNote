/**
 * join_frm.id는 3글자 이상, join_frm.pw==join_frm, 이름, 메일
 */
function infoConfirm(){
	if(join_frm.id.value.length<3){
		alert('아이디는 반드시 3글자 이상');
		join_frm.id.focus();
		return false;
	}
	if(!join_frm.pw.value){
		alert('비밀번호는 필수 입력 사항입니다');
		join_frm.pw.focus();
		return false;
	}
	if(join_frm.pw.value!=join_frm.pwChk.value){
		alert('비밀번호를 확인하세요');
		join_frm.pw.value='';
		join_frm.pwChk.value='';
		return false;
	}
	if(!join_frm.name.value){
		alert('이름은 필수 입력 사항입니다');
		join_frm.name.focus();
		return false;
	}
	if(join_frm.email.value.length!=0 && (
			join_frm.email.value.indexOf('@')<=0||
			join_frm.email.value.lastIndexOf('@')==join_frm.email.value.length-1 ||
			join_frm.email.value.lastIndexOf('@') > join_frm.email.value.lastIndexOf('.')
	)){
		alert('메일 형식을 확인하세요');
		join_frm.email.jocus();
		return false;
	}
	if(!join_frm.tempbirth.value){
		alert('생년월일은 필수 입력 사항입니다');
		join_frm.tempbirth.focus();
		return false;
	}
	join_frm.submit();
}