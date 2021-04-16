/* 선택한 navbar의 category에 해당하는 aside만 보여주기 */
//aside element 가져오기
let aside = document.querySelector('.category-aside');

//장바구니 or 구매내역을 클릭했을 때 실행
if (document.querySelector('span.page-title')) {
	aside.querySelector('.TOP').style.display = 'block';
	aside.querySelector('.Bottom').style.display = 'block';
	aside.querySelector('.Shoes').style.display = 'block';
	aside.querySelector('.Outer').style.display = 'block';
	aside.querySelector('.Bag').style.display = 'block';
}

// main-cate를 클릭했을 때
else {
	// 현재 클릭해서 들어와있는 main-cate를 알아내는 line
	let selectedMain = document.querySelector('.sub-section .category-name').innerText;

	// 클릭한  main-cate을 비교해서 해당하는 aside 보여주기
	if (selectedMain === 'TOP') {
		aside.querySelector('.TOP').style.display = 'block';
	}
	else if (selectedMain === 'Bottom') {
		aside.querySelector('.Bottom').style.display = 'block';
	}
	else if (selectedMain === 'Shoes') {
		aside.querySelector('.Shoes').style.display = 'block';
	}
	else if (selectedMain === 'Outer') {
		aside.querySelector('.Outer').style.display = 'block';
	}
	else if (selectedMain === 'Bag') {
		aside.querySelector('.Bag').style.display = 'block';
	}
}

/*----------------------------------------------------------------------------------------
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

 ----------------------------------------------------------------------------------*/


/*AJAX js version*/
/*
var request = new XMLHttpRequest();
$(document).ready(function() {

	$(".category-aside input").click(function() { //제가 ajax만 알고 DOM용어는 잘 몰라서 바꿔주실 수 있나요 ㅠㅠ??..
		var checkList = [];

		//체크된 리스트 저장
		$('input[type="checkbox"]:checked').each(function(i) {
			checkList.push($(this).val());
		});

		//ajax 호출 not jquery
		request.open("POST", "getItemList_to_SubCateAction.do?sub_cate=" + checkList, true); //true 비동기적 false 동기적 진행방식 (저희는 ajax의 기능을 통한 비동기적 방식으로 값을 받을거라 true값을 넣어줬습니다)
		request.onreadystatechange = getItemList_to_SubCate; //서버에 요청(Request)을 하기에 앞서, 서버로 보낸 요청에 대한 응답을 받았을 때 어떤 동작을 할 것인지 정해야합니다 ->getItemList_to_SubCate지정
		request.send(null);


	})

});



function getItemList_to_SubCate() {

	var request = new XMLHttpRequest();
	var categoryAside = document.getElementsByClassName("category-aside");
	if (request.readyState == 4 && request.status == 200) {
		var object = eval('(' + request.responseText + ')');
		alert(request.responseText);
		var request = new XMLHttpRequest();
		var categoryAside = document.getElementsByClassName("category-aside");

		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');

			var result = object.result;
			itemList.innerHTML = "";
			var itemList = document.getElementgetElementById("category-item-list");
			for (var i = 0; i < itemList.length; i++) {
				itemList.innerHTML = '<li class="category-item">';
				itemList.innerHTML = '<a class="link" href="' + request.getContextPath() + '/Web-source/category/item-info.jsp?itemCode=' + result[i][0].value + '">';
				itemList.innerHTML = '<img class="item-img" src="' + request.getContextPath() + '/itemFile/' + result[i][8].value + '" alt=""';
				itemList.innerHTML = '</a>';
				itemList.innerHTML = '<div class="item-info">';
				itemList.innerHTML = '<span class="name">' + result[i][1].value + '</span>';
				itemList.innerHTML = '<span class="price">' + result[i][2].value + '</span>';
				itemList.innerHTML = '</div>';
				itemList.innerHTML = '</li>';
			}

		}
	}
}
*/

