const moreRightBtn = document.querySelector('.more-right-btn');
const rightBanner = document.querySelector('.right-banner');

const navbarBtn = document.querySelector('.navbar .fa-bars');
const navbar = document.querySelector('.navbar .set-margin');

const asideBtn = document.querySelector('.asideBtn');
const moblieAside = document.querySelector('.category-aside');
const background = document.querySelector('.background');


moreRightBtn.addEventListener('click', () => {
	rightBanner.classList.toggle("active");
});

navbarBtn.addEventListener('click', () => {
	navbar.classList.toggle("active");
});

asideBtn.addEventListener('click', () => {
	moblieAside.classList.toggle("active");
	background.classList.toggle("active");
});