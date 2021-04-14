/* 선택한 navbar의 category에 해당하는 aside만 보여주기 */
//aside element 가져오기
let aside = document.querySelector('.category-aside');

//장바구니 or 구매내역을 클릭했을 때 실행
if (document.querySelector('span.page-title')) {
	aside.querySelector('.top').style.display = 'block';
	aside.querySelector('.bottom').style.display = 'block';
	aside.querySelector('.shoes').style.display = 'block';
	aside.querySelector('.outer').style.display = 'block';
	aside.querySelector('.bag').style.display = 'block';
}

// main-cate를 클릭했을 때
else {
	// 현재 클릭해서 들어와있는 main-cate를 알아내는 line
	let selectedMain = document.querySelector('.sub-section .category-name').innerText;
	
	// 클릭한  main-cate을 비교해서 해당하는 aside 보여주기
	if (selectedMain === 'TOP') {
		aside.querySelector('.top').style.display = 'block';
	}
	else if (selectedMain === 'Bottom') {
		aside.querySelector('.bottom').style.display = 'block';
	}
	else if (selectedMain === 'Shoes') {
		aside.querySelector('.shoes').style.display = 'block';
	}
	else if (selectedMain === 'Outer') {
		aside.querySelector('.outer').style.display = 'block';
	}
	else if (selectedMain === 'Bag') {
		aside.querySelector('.bag').style.display = 'block';
	}
}

let asideCheckbox = document.querySelectorAll('.second-cate input');

for(let i=0;i<asideCheckbox.length; i++) {
	//이 부분이 checkbox가 클릭되었는지 확인하는 eventListener입니다.
	//check가 되면 아래의 arrow function을 실행하게 됩니다!
	//alert(asideCheckbox[i].getAttribute('id'));
	asideCheckbox[i].addEventListener('click', () => {
		//checkbox가 체크되면 실행되는 statement (아래 코드는 제가 시도했다가 안되서 남겨놓은 코드입니다..ㅎㅎ)
		let checkSubCate = asideCheckbox[i].getAttribute('id');
		
		alert(document.querySelectorAll('.category-item')); 
					
		if (document.querySelector('.category-item')){
			let itemlist = document.querySelectorAll('.category-item'); 
			for(let i=0;i<itemlist.length; i++) {
				if(!itemlist[i].getAttribute('class').includes(checkSubCate)){
					itemlist[i].classList.toggle('active');
				}
 					/*
					//초기상태 모두 active 
					
				     			MTM  shirts T-shirst   active on = 1, actvie off = 0
					초기상태 		 1		1		1
					MTM체크	     1 	    0       0       	 
	MTM체크 상태에서 + shirts체크     0      0       1
	
					*/					
			}
		}
		else if(document.querySelector('.item-list')) {
			let itemlist2 = document.querySelectorAll('.item-list');
			
			for(let i=0;i<itemlist2.length; i++) {
				if(!itemlist2[i].getAttribute('class').includes(checkSubCate)){
					itemlist2[i].classList.toggle('active');
				}
			}
		}
	});
}


