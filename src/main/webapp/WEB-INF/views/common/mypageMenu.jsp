<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/commonCss/mypage.css">

        <div class="mypage-nav">
            <div class="mypage-navi">
                <div><a href="/showMypage.do?memberId=${sessionScope.m.memberId }">공연예매내역</a></div>
                <div><a href="#">전시예매내역</a></div>
                <div><a href="#">강좌신청내역</a></div>
                <div><a href="/spaceMypage.do?memberId=${sessionScope.m.memberId }">대관신청내역</a></div>
                <div><a href="#">열람실 관리</a></div>
                <div><a href="#">개인정보관리</a></div>
            </div>
        </div>
