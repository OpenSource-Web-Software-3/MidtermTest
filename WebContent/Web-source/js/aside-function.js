/* 선택한 navbar의 category에 해당하는 aside만 보여주기 */
let selectedMain = document.querySelector('.sub-section .category-name').innerText;
let aside = document.querySelector('.category-aside');

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

/*let pageName = document.querySelector('.page-title');

if (pageName.innerText === 'Purchase List' || pageName.innerText === 'Shop Cart') {
	aside.querySelector('.top').style.display = 'block';
	aside.querySelector('.bottom').style.display = 'block';
	aside.querySelector('.shoes').style.display = 'block';
	aside.querySelector('.outer').style.display = 'block';
	aside.querySelector('.bag').style.display = 'block';
}
else;
*/
