<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>高拍仪测试</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<script type="text/javascript">
	// 	启动主
	function Start1_onclick() {
	    var str = captrue.bStopPlay(); 
	    var str = captrue.vSetResolution(7); 	
	    var str = captrue.bStartPlayRotate(270);
	}
	  function Start2_onclick()
	  {
		  var str=captrue.bStopPlay();
		  var str = captrue.bStartPlay2(0);
	  }
	  function Stop_onclick()
	  {
	  	var str=captrue.bStopPlay();
	  }

		function SaveJPG_onclick()
		{
	        var str=captrue.bSaveJPG("d:\\","JPG");
		}
		
		function UpLoadJPG_onclick()
		{
			var str=captrue.bUpLoadImage("D:\\JPG.JPG", "127.0.0.1", 8080, "/shop/servlet/uploadServlet");
		}
		
		function DeleteJPG_onclick()
		{
		 
	          var str=captrue.bDeleteFile("D:\\JPG.jpg");
		}
			
		function SaveGray_onclick()
		{
			captrue.vSetRotate(90);
			var str=captrue.bSaveGray("D:\\","gray");
		
		}
		function SaveTifJPG_onclick()
		{
			captrue.vSetRotate(180);
			var str=captrue.bSaveTifJPG("D:\\","tifJPG");
		}
		function SaveTIF_onclick()
		{
			captrue.vSetRotate(270);
			captrue.vSetDPI(200,200);
			captrue.vSetTIFPara (0.3,0.59,0.11,0.2);
			var str=captrue.bSaveTIF24Bit("D:\\","TIF", 0);
		}
		
		function SaveMulTIF_onclick()
		{
			captrue.vSetDPI(200,200);
			var str=captrue.bSaveTIF24Bit("D:\\","MulTIF", 1);
		}
		function ParaSet_onclick()
		{
			var str=captrue.displayVideoPara();
		}
		function ParaSetPIN_onclick()
		{
			var str=captrue.vSetCapturePin();
	  		captrue.bStartPlay();
		}
		function CutHB_onclick()
		{
			var str=captrue.vSetDelHBFlag(1);
		}
		function Skew_onclick()
		{
			var str=captrue.vSetSkewFlag(1);
		}
		function StartPDF_onclick()
		{
			var pdffileName = document.getElementById("pdffileName").value;
			if(pdffileName == "")
			{
				pdffileName =  "pdffile";
			}
			var str=captrue.bSavePDFStart("D:\\", pdffileName);
		}
		function ColorPDF_onclick()
		{
			var str=captrue.bSavePDFColorPage();
		}
		function BWPDF_onclick()
		{
			var str=captrue.bSavePDFBWPage();
		}
		
		function EndPDF_onclick()
		{
			var str=captrue.bSavePDFEnd();
		}	 
		
		function SetBrightness_onclick(){
			var BrightnessValue = document.getElementById("BrightnessValue").value;
			captrue.vSetBrightness(BrightnessValue);
		}
		
		function SetContrast_onclick(){
			var ContrastValue = document.getElementById("ContrastValue").value;
			captrue.vSetContrast(ContrastValue);
		}
		
		function rotateMain(){
			  var str=captrue.bStopPlay();  	
	        var str = captrue.bStartPlayRotate(270);
			
		}
		
		function getDeviceId()
		{
			var deviceId = captrue.sGetDevicesId();
			alert(deviceId);
		}
		
		function selectAutoMode(el)
		{
			captrue.bSetMode(el.value);
		}
		
		function selectDefaultMode(el)
		{
			captrue.bSetMode(el.value);
		}
	      
		function selectSfzMode(el)
		{
			captrue.bSetMode(el.value);
			if(el.value == 1)
			{
				captrue.bSetImageArea(1000,1000,8000,8000);
			}
		}	
		
		function SelectExposure(el)
		{
			captrue.vSetExposure(el.value);
		}
	</script>

</head>
<body>

<div style="text-align:center;" >
	<!-- 谷歌浏览器 -->
