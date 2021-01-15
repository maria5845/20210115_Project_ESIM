<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/css/setting/settingthresold.css">
     <div class="m-form" style="margin: 0;">
         <div class="in">

            <table id="hdrListSrch" class="inForm">
           		<colgroup>
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr style="height: 30px;">
                		<td style="width:24%;">
                			<button class="fourBtn btn btn-lg" onclick="fnSigma(-3)">DamagedLSL</button>
                			<button class="fourBtn btn" style="background-color:yellow;" onclick="fnSigma(-2)">WarningLCL</button>
                			<button class="fourBtn btn" style="background-color:yellow;" onclick="fnSigma(2)">WarningUCL</button>
                			<button class="fourBtn btn btn-lg" onclick="fnSigma(3)">DamagedUSL</button>
                		</td>
                		<td>
                			<div class="th_date">
								<input name="sdate" id="sdate" class="picker-input date">
								<input name="stime" id="stime" class="picker-input time">
								<span>~</span>
								<input name="edate" id="edate" class="picker-input date">
								<input name="etime" id="etime" class="picker-input time">
							</div>
                		</td>
	                    <td class="fr">
            				<button type="button" class="btn btn-add2 btn-medium" onclick="javascript:fnSave();">
            					<spring:message code="BUTTON.SAVE" text="저장" />
           					</button>
           					<button type="button" class="re_btn btn btn-lg" onclick="cylRecall()">Recall</button>
            			</td>
            			<td class="fr">
                			Renewal Cycle&nbsp;&nbsp;
							<select name="refresh" id="refresh" style="width:300px; font-size:15px;">
								<option value="1" ${(1 == reset) ? 'selected' : '' }>One minute</option>
								<option value="2" ${(2 == reset) ? 'selected' : '' }>Two minutes</option>
								<option value="3" ${(3 == reset) ? 'selected' : '' }>Three minutes</option>
							</select>
                		</td>
					</tr>
                </tbody>
            </table>
        </div>
    </div>


    <div class="var-wrap" style="padding: 10px 240px;">
    	<div class="floor1 thresold-tb" style="table-layout:fixed;">
    		<table class="tb2">
    			<colgroup>
            		<col width="150">
            		<col width="30">
            		<col width="130">
            		<col width="200">
            		<col width="200">
            		<col width="200">
            		<col width="200">
            	</colgroup>
    			<thead>
    				<tr>
    					<td>Cylinder</td>
    					<td><input type="checkbox" id="cyl_allCheck" onclick="fnAllCheck()" style="margin:0 7px 4px 0;" checked/>Select</td>
    					<td>Type</td>
    					<td>Damaged (Lower)</td>
    					<td>Warning (Lower)</td>
    					<td>Warning (Upper)</td>
    					<td>Damaged (Upper)</td>
    				</tr>
    			</thead>
    			<tbody id="thresold_body">
    			</tbody>
    		</table>
    	</div>
		
<!-- 		<div class="itx mg-t10"> -->
<!-- 			* 비정상적인 값 범위를 입력 시 화면에 원하는 결과가 출력되지 않을 수 있습니다. -->
<!-- 		</div> -->
    </div>
