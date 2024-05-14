/**
 * 
 */
console.log("userRegister.js in!!");

// 아이디 중복체크
document.getElementById('checkBtn').addEventListener('click',(e)=>{
    let email = document.getElementById("e").value;
    let pwd = document.getElementById('p').value;
    let check = document.getElementById('check');
    console.log(email);
    emailToServer(email).then(result =>{
        console.log(result);
        if(result == 1){
            alert("사용불가 아이디 입니다.");  
            check.innerHTML = "";
            check.innerHTML = `<button type="button" class="btn btn-danger">중복된 아이디 입니다. 다시 입력해주세요.</button>`;
            
            
            
            
        }else{
            check.innerHTML = "";
            check.innerHTML = `<button type="button" class="btn btn-success">사용가능 아이디 입니다!</button>`;


        }
    })

});

//아이디 중복체크 비동기 메서드
async function emailToServer(email){
    try {
        const url = "/user/emailCheck/"+email;
        const resp = await fetch(url);
        const result = resp.text();

        return result;
    } catch (error) {
        console.log(error);
    }
}

//아이디 생성 확인 가능 여부