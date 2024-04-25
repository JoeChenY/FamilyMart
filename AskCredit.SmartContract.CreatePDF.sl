<?xml version="1.0" encoding="UTF-8"?>
<java version="1.8.0_92" class="java.beans.XMLDecoder">
 <object class="pe.pde.ScriptLibraryModel" id="ScriptLibraryModel0">
  <void property="exportFileName">
   <string>AskCredit.SmartContract.CreatePDF</string>
  </void>
  <void property="root">
   <void property="author">
    <string>Administrator</string>
   </void>
   <void property="createDate">
    <string>2008/05/01 11:19:12</string>
   </void>
   <void property="name">
    <string> Script Library</string>
   </void>
   <void property="parentId">
    <string>SCFROOT</string>
   </void>
   <void property="synopsis">
    <string>Your Company Name ScriptLibrary</string>
   </void>
  </void>
  <void property="scriptForderMap">
   <void method="put">
    <string>SCF00001428649370332</string>
    <object class="pe.pde.ScriptForder">
     <void property="author">
      <string>Administrator</string>
     </void>
     <void property="createDate">
      <string>2011/08/10 13:52:23</string>
     </void>
     <void property="id">
      <string>SCF00001428649370332</string>
     </void>
     <void property="name">
      <string>AskCredit</string>
     </void>
     <void property="parentId">
      <string>SCF_GLOBAL_ROOTSCRIPT</string>
     </void>
     <void property="synopsis">
      <string>ScriptForder1 synopsis</string>
     </void>
    </object>
   </void>
   <void method="put">
    <string>SCF00061653449771347</string>
    <object class="pe.pde.ScriptForder" id="ScriptForder0">
     <void property="author">
      <string>Administrator</string>
     </void>
     <void property="createDate">
      <string>2022/05/25 11:36:11</string>
     </void>
     <void property="id">
      <string>SCF00061653449771347</string>
     </void>
     <void property="name">
      <string>SmartContract</string>
     </void>
     <void property="parentId">
      <string>SCF00001428649370332</string>
     </void>
     <void property="scriptLibraryIdList">
      <void method="add">
       <string>SCL00371653449940606</string>
      </void>
     </void>
     <void property="synopsis">
      <string>智慧合約使用</string>
     </void>
    </object>
   </void>
   <void method="put">
    <string>SCF_GLOBAL_ROOTSCRIPT</string>
    <object class="pe.pde.ScriptForder">
     <void property="author">
      <string>Administrator</string>
     </void>
     <void property="createDate">
      <string>2008/05/01 11:19:12</string>
     </void>
     <void property="id">
      <string>SCF_GLOBAL_ROOTSCRIPT</string>
     </void>
     <void property="name">
      <string>全家便利商店股份有限公司 Script Library</string>
     </void>
     <void property="parentId">
      <string>SCFROOT</string>
     </void>
     <void property="synopsis">
      <string>Your Company Name ScriptLibrary</string>
     </void>
    </object>
   </void>
  </void>
  <void property="scriptLibraryMap">
   <void method="put">
    <string>SCL00371653449940606</string>
    <object class="pe.pde.ScriptLibrary">
     <void property="author">
      <string>Administrator</string>
     </void>
     <void property="createDate">
      <string>2024/04/12 17:26:12</string>
     </void>
     <void property="fullName">
      <string>AskCredit.SmartContract.CreatePDF</string>
     </void>
     <void property="id">
      <string>SCL00371653449940606</string>
     </void>
     <void property="name">
      <string>CreatePDF</string>
     </void>
     <void property="parentId">
      <string>SCF00061653449771347</string>
     </void>
     <void property="scriptSource">
      <string>function setConvertNum(pArtIns,AtchName,TypeITEM){//自動檢查轉檔次數，如果太多次的話，可能是系統異常，要重置轉檔
	//var artIns = MyTask.getArtInstance();
	var ht = Server.getGlobals(MyTask.getRootID()+&quot;SC&quot;);
	var Num = ht.get(&quot;SCNum&quot;);
	Num = parseInt(Num,10);
	if(&quot;NaN&quot;.equals(Num))Num = 1;
	else Num++;
	if(Num&gt;10){//超過10分鐘 還沒找到檔案要重置轉檔
		ResetConvertSC(pArtIns,AtchName,TypeITEM);
		Num = 0;
	}
	ht.put(&quot;SCNum&quot;,Num+&quot;&quot;);
	Server.setGlobals(MyTask.getRootID()+&quot;SC&quot;,ht);
}
function ClearConvertNum(){
	Server.deleteGlobals(MyTask.getRootID() + &quot;SC&quot;);
}
function ResetConvertSC(pArtIns,AtchName,TypeITEM){
	var Vec = pArtIns.getAppDataMap().get(AtchName);
	var NewVec = new java.util.Vector();
	for(var j=0;j&lt;Vec.size();j++){
		var hm = Vec.get(j);
		hm.put(TypeITEM,&quot;&quot;);
		NewVec.add(hm);
	}
	pArtIns.setAppValue(AtchName,NewVec);
	Server.updateArtInstance(pArtIns);
}


