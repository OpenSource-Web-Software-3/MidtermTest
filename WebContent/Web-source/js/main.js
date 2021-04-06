// banner slider 구현한 부분
window.addEventListener('load', function(){

    let MOVEING_PX = 4,
        AUTO_TIME = 4000,
    
        slide = document.querySelector('.banner-slide'),
        indi = document.querySelector('.indicate'),
        bannerList = slide.querySelector('.list'),
        bannerListItem = bannerList.querySelectorAll('li'),
        prevBtn = slide.querySelector('.btn-wrap .left'),
        nextBtn = slide.querySelector('.btn-wrap .right')
        before = 0,
        after = 0;

    // inditor의 각 listener 생성
    for(var j = 0;j < indi.children.length;j++){
        indiClick(j);
    };
    
    //배너를 slide하는 function
    setInterval(() => {
    	after++;
        if(after >= bannerListItem.length){
            after = 0;
        };
        
        bannerListItem[after].classList.add('active');
        bannerListItem[before].classList.remove('active');
        
        indi.children[before].classList.remove('active');
        indi.children[after].classList.add('active');
        
        before = after;
        
    }, AUTO_TIME);

    // 다음 배너를 보는 버튼의 listener
    nextBtn.addEventListener('click', function(e){
    	after++;
        if(after >= bannerListItem.length){
            after = 0;
        };
        move(after, before, 'next');
        before = after;
    });
    
    // 이전 배너를 보는 버튼의 listener
    prevBtn.addEventListener('click', function(e){
    	after--;
        if(after < 0){
            after = bannerListItem.length - 1;
        };
        move(after, before);
        before = after;
    });
    
    //index번째 indicator의 listener를 생성해주는 함수
    function indiClick(index){
        indi.children[index].addEventListener('click', function(){
        	after = index;
            if(after > before){
                move(after, before, 'next');
            }else if(after < before){
                move(after, before);
            };
            before = after;
        });
    }
    // next. prev 버트인지를 구분하여 배너 slider를 조종
    function move(after, before, type){
    	if(type === 'next'){
            bannerListItem[after].classList.add('active');
            bannerListItem[before].classList.remove('active');
            clearInterval();
        }
        else{
            bannerListItem[after].classList.remove('active');
            bannerListItem[before].classList.add('active');
        };
        
        indi.children[before].classList.remove('active');
        indi.children[after].classList.add('active');
    }
});