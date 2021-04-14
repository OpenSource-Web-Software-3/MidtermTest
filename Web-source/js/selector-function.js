/* 등록할 상품의 main-cate에 따라 sub-cate의 option 보여주는 부분 */
let mainCate = document.querySelector('#main-cate');
let subCate = document.querySelector('#sub-cate');


mainCate.addEventListener('change', () => {
	let selectedOpt = mainCate.options[mainCate.selectedIndex].value;

	if ('Top' === selectedOpt) {
		subCate.innerHTML = `
			<option value="T-Shirt">T-Shirt</option>
		    <option value="Shirt">Shirt</option>
		    <option value="MTM">MTM</option>
		`;
	} 
	else if ('Bottom' === selectedOpt) {
		subCate.innerHTML = `
			<option value="Pants">Pants</option>
		    <option value="Shorts">Shorts</option>
		`;
	}
	else if ('Shoes' === selectedOpt) {
		subCate.innerHTML = `
			<option value="Sandal">Sandal</option>
		    <option value="RunningShoes">Running Shoes</option>
		    <option value="Sneakers">Sneakers</option>
		`;
	}
	else if ('Outer' === selectedOpt) {
		subCate.innerHTML = `
			<option value="Coat">Coat</option>
		    <option value="Jacket">Jacket</option>
		    <option value="Cardigan">Cardigan</option>
		`;
	}
	else if ('Bag' === selectedOpt) {
		subCate.innerHTML = `
			<option value="EchoBag">Echo bag</option>
		    <option value="CrossBag">Cross bag</option>
		    <option value="Backpack">Backpack</option>
		`;
	}
	else;
})