function CreateContract(pArtIns,AtchName,chkITEM,ftlITEM,TypeITEM,UrlItem1,UrlItem2,print){
	var format = new Packages.java.text.SimpleDateFormat();//系統時間
	format.applyPattern(&quot;yyyy/MM/dd&quot;);
	var NowDate = format.format(Server.getServerTime());

	var FileUpLoadPath = &quot;C:\\AF4.0\\FileUpload\\&quot;;//來源		
	var FileUpLoadV = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME=&apos;FileUpLoad&apos;&quot;);
	if(FileUpLoadV.size()&gt;0){
		FileUpLoadPath = FileUpLoadV.get(0).get(&quot;VALUE&quot;)+&quot;\\&quot;;//來源	
	}
					
	var tempPath = &quot;\\126.1.6.83\\TEMPPDF&quot;;
	var vec3 = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME IN(&apos;TEMPPDF&apos;)&quot;);
	for(var i = 0 ; i &lt; vec3.size() ; i++)tempPath = vec3.get(i).get(&quot;VALUE&quot;) ;

	tempPath += &quot;\\SmartContract&quot;;
	var creatF = new java.io.File(tempPath);
	creatF.mkdir();//建立資料夾
	
	tempPath += &quot;\\&quot; + pArtIns.getID();
	var creatF = new java.io.File(tempPath);
	creatF.mkdir();//建立資料夾
	
	var Vec = pArtIns.getAppDataMap().get(AtchName);
	var AllOver = true;
	var txtReContractPdf = pArtIns.getAppValue(&quot;txtReContractPdf&quot;)+&quot;&quot;;
	var ReContractPdfVec = new java.util.Vector();
	if(!&quot;&quot;.equals(txtReContractPdf) &amp;&amp; txtReContractPdf != null &amp;&amp; !&quot;null&quot;.equals(txtReContractPdf)){
		txtReContractPdf = txtReContractPdf.split(&quot;;&quot;);
		for(var i=0;i&lt;txtReContractPdf.length;i++){
			ReContractPdfVec.add(txtReContractPdf[i]+&quot;&quot;);
		}
	}
	
	if(ReContractPdfVec.size() == 0 &amp;&amp; !print) return true;//本次不須轉檔
	for(var j=0;j&lt;Vec.size();j++){
		var hm = Vec.get(j);
		var ChkFlag = &quot;true&quot;.equals(hm.get(chkITEM));//是否製作合約
		if(!ChkFlag)continue;
		
		var FtlNo = hm.get(ftlITEM);
		var ToPdf = hm.get(TypeITEM);
		
		if(ReContractPdfVec.size()&gt;0 &amp;&amp; !print){
			if(ReContractPdfVec.indexOf(FtlNo + &quot;&quot;) == -1)continue; //不須轉檔
		}
		
		if(&quot;&quot;.equals(ToPdf)){//第1次還沒轉--&gt;進行轉檔
			AllOver = false;
			Server.addDebugLog(&quot;Start 智慧合約 Step1：&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;));
			var FtlVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FILE where No = &apos;&quot; + FtlNo + &quot;&apos;&quot;);
			if(FtlVec.size()&gt;0){
				importPackage(Packages.askcredit);
				var FtlHm = FtlVec.get(0);
				//建立合約範本資料格式
				var dh = DocumentHandler();
				var HeaderFooterMp = new java.util.HashMap();
				var ContentMp = new java.util.HashMap();
				var HeaderFooterFilePath = &quot;&quot;;
				var ContentFilePath = &quot;&quot;;
				var txtFormNo = pArtIns.getAppValue(&quot;txtFormNo&quot;);
				var ContractFileName = FtlHm.get(&quot;FileName&quot;);
				var SealNo = FtlHm.get(&quot;SealNo&quot;);
				var SealType = FtlHm.get(&quot;SealType&quot;);
				var Errflag = false;
				Server.addDebugLog(&quot;Start 智慧合約-&gt; txtFormNo：&quot; + txtFormNo + &quot;，&quot; + ContractFileName);
				if(&quot;其他協議書&quot;.equals(ContractFileName)){
					HeaderFooterFilePath = AtchGetPath(pArtIns.getAppValue(&quot;atchOtherContract&quot;),FileUpLoadPath);
					if(!&quot;&quot;.equals(HeaderFooterFilePath)){
						var ContentPath = tempPath + &quot;\\&quot;;
						var path = HeaderFooterFilePath.substring(0,HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;));
						var FileName = HeaderFooterFilePath.substring(HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						//file To smartContract
						loadLibrary(&quot;AskCredit.Common.CommonFunction&quot;);
						copyFile2(HeaderFooterFilePath , tempPath+&quot;\\&quot;,FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;);
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;1&quot;,FileUpLoadPath);
						if(!ToPdfResult)Errflag = true;

						//頁尾
						var OtFooterFtlV = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where Name = &apos;SmartContract_OtherContract_FooterFtl&apos;&quot;);
						if(OtFooterFtlV.size()&gt;0){
							var cmbContractorNum = pArtIns.getAppValue(&quot;cmbContractorNum&quot;);
							var FtFilePath = OtFooterFtlV.get(0).get(&quot;VALUE&quot;) + &quot;\\&quot; + cmbContractorNum + &quot;.ftl&quot;;
							var FtFile = new java.io.File(FtFilePath);
							if (FtFile.exists()) {
								ContentFilePath = FtFilePath;
								var OtFooterFtlPath = tempPath + &quot;\\&quot;;
								var path = ContentFilePath.substring(0,ContentFilePath.lastIndexOf(&quot;\\&quot;));
								var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
								OtFooterFtlPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
								//file To smartContract
								//loadLibrary(&quot;AskCredit.Common.CommonFunction&quot;);
								//copyFile2(ContentFilePath , tempPath+&quot;\\&quot;,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;);
								
								//設定簽章嵌入
								var SealVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_SEAL where No = &apos;&quot;+SealNo+&quot;&apos; and FtlName &lt;&gt; &apos;&apos;&quot;);
								if(SealVec.size()&gt;0){
									for(var k=0;k&lt;SealVec.size();k++){
										var ImgBase64Val = &quot;&quot;;
										var ImgFtlName = SealVec.get(k).get(&quot;FtlName&quot;)+&quot;&quot;;
										if(print){
											var ImgFile = SealVec.get(k).get(&quot;ImgFile&quot;)+&quot;&quot;;
											var ImgFilePath = AtchGetPath(ImgFile,FileUpLoadPath)+&quot;&quot;;
											ImgBase64Val = ImageToDocBase64.toString(ImgFilePath+&quot;&quot;);
										}else{
											ImgBase64Val = &quot;iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&quot; + &quot;\n&quot; + &quot;jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY2BgYGAAAAAFAAGKM+MAAAAAAElFTkSuQmCC&quot;;
										}
										HeaderFooterMp.put(ImgFtlName,ImgBase64Val);
										ContentMp.put(ImgFtlName,ImgBase64Val);
									}
								}
								//開始建立合約
								dh.createDoc(path+&quot;&quot;,FileName+&quot;&quot;,OtFooterFtlPath+&quot;&quot;,ContentMp);
								var ToPdfResult = DocToPdf(pArtIns,OtFooterFtlPath ,FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;1&quot;,FileUpLoadPath);
								if(!ToPdfResult)Errflag = true;
							}else{
								Server.addDebugLog(&quot;智慧合約-找不到其他協議書頁尾格式。&quot; + FtFilePath);
							}
						}
						
					}
				}else{
					var FtlFile1 = FtlHm.get(&quot;FtlFile1&quot;);
					var FtlFile2 = FtlHm.get(&quot;FtlFile2&quot;);
					HeaderFooterFilePath = AtchGetPath(FtlFile1,FileUpLoadPath);
					ContentFilePath = AtchGetPath(FtlFile2,FileUpLoadPath);
					//設定資料格式
					var FormItemNo = FtlHm.get(&quot;FormItemNo&quot;);
					var FormItemList = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FORM_ITEM where No = &apos;&quot; + FormItemNo + &quot;&apos;&quot;);
					if(FormItemList.size()&gt;0){
						var BatComName = new java.util.Vector();
						var BatCName = new java.util.Vector();
						var BatCStr = new java.util.Vector();
						var ArtID = pArtIns.getArtifactID();
						if(&quot;ART00001636444102368&quot;.equals(ArtID)){//本約簽呈批次用印處理
							var BatFlag = hm.get(&quot;ITEM10&quot;);
							if(&quot;true&quot;.equals(BatFlag)){
								var BatIns = hm.get(&quot;ITEM11&quot;);
								var BatArtIns = Server.getArtInstance(BatIns);
								if(BatArtIns != null){
									var Table1 = BatArtIns.getAppDataMap().get(&quot;Table1&quot;);
									for(var l=0;l&lt;Table1.size();l++){
										if(&quot;true&quot;.equals(Table1.get(l).get(&quot;ITEM1&quot;))){
											BatCName.add(Table1.get(l).get(&quot;ITEM4&quot;)+&quot;&quot;);
											BatCStr.add(Table1.get(l).get(&quot;ITEM3&quot;)+&quot;&quot;);
											BatComName.add(Table1.get(l).get(&quot;ITEM2&quot;)+&quot;&quot;);
										}
									}
								}
							}
						}		
						var AddTable = new java.util.Vector();
						for(var k=0;k&lt;FormItemList.size();k++){
							var FormItemHm = FormItemList.get(k);
							var HeaderFooter = FormItemHm.get(&quot;HeaderFooter&quot;);
							var ArtID = FormItemHm.get(&quot;ArtID&quot;);
							var ItemID = FormItemHm.get(&quot;ItemID&quot;);
							var ContractName = FormItemHm.get(&quot;ContractName&quot;);
							var TableItemID = FormItemHm.get(&quot;TableItemID&quot;);
							if(&quot;&quot;.equals(TableItemID)){//一般元件
								var FormList = Server.SQLloadValue(&quot;select Name from &quot; + ArtID +&quot;_Form where ItemID = &apos;&quot; + ItemID + &quot;&apos;&quot;);
								var getValue = &quot;&quot;;
								if(FormList.size()&gt;0){
									var ComName = FormList.get(0).get(&quot;Name&quot;);
									getValue = pArtIns.getAppValue(ComName+&quot;&quot;);
									//本約簽呈批次用印處理
									if(BatCName.contains(ContractName+&quot;&quot;)){
										var BatString = BatCStr.get(BatCName.indexOf(ContractName+&quot;&quot;));
										var BatName = BatComName.get(BatCName.indexOf(ContractName+&quot;&quot;));
										if(&quot;&quot;.equals(BatString)){
											var StrLen = (getValue+&quot;&quot;).length;
											getValue = &quot;&quot;;
											for(var m=0;m&lt;StrLen;m++){
												getValue+= &quot;　&quot;;
											}
										}else{
											if((BatName+&quot;&quot;).indexOf(&quot;對齊&quot;)!=-1){
												var StrLen = (getValue+&quot;&quot;).length;
												if((BatString+&quot;&quot;).length &lt; StrLen){
													while(true){
														if((BatString+&quot;&quot;).length &lt; StrLen){
															BatString+=&quot;　&quot;;
														}else{
															getValue = BatString;
															break;
														}
													}
												}
											}else{
												getValue = BatString;
											}
										}
									}
									//特殊處理
									if(&quot;AtchLayout&quot;.equals(ComName)){//店舖Layout圖
										var LayoutFilePath = AtchGetPath(getValue,FileUpLoadPath)+&quot;&quot;;
										if(!&quot;&quot;.equals(LayoutFilePath)){
											if(LayoutFilePath.indexOf(&quot;.pdf&quot;) !=-1 || LayoutFilePath.indexOf(&quot;.PDF&quot;) !=-1){
												var Output = PdfToImage.extractImages(LayoutFilePath);
												if(Output.size()&gt;0){
													for(var l=0;l&lt;Output.size();l++){
														var FilePath = Output.get(l);
														getValue = ImageToDocBase64.toString(FilePath+&quot;&quot;);
														break;//目前只讀取第一張
													}
												}else{
													getValue = &quot;&quot;;
												}
											}else if(LayoutFilePath.indexOf(&quot;.tif&quot;) !=-1 || LayoutFilePath.indexOf(&quot;.tiff&quot;) !=-1 || 
											LayoutFilePath.indexOf(&quot;.TIF&quot;) !=-1 || LayoutFilePath.indexOf(&quot;.TIFF&quot;) !=-1){
												var Output = TiffToImage.extractImages(LayoutFilePath);
												if(Output.size()&gt;0){
													for(var l=0;l&lt;Output.size();l++){
														var FilePath = Output.get(l);
														getValue = ImageToDocBase64.toString(FilePath+&quot;&quot;);
														break;//目前只讀取第一張
													}
												}else{
													getValue = &quot;&quot;;
												}
											}
										}else{
											getValue = &quot;&quot;;
										}
									}
								}
								if(&quot;true&quot;.equals(HeaderFooter))HeaderFooterMp.put(ContractName + &quot;&quot;, getValue+&quot;&quot;);
								else ContentMp.put(ContractName + &quot;&quot;, getValue+&quot;&quot;);
							}else{//表格元件
								//AddTable
								var FormItemList2 = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FORM_ITEM where No = &apos;&quot; + FormItemNo + &quot;&apos; and ItemID = &apos;&quot; + ItemID + &quot;&apos;&quot;);//取得表格需匯入之ITEM
								if(FormItemList2.size()&gt;0){
									var FormList = Server.SQLloadValue(&quot;select Name from &quot; + ArtID +&quot;_Form where ItemID = &apos;&quot; + ItemID + &quot;&apos;&quot;);//取得元件名稱
									if(FormList.size()&gt;0){
										var ComName = FormList.get(0).get(&quot;Name&quot;);
										if(AddTable.indexOf(ComName+&quot;&quot;) == -1){//該表格還未被讀取
											var TableData = pArtIns.getAppDataMap().get(ComName);
											AddTable.add(ComName+&quot;&quot;);//紀錄該表格已完成所有資料讀取
											var TableArrayList = new java.util.ArrayList();
											var ContractLabel = &quot;&quot;;
											var InitSize = 3;//預設表格3列
											if(TableData.size()&gt;3)InitSize = TableData.size();
											for(var m=0;m&lt;InitSize;m++){//表格資料
												var NameHm = new java.util.HashMap();
												for(var l=0;l&lt;FormItemList2.size();l++){//取得表格ItemID
													var TableItemID = FormItemList2.get(l).get(&quot;TableItemID&quot;);
													var ContractName2 = FormItemList2.get(l).get(&quot;ContractName&quot;)+&quot;&quot;;//合約標籤 tbl.item1
													var DataVal = &quot;&quot;;//資料值
													if(m&lt;TableData.size())DataVal = TableData.get(m).get(TableItemID)+&quot;&quot;;
													if(&quot;&quot;.equals(ContractLabel))ContractLabel = ContractName2.split(&quot;.&quot;)[0];
													NameHm.put(ContractName2.split(&quot;.&quot;)[1],DataVal);
												}
												TableArrayList.add(NameHm);
											}
											if(&quot;true&quot;.equals(HeaderFooter))HeaderFooterMp.put(ContractLabel,TableArrayList);
											else ContentMp.put(ContractLabel,TableArrayList);
										}
									}
								}
							}
						}
					}
					//設定簽章嵌入
					var SealVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_SEAL where No = &apos;&quot;+SealNo+&quot;&apos; and FtlName &lt;&gt; &apos;&apos;&quot;);
					if(SealVec.size()&gt;0){
						for(var k=0;k&lt;SealVec.size();k++){
							var ImgBase64Val = &quot;&quot;;
							var ImgFtlName = SealVec.get(k).get(&quot;FtlName&quot;)+&quot;&quot;;
							if(print){
								var ImgFile = SealVec.get(k).get(&quot;ImgFile&quot;)+&quot;&quot;;
								var ImgFilePath = AtchGetPath(ImgFile,FileUpLoadPath)+&quot;&quot;;
								ImgBase64Val = ImageToDocBase64.toString(ImgFilePath+&quot;&quot;);
							}else{
								ImgBase64Val = &quot;iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&quot; + &quot;\n&quot; + &quot;jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY2BgYGAAAAAFAAGKM+MAAAAAAElFTkSuQmCC&quot;;
							}
							HeaderFooterMp.put(ImgFtlName,ImgBase64Val);
							ContentMp.put(ImgFtlName,ImgBase64Val);
						}
					}
					//開始建立合約
					var HeaderFooterPath = tempPath + &quot;\\&quot; + txtFormNo;
					var ContentPath = tempPath + &quot;\\&quot; + txtFormNo;
					if(!&quot;&quot;.equals(HeaderFooterFilePath)){
						var path = HeaderFooterFilePath.substring(0,HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;));
						var FileName = HeaderFooterFilePath.substring(HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;)+1);
						HeaderFooterPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						dh.createDoc(path+&quot;&quot;,FileName+&quot;&quot;,HeaderFooterPath+&quot;&quot;,HeaderFooterMp);
						//開始轉檔
						//Form目標,Doc路徑,Doc名稱,簽章群組代號,簽章格式,蓋章,Type
						var ToPdfResult = DocToPdf(pArtIns,HeaderFooterPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;1&quot;,FileUpLoadPath);
						if(!ToPdfResult)Errflag = true;
					}
					if(!&quot;&quot;.equals(ContentFilePath)){
						var path = ContentFilePath.substring(0,ContentFilePath.lastIndexOf(&quot;\\&quot;));
						var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						dh.createDoc(path+&quot;&quot;,FileName+&quot;&quot;,ContentPath+&quot;&quot;,ContentMp);
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,print,&quot;1&quot;,FileUpLoadPath);
						if(!ToPdfResult)Errflag = true;
					}
				}
				if(!Errflag)hm.put(TypeITEM,&quot;1&quot;);
			}
		}else if(&quot;1&quot;.equals(ToPdf)){//轉檔中-檢查轉檔
			Server.addDebugLog(&quot;Start 智慧合約 Step2-3：&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;));
			//AllOver = false;
			var FtlVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FILE where No = &apos;&quot; + FtlNo + &quot;&apos;&quot;);
			if(FtlVec.size()&gt;0){
				var FtlHm = FtlVec.get(0);
				//建立合約範本資料格式
				var HeaderFooterFilePath = &quot;&quot;;
				var ContentFilePath = &quot;&quot;;
				var txtFormNo = pArtIns.getAppValue(&quot;txtFormNo&quot;);
				var ContractFileName = FtlHm.get(&quot;FileName&quot;);
				var SealNo = FtlHm.get(&quot;SealNo&quot;);
				var SealType = FtlHm.get(&quot;SealType&quot;);
				var Errflag = false;
				
				if(&quot;其他協議書&quot;.equals(ContractFileName)){
					HeaderFooterFilePath = AtchGetPath(pArtIns.getAppValue(&quot;atchOtherContract&quot;),FileUpLoadPath);
					if(!&quot;&quot;.equals(HeaderFooterFilePath)){
						var ContentPath = tempPath + &quot;\\&quot;;
						var path = HeaderFooterFilePath.substring(0,HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;));
						var FileName = HeaderFooterFilePath.substring(HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;2&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem1,&quot;&quot;);
						}
						else{
							hm.put(UrlItem1,ToPdfResult);
						}
					}else{
						hm.put(UrlItem1,&quot;&quot;);
					}
					//頁尾
					var OtFooterFtlV = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where Name = &apos;SmartContract_OtherContract_FooterFtl&apos;&quot;);
					if(OtFooterFtlV.size()&gt;0){
						var cmbContractorNum = pArtIns.getAppValue(&quot;cmbContractorNum&quot;);
						var FtFilePath = OtFooterFtlV.get(0).get(&quot;VALUE&quot;) + &quot;\\&quot; + cmbContractorNum + &quot;.ftl&quot;;
						var FtFile = new java.io.File(FtFilePath);
						if (FtFile.exists()) {
							ContentFilePath = FtFilePath;
							var OtFooterFtlPath = tempPath + &quot;\\&quot;;
							var path = ContentFilePath.substring(0,ContentFilePath.lastIndexOf(&quot;\\&quot;));
							var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
							OtFooterFtlPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
							
							var ToPdfResult = DocToPdf(pArtIns,OtFooterFtlPath ,FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;2&quot;,FileUpLoadPath);
							if(&quot;&quot;.equals(ToPdfResult)){
								Errflag = true;
								hm.put(UrlItem2,&quot;&quot;);
							}
							else{
								hm.put(UrlItem2,ToPdfResult);
							}
						}else{
							hm.put(UrlItem2,&quot;&quot;);
							Server.addDebugLog(&quot;智慧合約-找不到其他協議書頁尾格式。&quot; + FtFilePath);
						}
					}else{
						hm.put(UrlItem2,&quot;&quot;);
					}
				}else{
					var FtlFile1 = FtlHm.get(&quot;FtlFile1&quot;);
					var FtlFile2 = FtlHm.get(&quot;FtlFile2&quot;);
					HeaderFooterFilePath = AtchGetPath(FtlFile1,FileUpLoadPath);
					ContentFilePath = AtchGetPath(FtlFile2,FileUpLoadPath);

					//開始建立合約
					var HeaderFooterPath = tempPath + &quot;\\&quot; + txtFormNo;
					var ContentPath = tempPath + &quot;\\&quot; + txtFormNo;
					
					if(!&quot;&quot;.equals(HeaderFooterFilePath)){
						var FileName = HeaderFooterFilePath.substring(HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;)+1);
						HeaderFooterPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						//開始轉檔
						//Form目標,Doc路徑,Doc名稱,簽章群組代號,簽章格式,蓋章,Type
						var ToPdfResult = DocToPdf(pArtIns,HeaderFooterPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;2&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem1,&quot;&quot;);
						}
						else{
							hm.put(UrlItem1,ToPdfResult);
						}
					}else{
						hm.put(UrlItem1,&quot;&quot;);
					}
					if(!&quot;&quot;.equals(ContentFilePath)){
						var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,print,&quot;2&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem2,&quot;&quot;);
						}
						else{
							hm.put(UrlItem2,ToPdfResult);
						}
					}else{
						hm.put(UrlItem2,&quot;&quot;);
					}
				}
				
				if(!Errflag)hm.put(TypeITEM,&quot;2&quot;);
				else AllOver = false;
			}
			setConvertNum(pArtIns,AtchName,TypeITEM);
		}
		
		/*else if(&quot;2&quot;.equals(ToPdf)){//浮水印
			Server.addDebugLog(&quot;Start 智慧合約 Step3：&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;));
			var FtlVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FILE where No = &apos;&quot; + FtlNo + &quot;&apos;&quot;);
			if(FtlVec.size()&gt;0){
				var FtlHm = FtlVec.get(0);
				//建立合約範本資料格式
				var HeaderFooterFilePath = &quot;&quot;;
				var ContentFilePath = &quot;&quot;;
				var txtFormNo = pArtIns.getAppValue(&quot;txtFormNo&quot;);
				var ContractFileName = FtlHm.get(&quot;FileName&quot;);
				var SealNo = FtlHm.get(&quot;SealNo&quot;);
				var SealType = FtlHm.get(&quot;SealType&quot;);
				var Errflag = false;
				
				if(&quot;其他協議書&quot;.equals(ContractFileName)){
					ContentFilePath = AtchGetPath(pArtIns.getAppValue(&quot;atchOtherContract&quot;),FileUpLoadPath);
					var ContentPath = tempPath + &quot;\\&quot; + txtFormNo;
					if(!&quot;&quot;.equals(ContentFilePath)){
						var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,print,&quot;3&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem2,&quot;&quot;);
						}
						else{
							hm.put(UrlItem2,ToPdfResult);
						}
					}else{
						hm.put(UrlItem2,&quot;&quot;);
					}
					
				}else{
					var FtlFile1 = FtlHm.get(&quot;FtlFile1&quot;);
					var FtlFile2 = FtlHm.get(&quot;FtlFile2&quot;);
					HeaderFooterFilePath = AtchGetPath(FtlFile1,FileUpLoadPath);
					ContentFilePath = AtchGetPath(FtlFile2,FileUpLoadPath);
					//開始建立合約
					var HeaderFooterPath = tempPath + &quot;\\&quot; + txtFormNo;
					var ContentPath = tempPath + &quot;\\&quot; + txtFormNo;
					if(!&quot;&quot;.equals(HeaderFooterFilePath)){
						var FileName = HeaderFooterFilePath.substring(HeaderFooterFilePath.lastIndexOf(&quot;\\&quot;)+1);
						HeaderFooterPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						//開始轉檔
						//Form目標,Doc路徑,Doc名稱,簽章群組代號,簽章格式,蓋章,Type
						var ToPdfResult = DocToPdf(pArtIns,HeaderFooterPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,false,&quot;3&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem1,&quot;&quot;);
						}
						else{
							hm.put(UrlItem1,ToPdfResult);
						}
					}else{
						hm.put(UrlItem1,&quot;&quot;);
					}
					if(!&quot;&quot;.equals(ContentFilePath)){
						var FileName = ContentFilePath.substring(ContentFilePath.lastIndexOf(&quot;\\&quot;)+1);
						ContentPath += FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;;
						
						var ToPdfResult = DocToPdf(pArtIns,ContentPath ,txtFormNo + FileName.substring(0,FileName.lastIndexOf(&quot;.&quot;)) + &quot;.doc&quot;,SealNo,SealType,print,&quot;3&quot;,FileUpLoadPath);
						if(&quot;&quot;.equals(ToPdfResult)){
							Errflag = true;
							hm.put(UrlItem2,&quot;&quot;);
						}
						else{
							hm.put(UrlItem2,ToPdfResult);
						}
					}else{
						hm.put(UrlItem2,&quot;&quot;);
					}
				}
										
				if(!Errflag)hm.put(TypeITEM,&quot;3&quot;);
				else AllOver = false;
			}
		}*/

		
		Vec.set(j,hm);
	}
	if(AllOver){//合約處理完畢，回法遵室
		ClearConvertNum();
		Server.addDebugLog(&quot;Start 智慧合約 Step4：&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;));
		//開啟預覽視窗
		var vec = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME IN(&apos;SHOWPDF_PATH&apos;)&quot;);
		var showpdf_path = &quot;&quot;;
		for(var i = 0 ; i &lt; vec.size() ; i++){
			var name = vec.get(i).get(&quot;NAME&quot;);
			var value = vec.get(i).get(&quot;VALUE&quot;);
			if(&quot;SHOWPDF_PATH&quot;.equals(name)){
				showpdf_path = value + &quot;SmartContract/&quot; + pArtIns.getID() + &quot;/&quot;;
				break;
			}
		}
		var PrintSMvec = new java.util.Vector();//SmartContractPrint_Saddle_Multiple
		var PrintFMvec = new java.util.Vector();//SmartContractPrint_Flat_Multiple
		var PrintRMvec = new java.util.Vector();//SmartContractPrint_Receipt_Multiple
		var ContractNum = 0;

		for(var j=0;j&lt;Vec.size();j++){
			var hm = Vec.get(j);
			var FtlNo = hm.get(ftlITEM);
			var ChkFlag = &quot;true&quot;.equals(hm.get(chkITEM));//是否製作合約
			if(ChkFlag)ContractNum++;
		}

		if(ContractNum &lt;10) ContractNum = &quot;0&quot; + ContractNum;
		else ContractNum = ContractNum + &quot;&quot;;
		
		var txtContractNum = parseInt(pArtIns.getAppValue(&quot;txtContractNum&quot;),10);//合約份數
		var txtReceiptNum = parseInt(pArtIns.getAppValue(&quot;txtReceiptNum&quot;),10);//草稿份數
		if(&quot;NaN&quot;.equals(txtContractNum))txtContractNum = 2;
		if(&quot;NaN&quot;.equals(txtReceiptNum))txtReceiptNum = 1;
		var No = 1;
		//合約種類
		var FcType = &quot;&quot;;
		
		var ArtID = pArtIns.getArtifactID();
		var cmbStoreType2 = &quot;&quot;;
		var chkFcToFc = &quot;true&quot;.equals(pArtIns.getAppValue(&quot;chkFcToFc&quot;));//交叉
		var cmbWithStoreType = pArtIns.getAppValue(&quot;cmbWithStoreType&quot;);//交叉店型
		
		if(&quot;ART00591636522248424&quot;.equals(ArtID)){//草約
			cmbStoreType2 = pArtIns.getAppValue(&quot;cmbStoreType2&quot;);
		}else{//本約
			cmbStoreType2 = pArtIns.getAppValue(&quot;cmbStoreType2&quot;);
		}
		if(!chkFcToFc){
			if((cmbStoreType2+&quot;&quot;).indexOf(&quot;1FC&quot;) == 0){
				FcType = &quot;1FC&quot;;
			}else if((cmbStoreType2+&quot;&quot;).indexOf(&quot;2FC&quot;) == 0){
				FcType = &quot;2FC&quot;;
			}else if((cmbStoreType2+&quot;&quot;).indexOf(&quot;3FC&quot;) == 0){
				FcType = &quot;3FC&quot;;
			}
		}else{
			if((cmbWithStoreType+&quot;&quot;).indexOf(&quot;1FC&quot;) == 0){
				FcType = &quot;1FC&quot;;
			}else if((cmbWithStoreType+&quot;&quot;).indexOf(&quot;2FC&quot;) == 0){
				FcType = &quot;2FC&quot;;
			}else if((cmbWithStoreType+&quot;&quot;).indexOf(&quot;3FC&quot;) == 0){
				FcType = &quot;3FC&quot;;
			}
		}
		if(&quot;&quot;.equals(FcType))Server.addDebugLog(&quot;找不到店型型態：&quot; + cmbStoreType2 + &quot;;&quot; +cmbWithStoreType);
		for(var j=0;j&lt;Vec.size();j++){
			var hm = Vec.get(j);
			var FtlNo = hm.get(ftlITEM);
			var ChkFlag = &quot;true&quot;.equals(hm.get(chkITEM));//是否製作合約
			var pdf1 = hm.get(UrlItem1);
			var pdf2 = hm.get(UrlItem2);
			var ContractName = &quot;&quot;;
			var Receipt = &quot;&quot;;//true=收據
			if(ChkFlag){
				var FtlVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_FILE where No = &apos;&quot; + FtlNo + &quot;&apos;&quot;);
				var SealNo = FtlVec.get(0).get(&quot;SealNo&quot;);
				var SealType = FtlVec.get(0).get(&quot;SealType&quot;);
				if(FtlVec.size()&gt;0){
					ContractName = FtlVec.get(0).get(&quot;FileName&quot;);
					Receipt = FtlVec.get(0).get(&quot;Receipt&quot;);
				}
				var PrintNum = &quot;&quot;;
				if(&quot;true&quot;.equals(Receipt)){
					if(txtReceiptNum&lt;10)PrintNum = &quot;0&quot; + txtReceiptNum;
					else PrintNum = txtReceiptNum+&quot;&quot;;
				}else{
					if(txtContractNum&lt;10)PrintNum = &quot;0&quot; + txtContractNum;
					else PrintNum = txtContractNum+&quot;&quot;;
				}
				
				if(&quot;&quot;.equals(pdf1) || &quot;&quot;.equals(pdf2)){
					if(!&quot;&quot;.equals(pdf1)){
						var NewName = &quot;&quot;;
						if(No&lt;10)NewName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType + &quot;_0&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
						else NewName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType + &quot;_&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
						if(print) NewName += &quot;_Chop.pdf&quot;;//列印用文件
						OldPdf1FilePath = tempPath + &quot;\\&quot; +(pdf1+&quot;&quot;).substring((pdf1+&quot;&quot;).lastIndexOf(&quot;/&quot;)+1).split(&quot;%20&quot;).join(&quot; &quot;);
						NewPdf1FilePath = tempPath + &quot;\\&quot; + NewName;
						
						if(!OldPdf1FilePath.equals(NewPdf1FilePath)){//沒有轉檔之合約不需納入重新命名
							var file = new Packages.java.io.File(OldPdf1FilePath);
							var file2 = new Packages.java.io.File(NewPdf1FilePath);
							if (file2.exists()){
								var Result = file2[&quot;delete&quot;]();
								if(!Result)Server.addDebugLog(&quot;Delete_1_Error&quot; + NewPdf1FilePath);
							}
							
							var Result = file.renameTo(file2);
							if(!Result)Server.addDebugLog(&quot;renameTo_1_Error&quot; + OldPdf1FilePath + &quot;;&quot; +NewPdf1FilePath);
							
							UrlPath = new java.lang.String(showpdf_path+NewName);
							UrlPath = UrlPath.replaceAll(&quot; &quot;,&quot;%20&quot;);
							hm.put(UrlItem1,UrlPath);
							hm.put(UrlItem2,&quot;&quot;);
						}

						if(&quot;true&quot;.equals(Receipt)){//草稿
							PrintRMvec.add(NewPdf1FilePath);
						}else if(&quot;false&quot;.equals(Receipt)){//平
							PrintFMvec.add(NewPdf1FilePath);
						}
						No++;
					}else if(!&quot;&quot;.equals(pdf2)){
						var NewName = &quot;&quot;;
						if(No&lt;10)NewName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType  + &quot;_0&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
						else NewName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType  + &quot;_&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
						if(print) NewName += &quot;_Chop.pdf&quot;;//列印用文件
						OldPdf1FilePath = tempPath + &quot;\\&quot; +(pdf2+&quot;&quot;).substring((pdf2+&quot;&quot;).lastIndexOf(&quot;/&quot;)+1).split(&quot;%20&quot;).join(&quot; &quot;);
						NewPdf1FilePath = tempPath + &quot;\\&quot; + NewName;

						if(!OldPdf1FilePath.equals(NewPdf1FilePath)){//沒有轉檔之合約不需納入重新命名
							var file = new Packages.java.io.File(OldPdf1FilePath);
							var file2 = new Packages.java.io.File(NewPdf1FilePath);
							if (file2.exists()){
								var Result = file2[&quot;delete&quot;]();
								if(!Result)Server.addDebugLog(&quot;Delete_2_Error&quot; + NewPdf1FilePath);
							}
							
							var Result = file.renameTo(file2);
							if(!Result)Server.addDebugLog(&quot;renameTo_1_Error&quot; + OldPdf1FilePath + &quot;;&quot; +NewPdf1FilePath);
	
							UrlPath = new java.lang.String(showpdf_path+NewName);
							UrlPath = UrlPath.replaceAll(&quot; &quot;,&quot;%20&quot;);
							hm.put(UrlItem1,UrlPath);
							hm.put(UrlItem2,&quot;&quot;);
						}
						
						if(&quot;true&quot;.equals(Receipt)){//草稿
							PrintRMvec.add(NewPdf1FilePath);
						}else if(&quot;false&quot;.equals(Receipt)){//平
							PrintFMvec.add(NewPdf1FilePath);
						}
						No++;
					}
					hm.put(TypeITEM,&quot;&quot;);
					Vec.set(j,hm);
					
					continue;//不合併
				}
				if(&quot;其他協議書&quot;.equals(ContractName)){
					ContractName = (pdf1+&quot;&quot;).substring((pdf1+&quot;&quot;).lastIndexOf(&quot;/&quot;)+1).split(&quot;%20&quot;).join(&quot; &quot;);
					ContractName = ContractName.substring(0,ContractName.lastIndexOf(&quot;.&quot;));
				}
				var FileName = &quot;&quot;;
				if(No&lt;10)FileName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType  + &quot;_0&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
				else FileName = ContractName + &quot;_&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;) + &quot;_&quot; + FcType  + &quot;_&quot; + No + &quot;_&quot; + ContractNum + &quot;_&quot; + PrintNum + &quot;.pdf&quot;;
				if(print) FileName += &quot;_Chop.pdf&quot;;//列印用文件
				pdf1 = tempPath + &quot;\\&quot; +(pdf1+&quot;&quot;).substring((pdf1+&quot;&quot;).lastIndexOf(&quot;/&quot;)+1).split(&quot;%20&quot;).join(&quot; &quot;);
				pdf2 = tempPath + &quot;\\&quot; +(pdf2+&quot;&quot;).substring((pdf2+&quot;&quot;).lastIndexOf(&quot;/&quot;)+1).split(&quot;%20&quot;).join(&quot; &quot;);
				if(&quot;其他協議書&quot;.equals(FtlVec.get(0).get(&quot;FileName&quot;)))
					var ReturnPdfPath = mergePdf(pdf1,pdf2,tempPath + &quot;\\&quot; + FileName,false);
				else 
					var ReturnPdfPath = mergePdf(pdf1,pdf2,tempPath + &quot;\\&quot; + FileName,print);
				if(!&quot;&quot;.equals(ReturnPdfPath)){
					
					UrlPath = new java.lang.String(showpdf_path+FileName);
					UrlPath = UrlPath.replaceAll(&quot; &quot;,&quot;%20&quot;);
					hm.put(UrlItem1,UrlPath);
					hm.put(UrlItem2,&quot;&quot;);
					if(&quot;其他協議書&quot;.equals(FtlVec.get(0).get(&quot;FileName&quot;)) &amp;&amp; print){
						SetPdfImg(tempPath,FileName,SealNo,SealType,FileUpLoadPath);
						PrintFMvec.add(tempPath + &quot;\\&quot; + FileName);
					}else{
						PrintSMvec.add(tempPath + &quot;\\&quot; + FileName + &quot;_Print.pdf&quot;);
					}
				}
				hm.put(TypeITEM,&quot;&quot;);
				Vec.set(j,hm);
				No++;
			}
			
		}
		pArtIns.setAppValue(AtchName,Vec);
		
		if(print){//進行合約列印 按鈕驅動
			var PrintSql = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME in (&quot; +
			&quot;&apos;SmartContractPrint_Saddle_Multiple&apos;,&quot; +
			&quot;&apos;SmartContractPrint_Flat_Multiple&apos;,&quot; +
			&quot;&apos;SmartContractPrint_Receipt_Multiple&apos;)&quot;);
			var tblPrintPdfList = new java.util.Vector();
			
			var PrintName = new java.util.Vector();
			var PrintPath = new java.util.Vector();
			for(var j=0;j&lt;PrintSql.size();j++){
				PrintName.add(PrintSql.get(j).get(&quot;NAME&quot;)+&quot;&quot;);
				PrintPath.add(PrintSql.get(j).get(&quot;VALUE&quot;)+&quot;&quot;);
			}
			if(PrintSMvec.size()&gt;0){
				var PrintIndex = PrintName.indexOf(&quot;SmartContractPrint_Saddle_Multiple&quot;);
				if(PrintIndex != -1){
					for(var j=0;j&lt;PrintSMvec.size();j++){
						var PrintFileName = PrintSMvec.get(j)+&quot;&quot;;
						PrintFileName = (PrintFileName+&quot;&quot;).substring((PrintFileName+&quot;&quot;).lastIndexOf(&quot;\\&quot;)+1);
						if((PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;) != -1)PrintFileName = (PrintFileName+&quot;&quot;).substring(0,(PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;));
						
						var tblPrintPdfListHm = new java.util.HashMap();
						tblPrintPdfListHm.put(&quot;ITEM1&quot;,PrintSMvec.get(j)+&quot;&quot;);
						tblPrintPdfListHm.put(&quot;ITEM2&quot;,PrintFileName);
						tblPrintPdfListHm.put(&quot;ITEM3&quot;,&quot;SmartContractPrint_Saddle_Multiple&quot;);
						tblPrintPdfList.add(tblPrintPdfListHm);
					}
				}
			}
			if(PrintFMvec.size()&gt;0){
				var PrintIndex = PrintName.indexOf(&quot;SmartContractPrint_Flat_Multiple&quot;);
				if(PrintIndex != -1){
					for(var j=0;j&lt;PrintFMvec.size();j++){
						var PrintFileName = PrintFMvec.get(j)+&quot;&quot;;
						PrintFileName = (PrintFileName+&quot;&quot;).substring((PrintFileName+&quot;&quot;).lastIndexOf(&quot;\\&quot;)+1);
						if((PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;) != -1)PrintFileName = (PrintFileName+&quot;&quot;).substring(0,(PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;));
						
						var tblPrintPdfListHm = new java.util.HashMap();
						tblPrintPdfListHm.put(&quot;ITEM1&quot;,PrintFMvec.get(j)+&quot;&quot;);
						tblPrintPdfListHm.put(&quot;ITEM2&quot;,PrintFileName);
						tblPrintPdfListHm.put(&quot;ITEM3&quot;,&quot;SmartContractPrint_Flat_Multiple&quot;);
						tblPrintPdfList.add(tblPrintPdfListHm);
					}
				}
			}
			if(PrintRMvec.size()&gt;0){
				var PrintIndex = PrintName.indexOf(&quot;SmartContractPrint_Receipt_Multiple&quot;);
				if(PrintIndex != -1){
					for(var j=0;j&lt;PrintRMvec.size();j++){
						var PrintFileName = PrintRMvec.get(j)+&quot;&quot;;
						PrintFileName = (PrintFileName+&quot;&quot;).substring((PrintFileName+&quot;&quot;).lastIndexOf(&quot;\\&quot;)+1);
						if((PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;) != -1)PrintFileName = (PrintFileName+&quot;&quot;).substring(0,(PrintFileName+&quot;&quot;).lastIndexOf(&quot;_Chop.pdf&quot;));
						
						var tblPrintPdfListHm = new java.util.HashMap();
						tblPrintPdfListHm.put(&quot;ITEM1&quot;,PrintRMvec.get(j)+&quot;&quot;);
						tblPrintPdfListHm.put(&quot;ITEM2&quot;,PrintFileName);
						tblPrintPdfListHm.put(&quot;ITEM3&quot;,&quot;SmartContractPrint_Receipt_Multiple&quot;);
						tblPrintPdfList.add(tblPrintPdfListHm);
					}
				}
			}
			pArtIns.setAppValue(&quot;tblPrintPdfList&quot;,tblPrintPdfList);
		}

		pArtIns.setAppValue(&quot;txtReContractPdf&quot;,&quot;&quot;);
		Server.updateArtInstance(pArtIns);
		Server.addDebugLog(&quot;Start 智慧合約 End：&quot; + pArtIns.getAppValue(&quot;txtFormNo&quot;));
		return true;
	}else{//還沒完成 繼續等待
		pArtIns.setAppValue(AtchName,Vec);
		Server.updateArtInstance(pArtIns);
		return false;
	}
}


