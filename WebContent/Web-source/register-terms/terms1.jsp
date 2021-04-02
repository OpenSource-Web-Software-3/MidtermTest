<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* webkit printing magic: print all background colors */
html {
    -webkit-print-color-adjust: exact;
}
* {
    box-sizing: border-box;
    -webkit-print-color-adjust: exact;
}

@media only screen {
    body {
        margin: 2em auto;
        max-width: 900px;
        color: rgb(55, 53, 47);
    }
}

body {
    line-height: 1.5;
    white-space: pre-wrap;
}

a,
a.visited {
    color: inherit;
    text-decoration: underline;
}

.pdf-relative-link-path {
    font-size: 80%;
    color: #444;
}

h1,
h2,
h3 {
    letter-spacing: -0.01em;
    line-height: 1.2;
    font-weight: 600;
    margin-bottom: 0;
}

.page-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-top: 0;
    margin-bottom: 0.75em;
}

h1 {
    font-size: 1.875rem;
    margin-top: 1.875rem;
}

h2 {
    font-size: 1.5rem;
    margin-top: 1.5rem;
}

h3 {
    font-size: 1.25rem;
    margin-top: 1.25rem;
}

.source {
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 1.5em;
    word-break: break-all;
}

.callout {
    border-radius: 3px;
    padding: 1rem;
}

figure {
    margin: 1.25em 0;
    page-break-inside: avoid;
}

figcaption {
    opacity: 0.5;
    font-size: 85%;
    margin-top: 0.5em;
}

mark {
    background-color: transparent;
}

.indented {
    padding-left: 1.5em;
}

hr {
    background: transparent;
    display: block;
    width: 100%;
    height: 1px;
    visibility: visible;
    border: none;
    border-bottom: 1px solid rgba(55, 53, 47, 0.09);
}

img {
    max-width: 100%;
}

@media only print {
    img {
        max-height: 100vh;
        object-fit: contain;
    }
}

@page {
    margin: 1in;
}

.collection-content {
    font-size: 0.875rem;
}

.column-list {
    display: flex;
    justify-content: space-between;
}

.column {
    padding: 0 1em;
}

.column:first-child {
    padding-left: 0;
}

.column:last-child {
    padding-right: 0;
}

.table_of_contents-item {
    display: block;
    font-size: 0.875rem;
    line-height: 1.3;
    padding: 0.125rem;
}

.table_of_contents-indent-1 {
    margin-left: 1.5rem;
}

.table_of_contents-indent-2 {
    margin-left: 3rem;
}

.table_of_contents-indent-3 {
    margin-left: 4.5rem;
}

.table_of_contents-link {
    text-decoration: none;
    opacity: 0.7;
    border-bottom: 1px solid rgba(55, 53, 47, 0.18);
}

table,
th,
td {
    border: 1px solid rgba(55, 53, 47, 0.09);
    border-collapse: collapse;
}

table {
    border-left: none;
    border-right: none;
}

th,
td {
    font-weight: normal;
    padding: 0.25em 0.5em;
    line-height: 1.5;
    min-height: 1.5em;
    text-align: left;
}

th {
    color: rgba(55, 53, 47, 0.6);
}

ol,
ul {
    margin: 0;
    margin-block-start: 0.6em;
    margin-block-end: 0.6em;
}

li > ol:first-child,
li > ul:first-child {
    margin-block-start: 0.6em;
}

ul > li {
    list-style: disc;
}

ul.to-do-list {
    text-indent: -1.7em;
}

ul.to-do-list > li {
    list-style: none;
}

.to-do-children-checked {
    text-decoration: line-through;
    opacity: 0.375;
}

ul.toggle > li {
    list-style: none;
}

ul {
    padding-inline-start: 1.7em;
}

ul > li {
    padding-left: 0.1em;
}

ol {
    padding-inline-start: 1.6em;
}

ol > li {
    padding-left: 0.2em;
}

.mono ol {
    padding-inline-start: 2em;
}

.mono ol > li {
    text-indent: -0.4em;
}

.toggle {
    padding-inline-start: 0em;
    list-style-type: none;
}

/* Indent toggle children */
.toggle > li > details {
    padding-left: 1.7em;
}

.toggle > li > details > summary {
    margin-left: -1.1em;
}

.selected-value {
    display: inline-block;
    padding: 0 0.5em;
    background: rgba(206, 205, 202, 0.5);
    border-radius: 3px;
    margin-right: 0.5em;
    margin-top: 0.3em;
    margin-bottom: 0.3em;
    white-space: nowrap;
}

.collection-title {
    display: inline-block;
    margin-right: 1em;
}

time {
    opacity: 0.5;
}

.icon {
    display: inline-block;
    max-width: 1.2em;
    max-height: 1.2em;
    text-decoration: none;
    vertical-align: text-bottom;
    margin-right: 0.5em;
}

img.icon {
    border-radius: 3px;
}

.user-icon {
    width: 1.5em;
    height: 1.5em;
    border-radius: 100%;
    margin-right: 0.5rem;
}

.user-icon-inner {
    font-size: 0.8em;
}

.text-icon {
    border: 1px solid #000;
    text-align: center;
}

.page-cover-image {
    display: block;
    object-fit: cover;
    width: 100%;
    height: 30vh;
}

.page-header-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.page-header-icon-with-cover {
    margin-top: -0.72em;
    margin-left: 0.07em;
}

.page-header-icon img {
    border-radius: 3px;
}

.link-to-page {
    margin: 1em 0;
    padding: 0;
    border: none;
    font-weight: 500;
}

p > .user {
    opacity: 0.5;
}

td > .user,
td > time {
    white-space: nowrap;
}

input[type="checkbox"] {
    transform: scale(1.5);
    margin-right: 0.6em;
    vertical-align: middle;
}

p {
    margin-top: 0.5em;
    margin-bottom: 0.5em;
}

.image {
    border: none;
    margin: 1.5em 0;
    padding: 0;
    border-radius: 0;
    text-align: center;
}

.code,
code {
    background: rgba(135, 131, 120, 0.15);
    border-radius: 3px;
    padding: 0.2em 0.4em;
    border-radius: 3px;
    font-size: 85%;
    tab-size: 2;
}

code {
    color: #eb5757;
}

.code {
    padding: 1.5em 1em;
}

.code-wrap {
    white-space: pre-wrap;
    word-break: break-all;
}