<!-- 	<OBJECT ID="captrue" CLSID="{454C18E2-8B7D-43C6-8C17-B1825B49D7DE}" TYPE="application/x-itst-activex" width=85% height=85%></OBJECT>   -->
	<!-- 火狐浏览器 -->
<!-- 	<OBJECT id="captrue" type="application/x-itst-activex" clsid="{454C18E2-8B7D-43C6-8C17-B1825B49D7DE}" width="1360" height="960"></OBJECT> -->
	<!-- IE 浏览器 -->
	<object id="captrue" classid="clsid:454C18E2-8B7D-43C6-8C17-B1825B49D7DE" width="1360" height="960" ></object>
</div>

<form method="POST" action="--WEBBOT-SELF--" name="form1">
  <input type="button" value="启动主" name="StartBtn" onClick="Start1_onclick()">
  <input type="button" value="启动副" name="StopBtn" onClick="Start2_onclick()">
  <input type="button" value="停止" name="StopBtn" onClick="Stop_onclick()">
  <input type="button" value="JPG" name="SaveJPGBtn" onClick="SaveJPG_onclick()">
  <input type="button" value="Gray" name="SaveJPGBtn" onClick="SaveGray_onclick()">
  <input type="button" value="TIF" name="SaveTIFBtn" onClick="SaveMulTIF_onclick()">
  <input type="button" value="TIFJPG" name="SaveTIFBtn" onClick="SaveTifJPG_onclick()">
  <input type="button" value="设置切黑边" name="SaveTIFBtn" onClick="CutHB_onclick()">
  <input type="button" value="设置矫正" name="SaveTIFBtn" onClick="Skew_onclick()">
  <input type="button" value="参数设置" name="ParaSet" onClick="ParaSet_onclick()">
  <input type="button" value="PIN设置" name="ParaSet" onClick="ParaSetPIN_onclick()"></p>
  <input type="button" value="删除JPG" name="DeleteJPGBtn" onClick="DeleteJPG_onclick()">
  <input type="button" value="上传JPG" name="UpLoadBtn" onClick="UpLoadJPG_onclick()">
  PDF文件名：<input type="text" id="pdffileName" />
  <input type="button" value="开始拍PDF" name="StartPDFBtn" onClick="StartPDF_onclick()">
  <input type="button" value="增加PDF彩页" name="ColorPDFBtn" onClick="ColorPDF_onclick()">
  <input type="button" value="增加图像" name="ColorPDFBtn" onClick="ImgPDF_onclick()">
  <input type="button" value="增加PDF黑白页" name="BWPDFBtn" onClick="BWPDF_onclick()">
  <input type="button" value="结束拍PDF" name="EndPDFBtn" onClick="EndPDF_onclick()">
  亮度:<input type="text" value="20" style="width:30px;" id="BrightnessValue"/>
  <input type="button" value="设置"  onclick="SetBrightness_onclick()">
  对比度:<input type="text" value="20" style="width:30px;" id="ContrastValue"/>
  <input type="button" value="设置" onClick="SetContrast_onclick()"> 
  曝光度:
  <select id="ExposureValue" onChange="SelectExposure(this)">
	<option value="0">0</option>
	<option value="10">10</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="40">40</option>
	<option value="50" selected="selected">50</option>
	<option value="60">60</option>
	<option value="70">70</option>
	<option value="80">80</option>
	<option value="90">90</option>
	<option value="100">100</option>
  </select>
  
  <input type="button" value="主旋" onClick="rotateMain()">
  
  <input type="button" value="硬件ID" onClick="getDeviceId()">
    
  <input type="radio" value="3" name="mode" id="autoMode" onClick="selectAutoMode(this)"/><label for="autoMode">自动</label>
  <input type="radio" value="0" name="mode" id="defaultMode" onClick="selectDefaultMode(this)"/><label for="autoMode">默认</label>
  <input type="radio" value="4" name="mode" id="sfzMode" onClick="selectSfzMode(this)"/><label for="autoMode">证件</label>
  <input type="radio" value="1" name="mode" id="customMode" onClick="selectSfzMode(this)"/><label for="autoMode">自定义</label>
</form>

</body>
</html>