/*AJAX jquery version*/
var request = new XMLHttpRequest();
$(document).ready(function() {

	$(".category-aside input").click(function() {

		var sub_cate = [];
		var main_cate = [];
		var main_cateOfcategorySkin = $('.category-name').text(); //category-skin.jsp
		var pageTitle = $('#page-title').text(); //purchase List.jsp or shopchart

		//체크된 리스트 저장
		$('input[type="checkbox"]:checked').each(function(i) {
			main_cate.push($($(this).parent().parent().parent().parent())[0].className); //main_cate목록 저장 (좀 이상하긴 한데... 잘몰라서 일단 써놨습니다 ㅎㅎㅎ)
			sub_cate.push($(this).val());
		});

		$.ajax({
			url: "getItemList_to_SubCateAction.do?main_cate=" + main_cate,
			type: "POST",
			traditional: true,
			data: {
				main_cate: main_cate,
				sub_cate: sub_cate,
				main_cateOfcategorySkin: main_cateOfcategorySkin, //category-skin
				pageTitle: pageTitle //purchase or shopCart
			},
			success: function(data) {


				if (data == "") {
					$('#category-item-list').empty();
					$('#shopCart-item').empty();
					$('#purchase-item-list').empty();

					return; //상품이 한개도 없는경우
				}

				var parsed = JSON.parse(data);
				var result = parsed.result;
				var flag = parsed.flag;
				var date = parsed.date;

				if (flag == "category-skin") {
					$('#category-item-list').empty();
					for (var i = 0; i < result.length; i++) {
						getItemList_to_SubCate1(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value, result[i][6].value, result[i][7].value, result[i][8].value);
					}
				}
				else if (flag == "Shop Cart") {
					$('#shopCart-item').empty();
					for (var i = 0; i < result.length; i++) {
						getItemList_to_SubCate2(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value, result[i][6].value, result[i][7].value, result[i][8].value, result[i][9].value, result[i][10].value, result[i][11].value);
					}
				}
				else if (flag == "Purchase List") {
					$('#purchase-item-list').empty();
					getItemList_to_SubCate3(result, date);
				}
				else alert('Ajax Error!');
			}
		});

	});

});


//category-info.jsp
function getItemList_to_SubCate1(itemCode, itemName, itemPrice, itemColor, itemSize, main_cate, sub_cate, itemContent, filepath) {

	filepath = getContextPath() + "/itemFile/" + filepath;

	$('#category-item-list').append(
		'<li class="category-item">'
		+ '<a class="link" href="' + getContextPath() + '/Web-source/category/item-info.jsp?itemCode=' + itemCode + '">'
		+ '<img class="item-img" src="' + filepath + '" alt=""/>'
		+ '</a>'
		+ '<div class="item-info">'
		+ '<span class="name">' + itemName + '</span>'
		+ '<span class="price">' + itemPrice + '</span>'
		+ '</div>'
		+ '</li>');
}


//shopcart
function getItemList_to_SubCate2(itemCode, itemName, itemPrice, itemColor, itemSize, main_cate, sub_cate, itemContent, filepath, ID, date, folderName) {
	filepath = getContextPath() + "/itemFile/" + filepath;

	$('#shopCart-item').append(
		'<div class="cart-list">'
		+ '<div class="item-list main-cate-name sub-cate-name">'
		+ '<a class="link" href="' + getContextPath() + '/Web-source/category/item-info.jsp?itemCode=' + itemCode + '">'
		+ '<img class="img" src="' + filepath + '" alt=""/>'
		+ '<div class="info">'
		+ '<span class="date">' + date + '</span>'
		+ '<span class="name">' + itemName + '</span>'
		+ '<span class="size-color">색상 : ' + itemColor + '</span>'
		+ '<span class="price">가격 : ' + itemPrice + '</span>'
		+ '</div>'
		+ '</a>'
		+ '</div>'
		+ '</div>');
}

//purchase
function getItemList_to_SubCate3(result, date) {
	
	for(var i=0; i<date.length; i++){
		$('#purchase-item-list').append(
			'<div class="partition '+ (i+1) +'">'
			+ '<div class="line-box">'+date[i].value+'</div>');
		
		for(var j=0; j<result.length;j++){
			
			if(date[i].value != result[j][10].value) continue;
			
			var filepath = getContextPath() + "/itemFile/" + result[j][8].value;
			
			$('#purchase-item-list').append(
				'<div class="item-list">'
				+ '<a class="link" href="' + getContextPath() + '/Web-source/category/item-info.jsp?itemCode=' + result[j][0].value + '">'
				+ '<img class="img" src="' + filepath + '" alt="" />'
				+ '<div class="info">'
				+ '<span class="name">'+result[j][1].value+'</span>'
				+ '<span class="size-color">'+result[j][3].value+'/'+result[j][4].value+'</span>'
				+ '<span class="price">'+result[j][2].value+'</span>'
				+ '</div>'
				+ '</a>'
				+ '</div>');
		}
		$('#purchase-item-list').append('</div>');
	}
}

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath;
}