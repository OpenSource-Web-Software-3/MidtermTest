const moreRightBtn = document.querySelector('.more-right-btn');
const rightBanner = document.querySelector('.right-banner');

moreRightBtn.addEventListener('click', () => {
	rightBanner.classList.toggle("active");
});