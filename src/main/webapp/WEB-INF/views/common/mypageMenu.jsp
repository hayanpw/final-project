<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/commonCss/mypage.css">

        <div class="mypage-nav">
            <div class="mypage-navi">
                <div><a href="/showMypage.do?memberId=${sessionScope.m.memberId }">공연예매내역</a></div>
                <div><a href="/exhibitionMypage.do?memberNo=${sessionScop.m.memberNo }">전시예매내역</a></div>
                <div><a href="/academyMypage.do?memberNo=${sessionScop.m.memberNo }">강좌신청내역</a></div>
                <div><a href="/spaceMypage.do?memberId=${sessionScope.m.memberId }">대관신청내역</a></div>
                <div><a href="/readingMypage.do?memberId=${sessionScope.m.memberId }">열람실예약내역</a></div>
                <div><a href="/mypage.do?memberNo=${sessionScope.m.memberNo }">개인정보관리</a></div>
            </div>
        </div>
