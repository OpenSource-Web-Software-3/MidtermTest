<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	   <%@include file="./head-file.jsp" %>
	   <link rel="stylesheet" href="./css/insert-item.css" />
        <script src="./js/selector-function.js" defer></script>
	   <title>Insert Item Page</title>
	</head>
	<body>
	   <section class="insert-item">
	       <a href="index.do" class="main-page">CROSS SHOPPING</a>
	       <span class="title">등록할 상품의 정보 입력</span>
	       <form action="" class="insert-form">
	           <!-- 등록할 아이템 이름 -->
	           <div class="name">
                   <label for="item-name">상품 이름</label>
                   <input name="itemName" type="text" id="item-name" />
	           </div>
	           
	           <!-- 등록할 아이템 가격 -->
	           <div class="price">
	               <label for="item-price">상품 가격<span class="alert"> ( , 없이 작성해주세요. )</span></label>
	               <input name="itemPrice" type="text" id="item-price" />	           
	           </div>
	          
	           <!-- 등록할 아이템 색깔 -->
	           <div class="color">
		           <label for="item-color">상품 색상<span class="alert"> ( '#ffffff(소문자) 형식'으로 작성해주세요. )</span></label>
	               <input name="itemColor" type="text" id="item-color" />
	           </div>
	           
	           <!-- 등록할 아이템 사이즈 -->
	           <div class="size">
		           <label for="item-size">상품 사이즈<span class="alert"> ( 가방일 경우, '없음'을 선택해주세요. )</span></label>
	               <select name="itemSize" id="item-size">
	                   <option value="none">없음</option>
	                   <option value="XS">XS</option>
	                   <option value="S">S</option>
	                   <option value="M">M</option>
	                   <option value="L">L</option>
	                   <option value="XL">XL</option>
	                   <option value="XXL">XXL</option>
	               </select>	           
	           </div>
	           
	           <!-- 등록할 아이템 main-cate -->
	           <div class="main">
	               <label for="main-cate">상품의 메인 카테고리</label>
	               <select name="main_cate" id="main-cate">
	                   <option value="Top">Top</option>
	                   <option value="Bottom">Bottom</option>
	                   <option value="Shoes">Shoes</option>
	                   <option value="Outer">Outer</option>
	                   <option value="Bag">Bag</option>
	               </select>
	           </div>
	           <!-- 등록할 아이템 sub-cate -->
	           <div class="sub">
	               <label for="main-cate">상품의 서브 카테고리</label>
                   <select name="sub_cate" id="sub-cate">
                   </select>
	           </div>
	           
	           <div class="image">
	               <span class="item-img">상품 사진</span>
	               <div>
		               <label class="imgBtn" for="item-img">
		                                         사진 업로드
		                  <input name="itemImage" type="file" id="item-img" onchange="javascript:document.querySelector('.img-path').value=this.value"/>
		               </label>
                       <input type="text" class="img-path" readonly/>	               
	               </div>
	           </div>
	           
	           <button class="sendBtn">입력 완료</button>
	       </form>
	   </section>
	</body>
</html>