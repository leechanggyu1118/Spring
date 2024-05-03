console.log("boardDetailComment 들어왔습니다!");
console.log(bnoVal);
// cmtAddBtn 버튼을 클릭하면 bno, writer, content를 비동기로 DB에 넣기.

document.getElementById("cmtAddBtn").addEventListener('click',()=>{

    const cmtWriter = document.getElementById('cmtWriter').innerText;
    const cmtText = document.getElementById('cmtText').value;
    if(cmtText == null || cmtText == ""){
        alert("댓글을 입력해주세요.")
        document.getElementById("cmtText").focus();
        return false;
    }else{
        let cmtData={
            bno : bnoVal,
            writer : cmtWriter,
            content : cmtText
        }
        console.log(cmtData);
        postCommentToServer(cmtData).then(result =>{
            console.log(result);
            if(result == '1'){
                alert("댓글 등록 성공!!")
                document.getElementById("cmtText").value="";
                //화면에 뿌리기
                spreadCommentList(bnoVal);
            }
        })

    }

})

//비동기 통신
async function postCommentToServer(cmtData){
    try {
        const url = "/comment/post";
        const config = {
            method:"post",
            headers:{
                "content-type":"application/json; charset = utf-8"
            },
            body:JSON.stringify(cmtData)
        };

        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function getCommentListFromServer(bno, page){
    try {
        const resp = await fetch("/comment/"+bno+"/"+page);
        const result = await resp.json();
        return result;



    } catch (error) {
        console.log(error);
    }
}
//댓글 뿌리기
function spreadCommentList(bno, page=1){
    getCommentListFromServer(bno, page).then(result =>{
        console.log(result);
        const ul = document.getElementById('cmtListArea');
        if(result.cmtList.length > 0){
         //반복
         if(page ==1){
             ul.innerHTML = ""; 
         }
            for(let cvo of result.cmtList){
                let li = `<li class="list-group-item" data-cno="${cvo.cno}">`;
                li += `<div class="input-group mb-3"> no. ${cvo.cno} |`;
                li += `<div class="fw-bold">${cvo.writer}</div>`;
                li += `${cvo.content}`;
                li += `</div>`;
                li += `<span class="badge rounded-pill text-bg-warning">${cvo.regDate}</span>`;
                li += `<button type="button" class="btn btn-outline-warning btm-sm mod" data-bs-toggle="modal" data-bs-target="#myModal">%</button>`;
                li += `<button type="button" data-cno="${cvo.cno}" class="btn btn-outline-danger btm-sm del">X</button>`;
                li += `</li>`;
                ul.innerHTML += li;
            }

            //더보기 버튼 코드
            let moreBtn = document.getElementById('moreBtn');
            console.log(moreBtn);
            // moreBtn 표시되는 조건
            // pgvo.pageNo = 1 / realEndPage = 3
            // realEndPage보다 현재 내 페이지가 작으면 표시
            if(result.pgvo.pageNo < result.realEndPage){
                // style="visibility: hidden" visibility: visible = 표시
                moreBtn.style.visibility = 'visible'; //버튼 표시
                moreBtn.dataset.page = page + 1; // 페이지 늘림
            }else{
                moreBtn.style.visibility = 'hidden'; // 숨김
            }

        }else{
            let li = `<li class="list-group-item">Comment List Empty</li>`;
            ul.innerHTML = li;
        }

    })
}

document.addEventListener('click',(e)=>{
    if(e.target.id == 'moreBtn'){
        let page = parseInt(e.target.dataset.page);
        spreadCommentList(bnoVal, page);
        
    }else if(e.target.classList.contains('mod')){
        //내가 수정버튼을 누른 댓글의 li
        let li = e.target.closest('li');
        //nextSibling : 한 부모 안에서 다음 형제를 찾기
        let cmtText = li.querySelector('.fw-bold').nextSibling;
        console.log(cmtText);
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;

        // 수정 => cno dataset으로 달기 cno, content
        document.getElementById('cmtModBtn').setAttribute("data-cno", li.dataset.cno);
    }else if(e.target.id == 'cmtModBtn'){
        let cmtModBtn = {
            cno : e.target.dataset.cno,
            content : document.getElementById('cmtTextMod').value
        };
        console.log(cmtModBtn);

        //비동기로 내보내기
        modifyCommentToServer(cmtModBtn).then(result =>{
            console.log(result);
            if(result == '1'){
                alert('댓글 수정 성공!!');
                document.querySelector(".btn-close").click();

            }else{
                alert('댓글 수정 실패!!');
                document.querySelector(".btn-close").click();
            }
            //화면에 뿌리기
            spreadCommentList(bnoVal);
        })

    }else if(e.target.classList.contains("del")){
            //cno
            // let cnoVal = e.target.dataset.cno;
            let li = e.target.closest('li');
            let cnoVal = li.dataset.cno;
     
        console.log(cmtDelBtn);
        //비동기로 삭제 요청
        deleteCommentToServer(cnoVal).then(result =>{
            console.log(result);
            if(result == "1"){
                alert('댓글 삭제 성공!!');
                //화면에 뿌리기
                spreadCommentList(bnoVal);
            }
        })

    }


})

// 댓글 삭제하기
async function deleteCommentToServer(cnoVal){
    try {
        const url = "/comment/"+cnoVal;
        const config = {
            method:'delete'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (error) {
        console.log(error);
    }
}

// 수정 시 모달창을 통해 댓글 입력받기
async function modifyCommentToServer(cmtModBtn){
    try {
        const url = "/comment/modify";
        const config = {
            method:"put",
            headers:{
                "content-type":"application/json; charset=utf-8"
            },
            body:JSON.stringify(cmtModBtn)
        };

        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}