function mergePdf(file1,file2,newfile,print) {
	importPackage(java.io);
	importPackage(Packages.com.lowagie.text);//document
	importClass(Packages.com.lowagie.text.pdf.PdfReader);
	importClass(Packages.com.lowagie.text.pdf.PdfStamper);
	importClass(Packages.com.lowagie.text.pdf.PdfCopy);
	
    var retValue = false;
    var document = null;
    try {
    	if(print){//合約至印表機列印
    		var reader1 = new PdfReader(file1+&quot;&quot;);
			var reader1PageCount = reader1.getNumberOfPages();
			if(reader1PageCount&lt;2){//封面需2頁
				var stamper = new PdfStamper(reader1, new FileOutputStream(file1+&quot;_&quot;));
				stamper.insertPage(reader1.getNumberOfPages() + 1, reader1.getPageSizeWithRotation(1));
				stamper.close();
				reader1.close();
			}
			
	        var reader2 = new PdfReader(file2+&quot;&quot;);
	        var reader2PageCount = reader2.getNumberOfPages();
	        var AddPageCount = 0;
			if(reader2PageCount%4 != 0){//內文需4的倍數
				AddPageCount += 4-reader2PageCount%4;
			}
			AddPageCount+=2;//封底需2頁
			var stamper = new PdfStamper(reader2, new FileOutputStream(file2+&quot;_&quot;));
			for(var j=0;j&lt;AddPageCount;j++){
				stamper.insertPage(reader2.getNumberOfPages() + 1, reader2.getPageSizeWithRotation(1));
			}
			stamper.close();
			reader2.close();

			var reader1 = new PdfReader(file1+&quot;_&quot;);
	        document = new Document(reader1.getPageSize(1));//設定格式
	        var newPdfFile = new FileOutputStream(newfile+&quot;_Print.pdf&quot;);
	        var copy = new PdfCopy(document, newPdfFile);
	        document.open();
	
	        var n = reader1.getNumberOfPages();
	        for (var j = 1; j &lt;= n; j++) {
	            document.newPage();
	            var page = copy.getImportedPage(reader1, j);
	            copy.addPage(page);
	        }
			var reader2 = new PdfReader(file2+&quot;_&quot;);
	        var n = reader2.getNumberOfPages();
	        for (var j = 1; j &lt;= n; j++) {
	            document.newPage();
	            var page = copy.getImportedPage(reader2, j);
	            copy.addPage(page);
	        }
	        document.close();
	        copy.close();
	        reader2.close();
	        reader1.close();
	        newPdfFile.close();
    	}
    	
		var reader1 = new PdfReader(file1+&quot;&quot;);
        document = new Document(reader1.getPageSize(1));//設定格式
        var newPdfFile = new FileOutputStream(newfile);
        var copy = new PdfCopy(document, newPdfFile);
        document.open();

        var n = reader1.getNumberOfPages();
        for (var j = 1; j &lt;= n; j++) {
            document.newPage();
            var page = copy.getImportedPage(reader1, j);
            copy.addPage(page);
        }
		var reader2 = new PdfReader(file2+&quot;&quot;);
        var n = reader2.getNumberOfPages();
        for (var j = 1; j &lt;= n; j++) {
            document.newPage();
            var page = copy.getImportedPage(reader2, j);
            copy.addPage(page);
        }
        document.close();
        copy.close();
        reader2.close();
        reader1.close();
        newPdfFile.close();
        retValue = true;

        if(true){
	    	var dt = new File(file1+&quot;_&quot;);
   			if(dt.exists()){
   				var Result = dt[&quot;delete&quot;]();
   				if(!Result)Server.addDebugLog(&quot;mergePdf_delete_1_Error:&quot; + file1+&quot;_&quot;);
   			}
   			var dt = new File(file2+&quot;_&quot;);
   			if(dt.exists()){
   				var Result = dt[&quot;delete&quot;]();
   				if(!Result)Server.addDebugLog(&quot;mergePdf_delete_1_Error:&quot; + file2+&quot;_&quot;);
   			}
   			var dt = new File(file1+&quot;&quot;);
   			if(dt.exists()){
   				var Result = dt[&quot;delete&quot;]();
   				if(!Result)Server.addDebugLog(&quot;mergePdf_delete_1_Error:&quot; + file1);
   			}
   			var dt = new File(file2+&quot;&quot;);
   			if(dt.exists()){
   				var Result = dt[&quot;delete&quot;]();
   				if(!Result)Server.addDebugLog(&quot;mergePdf_delete_1_Error:&quot; + file2);
   			}
	    }
    } catch (e) {
    	Server.addDebugLog(&quot;智慧合約pdf處理錯誤[&quot;+newfile+&quot;]:&quot;+e.toString());
    }
    if(retValue)return newfile;
    else return &quot;&quot;;
}