.code > code {
    background: none;
    padding: 0;
    font-size: 100%;
    color: inherit;
}

blockquote {
    font-size: 1.25em;
    margin: 1em 0;
    padding-left: 1em;
    border-left: 3px solid rgb(55, 53, 47);
}

.bookmark {
    text-decoration: none;
    max-height: 8em;
    padding: 0;
    display: flex;
    width: 100%;
    align-items: stretch;
}

.bookmark-title {
    font-size: 0.85em;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 1.75em;
    white-space: nowrap;
}

.bookmark-text {
    display: flex;
    flex-direction: column;
}

.bookmark-info {
    flex: 4 1 180px;
    padding: 12px 14px 14px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.bookmark-image {
    width: 33%;
    flex: 1 1 180px;
    display: block;
    position: relative;
    object-fit: cover;
    border-radius: 1px;
}

.bookmark-description {
    color: rgba(55, 53, 47, 0.6);
    font-size: 0.75em;
    overflow: hidden;
    max-height: 4.5em;
    word-break: break-word;
}

.bookmark-href {
    font-size: 0.75em;
    margin-top: 0.25em;
}

.sans { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"; }
.code { font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace; }
.serif { font-family: Lyon-Text, Georgia, YuMincho, "Yu Mincho", "Hiragino Mincho ProN", "Hiragino Mincho Pro", "Songti TC", "Songti SC", "SimSun", "Nanum Myeongjo", NanumMyeongjo, Batang, serif; }
.mono { font-family: iawriter-mono, Nitti, Menlo, Courier, monospace; }
.pdf .sans { font-family: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC', 'Noto Sans CJK KR'; }

.pdf .code { font-family: Source Code Pro, "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC', 'Noto Sans Mono CJK KR'; }

.pdf .serif { font-family: PT Serif, Lyon-Text, Georgia, YuMincho, "Yu Mincho", "Hiragino Mincho ProN", "Hiragino Mincho Pro", "Songti TC", "Songti SC", "SimSun", "Nanum Myeongjo", NanumMyeongjo, Batang, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC', 'Noto Sans CJK KR'; }

.pdf .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC', 'Noto Sans Mono CJK KR'; }

.highlight-default {
}
.highlight-gray {
    color: rgb(155,154,151);
}
.highlight-brown {
    color: rgb(100,71,58);
}
.highlight-orange {
    color: rgb(217,115,13);
}
.highlight-yellow {
    color: rgb(223,171,1);
}
.highlight-teal {
    color: rgb(15,123,108);
}
.highlight-blue {
    color: rgb(11,110,153);
}
.highlight-purple {
    color: rgb(105,64,165);
}
.highlight-pink {
    color: rgb(173,26,114);
}
.highlight-red {
    color: rgb(224,62,62);
}
.highlight-gray_background {
    background: rgb(235,236,237);
}
.highlight-brown_background {
    background: rgb(233,229,227);
}
.highlight-orange_background {
    background: rgb(250,235,221);
}
.highlight-yellow_background {
    background: rgb(251,243,219);
}
.highlight-teal_background {
    background: rgb(221,237,234);
}
.highlight-blue_background {
    background: rgb(221,235,241);
}
.highlight-purple_background {
    background: rgb(234,228,242);
}
.highlight-pink_background {
    background: rgb(244,223,235);
}
.highlight-red_background {
    background: rgb(251,228,228);
}
.block-color-default {
    color: inherit;
    fill: inherit;
}
.block-color-gray {
    color: rgba(55, 53, 47, 0.6);
    fill: rgba(55, 53, 47, 0.6);
}
.block-color-brown {
    color: rgb(100,71,58);
    fill: rgb(100,71,58);
}
.block-color-orange {
    color: rgb(217,115,13);
    fill: rgb(217,115,13);
}
.block-color-yellow {
    color: rgb(223,171,1);
    fill: rgb(223,171,1);
}
.block-color-teal {
    color: rgb(15,123,108);
    fill: rgb(15,123,108);
}
.block-color-blue {
    color: rgb(11,110,153);
    fill: rgb(11,110,153);
}
.block-color-purple {
    color: rgb(105,64,165);
    fill: rgb(105,64,165);
}
.block-color-pink {
    color: rgb(173,26,114);
    fill: rgb(173,26,114);
}
.block-color-red {
    color: rgb(224,62,62);
    fill: rgb(224,62,62);
}
.block-color-gray_background {
    background: rgb(235,236,237);
}
.block-color-brown_background {
    background: rgb(233,229,227);
}
.block-color-orange_background {
    background: rgb(250,235,221);
}
.block-color-yellow_background {
    background: rgb(251,243,219);
}
.block-color-teal_background {
    background: rgb(221,237,234);
}
.block-color-blue_background {
    background: rgb(221,235,241);
}
.block-color-purple_background {
    background: rgb(234,228,242);
}
.block-color-pink_background {
    background: rgb(244,223,235);
}
.block-color-red_background {
    background: rgb(251,228,228);
}
.select-value-color-default { background-color: rgba(206,205,202,0.5); }
.select-value-color-gray { background-color: rgba(155,154,151, 0.4); }
.select-value-color-brown { background-color: rgba(140,46,0,0.2); }
.select-value-color-orange { background-color: rgba(245,93,0,0.2); }
.select-value-color-yellow { background-color: rgba(233,168,0,0.2); }
.select-value-color-green { background-color: rgba(0,135,107,0.2); }
.select-value-color-blue { background-color: rgba(0,120,223,0.2); }
.select-value-color-purple { background-color: rgba(103,36,222,0.2); }
.select-value-color-pink { background-color: rgba(221,0,129,0.2); }
.select-value-color-red { background-color: rgba(255,0,26,0.2); }

.checkbox {
    display: inline-flex;
    vertical-align: text-bottom;
    width: 16;
    height: 16;
    background-size: 16px;
    margin-left: 2px;
    margin-right: 5px;
}

.checkbox-on {
    background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20width%3D%2216%22%20height%3D%2216%22%20fill%3D%22%2358A9D7%22%2F%3E%0A%3Cpath%20d%3D%22M6.71429%2012.2852L14%204.9995L12.7143%203.71436L6.71429%209.71378L3.28571%206.2831L2%207.57092L6.71429%2012.2852Z%22%20fill%3D%22white%22%2F%3E%0A%3C%2Fsvg%3E");
}

.checkbox-off {
    background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20x%3D%220.75%22%20y%3D%220.75%22%20width%3D%2214.5%22%20height%3D%2214.5%22%20fill%3D%22white%22%20stroke%3D%22%2336352F%22%20stroke-width%3D%221.5%22%2F%3E%0A%3C%2Fsvg%3E");
}
    
</style>
<article id="5b9d6932-c2d8-4469-b9a9-a9b7aace44d7" class="page sans"><div class="page-body">
<p id="c2b8be18-27ae-4556-8282-5fa3018871b5" class=""><strong>제</strong><strong>1</strong><strong>조</strong><strong>(</strong><strong>목적</strong><strong>)</strong> 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</p><p id="9aea3f35-dc8b-41f4-8e89-033472b470f1" class=""><strong>제</strong><strong>1</strong><strong>조</strong><strong>(</strong><strong>목적</strong><strong>)</strong> 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</p><p id="a472d4ee-4092-444e-9387-192d68925aae" class="">※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><p id="ae0ef4cc-6857-46a7-bef5-3d81acca2743" class=""><strong>제</strong><strong>2</strong><strong>조</strong><strong>(</strong><strong>정의</strong><strong>)</strong></p><p id="29b525cd-099b-4788-98c8-fdc8a3abc2d0" class="">① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</p><p id="7b1884af-f14b-4c13-b7bc-96d26937ed4f" class="">② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p><p id="a6f85ef3-f418-4ff6-8d44-5a2c5d3eaf97" class="">③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p><p id="4b2824d9-1156-4ab4-8d5a-508b62b66f94" class="">④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</p><p id="bc9ea30f-9358-4bbf-bed1-bab511fb4386" class=""><strong>제</strong><strong>3</strong><strong>조 </strong><strong>(</strong><strong>약관 등의 명시와 설명 및 개정</strong><strong>)</strong></p><p id="6bf725d8-6be6-4c3b-984a-d4b34939e56f" class="">① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</p><p id="000766d9-32a9-4eea-b6d1-c7f9d0a21824" class="">② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</p><p id="62c8add5-c81d-42a4-9cdc-c9ffa9a55148" class="">③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><p id="fd46e02e-fb04-492e-af4a-3022afefb70f" class="">④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 &quot;몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</p><p id="4c78c0aa-a62c-4658-a61a-9a77ef5dfc77" class="">⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</p><p id="5d0ece5f-161e-4a30-bcab-50505071fafc" class="">⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p><p id="6f196c8d-34eb-4316-a031-3ab39446ce05" class=""><strong>제</strong><strong>4</strong><strong>조</strong><strong>(</strong><strong>서비스의 제공 및 변경</strong><strong>)</strong></p><p id="a2979113-1d1c-4d2a-882c-d2377d6cfa27" class="">① “몰”은 다음과 같은 업무를 수행합니다.</p><ol id="1cb52409-23de-4891-b4a8-30def9e3da22" class="numbered-list" start="1"><li>재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li></ol><ol id="ac966ecd-1a60-46d6-838d-6df03f8d9a88" class="numbered-list" start="2"><li>구매계약이 체결된 재화 또는 용역의 배송</li></ol><ol id="e3cba5f6-59b9-4265-b070-1c335f466995" class="numbered-list" start="3"><li>기타 “몰”이 정하는 업무</li></ol><p id="3d3c93bd-b3bd-4276-aef3-a3731c243a9a" class="">② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</p><p id="878c0fe1-72ef-4a5a-88fe-fb91849ac8bf" class="">③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</p><p id="dad1ddd4-90d7-48a0-9a52-fde1843b600b" class="">④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p id="1dfacb37-ab78-472f-a555-5eed403f6091" class=""><strong>제</strong><strong>5</strong><strong>조</strong><strong>(</strong><strong>서비스의 중단</strong><strong>)</strong></p><p id="3ad75c77-578a-45b0-8a3c-ba6dbc796d57" class="">① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</p><p id="a2cab2b0-0d72-4b1a-80c5-76fea103f341" class="">② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p id="74f61597-c8b9-4be0-be13-61187435b522" class="">③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p><p id="15b1e5af-95f3-4249-a428-648c8ac1a53c" class=""><strong>제</strong><strong>6</strong><strong>조</strong><strong>(</strong><strong>회원가입</strong><strong>)</strong></p><p id="9ff3c4f6-8241-481d-a03b-84c91d363202" class="">① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</p><p id="c2cc2f5c-ac62-4283-b7cd-9793b620bf63" class="">② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.</p><ol id="e93c3ad3-777d-4e62-8a6f-8bb63853311a" class="numbered-list" start="1"><li>가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li></ol><ol id="dd3fa882-54a6-4522-a993-1eeef865aa71" class="numbered-list" start="2"><li>등록 내용에 허위, 기재누락, 오기가 있는 경우</li></ol><ol id="cee16156-14f8-4ed2-97fd-6cf782470b92" class="numbered-list" start="3"><li>기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li></ol><p id="b3a1a5c7-13dd-4056-ab87-c78125ef34c9" class="">③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</p><p id="be21e8c8-815f-4739-9b1f-fe8c968ca3d2" class="">④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</p><p id="b0fc3edd-4f0c-44db-a7e7-95b0813a9d60" class=""><strong>제</strong><strong>7</strong><strong>조</strong><strong>(</strong><strong>회원 탈퇴 및 자격 상실 등</strong><strong>)</strong></p><p id="8188823a-18c6-4543-98de-8e30f412d0c6" class="">① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</p><p id="63036654-5d16-4092-a738-9a890a8b47bd" class="">② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.</p><ol id="b2978312-bfb6-4bf1-b393-ad34c546f368" class="numbered-list" start="1"><li>가입 신청 시에 허위 내용을 등록한 경우</li></ol><ol id="a9b0c58e-e336-4041-91fd-e8d3e28ad63c" class="numbered-list" start="2"><li>“몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li></ol><ol id="338f4f33-e443-4497-9356-4a01bf6b64bd" class="numbered-list" start="3"><li>다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li></ol><ol id="bc498d03-73fa-417d-b82e-96339cfeaf1f" class="numbered-list" start="4"><li>“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li></ol><p id="c5c203ab-8615-44fe-a736-f7e99823c587" class="">③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.</p><p id="09878ef7-27b3-468e-af7f-97513e845198" class="">④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p><p id="0e16b6d0-68df-4465-b86a-86a0132a158a" class=""><strong>제</strong><strong>8</strong><strong>조</strong><strong>(</strong><strong>회원에 대한 통지</strong><strong>)</strong></p><p id="6c48d40b-f1c7-4d9b-a74e-9b6ed9e725e7" class="">① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</p><p id="c9888f8e-ae01-482f-a8f0-5e143c12d29b" class="">② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</p><p id="c61c3d9c-908b-4fe9-a727-fa5a1e2627f3" class=""><strong>제</strong><strong>9</strong><strong>조</strong><strong>(</strong><strong>구매신청 및 개인정보 제공 동의 등</strong><strong>)</strong></p><p id="8c0d32c6-5433-4493-8de1-dfec3fa749a2" class="">① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.</p><ol id="7864ae42-d7c6-4532-b8d9-59b43cd58469" class="numbered-list" start="1"><li>재화 등의 검색 및 선택</li></ol><ol id="5dcd053f-2dcf-4af2-b776-b2ffdacf88af" class="numbered-list" start="2"><li>받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li></ol><ol id="ade15fe0-080c-4f9c-ba55-614104d3563a" class="numbered-list" start="3"><li>약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인</li></ol><ol id="17d339b1-c4c8-4a60-9ba1-81aab210a251" class="numbered-list" start="4"><li>이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시</li></ol><p id="249142bd-27c7-43c6-a659-a3abdf71f91f" class="">(예, 마우스 클릭)</p><ol id="9d3ab2c2-a1bf-4911-9bbe-f748d30b62d6" class="numbered-list" start="1"><li>재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li></ol><ol id="b5979262-2fbc-41ad-89fc-4a7bc8ec6f7d" class="numbered-list" start="2"><li>결제방법의 선택</li></ol><p id="5842ec91-77cf-49a2-82cb-87c86e5e8a94" class="">② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)</p><p id="61258bf1-e36e-435f-99b8-c92954a1167c" class="">③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</p><p id="463a051e-7e67-416d-9c22-41117c18221f" class=""><strong>제</strong><strong>10</strong><strong>조 </strong><strong>(</strong><strong>계약의 성립</strong><strong>)</strong></p><p id="0d4bd046-d80c-418f-ba14-945c7b5cea91" class="">① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.</p><ol id="7e7ed91e-c9f6-485c-864b-fc8511bfeef9" class="numbered-list" start="1"><li>신청 내용에 허위, 기재누락, 오기가 있는 경우</li></ol><ol id="3c3ee47b-2c79-4f57-bb63-a14b22a48484" class="numbered-list" start="2"><li>미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li></ol><ol id="580dc828-d8bf-48c0-863d-d47a46295d2b" class="numbered-list" start="3"><li>기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li></ol><p id="af7b8ddc-5a51-4bb4-9b1a-5e8d6b0ea532" class="">② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</p><p id="6ce27c12-475e-48d2-9f9c-2ebab8bd5eba" class="">③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</p><p id="e05faba1-d532-422e-852d-9c8b6cf5a5fb" class=""><strong>제</strong><strong>11</strong><strong>조</strong><strong>(</strong><strong>지급방법</strong><strong>) </strong>“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</p><ol id="b2776fca-4574-4bb2-81f7-082e2dc72773" class="numbered-list" start="1"><li>폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li></ol><ol id="8cccf4b8-b4b5-41dd-9dd5-9d504513adf4" class="numbered-list" start="2"><li>선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li></ol><ol id="b2d9c111-3383-4c51-89c6-97f7184ebb41" class="numbered-list" start="3"><li>온라인무통장입금</li></ol><ol id="0bb89fee-b30c-482d-8ff5-301d19223410" class="numbered-list" start="4"><li>전자화폐에 의한 결제</li></ol><ol id="baab0609-baf8-432a-abac-09f63587ba7f" class="numbered-list" start="5"><li>수령 시 대금지급</li></ol><ol id="2a4fef26-534e-462d-a500-26ddecc43aaf" class="numbered-list" start="6"><li>마일리지 등 “몰”이 지급한 포인트에 의한 결제</li></ol><ol id="9de8fe04-bb12-4988-9aa3-86164027d353" class="numbered-list" start="7"><li>“몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li></ol><ol id="07610237-de4a-4977-bb37-7dd7ed7a5d35" class="numbered-list" start="8"><li>기타 전자적 지급 방법에 의한 대금 지급 등</li></ol><p id="e475f9ae-6214-44da-a914-a5a9ebc8ab73" class=""><strong>제</strong><strong>12</strong><strong>조</strong><strong>(</strong><strong>수신확인통지</strong><strong>․</strong><strong>구매신청 변경 및 취소</strong><strong>)</strong></p><p id="58f6e07b-3e42-4320-870e-ff032704700b" class="">① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</p><p id="6617f1f6-e59a-4d7b-823e-d975d4404813" class="">② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</p><p id="cc61edd1-fef0-446a-ab6f-93be90c38919" class=""><strong>제</strong><strong>13</strong><strong>조</strong><strong>(</strong><strong>재화 등의 공급</strong><strong>)</strong></p><p id="685b2b8e-196c-4214-b7aa-a9a304c8a1af" class="">① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</p><p id="5094e2fd-0935-4582-8b71-27dbdbf64a31" class="">② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.</p><p id="53771573-d79e-4c68-ac8d-5d3a504db427" class=""><strong>제</strong><strong>14</strong><strong>조</strong><strong>(</strong><strong>환급</strong><strong>) </strong>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</p><p id="b5ef8534-c673-4c80-8cf7-35e1003d13d8" class=""><strong>제</strong><strong>15</strong><strong>조</strong><strong>(</strong><strong>청약철회 등</strong><strong>)</strong></p><p id="5f050fef-939f-4956-9311-51041dd52d2c" class="">① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</p><p id="8835c4ff-ebe7-4702-85d0-86a6f00ea3e6" class="">② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.</p><ol id="e17c03dc-94bb-431b-8634-d4ae9df52f50" class="numbered-list" start="1"><li>이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li></ol><ol id="ca99d5e1-005e-4f7d-a068-f0573126c1b9" class="numbered-list" start="2"><li>이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li></ol><ol id="3c4ff601-4b3b-4f56-80e2-f6275da3b04f" class="numbered-list" start="3"><li>시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</li></ol><ol id="a17af949-a091-4dde-8d43-c715e0059077" class="numbered-list" start="4"><li>같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li></ol><p id="e699ce6f-88e3-48d2-b9c8-65f2e6daa9e5" class="">③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</p><p id="47d66f0e-7d2c-4bcb-8cd2-9f457b323255" class="">④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</p><p id="8815684d-ece6-4f30-8b6d-cbcdb6eb2c9a" class=""><strong>제</strong><strong>16</strong><strong>조</strong><strong>(</strong><strong>청약철회 등의 효과</strong><strong>)</strong></p><p id="e0bcf6a3-2695-4950-842f-63c2163f0ec8" class="">① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</p><p id="ff70b3aa-0da7-4014-919d-0cf1d23b2d29" class="">② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</p><p id="210f51b1-8c8b-498d-8b1f-389c5b3080c0" class="">③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.</p><p id="f4764c3e-fc64-4481-b263-c4e4b28094b1" class="">④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</p><p id="ad008fb2-a6ab-4bb5-bc04-5ea2ff37452f" class=""><strong>제</strong><strong>17</strong><strong>조</strong><strong>(</strong><strong>개인정보보호</strong><strong>)</strong></p><p id="2eba0aa9-e13b-4055-8155-01e2392fd927" class="">① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.</p><p id="c162554f-56ca-498d-8c54-a9377c39ad5d" class="">② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.</p><p id="3978ef87-e73a-4973-80a3-40869c3e56bd" class="">③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</p><p id="af15b119-58fa-4163-b007-326abd9c2274" class="">④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</p><p id="220d47ca-eafd-4ddd-bfa4-142ef2491f85" class="">⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</p><p id="89bcea9e-d94c-4271-a5d5-566d6dcf4681" class="">⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</p><p id="56817a23-19b4-469c-8498-0b0e4cb131b0" class="">⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</p><p id="670554af-1631-484a-8863-001d66943f31" class="">⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</p><p id="9b94f4ac-4efd-4b6b-930d-96be6c9dd703" class="">⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</p><p id="1bdaeefd-da86-4204-916e-29d28624e6b3" class=""><strong>제</strong><strong>18</strong><strong>조</strong><strong>(“</strong><strong>몰</strong><strong>“</strong><strong>의 의무</strong><strong>)</strong></p><p id="f72d62ae-499e-4613-9455-870a15018fcd" class="">① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.</p><p id="4162ace9-4a35-417a-94ca-3639d4e29c44" class="">② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</p><p id="9dcee2dd-df39-4879-9461-ad4ef0cfd591" class="">③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p><p id="ab59d38d-6adf-4fce-96ee-1879c87a082f" class="">④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p><p id="38bc88a5-6b85-496c-8a76-accbf74d5f0c" class=""><strong>제</strong><strong>19</strong><strong>조</strong><strong>(</strong><strong>회원의 </strong><strong>ID </strong><strong>및 비밀번호에 대한 의무</strong><strong>)</strong></p><p id="febd7a66-a894-4f0c-905a-054c1390a3f9" class="">① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</p><p id="e92ed0e9-e3d0-48e3-a24b-4ea0a4d5db77" class="">② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p><p id="5204238a-f325-450a-a10f-2059ee65af9b" class="">③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</p><p id="705987d2-092b-4c5b-83a1-e08888eab8f0" class=""><strong>제</strong><strong>20</strong><strong>조</strong><strong>(</strong><strong>이용자의 의무</strong><strong>) </strong><strong>이용자는 다음 행위를 하여서는 안 됩니다</strong><strong>.</strong></p><ol id="65ea47ab-de8d-4d84-8490-61b43cadfd82" class="numbered-list" start="1"><li>신청 또는 변경시 허위 내용의 등록</li></ol><ol id="3f321600-3677-4043-9340-482d4e5b9faf" class="numbered-list" start="2"><li>타인의 정보 도용</li></ol><ol id="c53fe464-d8fa-4a9d-860a-2aa2aa46d3c8" class="numbered-list" start="3"><li>“몰”에 게시된 정보의 변경</li></ol><ol id="0a26b880-0d68-4c40-9738-e8217f9e1bfe" class="numbered-list" start="4"><li>“몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li></ol><ol id="536ef8f0-1820-4d89-a82f-5bab8bb120ee" class="numbered-list" start="5"><li>“몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해</li></ol><ol id="03e1f2fd-2f41-40dc-a762-40f2ba7418ec" class="numbered-list" start="6"><li>“몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li></ol><ol id="2728ce53-ba26-43ba-9ee3-31eb06682862" class="numbered-list" start="7"><li>외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li></ol><p id="1cf5a30f-b0b5-4eb5-8db7-87ed5353b030" class=""><strong>제</strong><strong>21</strong><strong>조</strong><strong>(</strong><strong>연결</strong><strong>“</strong><strong>몰</strong><strong>”</strong><strong>과 피연결</strong><strong>“</strong><strong>몰</strong><strong>” </strong><strong>간의 관계</strong><strong>)</strong></p><p id="86919721-6eed-4fbe-b657-045121ea5582" class="">① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.</p><p id="6c3ead13-c609-49eb-b7e6-e4c09df6986c" class="">② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</p><p id="7062083a-02a6-4593-9dc7-1f4193139bea" class=""><strong>제</strong><strong>22</strong><strong>조</strong><strong>(</strong><strong>저작권의 귀속 및 이용제한</strong><strong>)</strong></p><p id="691a1e23-14b4-478d-b367-1dbef85ee329" class="">① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.</p><p id="91f5e9a2-2d52-4f61-81d1-7f7cb08af73b" class="">② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p><p id="fffae89a-2452-4c68-99bd-a4869732f2ea" class="">③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</p><p id="e2fb9023-3dba-4fbf-9a63-3faee26cccc3" class=""><strong>제</strong><strong>23</strong><strong>조</strong><strong>(</strong><strong>분쟁해결</strong><strong>)</strong></p><p id="5907a4b3-a0cf-456e-be82-762c87b85058" class="">① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.</p><p id="c81e6b38-0a0e-4bcb-a89d-07e61ba0bf36" class="">② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</p><p id="293dd7be-3e39-47bf-83d2-e3134f92aad6" class="">③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</p><p id="926dcdeb-cff5-42a8-9885-089db7693e5f" class=""><strong>제</strong><strong>24</strong><strong>조</strong><strong>(</strong><strong>재판권 및 준거법</strong><strong>)</strong></p><p id="b17c66ca-25b1-4ce2-87b5-30c7589815dd" class="">① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</p><p id="f78c2692-05b9-44b5-a340-37866abb5f4d" class="">② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</p><p id="44d445c7-27a4-4ebd-8b40-170390e5aca1" class="">※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><p id="91a540a2-96e5-4585-875a-a9aace4ada21" class=""><strong>제</strong><strong>2</strong><strong>조</strong><strong>(</strong><strong>정의</strong><strong>)</strong></p><p id="4eca6ab7-1b9a-4c38-87a2-0ce8eae0bac3" class="">① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</p><p id="00414b35-a629-480c-9397-487069d21b82" class="">② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p><p id="ae538172-0e54-46b4-848e-cad0fc156fb2" class="">③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p><p id="71120cb8-2c3a-47d1-ac39-a684e4f24ce6" class="">④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</p><p id="65bd1a1e-b27c-411c-9d0d-223f425d7956" class=""><strong>제</strong><strong>3</strong><strong>조 </strong><strong>(</strong><strong>약관 등의 명시와 설명 및 개정</strong><strong>)</strong></p><p id="2171a4bb-48a1-4725-bf1b-7ea80a0f9fd5" class="">① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</p><p id="e65ff348-062b-487f-a099-303b302933e4" class="">② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</p><p id="fc9abbf9-3635-4dca-8f89-785447f2b580" class="">③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><p id="dd42926c-47a5-480a-a072-d704c1733828" class="">④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 &quot;몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</p><p id="5f710fd1-3a6b-4d8a-bce4-33cfa7e7600a" class="">⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</p><p id="07cfd777-77f0-45ca-b248-ceece0a5211e" class="">⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p><p id="d77d7af6-716f-4dcf-b428-8103aca7adb9" class=""><strong>제</strong><strong>4</strong><strong>조</strong><strong>(</strong><strong>서비스의 제공 및 변경</strong><strong>)</strong></p><p id="9ef6d1f1-8938-4929-ac2c-29f5ea362fc2" class="">① “몰”은 다음과 같은 업무를 수행합니다.</p><ol id="b02a4a46-dd76-4c20-bac0-7a8ed2dabfe9" class="numbered-list" start="1"><li>재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li></ol><ol id="e3ce7956-af00-4557-8510-183768321cfa" class="numbered-list" start="2"><li>구매계약이 체결된 재화 또는 용역의 배송</li></ol><ol id="fab501b3-31ae-47de-88d5-cec701f1cf2d" class="numbered-list" start="3"><li>기타 “몰”이 정하는 업무</li></ol><p id="d6b14f5b-92e2-4752-a07d-2aaeac4a4132" class="">② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</p><p id="16cce476-a446-4cc0-bf2d-c42cc6c93489" class="">③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</p><p id="2efba050-5d93-481d-89a3-5a8660fac793" class="">④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p id="95363217-9d08-4472-8848-33a9a0af96f1" class=""><strong>제</strong><strong>5</strong><strong>조</strong><strong>(</strong><strong>서비스의 중단</strong><strong>)</strong></p><p id="3103b0fe-4d6b-4ab8-9a88-80a74090b3a9" class="">① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</p><p id="64a74e25-6c8d-4e08-9d94-a7764de02731" class="">② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p id="eae50021-2d93-4ff8-82b6-b1595cffdc36" class="">③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p><p id="35708a27-e0d1-486e-8f21-35d34834d70f" class=""><strong>제</strong><strong>6</strong><strong>조</strong><strong>(</strong><strong>회원가입</strong><strong>)</strong></p><p id="3eaa3393-894f-4e44-97d0-21dea57a7cc2" class="">① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</p><p id="a7be293a-e44d-4630-9612-5d9872f04576" class="">② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.</p><ol id="d31798e3-49b8-454e-a81a-a7cf5d6a7ea7" class="numbered-list" start="1"><li>가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li></ol><ol id="213cc511-2113-4a99-9d3e-de073ad8d31b" class="numbered-list" start="2"><li>등록 내용에 허위, 기재누락, 오기가 있는 경우</li></ol><ol id="72a45f08-f2d7-4947-b6c3-021d728e7f8a" class="numbered-list" start="3"><li>기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li></ol><p id="4cad1cb6-5029-4800-a609-2291046a971d" class="">③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</p><p id="2f482dd5-0e35-480d-af93-03805e5fb640" class="">④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</p><p id="2455fc22-5e9e-4906-a80e-bea0b7eb7554" class=""><strong>제</strong><strong>7</strong><strong>조</strong><strong>(</strong><strong>회원 탈퇴 및 자격 상실 등</strong><strong>)</strong></p><p id="38c6f3a0-e3e0-4e25-b2c3-7cb95c3f99f2" class="">① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</p><p id="561a9510-43e5-43f5-843d-0774412fdfd2" class="">② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.</p><ol id="e7903c01-ac2d-4ce0-acb5-54ab74fd7e36" class="numbered-list" start="1"><li>가입 신청 시에 허위 내용을 등록한 경우</li></ol><ol id="31e06625-a62f-4206-85eb-98a8c8cfd61e" class="numbered-list" start="2"><li>“몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li></ol><ol id="85ac91e9-29cd-4f24-90e3-73dc082b584b" class="numbered-list" start="3"><li>다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li></ol><ol id="e5c37252-9c65-42fe-9161-6a722d2a1309" class="numbered-list" start="4"><li>“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li></ol><p id="df2c7ba7-e52d-4b26-abfb-ee15a059532d" class="">③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.</p><p id="13c12286-5bdd-4740-9905-d75d4f6ec9cd" class="">④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p><p id="80dcf2f0-621a-407a-bf5b-d605e493409f" class=""><strong>제</strong><strong>8</strong><strong>조</strong><strong>(</strong><strong>회원에 대한 통지</strong><strong>)</strong></p><p id="e60d560d-3185-41b1-84da-3716728ac256" class="">① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</p><p id="b4c2bd30-a613-42ac-98ff-36670f0bad40" class="">② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</p><p id="4a2fe7b7-d61b-4ce5-bcf0-44bbc86ec112" class=""><strong>제</strong><strong>9</strong><strong>조</strong><strong>(</strong><strong>구매신청 및 개인정보 제공 동의 등</strong><strong>)</strong></p><p id="5dffabf1-9f12-4c1c-bf10-c9b8357c369a" class="">① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.</p><ol id="ffcee0d5-0418-435c-b2c6-8fdc9a159236" class="numbered-list" start="1"><li>재화 등의 검색 및 선택</li></ol><ol id="969d1dd0-fb7c-4482-8cf7-2603d3d56173" class="numbered-list" start="2"><li>받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li></ol><ol id="b06bc1f7-af0c-45ef-99c7-9cb888e45be5" class="numbered-list" start="3"><li>약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인</li></ol><ol id="75517e99-6b2e-4d75-99d4-4b9459f8ba7c" class="numbered-list" start="4"><li>이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시</li></ol><p id="4296b88c-65c3-443f-9c3f-293c506bb3ac" class="">(예, 마우스 클릭)</p><ol id="a683db56-80ff-4932-9f51-5b6f536d8612" class="numbered-list" start="1"><li>재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li></ol><ol id="d850cdbb-0813-4b3b-b056-08b6f3089181" class="numbered-list" start="2"><li>결제방법의 선택</li></ol><p id="0ea476f1-b985-420b-92e1-5cdaa57ace09" class="">② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)</p><p id="2a6a9a64-0b92-4882-b2fb-1a3fc0f44ec7" class="">③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</p><p id="7bab35fb-adcb-4549-a7cd-1cd04af12db2" class=""><strong>제</strong><strong>10</strong><strong>조 </strong><strong>(</strong><strong>계약의 성립</strong><strong>)</strong></p><p id="9e3ed6b7-0f3f-4220-8f93-991f12c17b7a" class="">① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.</p><ol id="de198902-d9f5-4bed-ba45-266288702810" class="numbered-list" start="1"><li>신청 내용에 허위, 기재누락, 오기가 있는 경우</li></ol><ol id="6ec318ae-c894-4f9f-ac68-8ff2db58e957" class="numbered-list" start="2"><li>미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li></ol><ol id="7078b0e5-990f-4bdd-aada-51d607ee7b09" class="numbered-list" start="3"><li>기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li></ol><p id="3ba8c680-f5aa-48e1-adac-c6a5c8ba793d" class="">② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</p><p id="226a3571-ac30-49a3-ad35-8ff90a60f82b" class="">③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</p><p id="dc6b6f91-63a0-469c-a4fd-700ab69b8c81" class=""><strong>제</strong><strong>11</strong><strong>조</strong><strong>(</strong><strong>지급방법</strong><strong>) </strong>“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</p><ol id="2f2bc737-f759-4907-9663-9aa7016a9a66" class="numbered-list" start="1"><li>폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li></ol><ol id="030d51a4-79c8-4e50-b96b-ea28058ddccb" class="numbered-list" start="2"><li>선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li></ol><ol id="23184fa4-1fe4-4c7a-bbfe-68f7f7bf1fd3" class="numbered-list" start="3"><li>온라인무통장입금</li></ol><ol id="9c6d33e2-e799-424d-a50e-f42c033728da" class="numbered-list" start="4"><li>전자화폐에 의한 결제</li></ol><ol id="0d1b9fb6-25f5-4eea-a633-cfe27dcd688f" class="numbered-list" start="5"><li>수령 시 대금지급</li></ol><ol id="44389b18-1b93-4b67-a9bd-0ede00b2208a" class="numbered-list" start="6"><li>마일리지 등 “몰”이 지급한 포인트에 의한 결제</li></ol><ol id="28eb406c-a942-4552-9ea2-298de12aac74" class="numbered-list" start="7"><li>“몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li></ol><ol id="83309103-115a-44a0-a006-795143c4970d" class="numbered-list" start="8"><li>기타 전자적 지급 방법에 의한 대금 지급 등</li></ol><p id="dda39780-1201-4fc4-b95e-da33dc2c5efb" class=""><strong>제</strong><strong>12</strong><strong>조</strong><strong>(</strong><strong>수신확인통지</strong><strong>․</strong><strong>구매신청 변경 및 취소</strong><strong>)</strong></p><p id="04ee47ac-5764-499c-ab52-7a2676d37ab7" class="">① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</p><p id="b52e10b3-534a-4cce-a0db-393b07ec2312" class="">② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</p><p id="85088da5-874a-4a50-a7df-6981d855329a" class=""><strong>제</strong><strong>13</strong><strong>조</strong><strong>(</strong><strong>재화 등의 공급</strong><strong>)</strong></p><p id="47193ad6-5add-4108-b15a-ce32a2bb3690" class="">① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</p><p id="20f097d8-afc1-4aa4-8c16-af443c8420c2" class="">② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.</p><p id="669e6be3-a15d-4592-956f-7bfe5fdf99a8" class=""><strong>제</strong><strong>14</strong><strong>조</strong><strong>(</strong><strong>환급</strong><strong>) </strong>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</p><p id="639cc951-be71-4bb0-a9ae-8b73e641f3e0" class=""><strong>제</strong><strong>15</strong><strong>조</strong><strong>(</strong><strong>청약철회 등</strong><strong>)</strong></p><p id="e9e6f78e-e9b6-4b02-8248-74e57231645f" class="">① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</p><p id="bb151ae0-1ffc-4bdb-82ee-329dcedbe051" class="">② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.</p><ol id="e0f827e2-8729-42ba-89d8-e052165aa2eb" class="numbered-list" start="1"><li>이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li></ol><ol id="77361581-4b0f-4589-a94a-92adbb56c9f5" class="numbered-list" start="2"><li>이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li></ol><ol id="c89c1081-6d06-4fe8-b2ab-e8dd40659aad" class="numbered-list" start="3"><li>시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</li></ol><ol id="439ade95-7ea8-447e-a659-bc1b1ac7451d" class="numbered-list" start="4"><li>같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li></ol><p id="0ee76e5c-8bd3-4de9-8742-ff718056f58f" class="">③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</p><p id="26bf74fd-1e9d-45fa-b49b-0ab7b0d7f4df" class="">④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</p><p id="74e1a0dc-6506-4a8b-8f83-5d0bfe0341e7" class=""><strong>제</strong><strong>16</strong><strong>조</strong><strong>(</strong><strong>청약철회 등의 효과</strong><strong>)</strong></p><p id="a84744fd-2eb6-4c5f-8770-defaf305873d" class="">① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</p><p id="08899bf6-b7e2-45a7-a8c5-712bd28f3da2" class="">② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</p><p id="61b77c15-51e7-4c22-b1ea-91533f088470" class="">③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.</p><p id="f0b54596-1eba-4bd4-bd21-21db4e9b05a6" class="">④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</p><p id="2414a32f-ac55-40be-b8a6-52406c1195bd" class=""><strong>제</strong><strong>17</strong><strong>조</strong><strong>(</strong><strong>개인정보보호</strong><strong>)</strong></p><p id="f1e002e8-bed7-474a-a7d4-c849abd2fc59" class="">① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.</p><p id="26bbb187-7515-4fce-8387-24cbb04212cd" class="">② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.</p><p id="8f980260-4b9a-4fb5-87eb-9da101a6cbf2" class="">③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</p><p id="9132fab5-1d70-4c32-8692-e7b6d7c1b60a" class="">④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</p><p id="77b2360e-b970-4ee4-b626-6bd9237de1f0" class="">⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</p><p id="f604d99f-65a8-47e3-8743-946688f7e8fb" class="">⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</p><p id="58a8a794-7558-4f45-8ff9-37ab1acba1a3" class="">⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</p><p id="b32f33f8-46b3-42fa-807b-a99d80d5ff2b" class="">⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</p><p id="071eadaa-1f3c-4fd9-9f6e-1264128972d0" class="">⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</p><p id="7be9b6ca-51e6-4d3b-869a-46fb1187fb3e" class=""><strong>제</strong><strong>18</strong><strong>조</strong><strong>(“</strong><strong>몰</strong><strong>“</strong><strong>의 의무</strong><strong>)</strong></p><p id="28c257cd-fbd5-4ac2-a121-2aab8fbf5a0e" class="">① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.</p><p id="1242fb37-e728-4249-845b-c2048a22ff4e" class="">② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</p><p id="1f6213b8-e611-470c-b44a-ce6856f7dffa" class="">③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p><p id="02f27bcb-b3d1-4862-82de-b8b173402cbb" class="">④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p><p id="ddc1cdcb-7091-46e9-8d7f-38d23978e348" class=""><strong>제</strong><strong>19</strong><strong>조</strong><strong>(</strong><strong>회원의 </strong><strong>ID </strong><strong>및 비밀번호에 대한 의무</strong><strong>)</strong></p><p id="8989fd93-9b70-457a-9a45-9d95aa06559f" class="">① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</p><p id="6817d59d-e3e5-4f43-9a81-3dd56a974ce5" class="">② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p><p id="b724a33e-a5c4-496b-a7c8-ea3cdd685c76" class="">③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</p><p id="d50d6dcd-8ead-4af6-ae23-aeffc9e4a72c" class=""><strong>제</strong><strong>20</strong><strong>조</strong><strong>(</strong><strong>이용자의 의무</strong><strong>) </strong><strong>이용자는 다음 행위를 하여서는 안 됩니다</strong><strong>.</strong></p><ol id="c8cf8eb0-8f1c-4399-bb0c-b011fabbcb7a" class="numbered-list" start="1"><li>신청 또는 변경시 허위 내용의 등록</li></ol><ol id="53c010c7-91ac-4c83-ad6a-309dce93a849" class="numbered-list" start="2"><li>타인의 정보 도용</li></ol><ol id="72cc4942-3a6c-4c85-973f-240a35680405" class="numbered-list" start="3"><li>“몰”에 게시된 정보의 변경</li></ol><ol id="a86402b3-cee5-4470-92be-d349b37b1531" class="numbered-list" start="4"><li>“몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li></ol><ol id="eaa73889-bc98-4423-afd1-24c9fd890cb3" class="numbered-list" start="5"><li>“몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해</li></ol><ol id="154abeb4-bca1-47fd-99e3-4c623d1e67e6" class="numbered-list" start="6"><li>“몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li></ol><ol id="d45d612c-46a5-4205-b809-947b222a8ed6" class="numbered-list" start="7"><li>외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li></ol><p id="69cb4ede-fd88-4b5f-baa8-3e0afce40bd8" class=""><strong>제</strong><strong>21</strong><strong>조</strong><strong>(</strong><strong>연결</strong><strong>“</strong><strong>몰</strong><strong>”</strong><strong>과 피연결</strong><strong>“</strong><strong>몰</strong><strong>” </strong><strong>간의 관계</strong><strong>)</strong></p><p id="1da16b9e-4004-476a-b70e-3022cd2fc191" class="">① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.</p><p id="bdd2d3dd-c162-49c8-aea9-5fc5e9969daa" class="">② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</p><p id="c905d096-db84-44a9-b3ab-ba3ca7f97397" class=""><strong>제</strong><strong>22</strong><strong>조</strong><strong>(</strong><strong>저작권의 귀속 및 이용제한</strong><strong>)</strong></p><p id="63484888-2e41-40d6-ab0a-3449903126fa" class="">① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.</p><p id="cc9ef8c2-ad74-4002-a7af-937288534555" class="">② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p><p id="324a1d07-ee0a-4e18-b13c-83de8e4554fa" class="">③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</p><p id="ae9af61f-a5dd-4f87-ba8f-383845e180a9" class=""><strong>제</strong><strong>23</strong><strong>조</strong><strong>(</strong><strong>분쟁해결</strong><strong>)</strong></p><p id="510aa404-13d8-4c38-ad0f-a3d802270693" class="">① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.</p><p id="eb3ead69-17b5-419c-90e3-08d072df86de" class="">② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</p><p id="59ad1529-2813-4a56-bf24-086039f59c67" class="">③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</p><p id="dbbde3ea-cac7-4f5e-96ca-944fee605606" class=""><strong>제</strong><strong>24</strong><strong>조</strong><strong>(</strong><strong>재판권 및 준거법</strong><strong>)</strong></p><p id="0b6ad98f-dea1-42ce-8683-071328271fc0" class="">① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</p><p id="7cc84f1b-cfa0-48bb-b1d7-8e993f1c4c7d" class="">② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</p></div></article>