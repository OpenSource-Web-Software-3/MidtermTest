<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <%@include file="../head-file.jsp" %>
        <link rel="stylesheet" href="../css/aside-style.css" />
        <link rel="stylesheet" href="../css/pur-list-style.css" />
    <title>Purchase List</title>
    </head>
    <body>
        <!-- pur-list-style.css에다 삽입하면 오류가 발생할까봐 따로 style tag 안에 작성-->
        <style>
        html, body {
		    width: 100%;
		    height: 100%;
		    margin: 0px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    background-color: var(--header-back);
		}
        </style>
        <!-- 본문 시작하는 부분 -->
	   <section class="purchase">
	       <!-- 주문/결제 부분 -->
	       <div class="first-part">
	           <span class="title">주문 / 결제</span>
	           <table class="item-info">
	               <tbody>
	                   <tr class="row1">
	                       <td class="col1">이미지</td>
	                       <td class="col2">상품 정보</td>
	                       <td class="col3">수량</td>
	                       <td class="col4">배송비</td>
	                       <td class="col5">금액</td>
	                   </tr>
	                   <tr>
	                       <!-- 해당 부분도 추후에 DB값 불러와서 사용 -->
	                       <td><img src="" alt="" class="item-img" /></td>
	                       <td><span>item name</br>gray / large</span></td>
	                       <td>1개</td>
	                       <td>2,500</td>
	                       <td>10,000</td>   
	                   </tr>
	               </tbody>
	           </table>
	       </div>
	       <!-- 구매와 관련된 정보를 입력하는 부분 -->
	       <form action="">
	           <!-- 배송지 정보 입력 part -->
	           <div class="second-part">
	               <span class="title">배송지 정보</span>
	               <div class="user-info-part">
	                   <span>수령인 : user name</span>
	                   <span>주소</span>
	                   <fieldset class="address-form">
                               <input id="postal-code" name="" type="text" placeholder="우편주소"/>
                               <input id="user-address" name="" type="text" placeholder="상세주소"/>
                       </fieldset>
	               </div>
	           </div>
	           <!-- 결제 수단을 입력하는 part -->
	           <div class="third-part">
	               <span class="title">결재수단</span>
	                <fieldset class="card-form">
                           <label for="card-company">카드 회사</label>
                           <input id="card-company" name="" type="text" />
                           
                           <label for="card-number">카드 번호</label>
                           <input id="card-number" name="" type="text" />
                    </fieldset>
	           </div>
	           <!-- 구매 버튼 -->
	           <button class="purchaseBtn">구매하기</button>
	       </form>
	   </section>
	</body>
</html>