function DocToPdf(pArtIns, DocPath, DocFileName, SealNo, SealType,ImgFlag,Type,FileUpLoadPath){
	//處理完整路徑
	DocPath = DocPath.substring(0,DocPath.lastIndexOf(&quot;\\&quot;));
	//轉pdf
	loadLibrary(&quot;AskCredit.Common.CommonFunction&quot;);
	importPackage(java.io);
	var InsID = pArtIns.getID();
	
	var NewName = DocFileName.substring(0,DocFileName.lastIndexOf(&quot;.&quot;));
	var NewPdfName = NewName + &quot;.pdf&quot;;
	NewName += &quot;.doc&quot;;
	
	if(&quot;1&quot;.equals(Type)){
		//取得轉pdf掃描路徑
		var moveToPathn = &quot;&quot;;
		var sql = &quot;select * from BPM_FLOW_CONFIG where NAME=&apos;Neevia_SOURCE&apos;&quot;;
		var vec = Server.SQLloadValue(sql);
		if(vec.size()&gt;0){
			moveToPathn = vec.get(0).get(&quot;VALUE&quot;)+&quot;\\&quot;+InsID;
		}
		var creatF = new java.io.File(moveToPathn);
		creatF.mkdir();//建立資料夾
		//進行轉檔
		var DocFile = new File(DocPath + &quot;\\&quot; + NewName);
		var MoveFile = new File(moveToPathn + &quot;\\&quot; + NewName);
		if (MoveFile.exists()){
			var Result = MoveFile[&quot;delete&quot;]();
			if(!Result)Server.addDebugLog(&quot;智慧合約 Delete:false，&quot; + moveToPathn + &quot;\\&quot; + NewName);
		}
		var MoveResult = DocFile.renameTo(MoveFile);
		if(!MoveResult)Server.addDebugLog(&quot;智慧合約 MoveResult:false，&quot; + DocPath + &quot;\\&quot; + NewName + &quot;-&gt;&quot; + moveToPathn + &quot;\\&quot; + NewName);
		//var resultCopy = copyFile(DocPath+&quot;\\&quot;,moveToPathn+&quot;\\&quot;,NewName);
		
		return true;
	}else if(&quot;2&quot;.equals(Type)){
		//取得轉成功pdf路徑
		var pathn = &quot;&quot;;//轉PDF輸出的資料夾
		var vec = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME=&apos;Neevia_SUCCESS&apos;&quot;);
		if(vec.size()&gt;0){
			pathn = vec.get(0).get(&quot;VALUE&quot;)+&quot;\\&quot;+InsID;//轉PDF輸出的資料夾
		}
		//完成等待
		var file = new File(pathn+&quot;\\&quot; + NewPdfName);
		if (file.exists()){//轉檔完成-檔案移回	
			var MoveFile = new File(DocPath+&quot;\\&quot; + NewPdfName);
			if (MoveFile.exists()){
				var Result = MoveFile[&quot;delete&quot;]();
				if(!Result)Server.addDebugLog(&quot;智慧合約 Delete_2:false，&quot; + DocPath+&quot;\\&quot; + NewPdfName);
			}
			var MoveResult = file.renameTo(MoveFile);
			if(!MoveResult)Server.addDebugLog(&quot;智慧合約 MoveResult:false，&quot; + pathn + &quot;\\&quot; + NewPdfName + &quot;-&gt;&quot; + DocPath + &quot;\\&quot; + NewPdfName);
			//var resultCopy = copyFile(pathn+&quot;\\&quot;,DocPath+&quot;\\&quot;,NewPdfName);
			//設定簽章
			if(ImgFlag)SetPdfImg(DocPath,NewPdfName,SealNo,SealType,FileUpLoadPath);
			//開啟預覽視窗
			var vec = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME IN(&apos;SHOWPDF_PATH&apos;)&quot;);
			var showpdf_path = &quot;&quot;;
			for(var i = 0 ; i &lt; vec.size() ; i++){
				var name = vec.get(i).get(&quot;NAME&quot;);
				var value = vec.get(i).get(&quot;VALUE&quot;);
				if(&quot;SHOWPDF_PATH&quot;.equals(name)){
					showpdf_path = value + &quot;SmartContract/&quot; + InsID + &quot;/&quot; + NewPdfName;
					break;
				}
			}
			showpdf_path = new java.lang.String(showpdf_path);
			showpdf_path = showpdf_path.replaceAll(&quot; &quot;,&quot;%20&quot;);
			return showpdf_path;
		}else{
			var PdfFile = new File(DocPath + &quot;\\&quot; + NewPdfName);
			if (PdfFile.exists()){
				//開啟預覽視窗
				var vec = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME IN(&apos;SHOWPDF_PATH&apos;)&quot;);
				var showpdf_path = &quot;&quot;;
				for(var i = 0 ; i &lt; vec.size() ; i++){
					var name = vec.get(i).get(&quot;NAME&quot;);
					var value = vec.get(i).get(&quot;VALUE&quot;);
					if(&quot;SHOWPDF_PATH&quot;.equals(name)){
						showpdf_path = value + &quot;SmartContract/&quot; + InsID + &quot;/&quot; + NewPdfName;
						break;
					}
				}
				showpdf_path = new java.lang.String(showpdf_path);
				showpdf_path = showpdf_path.replaceAll(&quot; &quot;,&quot;%20&quot;);
				return showpdf_path;
			}
		}
		return &quot;&quot;;//需要繼續等待轉檔
		var wait = 0;
		while(wait&lt;=20){
			java.lang.Thread.sleep(3000);
			var file = new Packages.java.io.File(pathn+&quot;\\&quot; + NewPdfName);
			if (file.exists()){//轉檔完成
				java.lang.Thread.sleep(3000);
				copyFile(pathn+&quot;\\&quot;,DocPath+&quot;\\&quot;,NewPdfName);
				break;
			}
			wait++;
		}
	}/*else if(&quot;3&quot;.equals(Type)){
		//開啟預覽視窗
		var vec = Server.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME IN(&apos;SHOWPDF_PATH&apos;)&quot;);
		var showpdf_path = &quot;&quot;;
		for(var i = 0 ; i &lt; vec.size() ; i++){
			var name = vec.get(i).get(&quot;NAME&quot;);
			var value = vec.get(i).get(&quot;VALUE&quot;);
			if(&quot;SHOWPDF_PATH&quot;.equals(name)){
				showpdf_path = value + &quot;SmartContract/&quot; + InsID + &quot;/&quot; + NewPdfName;
				break;
			}
		}
		showpdf_path = new java.lang.String(showpdf_path);
		showpdf_path = showpdf_path.replaceAll(&quot; &quot;,&quot;%20&quot;);
		return showpdf_path;
	}*/
}


