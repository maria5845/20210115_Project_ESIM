<%@ page language="java" contentType="text/css; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
html,body{
	width: 100%;
	height: 100%;	
}
.wrapper{
	width: 100%;
	padding: 10px 20px;
	height: 100%;
    box-sizing: border-box;
}
.content{
	width: 100%;
}
.wrapper .head{
	position: relative;
	height: 70px;
}
#timeBox{
	float: left;
    margin-top: 3px;
}
#timeBox>div{
	float: left;
}
#timeBox>div:nth-child(2){
	text-align: center;
	font-size: 19px;
}
#timeBox>div:nth-child(2)>p{
	font-weight: bold;
    margin: 0;
}
#timeBox>div:nth-child(2)>p:first-child{
	color: #d8d8d8;
}
#timeBox>div:nth-child(2)>p:last-child{
	margin-top: 6px;
    color: #969696;
}
#timeBox>div:first-child,
#timeBox>div:last-child{
	cursor: pointer;
}
#timeBox .k-icon{
	font-size: 35px;
	color: #c70752;
}
#title{
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
    font-size: 42px;
    font-weight: bold;
    text-align: center;
}
#title_LNS{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
    font-size: 42px;
    font-weight: bold;
    text-align: center;
}
#reportBox{
	float: right;
}
.report-btn{
	position: relative;
	margin-right: 10px;
	display: inline-block;
}
.report-btn:last-child{
	margin-right: 0;
}
.report-btn>button{
    height: 40px;
    font-size: 16px;
    font-weight: bold;
    width: 130px;
    margin-top: 10px;
}
.calendar{
	position: absolute;
	display: none;
	right: 0;
	z-index: 99;
}

.content{
	height: calc(100% - 83px);
	margin-top: 13px;
	display: flex;
	justify-content: space-between;
}
.content>div>div{
	background-color: #32323D;
	border-radius: 5px;
	text-align: center;
	margin-bottom: 16px;
}
.content>div>div:first-child{
	height: 38px;
}
.content>div>div:nth-child(2),
.content>div>div:nth-child(3){
	height: calc(50% - 39px);
}
.content>div>div:nth-child(3){
	margin-bottom: 0;
}
#xnm{
	width: 38px;
}
.chart-box{
	width: calc(50% - 35px);
}
.one-chart-box{
    width: calc(99% - 35px);
}
.content .dvctitle{
    font-size: 18px;
    font-weight: bold;
    letter-spacing: 0.1em;
    line-height: 38px;
}
.content .dvctitle.vr{
    writing-mode: vertical-lr;
    width: 100%;
}
.bg-none{
	background: none!important;
}
.err_tb{
    width: calc(95% - 33px);
}
.err_tb_stk{
    width: calc(100% - 85px);
}
.err_cnt{
    height: calc(100% - 1px);
    border-spacing: 15px;
    border-collapse: separate;
    margin-left: 55px;
}
.err_cnt_stk{
    height: calc(100% - 1px);
    border-spacing: 5px;
    border-collapse: separate;
    margin-left: 55px;	
}
.lami_crt{
	height: calc(100% - 66px);
}
.lami_pcrt{
	text-align: center;
	height: calc(100% - 50px);
}
.stk_crt{
	text-align: center;
	height: calc(100% - 76px);
}
.stk_pcrt{
	height: calc(100% - 50px);
}
.proc_tb{
    width: calc(100% - 40px);
    padding: 3px 0px 0px 3px;
}
.proc_cnt{
    height: calc(100% - 1px);
}
.bd-r{
	border: none !important;
	text-align: right;
}
.cat{
    float: left;
    line-height: 4.5;
    text-indent: 5px;
    width: 55px;
    color: #FF0000;
    font-weight: 500;
    height: calc(20% - 1px);
}
.abs{
	position: absolute;
	color: #FF0000;
	font-weight: 500;
}
.all_err{
    top: 200px;
    right: 885px;
}
.l_err{
    left: 91px;
    top: 168px;
}
.stk{
    top: 156px;
    right: 868px;
}
.h_stk{
    top: 186px;
    right: 867px;
}
.tap{
    top: 216px;
    right: 868px;
}
.ins{
    top: 247px;
    right: 870px;
}
.ipop.syspop,
.pop-cont,
.modal-wrap{
}
.panel{
	background-color: #32323D;
    border-radius: 5px;	
}
.popup-title{
	font-size: 37px;
    font-weight: bold;
    text-align: center;
}
.time-bar{
	height: 30px;
	margin: 5px 0 15px;
}
.chart{
	position: relative;
}
.center{
	position: relative;
	bottom: 70px;
}
.temp{
	display: inline-block;
	width: 100%;
	
	font-size: 40px;
    opacity: 0.2;
    font-weight: bold;
    letter-spacing: 0.5em;
}
.time-bar>span{
	margin-right: 10px;
}
.chart-wrap.top{
	height: calc(62% - 50.5px);
    margin-bottom: 10px;
}
.chart-wrap.bot{
	height: calc(38% - 50.5px);
}
.chart-wrap>div{
	float: left;
	height: 100%;
    background-color: #32323D;
    border-radius: 5px;
}
.chart-wrap>div:first-child{
	width: 38px;
	font-size: 18px;
    font-weight: bold;
    letter-spacing: 0.1em;
    line-height: 38px;
    writing-mode: vertical-lr;
    text-align: center;
    margin-right: 10px;
}
.chart-wrap>div:last-child{
	width: calc(100% - 48px);
}
.report-btn .k-i-excel{
    font-size: 19px;
    vertical-align: text-bottom;
    margin-right: 5px;
}
.wrapper.modal-wrap{
	height: 830px;
	padding: 20px;
	background-color: #12131b;
}
.ipop .pop-cont .cont-header{
	background: none;
}
.dimmed{
	opacity: 0.8!important;
}
.contents1{
	position: relative;
	height: calc(100% - 45px);
}
.contents2{
	position: relative;
	height: calc(100% - 45px);
}
.contents1>div{
	float: left;
    height: 100%;
}
.contents2>div{
	float: left;
    height: 100%;
}
.con-title{
	width: 38px;
    margin-right: 10px;
    font-size: 18px;
    font-weight: bold;
    letter-spacing: 0.3em;
    line-height: 38px;
    writing-mode: vertical-lr;
    text-align: center;
}
.con-title>div:first-child{
	margin-bottom: 10px;
}
.con-wrap{
    width: calc(100% - 48px);
    box-sizing: border-box;
}
table.tb td {
    padding: 5px 0px 5px 0px;
}
.custom-tbl{
	width: 100%;
	height: 100%;
    overflow-y: scroll;
    border-radius: 5px;
}
.custom-tbl *{
	box-sizing: border-box;
}
.custom-tbl thead{
	background-color: #282933;
	border-radius: 5px 5px 0 0;
	color: #999999;
    font-size: 14px;
    font-weight: 500;
}
.custom-tbl thead th{
	padding: 10px;
	border-right: 1px solid #303135;
	color: #fff;
}
.custom-tbl thead th:first-child{
	border-radius: 5px 0 0 0;
}
.custom-tbl thead th:last-child{
	border-radius: 0 5px 0 0;
}
.custom-tbl thead th:last-child{
	border-right: 0;
}
.custom-tbl tbody tr{
	color: #cecece;
	font-size: 12px;
}
.custom-tbl tbody tr:nth-of-type(odd)>td {
    background-color: #393944;
}
.custom-tbl tbody td{
	padding: 10px;
	text-align: center;
	border-right: 1px solid #303135;
    border-bottom: 1px solid #303135;
}
.custom-tbl table tbody td:first-child,
.custom-tbl table tbody td:nth-child(2){
	background-color: #24242f;
	width: 160px;
	color: #fff;
}
.custom-tbl tbody td:last-child{
	border-right: 0;
}
.custom-tbl .sub{
	padding: 0;
}
.custom-tbl .sub span{
	width: 50%;
	padding: 10px;
    float: left;
    height: 33px;
}
.custom-tbl .sub span:first-child{
	border-right: 1px solid #303135;
}
.custom-tbl .empty td{
	background: #12131b!important;
    border: none;
}

