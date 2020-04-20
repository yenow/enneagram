/**
 * 
 * 
 */

var check = function check() {
	    
	if(this.document.querySelector(".user_id").value == ""){
		alert("id를 입력해주세요");
		return false;
	}
	
	if(this.document.querySelector(".user_pw").value == ""){
		alert("password를 입력해주세요");
		return false;
	}
	
	if(this.document.querySelector(".name").value == ""){
		alert("이름를 입력해주세요");
		return false;
	}
	
	if(this.document.querySelector(".tel").value == ""){
		alert("전화번호를 입력해주세요");
		return false;
	}

	if(this.document.querySelector(".address").value == ""){
		alert("주소를 입력해주세요");
		return false;
	}
	
};