function SetPdfImg(path,name,SealNo,SealType,FileUpLoadPath){
	if(&quot;&quot;.equals(SealNo)) return false;
	
	var SealVec = Server.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_SEAL where No = &apos;&quot;+SealNo+&quot;&apos; and FtlName = &apos;&apos;&quot;);
	if(SealVec.size()&gt;0){
		//刪除用印檔案
		/*var df = new java.io.File(path + &quot;\\&quot; + name);
		if (df.exists()){
			df[&quot;delete&quot;]();//刪除檔案
		}*/
		
		importPackage(java.io);
		importClass(Packages.com.lowagie.text.Image);
		importClass(Packages.com.lowagie.text.pdf.PdfReader); 
		importClass(Packages.com.lowagie.text.pdf.PdfStamper);
		importClass(Packages.com.lowagie.text.pdf.PdfGState);
		
		importPackage(Packages.java.awt.image);
		importPackage(Packages.javax.imageio);
		
		var reader = new PdfReader(path + &quot;\\&quot; + name);
		var stamper = new PdfStamper(reader, new FileOutputStream(path + &quot;\\&quot; + &quot;New&quot; + name));//,&quot;\0&quot;,true
		var total = reader.getNumberOfPages() + 1;
		var h = reader.getPageSize(1).getHeight();
		var w = reader.getPageSize(1).getWidth();
		// 0,h   w,h
		//
		// 0,0   0,w
		for(var i=0;i&lt;SealVec.size();i++){
			var Hm = SealVec.get(i);
			var SealName = Hm.get(&quot;SealName&quot;);
			var TBDistance = parseInt(Hm.get(&quot;TBDistance&quot;),10);
			var LRDistance = parseInt(Hm.get(&quot;LRDistance&quot;),10);
			var Position = Hm.get(&quot;Position&quot;);
			var Type = Hm.get(&quot;Type&quot;);
			var ImgFilePath = AtchGetPath(Hm.get(&quot;ImgFile&quot;)+&quot;&quot;,FileUpLoadPath);
			var Transparency = Hm.get(&quot;Transparency&quot;);
			var ImgH = parseInt(Hm.get(&quot;ImgH&quot;),10);
			var ImgW = parseInt(Hm.get(&quot;ImgW&quot;),10);
			var img = Image.getInstance(ImgFilePath);
			var img2 = &quot;&quot;;//騎縫章左
			var img3 = &quot;&quot;;//騎縫章右
			if(&quot;騎縫章&quot;.equals(SealName)){
				var out = new ByteArrayOutputStream();
		        var PriImg = ImageIO.read(new File(ImgFilePath));
			
		        var imgH = PriImg.getHeight();
		        var imgW = PriImg.getWidth();
		        var n = 2;
		        var sw = imgW/n;
		        for(var k=0;k&lt;n;k++){
		            var subImg;
		            if(k==n-1){//最後剩餘部分
		                subImg = PriImg.getSubimage(k * sw, 0, imgW-k*sw, imgH);
		                ImageIO.write(subImg,ImgFilePath.substring(ImgFilePath.lastIndexOf(&apos;.&apos;)+1),out);
			            img3 = Image.getInstance(out.toByteArray());
			            out.flush();
			            out.reset();
		            }else {//前n-1塊均勻切
		                subImg = PriImg.getSubimage(k * sw, 0, sw, imgH);
		                ImageIO.write(subImg,ImgFilePath.substring(ImgFilePath.lastIndexOf(&apos;.&apos;)+1),out);
			            img2 = Image.getInstance(out.toByteArray());
			            out.flush();
			            out.reset();
		            }
		        }
			}
			
			for(var j = 1; j &lt; total; j++) {
		        var x = 0;
				var y = 0;
				
				if(&quot;騎縫章&quot;.equals(SealName)){
					var NewPosition = Position;
					TBDistance = 0;
					LRDistance = 0;
					img = &quot;&quot;;
					
					if(&quot;A3&quot;.equals(SealType)){//正中央.
						//正中央(內頁) 1 左 2 右
						//右中 1 右 2 左
						if(&quot;左中&quot;.equals(NewPosition)){
							if(j%2 == 1){//單
								img = img3;//紙張左邊，圖片右邊
								NewPosition = &quot;左中&quot;;
							}else{//雙
								img = img2;
								NewPosition = &quot;右中&quot;;
							}
						}else if(&quot;右中&quot;.equals(NewPosition)){
							if(j%2 == 1){//單
								img = img2;//紙張右邊，圖片左邊
								NewPosition = &quot;右中&quot;;
							}else{//雙
								img = img3;
								NewPosition = &quot;左中&quot;;
							}
						}
					}else if(&quot;A4&quot;.equals(SealType)){
						//正中央(內頁) 1 左 2 右
						//右中 1 右 2 左
						if(&quot;左中&quot;.equals(NewPosition)){
							if(j%2 == 1){//單
								img = img3;//紙張左邊，圖片右邊
								//NewPosition = &quot;左中&quot;;
								NewPosition = &quot;右中&quot;;
							}else{//雙
								img = img2;
								NewPosition = &quot;右中&quot;;
							}
						}else if(&quot;右中&quot;.equals(NewPosition)){
							if(j%2 == 1){//單
								img = img2;//紙張右邊，圖片左邊
								NewPosition = &quot;右中&quot;;
							}else{//雙
								img = img3;
								//NewPosition = &quot;左中&quot;;
								NewPosition = &quot;右中&quot;;
							}
						}
					}
					
					if(&quot;左中&quot;.equals(NewPosition)){
						x = LRDistance;
						y = h / 2 - ImgH / 2;
					}else if(&quot;右中&quot;.equals(NewPosition)){
						x = w - LRDistance - ImgW;
						y = h / 2 - ImgH / 2;
					}else{
						continue;
					}
				}else{
					if(&quot;封頁&quot;.equals(Type)){
						if(j!=1)continue;
					}else if(&quot;內頁&quot;.equals(Type)){
						if(j==1 || j==total-1)continue
					}else if(&quot;封底&quot;.equals(Type)){
						if(j!=total-1)continue;
					}else if(&quot;封頁內頁&quot;.equals(Type)){
						if(j==total-1)continue;
					}else if(&quot;內頁封底&quot;.equals(Type)){
						if(j==1)continue;
					}else if(&quot;內文首頁&quot;.equals(Type)){
						if(j!=2)continue;
					}else if(&quot;內文頁尾&quot;.equals(Type)){
						if(j!=total-2)continue;
					}
					if(&quot;左上&quot;.equals(Position)){
						x = LRDistance;
						y = h - TBDistance - ImgH;
					}else if(&quot;中上&quot;.equals(Position)){
						x = w / 2 - ImgW / 2 ;
						y = h - TBDistance - ImgH;
					}else if(&quot;右上&quot;.equals(Position)){
						x = w - LRDistance - ImgW;
						y = h - TBDistance - ImgH;
					}else if(&quot;左中&quot;.equals(Position)){
						x = LRDistance;
						y = h / 2 - ImgH / 2 ;
					}else if(&quot;正中央&quot;.equals(Position)){
						x = w / 2 - ImgW / 2;
						y = h / 2 - ImgH / 2;
					}else if(&quot;右中&quot;.equals(Position)){
						x = w - LRDistance - ImgW;
						y = h / 2 - ImgH / 2;
					}else if(&quot;左下&quot;.equals(Position)){
						x = LRDistance;
						y = TBDistance + ImgH;
					}else if(&quot;中下&quot;.equals(Position)){
						x = w / 2 - ImgW / 2;
						y = TBDistance + ImgH;
					}else if(&quot;右下&quot;.equals(Position)){
						x = w - LRDistance - ImgW;
						y = TBDistance + ImgH;
					}
				}
				img.setAbsolutePosition(x, y);
				//img.scalePercent(percent);//縮放比例
				img.scaleAbsolute(ImgW,ImgH);
				
				var over = stamper.getOverContent(j);
				if(!&quot;&quot;.equals(Transparency) &amp;&amp; !&quot;100&quot;.equals(Transparency) &amp;&amp; !&quot;NaN&quot;.equals(parseInt(Transparency,10))){//設置透明度爲
					var gs = new PdfGState();
	            	gs.setFillOpacity(parseFloat(Transparency) / 100);
	            	over.setGState(gs);
				}else{
					var gs = new PdfGState();
	            	gs.setFillOpacity(1);
	            	over.setGState(gs);
				}
            	over.addImage(img);
			}
		}
		
		stamper.close();
		reader.close();
		
		//等待刪除
		var df = new java.io.File(path + &quot;\\&quot; + name);
		df[&quot;delete&quot;]();//刪除檔案
		var wait = 0;
		while(wait&lt;=10){
			java.lang.Thread.sleep(1000);
			var file = new java.io.File(path + &quot;\\&quot; + name);
			if (!file.exists()){
				var creatF = new java.io.File(path + &quot;\\&quot;+ &quot;New&quot; + name);
				creatF.renameTo(new java.io.File(path + &quot;\\&quot; + name));
				break;
			}else{
				var df = new java.io.File(path + &quot;\\&quot; + name);
				df[&quot;delete&quot;]();//刪除檔案
			}
			wait++;
		}
		return true;
	}else{
		return false;
	}
	return true;
}


