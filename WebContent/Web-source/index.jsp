<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- 기본적으로 head안에 들어갈 것들을 작성한 jsp include -->
    <script type="text/javascript" src="./js/main.js" defer></script>
    <%@include file="./head-file.jsp" %>
    <title>Cross shopping</title>
  </head>
  <body>
    <!-- 홈페이지에서 header, navbar tag를 생성한 jsp file include -->
    <%@include file="./header-navbar.jsp" %>
    
    <!-- main-section 시작-->
    <section class="main-section set-margin">
      <!-- banner -->
      <div class="banner-slide">
        <ul class="list">
            <li class="active"><img class="banner 1 " src="./image/banner/banner1.png" alt="" /></li>
            <li><img class="banner 2 " src="./image/banner/banner2.png" alt="" /></li>
            <li><img class="banner 3 " src="./image/banner/banner3.png" alt="" /></li>            
        </ul>
        <div class="btn-wrap">
            <button class="left"><i class="fas fa-chevron-left"></i></button>
            <button class="right"><i class="fas fa-chevron-right"></i></button>
        </div>
        <ul class="indicate">
            <li class="active"></li>
            <li></li>
            <li></li>
        </ul>
      </div>
      <!-- Cross shopping 소개글 -->
      <div class="introduce">
        <span class="title">Cross Shopping는?</br></span>
        <span class="content">저희 Cross Shopping은 다른 의류 쇼핑몰과는 조금 다릅니다.</br>
        일반적으로 쇼핑몰에서 자체적으로 보유한 상품들을 사고 파는 것이 아닌, 사용자분들께서 "직접 상품을 등록"하실 수 있습니다.</br>
          이런 측면에서는 여타 중고물품을 거래하는 사이트들과 차별점이 없을 수 있습니다. 그래서, 저희 쇼핑몰의 운영 방식에 대해 보여드릴게요😊</span>
          <img src="./image/introduce.png" alt="" class="process" />
          <span class="content">요약하자면! 중고물품 거래 시, 상대방의 신뢰를 미끼로 이용해 발생하는 상황들을 방지할 수 있습니다.</br>
          이젠 더이상 찜찜해하면서 거래하시지 마시고, 저희 쇼핑몰을 이용하시면서<span style="font-weight: bold"> 맘 편한 거래</span>를 이어나가셨으면 좋겠습니다:)</span>
      </div>
      
      <span class="new-items-text">New Items</span>
      <span class="mew-item-text">✨이번에 새로 등록된 상품들을 만나보시고, 마음에 드는 상품을 빨리 가져가세요!✨</span>
      <!-- 추후에 DB에 있는 마지막 4개의 item 정보를 가져와서 사용 
            필요 정보 : 해당 items의 URL, 사진,
      -->
      <ul class="new-item-list">
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
      </ul>
    </section>
    <!-- right-banner -->
    <a class="right-banner active" href="insert-item.jsp">
        <img src="./image/banner/right-banner.png" alt=""  />
    </a>
    <button class="more-right-btn">
        <i class="fas fa-chevron-left"></i>
    </button>
    <!-- footer tag를 생성할 jsp file include -->
    <%@include file ="./footer.jsp" %>
  </body>
</html>

