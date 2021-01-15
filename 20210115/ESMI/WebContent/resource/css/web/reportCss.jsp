<%@ page language="java" contentType="text/css; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.k-tabstrip-top {
    font-size: 18px !important;
}

table.tb thead tr{
	background-color: #414141;
    border-color: #3b3a3a;
    background: #282933;
    color: #fff;
    font-weight: 400;
}
table.tb tbody tr {
	border-color: #3b3a3a;
}
table.tb tbody td {
	border-color: #2c2c31;
}
table.tb thead th {
    background-color: #3b444b;
    color: #fff;
    font-weight: normal;
    border-color: #31383d;
}
table.tb tbody tr:hover {
    background-color: #625e5e !important;
}
table.tb thead th, table.tb tbody td {
    font-size: 14px; 
/*      height: 20px; */
    padding: 4px 7px !important;
    height: 25px !important;
}
.k-widget {
    font-size: 14px;
}
.ul-blue {
    color: blue;
    text-decoration: underline;
}
.k-header{
    /* background-color: #c40452; */
    background-color: #1e2229;
}

.k-widget {
    background-color: #1c1c26;
}

.k-textbox-container {
    padding-top: 1.42857143em;
    display: -ms-inline-flexbox;
    display: inline-flex;
    vertical-align: middle;
    position: relative;
    width: 12.4em;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-pack: stretch;
    justify-content: stretch;
}
.k-calendar {
    background-clip: padding-box;
    border-width: 1px;
    border-style: solid;
    box-sizing: border-box;
    outline: 0;
    font-family: inherit;
    font-size: 14px;
    line-height: 1.42857143;
    position: relative;
    overflow: hidden;
    display: inline-block;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -webkit-tap-highlight-color: transparent;
}
.k-calendar>.k-calendar-header {
    min-width: 280px;
    box-sizing: border-box;
}
.k-calendar-header {
    padding: 8px 16px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
}
.k-calendar.k-calendar-range:not(.k-calendar-infinite) .k-calendar-view {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: row;
    flex-direction: row;
}
.k-calendar.k-calendar-range .k-calendar-view {
    height: auto;
    min-height: 17em;
    width: auto;
    white-space: nowrap;
}
.k-calendar .k-calendar-view {
    width: 17em;
    height: 19em;
    position: relative;
    z-index: 1;
    overflow: hidden;
    margin: auto;
}

.k-calendar .k-calendar-footer, .k-calendar .k-footer {
    text-align: center;
    clear: both;
}

.k-calendar-range{
    width: 40.917em;
}

.k-dateinput, .k-datepicker{
    width: 10.4em !important;
}
.k-textbox-container>.k-label {
    -webkit-transform: translate(-8px,-4px) translate(-1px,-1.42857143em) translate(0,0) scale(1);
    -ms-transform: translate(-8px,-4px) translate(-1px,-1.42857143em) translate(0,0) scale(1);
    transform: translate(-8px,-4px) translate(-1px,-1.42857143em) translate(0,0) scale(1);
}
.k-floating-label-container>.k-label, .k-textbox-container>.k-label {
    max-width: 90%;
    line-height: 1.42857143em;
    white-space: nowrap;
    text-overflow: ellipsis;
    position: absolute;
    top: calc(1.42857143em + 5px);
    left: 9px;
    overflow: hidden;
    cursor: text;
    transition: color .2s ease-out,-webkit-transform .2s ease-out;
    transition: transform .2s ease-out,color .2s ease-out;
    transition: transform .2s ease-out,color .2s ease-out,-webkit-transform .2s ease-out;
    pointer-events: none;
}
.k-textbox {
    background-clip: padding-box;
    padding: 4px 8px;
    width: 12.4em;
    height: calc(1.42857143em + 10px);
}
.k-button, .k-popup .k-button{
    color: #363636;
    background-color: #040404;
    border-color: #5a5a5a;
    box-shadow: none;
}
.k-block, .k-widget, .k-popup, .k-content, .k-dropdown .k-input {
    color: #fefcfc;
}
.k-calendar .k-content .k-today, .k-calendar .k-footer .k-nav-today {
    color: #c40452;
}

.k-calendar-monthview::after {
    display: block;
    position: absolute;
    bottom: 0;
    content: " ";
    height: 0;
    line-height: 0;
    z-index: 1;
    width: 150%;
    left: -25%;
    box-shadow: 0 0 2.42857em 1.21429em #373535;
}
.k-calendar td.k-state-selected .k-link {
    border-color: #c40452;
    border-top-color: rgb(196, 4, 82);
    border-right-color: rgb(196, 4, 82);
    border-bottom-color: rgb(196, 4, 82);
    border-left-color: rgb(196, 4, 82);
    color: #fff;
    background-color: #c40452;
    background-image: none;
}
.k-calendar .k-calendar-monthview thead, .k-calendar .k-content thead, .k-calendar .k-header{
    color: #ffffff;
    background-color: #1c1c26;
    border-color: rgba(0,0,0,.08);
    border-top-color: rgba(0, 0, 0, 0.08);
    border-right-color: rgba(0, 0, 0, 0.08);
    border-bottom-color: rgba(0, 0, 0, 0.08);
    border-left-color: rgba(0, 0, 0, 0.08);
}
.k-content, .k-panelbar > li.k-item, .k-panel > li.k-item, .k-tiles {
    background-color: #1c1c26;
}

.k-calendar-range td.k-range-end, .k-calendar-range td.k-range-mid, .k-calendar-range td.k-range-start {
    background-image: linear-gradient(transparent 1px,rgba(252, 84, 189, 0.3) 1px,rgba(252, 84, 189, 0.3) calc(100% - 1px),transparent calc(100% - 1px));
}
.k-calendar-range .k-content td.k-range-start {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.k-calendar-range .k-content td.k-range-end {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
.k-calendar.k-calendar-range .k-range-mid {
    border-color: inherit;
    border-radius: 0;
}

.k-input, input.k-textbox, input.k-textbox:hover, .k-textbox > input, .k-multiselect-wrap {
    background-color: #414550;
    color: #d5d5d5;
}

.k-calendar-range td.k-state-focused .k-link {
    box-shadow: inset 0 0 0 1px #fff;
}

.k-group{
    color: #d5d5d5;
    background-color: #1c1c26;
}
.k-calendar-range td.k-state-selected .k-link{
    border-color: #c40452;
    color: #fff;
    background-color: #c40452;
}
.btn-excel{
    margin-right: 10px;
    background-color: #C40452;
    border-color: #A90346;
    color: #fff;
}
.k-widget, .k-state-default {
    border: none !important;
}
</style>