function AtchGetPath(Str,FileUpLoadPath){
	if(&quot;&quot;.equals(Str)) return Str;
	var InsID = &quot;&quot;;
	var officeITEM = &quot;&quot;;
	var ArtID = &quot;&quot;;
	var fileName = &quot;&quot;;
	var fileList = Packages.pe.filesystem.AttachFileInfo.parseAttachFileInfo(Str);
	if (fileList.size() &gt; 0) {
		for(var j = 0; j &lt; fileList.size(); j++) {
			var fileInfo = fileList.get(j);
			InsID = fileInfo.getArtInsID();
			officeITEM = fileInfo.getItemID();
			ArtID = fileInfo.getArtifactID();
			fileName = fileInfo.getFileName();
		}
	}else{
		return &quot;&quot;;
	}
	var pathn = FileUpLoadPath + ArtID+&quot;\\&quot;+InsID+&quot;&quot;+officeITEM ;//來源		
	
	return pathn + &quot;\\&quot; + fileName;
}
function UpdateAtch(pArtIns,FilePath,FileName,AtchName,AtchItem){//暫停使用
	var Table = pArtIns.getAppDataMap().get(AtchName);
	
	var InsID = pArtIns.getID();
	var TskID = Server.getArtTskID(InsID);
	var Task = Server.getTask(TskID);
	var ArtID = pArtIns.getArtifactID();
	var Member = Server.getCurrentMember();
	var Name = Member.getName();
	var file = new Packages.java.io.File(FilePath + FileName);
	var uploadFiles = new Packages.java.util.Vector();
	if (file.exists()) {
	    fileInfo = new Packages.pe.filesystem.AttachFileInfo(FileName);//一個夾檔就需要有一個 此物件, 這裡指處理一個夾檔
	    fileInfo.setTaskID(TskID);
	    fileInfo.setArtifactID(ArtID);
	    fileInfo.setArtInsID(InsID);
	    fileInfo.setMemberName(Name);
	    fileInfo.setSaveTime(Server.getServerTime());
	    fileInfo.setNote(&quot;&quot;);//備註
	    fileInfo.setItemID(AtchItem);//表單夾檔元件的ItemID
	    fileInfo.setFileSize(file.length());
	    var wfci = Packages.si.WFCIFactory.createWFCIRMIImpl(&quot;localhost&quot;,&quot;1099&quot;);
	    fm = wfci.getFileManager();
	    con = fm.connectServer(wfci.getFlowServerHost(), wfci.getFlowServerPort());//這動作ㄧ定要作
	    try {
	        ok2 = fm.uploadFile(fileInfo, new Packages.java.io.FileInputStream(file));   
	        if (ok2) {
	            uploadFiles.add(fileInfo);
	        }
	    } catch (e) {
	        Server.addErrLog(e);
	    }
	}
	var artIns = Task.getArtInstance();
	artIns.setAppValue(AtchName, artIns.getAppValue(AtchName) + getAttachStringValue(uploadFiles));
	Server.updateArtInstance(artIns);
}
function getAttachStringValue(vector){
    var tabChar = &quot;\t\t&quot;;
    var breakChar = &quot;\n\n&quot;;
    var stringbuffer = new Packages.java.lang.StringBuffer();
    for(var i = 0,n=vector.size(); i &lt; n; i++){
        var attachfileinfo = vector.get( i);
        stringbuffer.append(attachfileinfo.getFileName()).append(tabChar)
                    .append(attachfileinfo.getFileID()).append(tabChar)
                    .append(attachfileinfo.getTaskID()).append(tabChar)
                    .append(attachfileinfo.getArtifactID()).append(tabChar)
                    .append(attachfileinfo.getArtInsID()).append(tabChar)
                    .append(attachfileinfo.getMemberName()).append(tabChar)
                    .append(Packages.java.lang.Long.toString(attachfileinfo.getSaveTime())).append(tabChar)
                    .append(attachfileinfo.getNote()).append(tabChar)
                    .append(attachfileinfo.getItemID()).append(tabChar)  //new item 1
                     .append(Packages.java.lang.Long.toString(attachfileinfo.getFileSize())).append(tabChar) //new item 2
                     .append(breakChar);
    }
    return stringbuffer.toString();
}
function CopyFileToNewName(FromPathFile,ToPathFile){
	if(&quot;&quot;.equals(FromPathFile) || &quot;&quot;.equals(ToPathFile)) return false;
	Server.addInfoLog(&quot;======&gt;copyFile start&quot;);
	Server.addInfoLog(&quot;======&gt;p1:&quot;+FromPathFile);	
	Server.addInfoLog(&quot;======&gt;p2:&quot;+ToPathFile);
	try{
		var srcFileInputStream = new java.io.FileInputStream(FromPathFile);//in
		var dstFileOutputStream = new java.io.FileOutputStream(ToPathFile);//out
		var srcChannel = srcFileInputStream.getChannel();
		var dstChannel = dstFileOutputStream.getChannel();
		var bytes = dstChannel.transferFrom(srcChannel, 0, srcChannel.size());
		srcFileInputStream.close();
		dstFileOutputStream.close();
	} catch (e) {
		getContext().addErrLog(&quot;======&gt;copy error ! &quot; + e);
		return false;
	}
	Server.addInfoLog(&quot;======&gt;copyFile End&quot;);
	return true;
}
</string>
     </void>
    </object>
   </void>
  </void>
 </object>
</java>