.custom-tbl::-webkit-scrollbar-thumb{
	border-radius: 0 5px 5px 0;
}
.custom-tbl::-webkit-scrollbar-track{
	border-radius: 0 5px 5px 0;
}
th.now{
	border: 4px solid #c40452!important;
	border-bottom: 0!important;
}
td.now{
	border-left: 4px solid #c40452!important;
	border-right: 4px solid #c40452!important;
}
td.now.end{
	border-bottom: 4px solid #c40452!important;
}
.qty{
    text-align: left;
    font-size: 16px !important;
    border: 1px solid #c7c1c1;
    background-color: #303135 !important;
    padding-top: 1px;
    color: #fff !important;
}
.bd-no {
	border: none !important;
}
#show_err_desc, #show_desc{
	width: 300px;
    height: 60px;
    background: #D0D0D2;
    opacity: 0.9;
    border: 2px solid black;
    color: black;
    font-size: 18px;
    font-weight: 400;
    text-align: left;
    z-index: 10;
    padding: 5px 10px 5px 10px;
    box-shadow: 1px 1px 5px 2px grey inset;
}
.close-err {
    position: absolute;
    right: -6px;
    top: -5px;
    background-image: url(../../../../resource/img/btn-close-pop_red.png);
    background-repeat: no-repeat;
    background-position: 50%;
    width: 45px;
    height: 45px;
    overflow: hidden;
    text-indent: -3721em;
}
html .k-grid tr:hover {
  background: #C40452 !important;
}
.k-filter-row th, .k-grid-header th.k-header {
	background: #282933;
    vertical-align: middle;
    text-align: center;
    font-size: 19px;
    color: #fff;
}
.k-header, .k-treemap-title, .k-grid-header .k-header > .k-link {
    background: #282933;
    vertical-align: middle;
    text-align: center;
    font-size: 18px;
    color: #fff;
}
.k-grid td {
    height: 44px !important;
}
.k-widget {
    font-size: 18px;
}
#errCnt{
	display: flex;
	justify-content: space-between;
    box-sizing: border-box;
	/* width: 100%;
    padding: 13px 85px 0 105px; */
    width: 85.2vw;
    margin-left: 5.5vw;
    padding-top: 13px;
}	
.cnt-box{
	font-size: 16px;
	width: 109px;
	height: 30px;
	line-height: 30px;
	display: flex;
	justify-content: center;
}
.cnt-box>span{
	border: 1px solid #626060;
	width: 30px;
	height: 100%;
	margin-right: 8px;
}
.cnt-box>span:last-child{
	margin-right: 0;
}
.btn-wrap{
	position: absolute;
	right: 10px;
	z-index: 99;
	cursor: pointer;
}
</style>
