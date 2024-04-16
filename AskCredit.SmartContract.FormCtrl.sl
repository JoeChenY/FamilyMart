<?xml version="1.0" encoding="UTF-8"?>
<java version="1.8.0_92" class="java.beans.XMLDecoder">
 <object class="pe.pde.ScriptLibraryModel" id="ScriptLibraryModel0">
  <void property="exportFileName">
   <string>AskCredit.SmartContract.FormCtrl</string>
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
       <string>SCL00391666603340967</string>
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
    <string>SCL00391666603340967</string>
    <object class="pe.pde.ScriptLibrary">
     <void property="author">
      <string>Administrator</string>
     </void>
     <void property="createDate">
      <string>2024/04/16 16:27:40</string>
     </void>
     <void property="fullName">
      <string>AskCredit.SmartContract.FormCtrl</string>
     </void>
     <void property="id">
      <string>SCL00391666603340967</string>
     </void>
     <void property="name">
      <string>FormCtrl</string>
     </void>
     <void property="parentId">
      <string>SCF00061653449771347</string>
     </void>
     <void property="scriptSource">
      <string>//-------------------------------------------------------------------------------------------------------------------草約簽呈
function getDraftConfig(){
	var Config = {};

	//參數初始化-合約名稱
    Config.OtherContract = &quot;其他協議書&quot;;
	Config.PaName1 = &quot;草約書&quot;;
	Config.PaName2 = &quot;複數特別協議書&quot;;
	Config.PaName3 = &quot;教育訓練費收據&quot;;

	return Config;
}

//-------------------------------------------------------------------------------------------------------------------本約簽呈
//-------------------------------------------------------------------------------------------------------------------初始化參數
function getStoreTypeConfig(){//取得本約簽呈 店型資訊
	var Config = {};
	var pForm = Form.getParentForm();
	if(pForm != null){
		Config.StoreType = pForm.getValue(&quot;cmbStoreType&quot;);//類別-&gt;新進.複數...
		Config.StoreType2 = pForm.getValue(&quot;cmbStoreType2&quot;);//店型-&gt;1FC-A.2FC...
		Config.FCPerson = pForm.getValue(&quot;txt2FCPerson&quot;);//店型個人式
		Config.Plural = pForm.getValue(&quot;chkPlural&quot;);//複數
		Config.WithStoreType = pForm.getValue(&quot;cmbWithStoreType&quot;);//交叉店型，請選擇-&gt;否交叉
		Config.With2FCPerson = pForm.getValue(&quot;txtWith2FCPerson&quot;);//交叉店型個人式
	}
	return Config;
}

function getConfig(){
	var StoreTypeConfig = getStoreTypeConfig();
	var Config = {};
	
	//本約初始化數值
	Config.OpenStoreMonth = &quot;24&quot;; //K專案營業激勵獎金協議書，自開店日起之次月起__個月
	Config.GrossProfit = &quot;3&quot;; //K專案營業激勵獎金協議書，之每月營業總毛利 ％作為補助乙方營業之激勵獎勵金。
	Config.bonus = &quot;3&quot;; // 員工激勵獎金協議書，%作為員工加盟激勵獎金。
	Config.GrassTax = &quot;5000&quot;;//員工激勵-營業總毛利加計最大值
	Config.LBAAmt = &quot;160000&quot;;//薪傳獎勵金協議書-獎勵金
	Config.PSAEATF = &quot;0&quot;;//複數特別協議書-教育訓練費
	
	//本約-參數卡控
	Config.StoreType1 = &quot;新進&quot;;
	Config.StoreType2 = &quot;複數&quot;;
	Config.StoreType3 = &quot;契約期滿續約&quot;;
	Config.StoreType4 = &quot;移店已續約&quot;;
	Config.StoreType5 = &quot;移店未續約&quot;;
	Config.StoreType6 = &quot;FC店型變更&quot;;
	Config.StoreType7 = &quot;機構&quot;;
	Config.KopenStoreMonthMax = 24;//K專案-月份最大值
	Config.KGrossProfitMax = 10;//K專案-毛利最大值
	Config.bonusMax = 10;//員工激勵-營業總毛利加計最大值
	
	//參數初始化-合約名稱
    Config.OtherContract = &quot;其他協議書&quot;;
	Config.PaName1 = &quot;本約&quot;;
	Config.PaName2 = &quot;附帶契約&quot;;
	Config.PaName3 = &quot;讓渡金協議書&quot;;
	Config.PaName4 = &quot;K專案營業激勵獎金協議書&quot;;
	Config.PaName5 = &quot;員工激勵獎金協議書&quot;;
	Config.PaName6 = &quot;保證金收據&quot;;
	Config.PaName7 = &quot;加盟金收據&quot;;
	Config.PaName8 = &quot;教育訓練費稅金收據&quot;;
	Config.PaName9 = &quot;讓渡金收據&quot;;
	Config.PaName10 = &quot;擔保金收據&quot;;
	
	Config.PaName11 = &quot;複數特別協議書&quot;;  //介面 AccordionPanel14
	Config.PaName12 = &quot;存貨報廢補助協議書&quot;;
    Config.PaName13 = &quot;經營補助金協議書&quot;;
    Config.PaName14 = &quot;裝潢補助協議書&quot;;

    Config.PaName15 = &quot;薪傳保險補助金協議書&quot;; //介面 AccordionPanel11
    Config.PaName16 = &quot;薪傳獎勵金協議書&quot;; //介面 AccordionPanel12
    Config.PaName17 = &quot;續約特別協議書&quot;; // //介面 AccordionPanel13
    Config.PaName18 = &quot;新接店特別契約&quot;; // //介面 AccordionPanel13

	//契約一覽表卡控-合約書名稱/卡控訊息
    Config.ContractName1 = &quot;保證金變更協議書(30萬+100萬設定)&quot;;
    Config.ContractName2 = &quot;保證金金額 需選擇，現金30萬+100萬設定。&quot;;
    Config.ContractName3 = &quot;因保證金金額 選擇，30萬+100萬設定。&quot;;

    Config.ContractName4 = &quot;保證金變更協議書(200萬設定)&quot;;
    Config.ContractName5 = &quot;保證金金額 需選擇，200萬設定。&quot;;
    Config.ContractName6 = &quot;因保證金金額 選擇，200萬設定。&quot;;

    Config.ContractName7 = &quot;保證人變更協議書(無連保人.60萬現金)&quot;;
    Config.ContractName8 = &quot;連保人金額 需選擇，無連保人(現金60萬)&quot;;
    Config.ContractName9 = &quot;因連保人金額 選擇 [無連保人(現金60萬)]。&quot;;

    Config.ContractName10 = &quot;保證人變更協議書(100萬抵押權)&quot;;
    Config.ContractName11 = &quot;連保人金額 需選擇，無連保人(100萬設定)&quot;;
    Config.ContractName12 = &quot;因連保人金額 選擇 [無連保人(100萬設定)]。&quot;;
    
    Config.ContractName13 = &quot;教育訓練費稅金收據&quot;;
    Config.ContractName14 = &quot;加盟金收據&quot;;

	Config.ContractName15 = &quot;複數特別協議書&quot;;
    Config.ContractName16 = &quot;店型勾選複數，需選擇：&quot;;
    Config.ContractName17 = &quot;店型未勾選複數 不需選擇：&quot;;
	Config.ContractName18 = &quot;存貨報廢補助協議書&quot;;
	return Config;
}
//本約簽呈-合約填寫-預設資料-----------------------------------------------------------------------------------------------------------------SetEditContractInitData
function SetEditContractInitData(pForm){//初始化資料
	if(pForm == null) return false;
	var cmbStoreType = pForm.getValue(&quot;cmbStoreType&quot;);//類別.新進.複數...
	//Init Data 預設值 設定
	var Config = getConfig();
	var StoreType1 = Config.StoreType1;//新進
	var StoreType2 = Config.StoreType2;//複數
	var StoreType3 = Config.StoreType3;//契約期滿續約
    var StoreType4 = Config.StoreType4;//移店已續約
    var StoreType5 = Config.StoreType5;//移店未續約
    var StoreType6 = Config.StoreType6;//FC店型變更
    var StoreType7 = Config.StoreType7;//機構

	var OpenStoreMonth = Config.OpenStoreMonth; //K專案營業激勵獎金協議書，自開店日起之次月起__個月
	var GrossProfit = Config.GrossProfit; //K專案營業激勵獎金協議書，之每月營業總毛利 ％作為補助乙方營業之激勵獎勵金。
	var bonus = Config.bonus; // 員工激勵獎金協議書，%作為員工加盟激勵獎金。
	var GrassTax = Config.GrassTax;// 教育訓練費稅金收據，預設金額 5000
    var LBAAmt = Config.LBAAmt;//　薪傳獎勵金協議書，獎勵金
    var PSAEATF = Config.PSAEATF;//　複數特別協議書-教育訓練費
	if(StoreType1.equals(cmbStoreType)	//新進
	|| StoreType2.equals(cmbStoreType)	//複數
    || StoreType3.equals(cmbStoreType)	//契約期滿續約
    || StoreType4.equals(cmbStoreType)	//移店已續約
    || StoreType5.equals(cmbStoreType)	//移店未續約
    || StoreType6.equals(cmbStoreType)	//FC店型變更
    || StoreType7.equals(cmbStoreType)	//機構
	){
        //顯示使用-每次開啟帶入
        Form.setValue(&quot;txtSignatoryName&quot;,pForm.getValue(&quot;txtSignatorySC&quot;));//續約特別協議書-乙方
        Form.setValue(&quot;txtRSCNF&quot;,pForm.getValue(&quot;txtStoreNoSC&quot;) + &quot; &quot; + pForm.getValue(&quot;txtStoreNameSC&quot;));//續約特別協議書-新加盟店
        Form.setValue(&quot;txtSignatoryName2&quot;,pForm.getValue(&quot;txtSignatorySC&quot;));//複數特別協議書-乙方
		
		//複數特別協議書
		/*var cmbPluralStr1 = Form.getComponent(&quot;cmbPluralStr1&quot;);
		var cmbPluralStr2 = Form.getComponent(&quot;cmbPluralStr2&quot;);
		cmbPluralStr1.removeAllItems();
		cmbPluralStr2.removeAllItems();
		cmbPluralStr1.addItem(&quot;&quot;);
		cmbPluralStr1.addItem(&quot;之負責人所成立之&quot; + pForm.getValue(&quot;txtSignatorySC&quot;));
		cmbPluralStr2.addItem(&quot;&quot;);
		cmbPluralStr2.addItem(&quot;、『全家便利商店委任經營契約』&quot;);
		cmbPluralStr2.addItem(&quot;、3FC『全家便利商店加盟契約』&quot;);
		cmbPluralStr2.addItem(&quot;、『全家便利商店委任經營契約』、3FC「全家便利商店加盟契約』&quot;);*/
		
		var txtPluralStr1 = pForm.getValue(&quot;txtPluralStr1SC&quot;);
		var txtPluralStr2 = pForm.getValue(&quot;txtPluralStr2SC&quot;);
		Form.setValue(&quot;txtPluralStr1&quot;,txtPluralStr1);
		Form.setValue(&quot;txtPluralStr2&quot;,txtPluralStr2);
		/*var cmbPluralStr1 = Form.getComponent(&quot;cmbPluralStr1&quot;);
		var cmbPluralStr2 = Form.getComponent(&quot;cmbPluralStr2&quot;);
		if(cmbPluralStr1.getSelectedIndex() == -1){
			cmbPluralStr1.setSelectedIndex(0);
		}
		if(cmbPluralStr2.getSelectedIndex() == -1){
			cmbPluralStr2.setSelectedIndex(0);
		}*/

        //資料初始化-店號是空的(表示第1次開啟)
		var txtStoreNo = Form.getValue(&quot;txtStoreNo&quot;);
		if(&quot;&quot;.equals(txtStoreNo)){
			//設定店舖店號
			Form.setValue(&quot;txtStoreNo&quot;,pForm.getValue(&quot;txtStoreNo&quot;));
			txtStoreNo = Form.getValue(&quot;txtStoreNo&quot;);
			//本約
			//承租人
			var cmbStoreType = pForm.getValue(&quot;cmbStoreType&quot;);
			var cmbStoreType2 = pForm.getValue(&quot;cmbStoreType2&quot;);
			if(&quot;1FC-A&quot;.equals(cmbStoreType2))
				Form.setValue(&quot;chkLessee1&quot;,&quot;true&quot;);
			//店舖Layout
			Form.setValue(&quot;AtchLayout&quot;,pForm.getValue(&quot;AtchLayout&quot;));
			
			//讓渡金協議書
			Form.setValue(&quot;txtTransferMoney&quot;,pForm.getValue(&quot;txtTransferMoney&quot;));
			
			//K專案營業激勵獎金協議書
			Form.setValue(&quot;txtOpenStoreMonth&quot;,OpenStoreMonth);
			Form.setValue(&quot;txtGrossProfit&quot;,GrossProfit);

			//員工激勵獎金協議書
			Form.setValue(&quot;txtbonus&quot;,bonus);
            //薪傳獎勵金協議書
            Form.setValue(&quot;txtLBAAmt&quot;,LBAAmt);
            //複數特別協議書-教育訓練費
            Form.setValue(&quot;txtPSAEATF&quot;,PSAEATF);
			//保證金收據
			var cmbMargin = pForm.getComponent(&quot;cmbMargin&quot;);
			var cmbGuarantor = pForm.getComponent(&quot;cmbGuarantor&quot;);
			var txtMarginProvision = Form.getValue(&quot;txtMarginProvision&quot;);
			//if(!&quot;&quot;.equals(txtMarginProvision)){
				var Margin = cmbMargin.getSelectedIndex();
				var Guarantor = cmbGuarantor.getSelectedIndex();
				if(Margin == 1)Margin = 60;
				else if(Margin == 2) Margin = 30;
				else Margin = 0;
				
				if(Guarantor == 2)Guarantor = 60;
				else Guarantor = 0;

				var MarginAmount = (Margin + Guarantor) * 10000;
				//移轉金額處理
				if(StoreType3.equals(cmbStoreType)	//契約期滿續約
				|| StoreType4.equals(cmbStoreType)	//移店已續約
				|| StoreType5.equals(cmbStoreType)	//移店未續約
				|| StoreType6.equals(cmbStoreType)	//FC店型變更
				){
					var txtMarginTransferAmt = parseInt(pForm.getComponent(&quot;txtMarginTransferAmt&quot;),10);
					if(&quot;NaN&quot;.equals(txtMarginTransferAmt))txtMarginTransferAmt = 0;
					MarginAmount -= txtMarginTransferAmt;
				}
				//移轉金額處理End
				if(MarginAmount == 0)Form.setValue(&quot;txtMarginProvision&quot;,&quot;&quot;);
				else Form.setValue(&quot;txtMarginProvision&quot;,MarginAmount + &quot;&quot;);
			//}
			//教育訓練費稅金收據
			Form.setValue(&quot;txtGrassTax&quot;,GrassTax);
			//讓渡金收據
			var txtTransferMoney = (pForm.getValue(&quot;txtTransferMoney&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;);
			txtTransferMoney = (parseFloat(txtTransferMoney) * 1.05).toFixed(0) + &quot;&quot;;
			Form.setValue(&quot;txtTransferMoney2&quot;,txtTransferMoney);
			//擔保金收據
			var txtSecurityDeposit = (pForm.getValue(&quot;txtSecurityDeposit&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;);
			txtSecurityDeposit = parseInt(txtSecurityDeposit,10);
			if(&quot;NaN&quot;.equals(txtSecurityDeposit))txtSecurityDeposit = 0;
			//移轉金額處理
			if(StoreType3.equals(cmbStoreType)	//契約期滿續約
			|| StoreType4.equals(cmbStoreType)	//移店已續約
			|| StoreType5.equals(cmbStoreType)	//移店未續約
			|| StoreType6.equals(cmbStoreType)	//FC店型變更
			){
				var txtSecurityTransferAmt = parseInt(pForm.getComponent(&quot;txtSecurityTransferAmt&quot;),10);
				if(&quot;NaN&quot;.equals(txtSecurityTransferAmt))txtSecurityTransferAmt = 0;
				txtSecurityDeposit -= txtSecurityTransferAmt;
			}
			if(txtSecurityDeposit &lt;= 0)Form.setValue(&quot;txtSecurityDeposit&quot;,txtSecurityDeposit+&quot;&quot;);
			else Form.setValue(&quot;txtSecurityDeposit&quot;,txtSecurityDeposit+&quot;&quot;);
		}
		//店舖主檔建物門牌地址
		var tblStoreAddress = Form.getComponent(&quot;tblStoreAddress&quot;);
		if(tblStoreAddress.getRowList().size()&lt;=0 &amp;&amp; !&quot;&quot;.equals(txtStoreNo)){
			var StoreAddress = Client.SQLloadValue(&quot;select ADDRESS from [F_pbmstor] where Store_No = &apos;&quot; + txtStoreNo + &quot;&apos;&quot;);
			if(StoreAddress.size()&gt;0){
				var tbAddress = new java.util.Vector();
				for(var i=0;i&lt;StoreAddress.size();i++){
					var hm = new java.util.HashMap();
					hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
					hm.put(&quot;ITEM2&quot;,StoreAddress.get(i).get(&quot;ADDRESS&quot;));
					tbAddress.add(hm);
				}
				tblStoreAddress.setRowList(tbAddress);
			}
		}
	}
	return true;
}
//本約簽呈-合約填寫---OpenFormUi----------------------------------------------------------------------------------------------------------------
function SetEditContractUI(pForm){
	if(pForm == null) return false;
	
	var Config = getConfig();
	//參數初始化
	//參數初始化-合約名稱
	var PaName1 = Config.PaName1;
	var PaName2 = Config.PaName2;
	var PaName3 = Config.PaName3;
	var PaName4 = Config.PaName4;
	var PaName5 = Config.PaName5;
	var PaName6 = Config.PaName6;
	var PaName7 = Config.PaName7;
	var PaName8 = Config.PaName8;
	var PaName9 = Config.PaName9;
	var PaName10 = Config.PaName10;
    var PaName11 = Config.PaName15;//薪傳保險補助金協議書
    var PaName12 = Config.PaName16;//薪傳獎勵金協議書
    var PaName13 = Config.PaName17;//續約特別協議書
    var PaName14 = Config.PaName11;//複數特別協議書

	Form.getComponent(&quot;btnCreateNewPdf&quot;).setVisible(false);//立即產生合約按鈕
	//設定顯示區塊
	var ContractNameVec = getContractNameList(pForm.getArtInstance());//合約名稱列表
	var EditContractNum = 14;
	for(var i=1;i&lt;=EditContractNum;i++)Form.getComponent(&quot;AccordionPanel&quot;+i).setVisible(false);
	if(ContractNameVec.size()&gt;0){
		for(var i=0;i&lt;ContractNameVec.size();i++){
			switch(ContractNameVec.get(i)+&quot;&quot;){
				case PaName1: Form.getComponent(&quot;AccordionPanel1&quot;).setVisible(true);
					break;
				case PaName2: Form.getComponent(&quot;AccordionPanel2&quot;).setVisible(true);
					break;
				case PaName3: Form.getComponent(&quot;AccordionPanel3&quot;).setVisible(true);
					break;
				case PaName4: Form.getComponent(&quot;AccordionPanel4&quot;).setVisible(true);
					break;
				case PaName5: Form.getComponent(&quot;AccordionPanel5&quot;).setVisible(true);
					break;
				case PaName6: Form.getComponent(&quot;AccordionPanel6&quot;).setVisible(true);
					break;
				case PaName7: Form.getComponent(&quot;AccordionPanel7&quot;).setVisible(true);
					break;
				case PaName8: Form.getComponent(&quot;AccordionPanel8&quot;).setVisible(true);
					break;
				case PaName9: Form.getComponent(&quot;AccordionPanel9&quot;).setVisible(true);
					break;
				case PaName10: Form.getComponent(&quot;AccordionPanel10&quot;).setVisible(true);
					break;
                case PaName11: Form.getComponent(&quot;AccordionPanel11&quot;).setVisible(true);
					break;
                case PaName12: Form.getComponent(&quot;AccordionPanel12&quot;).setVisible(true);
					break;
                case PaName13: Form.getComponent(&quot;AccordionPanel13&quot;).setVisible(true);
					break;
                case PaName14: Form.getComponent(&quot;AccordionPanel14&quot;).setVisible(true);
					break;
				default :
			}
		}
	}
	
	//各欄位顯示控制
	var AP1Flag = false;//本約
	var AP1Flag_Layout = false;//本約-Layout
	var AP2Flag = false;//附帶契約
	var AP3Flag = false;//　讓渡金協議書
	var AP4Flag = false;//　K專案營業激勵獎金協議書
	var AP5Flag = false;//　員工激勵獎金協議書
	var AP6Flag = false;//　保證金收據
	var AP7Flag = false;//　加盟金收據
	var AP8Flag = false;//　草約金收據
	var AP9Flag = false;//　讓渡金收據
	var AP10Flag = false;//　擔保金收據
    var AP11Flag = false;//薪傳保險補助金協議書
    var AP12Flag = false;//薪傳獎勵金協議書
    var AP13Flag = false;//續約特別協議書
    var AP14Flag = false;//複數特別協議書
	
	var ppForm = pForm.getParentForm();
	if(ppForm != null){//會辦單
	
		var addSignDepID = ppForm.getValue(&quot;addSignDepID&quot;);
		if(&quot;DEPC_TFM_G180&quot;.equals(addSignDepID)){//法遵
			Form.getComponent(&quot;btnCreateNewPdf&quot;).setVisible(true);//立即產生合約按鈕
			AP1Flag = true;
			AP1Flag_Layout = true;
			AP2Flag = true;
			AP3Flag = true;
			AP4Flag = true;
			AP5Flag = true;
			AP6Flag = true;
			AP7Flag = true;
			AP8Flag = true;
			AP9Flag = true;
			AP10Flag = true;
            AP11Flag = true;
            AP12Flag = true;
            AP13Flag = true;
            AP14Flag = true;
		}else if(&quot;DEPC_TFM_U120&quot;.equals(addSignDepID)){//開發
			Form.getComponent(&quot;btnCreateNewPdf&quot;).setVisible(true);//立即產生合約按鈕
			AP1Flag_Layout = true;
			AP3Flag = true;
			AP4Flag = true;
			AP5Flag = true;
			AP6Flag = true;
			AP7Flag = true;
			AP8Flag = true;
			AP9Flag = true;
			AP10Flag = true;
            AP11Flag = true;
            AP12Flag = true;
            AP13Flag = true;
            AP14Flag = true;
		}
		
	}else{//主單
		var Task = pForm.getCurrentTask();
		if(Task != null){
			var ProID = Task.getProcessID();
			if(&quot;PRO00011636597116252&quot;.equals(ProID) ||
				&quot;PRO00021637047875003&quot;.equals(ProID)){ // 申請人
				AP1Flag_Layout = true;
				AP3Flag = true;
				AP4Flag = true;
				AP5Flag = true;
				AP6Flag = true;
				AP7Flag = true;
				AP8Flag = true;
				AP9Flag = true;
				AP10Flag = true;
                AP11Flag = true;
                AP12Flag = true;
			}
		}
	}
	
	//本約
	Form.getComponent(&quot;txtStoreNo&quot;).setEnabled(false);
	Form.getComponent(&quot;tblStoreAddress&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;chkLessee1&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;chkLessee2&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtLessee2&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtSY&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtSM&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtSD&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtEY&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtEM&quot;).setEnabled(AP1Flag);
	Form.getComponent(&quot;txtED&quot;).setEnabled(AP1Flag);
	
	Form.getComponent(&quot;AtchLayout&quot;).setEnabled(AP1Flag_Layout);

	//承租人
	if(AP1Flag){
		if(&quot;true&quot;.equals(Form.getValue(&quot;chkLessee2&quot;))){
			Form.getComponent(&quot;txtLessee2&quot;).setEnabled(true);
		}else{
			Form.getComponent(&quot;txtLessee2&quot;).setEnabled(false);
		}
	}
	//附帶契約
	Form.getComponent(&quot;rdoStoreType1&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;rdoStoreType2&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsY&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsM&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsD&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsT&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsH&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsP&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtStoreInsO&quot;).setEnabled(AP2Flag);
	Form.getComponent(&quot;txtSpecialEvents&quot;).setEnabled(AP2Flag);
	//讓渡金協議書
	Form.getComponent(&quot;txtTransferMoney&quot;).setEnabled(AP3Flag);
	//K專案營業激勵獎金協議書
	Form.getComponent(&quot;txtOpenStoreMonth&quot;).setEnabled(AP4Flag);
	Form.getComponent(&quot;txtGrossProfit&quot;).setEnabled(AP4Flag);
	//員工激勵獎金協議書
	Form.getComponent(&quot;txtbonusSY&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonusSM&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonusSD&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonusEY&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonusEM&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonusED&quot;).setEnabled(AP5Flag);
	Form.getComponent(&quot;txtbonus&quot;).setEnabled(AP5Flag);
    //薪傳保險補助金協議書
    Form.getComponent(&quot;txtLISAOS1&quot;).setEnabled(AP11Flag);
    Form.getComponent(&quot;txtLISARC1&quot;).setEnabled(AP11Flag);
    //薪傳獎勵金協議書
    Form.getComponent(&quot;txtLBAOS1&quot;).setEnabled(AP12Flag);
    Form.getComponent(&quot;txtLBARC1&quot;).setEnabled(AP12Flag);
    Form.getComponent(&quot;txtLBAAmt&quot;).setEnabled(AP12Flag);
    //續約特別協議書
    Form.getComponent(&quot;txtSignatoryName&quot;).setEnabled(false);//固定不可編輯-顯示用
    Form.getComponent(&quot;txtRSCNF&quot;).setEnabled(false);//固定不可編輯-顯示用
    Form.getComponent(&quot;txtRSCOFS&quot;).setEnabled(AP13Flag);
    //複數特別協議書
    Form.getComponent(&quot;txtSignatoryName2&quot;).setEnabled(false);//固定不可編輯-顯示用
    Form.getComponent(&quot;tblPSAOS&quot;).setEnabled(AP14Flag);
    Form.getComponent(&quot;txtPSAEATF&quot;).setEnabled(AP14Flag);
	Form.getComponent(&quot;txtPluralStr1&quot;).setEnabled(AP14Flag);
	Form.getComponent(&quot;txtPluralStr2&quot;).setEnabled(AP14Flag);
    //保證金收據
	Form.getComponent(&quot;txtMarginProvision&quot;).setEnabled(AP6Flag);
	//加盟金收據
	Form.getComponent(&quot;txtReduceAmount1&quot;).setEnabled(AP7Flag);
	Form.getComponent(&quot;txtReduceAmount2&quot;).setEnabled(AP7Flag);
	Form.getComponent(&quot;txtOpenStoreAmount&quot;).setEnabled(AP7Flag);
	//草約金收據
	Form.getComponent(&quot;txtGrassTax&quot;).setEnabled(AP8Flag);
	//讓渡金收據
	Form.getComponent(&quot;txtTransferMoney2&quot;).setEnabled(AP9Flag);
	Form.getComponent(&quot;txtTransferMoney2Split&quot;).setEnabled(AP9Flag);
	//擔保金收據
	Form.getComponent(&quot;txtSecurityDeposit&quot;).setEnabled(AP10Flag);

}

//[草約簽呈/本約簽呈](會辦單)---okAction---------------------------------------------------------------------------------------------------------------
function ChkContractEdit(ArtIns,From){//From: 0 主單(申請人), 1 會辦開發, 2 會辦法遵
	var Errmsg = &quot;&quot;;
	var ArtID = ArtIns.getArtifactID();
	var cmbStoreType = ArtIns.getAppValue(&quot;cmbStoreType&quot;);//類別.新進.複數...
	var tblContractListCount = ArtIns.getAppDataMap().get(&quot;tblContractList&quot;).size();
	if(&quot;ART00591636522248424&quot;.equals(ArtID) &amp;&amp; tblContractListCount &gt; 0){//草約
		if(From == 2){
			//會辦法遵
			if(&quot;複數&quot;.equals(cmbStoreType)){
				var tblStoreList = ArtIns.getAppDataMap().get(&quot;tblStoreList&quot;);
				if(tblStoreList.size() == 0)Errmsg += &quot;[草約簽呈]-店型為複數，原店鋪不可為空\n&quot;;
			}
		}
	}else if(&quot;ART00001636444102368&quot;.equals(ArtID) &amp;&amp; tblContractListCount &gt;0){//本約
		var Config = getConfig();
		//參數初始化
		var StoreType1 = Config.StoreType1;//新進
		var StoreType2 = Config.StoreType2;//複數
		var StoreType3 = Config.StoreType3;//契約期滿續約
		var StoreType4 = Config.StoreType4;//
		var StoreType5 = Config.StoreType5;//
		var StoreType6 = Config.StoreType6;//
		var StoreType7 = Config.StoreType7;//機構

		var KopenStoreMonthMax = Config.KopenStoreMonthMax;//K專案-月份最大值
		var KGrossProfitMax = Config.KGrossProfitMax;//K專案-毛利最大值
		var bonusMax = Config.bonusMax;//員工激勵-營業總毛利加計最大值
		
		//參數初始化-合約名稱
		var PaName1 = Config.PaName1;
		var PaName2 = Config.PaName2;
		var PaName3 = Config.PaName3;
		var PaName4 = Config.PaName4;
		var PaName5 = Config.PaName5;
		var PaName6 = Config.PaName6;
		var PaName7 = Config.PaName7;
		var PaName8 = Config.PaName8;
		var PaName9 = Config.PaName9;
		var PaName10 = Config.PaName10;
		var PaName12 = Config.PaName12;

		var PaName15 = Config.PaName15;//薪傳保險補助金協議書
		var PaName16 = Config.PaName16;//薪傳獎勵金協議書
		var PaName17 = Config.PaName17;//續約特別協議書
		var PaName11 = Config.PaName11;//複數特別協議書
		var PaName18 = Config.PaName18;//新接店特別契約
		
		//開始執行
		if(StoreType1.equals(cmbStoreType)	//新進
		|| StoreType2.equals(cmbStoreType)	//複數
		//|| true //目前先開放全部
		){
			var txtEditContractInsID = ArtIns.getAppValue(&quot;txtEditContractInsID&quot;);
			if(&quot;&quot;.equals(txtEditContractInsID)){
				Errmsg += &quot;[本約簽呈]-請於[契約一覽表]中合約內容進行[合約填寫]\n&quot;;
			}else{
				var tabStr = &quot;\t&quot;;
				var ContractArtIns = Client.getArtInstance(txtEditContractInsID);
				if(ContractArtIns != null){
					var ContractMsg1 = &quot;&quot;;
					var ContractNameVec = getContractNameList2(ArtIns);
					
					if(ContractNameVec.indexOf(PaName1) != -1){//本約------------------------------------------------------------------------
						if(From == 2){
							//建物門牌
							var tblStoreAddress = ContractArtIns.getAppDataMap().get(&quot;tblStoreAddress&quot;);
							var tblStoreAddressFlag = true;
							for(var i=0;i&lt;tblStoreAddress.size();i++){
								var chk = tblStoreAddress.get(i).get(&quot;ITEM1&quot;);
								if(&quot;true&quot;.equals(chk)){
									tblStoreAddressFlag = false;
								}
							}
							if(tblStoreAddressFlag)ContractMsg1 += &quot;請勾選 店舖建物之門牌.\n&quot;;
							//承租人
							var chkLessee1 = ContractArtIns.getAppValue(&quot;chkLessee1&quot;);
							var chkLessee2 = ContractArtIns.getAppValue(&quot;chkLessee2&quot;);
							var txtLessee2 = ContractArtIns.getAppValue(&quot;txtLessee2&quot;);
							if(&quot;false&quot;.equals(chkLessee1) &amp;&amp; &quot;false&quot;.equals(chkLessee2)){
								ContractMsg1 += tabStr + &quot;請勾選 承租人.\n&quot;;
							}else if(&quot;true&quot;.equals(chkLessee2) &amp;&amp; &quot;&quot;.equals(txtLessee2)){
								ContractMsg1 += tabStr + &quot;勾選承租人其他 請填寫承租人.\n&quot;;
							}
							//租賃期間
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSY&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSM&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSD&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtEY&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtEM&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtED&quot;))
							){
								ContractMsg1 += tabStr + &quot;請填寫 租賃期間.\n&quot;;
							}else{
								var SDate = (parseInt(ContractArtIns.getAppValue(&quot;txtSY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtSM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtSD&quot;);
								var EDate = (parseInt(ContractArtIns.getAppValue(&quot;txtEY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtEM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtED&quot;);
								if(!ChkDateTime(SDate) ||
								!ChkDateTime(EDate)
								){
									ContractMsg1 += tabStr + &quot;租賃期間 格式不正確(請填數字).\n&quot;;
								}else if(EDate &lt; SDate){
									ContractMsg1 += tabStr + &quot;租賃期間 結束日期 不可小於 開始日期.\n&quot;;
								}else if(parseInt(ContractArtIns.getAppValue(&quot;txtSY&quot;),10)&gt;=1000 ||
								parseInt(ContractArtIns.getAppValue(&quot;txtEY&quot;),10)&gt;=1000){
									ContractMsg1 += tabStr + &quot;租賃期間 格式不正確(請使用民國年).\n&quot;;
								}
							}
						}
						if(From == 0 || From == 1 || From == 2){
							//Layout
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;AtchLayout&quot;))){
								ContractMsg1 += tabStr + &quot;請上傳 店舖LAYOUT.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName1+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName2) != -1 &amp;&amp; From == 2){//附帶契約(法遵)------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						//開店型態
						var rdoStoreType1 = ContractArtIns.getAppValue(&quot;rdoStoreType1&quot;);
						var rdoStoreType2 = ContractArtIns.getAppValue(&quot;rdoStoreType2&quot;);
						if(&quot;false&quot;.equals(rdoStoreType1) &amp;&amp; &quot;false&quot;.equals(rdoStoreType2)){
							ContractMsg1 += tabStr + &quot;請勾選 開店型態.\n&quot;;
						}
						//店舖保險費
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsD&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;))
						){
							ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關資料.\n&quot;;
						}else{
							if(!ChkDateTime((parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtStoreInsM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtStoreInsD&quot;))
							){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關日期欄位 格式不正確(請填數字).\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;),10)&gt;=1000){
								ContractMsg1 += tabStr + &quot;第１３條（店舖保險費）相關日期欄位 格式不正確(請使用民國年).\n&quot;;
							}
							
							if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10))){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關金額欄位 格式不正確(請填數字).\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10)&gt;9 || (
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10)==0
							) ){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關金額欄位 數字需小於10，總額 不可等於0.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName2+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName3) != -1){//讓渡金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
	
						//讓渡金
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 讓渡金(未稅).\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10))){
							ContractMsg1 += tabStr + &quot;讓渡金(未稅) 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10)==0){
							ContractMsg1 += tabStr + &quot;讓渡金為0，可取消勾選讓渡金協議書或填寫讓渡金金額.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;讓渡金(未稅) 需大於0.\n&quot;;
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName3+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName4) != -1){//K專案營業激勵獎金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						
						//自開店日起之次月起月份
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 自開店日起之次月起月份\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10))){
							ContractMsg1 += tabStr + &quot;自開店日起之次月起月份 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10)&gt;KopenStoreMonthMax &amp;&amp;
						parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;自開店日起之次月起月份 範圍需於1~&quot; + KopenStoreMonthMax + &quot;之間.\n&quot;;
						}
						//毛利
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 毛利%.\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10))){
							ContractMsg1 += tabStr + &quot;毛利% 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10)&gt;KGrossProfitMax &amp;&amp;
						parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;毛利% 範圍需於1~&quot; + KGrossProfitMax + &quot;之間.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName4+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName5) != -1){//員工激勵獎金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						//日期期間
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSD&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusEM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusED&quot;))
						){
							ContractMsg1 += tabStr + &quot;請填寫 日期期間.\n&quot;;
						}else{
							var SDate = (parseInt(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusSM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusSD&quot;);
							var EDate = (parseInt(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusEM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusED&quot;);
							if(!ChkDateTime(SDate) ||
							!ChkDateTime(EDate)
							){
								ContractMsg1 += tabStr + &quot;日期期間 格式不正確(請填數字).\n&quot;;
							}else if(EDate &lt; SDate){
								ContractMsg1 += tabStr + &quot;日期期間 結束日期 不可小於 開始日期.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;),10)&gt;=1000 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;),10)&gt;=1000){
								ContractMsg1 += tabStr + &quot;日期期間 格式不正確(請使用民國年).\n&quot;;
							}
						}
						//營業總利益加計%
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonus&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 營業總利益加計%.\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10))){
							ContractMsg1 += tabStr + &quot;營業總毛利加計% 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10)&gt;bonusMax ||
						parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;營業總毛利加計% 範圍需於1~&quot; + bonusMax + &quot;之間.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName5+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName15) != -1){//薪傳保險補助金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLISAOS1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原簽約者一.\n&quot;;
						}
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLISARC1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 續簽約者一.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName15+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName16) != -1){//薪傳獎勵金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBAOS1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原簽約者一.\n&quot;;
						}
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBARC1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 續簽約者一.\n&quot;;
						}

						var txtLBAAmt = parseInt((ContractArtIns.getAppValue(&quot;txtLBAAmt&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;),10);
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBAAmt&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 獎勵金.\n&quot;;
						}else if(&quot;NaN&quot;.equals(txtLBAAmt)){
							ContractMsg1 += tabStr + &quot;獎勵金 請寫數字.\n&quot;;
						}else if(txtLBAAmt&lt;=0){
							ContractMsg1 += tabStr + &quot;獎勵金，金額需大於0.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName16+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName17) != -1){//續約特別協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtRSCOFS&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原加盟店.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName17+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName11) != -1  &amp;&amp; From == 2){//複數特別協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						var tblPSAOS = ContractArtIns.getAppDataMap().get(&quot;tblPSAOS&quot;);
						var tblPSAOSFlag = false;
						for(var i=0;i&lt;tblPSAOS.size();i++){
							var StoreNo = tblPSAOS.get(i).get(&quot;ITEM1&quot;);
							var StoreName = tblPSAOS.get(i).get(&quot;ITEM2&quot;);
							if(&quot;&quot;.equals(StoreNo) || &quot;&quot;.equals(StoreName)){
								tblPSAOSFlag = true;
								break;
							}
						}
						if(tblPSAOS.size() == 0)ContractMsg1 += &quot;請填寫 [原店鋪].\n&quot;;
						if(tblPSAOSFlag)ContractMsg1 += &quot;[原店鋪] 店號 或 店名 不可為空.\n&quot;;

						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtPSAEATF&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 教育訓練費.\n&quot;;
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName11+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName18) != -1){//新接店特別契約------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOperiod&quot;))){//第X期
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 第幾期.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOsy&quot;))){//起始年
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 起始年.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOsm&quot;))){//起始月
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 起始月.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOey&quot;))){//終止年
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 終止年.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOem&quot;))){//終止月
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 終止月.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSecurityCommittee&quot;))){//保障委任
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 保障委任.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName18+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					/*if(ContractNameVec.indexOf(PaName11) != -1){
						var chkPlural = ArtIns.getAppValue(&quot;chkPlural&quot;);//複數
						if(&quot;true&quot;.equals(chkPlural) &amp;&amp; &quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName11) + 1))){//勾選複數，無勾選複數特別協議書
							ContractMsg1 += tabStr + &quot;表單有勾選 [複數]，請勾選契約一覽表[&quot;+PaName11 +&quot;].\n&quot;;
						}else if(&quot;false&quot;.equals(chkPlural) &amp;&amp; &quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName11) + 1))){//無勾選複數，有勾選複數特別協議書
							ContractMsg1 += tabStr + &quot;表單無勾選 [複數]，請勿勾選契約一覽表[&quot;+PaName11 +&quot;].\n&quot;;
						}
					}*/

					if(ContractNameVec.indexOf(PaName6) != -1){//保證金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName6) + 1))){//無勾選保證金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [保證金金額]，請勾選契約一覽表[&quot;+PaName6 +&quot;].\n&quot;;
							}
						}else{
							//保證金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 保證金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10))){
								ContractMsg1 += tabStr + &quot;保證金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;保證金，金額需大於0.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10)&gt;=1000){
								//ContractMsg1 += tabStr + &quot;保證金，金額異常高.\n&quot;;
							}
							
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName6+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName7) != -1){//加盟金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName7) + 1))){//無勾選加盟金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [開店準備金金額]，請勾選契約一覽表[&quot;+PaName7 +&quot;].\n&quot;;
							}
						}else{
							//草約金減免
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 草約金減免.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10))){
								ContractMsg1 += tabStr + &quot;草約金減免 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10)&lt;0){
								ContractMsg1 += tabStr + &quot;草約金減免，金額需大於等於0.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10)&gt;100000){
								ContractMsg1 += tabStr + &quot;草約金減免，金額不可大於10萬.\n&quot;;
							}
							//本約金減免
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 本約金減免.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10))){
								ContractMsg1 += tabStr + &quot;本約金減免 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10)&lt;0){
								ContractMsg1 += tabStr + &quot;本約金減免，金額需大於等於0.\n&quot;;
							}else if(&quot;&quot;.equals(ContractMsg1)){//加盟金減免 = 草約金減免 + 本約金減免
								if(parseInt((ArtIns.getAppValue(&quot;txtFranchise&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;),10) != parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10) + parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10)){
									ContractMsg1 += tabStr + &quot;金額錯誤，草約金減免 + 本約金減免 需等於 加盟金減免.\n&quot;;
								}
							}
							//開店準備金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 開店準備金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10))){
								ContractMsg1 += tabStr + &quot;開店準備金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;開店準備金，金額需大於0.\n&quot;;
							}else if(&quot;&quot;.equals(ContractMsg1)){
								var txtOpenStoreAmount = parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10);//開店準備金(申請人填寫)
								var txtContractAmount = parseInt(ArtIns.getAppValue(&quot;txtContractAmount&quot;),10)*10000;//主單-本約金未稅
								var txtReduceAmount1 = parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10);//草約金減免(申請人填寫)
								var txtReduceAmount2 = parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10);//本約金減免(申請人填寫)
								var OpenStoreAmount = 0;
								if(&quot;NaN&quot;.equals(txtContractAmount))txtContractAmount = 0;
								if(txtContractAmount == 0)ContractMsg1 += tabStr + &quot;本約金(未稅) 不可為空 或為 0\n&quot;;

								if(StoreType1.equals(cmbStoreType) || StoreType2.equals(cmbStoreType) || StoreType7.equals(cmbStoreType)){
									//新進、複數、機構 規則
									//開店準備金 = (草約金10萬 - 草約金減免 + 本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免
									OpenStoreAmount = (100000 - txtReduceAmount1 + txtContractAmount - txtReduceAmount2)*0.05 + txtContractAmount - txtReduceAmount2;
								}else {
									//非新進、複數、機構 規則
									//開店準備金 = (本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免
									OpenStoreAmount = parseInt((parseFloat(txtContractAmount - txtReduceAmount2)*0.05).toFixed(0),10) + txtContractAmount - txtReduceAmount2;
								}
								if(txtOpenStoreAmount != OpenStoreAmount)
								ContractMsg1 += tabStr + &quot;開店準備金，金額有誤，請使用以下運算式檢查：\n[&quot;+StoreType1+&quot;、&quot;+StoreType2+&quot;、&quot;+StoreType7+&quot;]：開店準備金 = (草約金10萬 - 草約金減免 + 本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免\n\n[&quot;+StoreType3+&quot;、&quot;+StoreType4+&quot;、&quot;+StoreType5+&quot;、&quot;+StoreType6+&quot;]開店準備金 = (本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName7+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName8) != -1){//教育訓練費稅金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName8) + 1))){//無勾選教育訓練費稅金
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [教育訓練費稅金]，請勾選契約一覽表[&quot;+PaName8 +&quot;].\n&quot;;
							}
						}else{
							//教育訓練費稅金收據
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 教育訓練費稅金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;),10))){
								ContractMsg1 += tabStr + &quot;教育訓練費稅金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;教育訓練費稅金，金額需大於0.\n&quot;;
							}
						}
						
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName8+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName9) != -1){//讓渡金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						var txtTransferMoney2 = ContractArtIns.getAppValue(&quot;txtTransferMoney2&quot;);
						var txtTransferMoney2Split = ContractArtIns.getAppValue(&quot;txtTransferMoney2Split&quot;);
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName9) + 1))){//無勾選讓渡金收據
							
							if(!&quot;&quot;.equals(txtTransferMoney2) &amp;&amp; !&quot;0&quot;.equals(txtTransferMoney2)){
								ContractMsg1 += tabStr + &quot;有設定 [讓渡金(含稅)]，請勾選契約一覽表[&quot;+PaName9 +&quot;].\n&quot;;
							}
							if(!&quot;&quot;.equals(txtTransferMoney2Split) &amp;&amp; !&quot;0&quot;.equals(txtTransferMoney2Split)){
								ContractMsg1 += tabStr + &quot;有設定 [讓渡金分期給付(含稅)]，請勾選契約一覽表[&quot;+PaName9 +&quot;].\n&quot;;
							}
						}else{
							//讓渡金
							if(&quot;&quot;.equals(txtTransferMoney2Split) || &quot;0&quot;.equals(txtTransferMoney2Split)){
								if(&quot;&quot;.equals(txtTransferMoney2)){
									ContractMsg1 += tabStr + &quot;請填寫 讓渡金(含稅).\n&quot;;
								}else if(&quot;NaN&quot;.equals(parseInt(txtTransferMoney2,10))){
									ContractMsg1 += tabStr + &quot;讓渡金(含稅) 請寫數字.\n&quot;;
								}else if(parseInt(txtTransferMoney2,10)&lt;=0){
									ContractMsg1 += tabStr + &quot;讓渡金(含稅)，金額需大於0.\n&quot;;
								}
							}else{
								if(&quot;NaN&quot;.equals(parseInt(txtTransferMoney2Split,10))){
									ContractMsg1 += tabStr + &quot;讓渡金分期給付(含稅) 請寫數字.\n&quot;;
								}
							}
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName9+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName10) != -1){//擔保金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName10) + 1))){//無勾選擔保金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [擔保金金額]，請勾選契約一覽表[&quot;+PaName10 +&quot;].\n&quot;;
							}
						}else{
							//擔保金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 擔保金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;),10))){
								ContractMsg1 += tabStr + &quot;擔保金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;擔保金，金額需大於0.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName10+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(!&quot;&quot;.equals(Errmsg)){//------------------------------------------------------------------------
						Errmsg = &quot;本約簽呈-合約填寫：\n\n&quot; + Errmsg;
					}

					//契約一覽表卡控
					ContractMsg1 = &quot;&quot;;
					
					//存貨報廢------------------------------------------------------------------------
					var MsgFlag = false;
					var flag = true;
					for(var i=0;i&lt;ContractNameVec.size();i+=2){//存貨報廢 多版本的關係需在這卡控
						var getContractName = ContractNameVec.get(i);
						var getContractChk = ContractNameVec.get(i+1);
						if((PaName12+&quot;&quot;).equals(getContractName+&quot;&quot;)){
							MsgFlag = true;
							if(&quot;true&quot;.equals(getContractChk)){
								flag = false;
							}
						}
					}
					if(MsgFlag &amp;&amp; flag){
						ContractMsg1 += &quot;[&quot; + PaName12 + &quot;] 為必有，請勾選。&quot; + &quot;\n&quot;;
					}
					
					
					//var Config = getConfig();
					//var PaName7 = Config.PaName7;//加盟
					//var PaName8 = Config.PaName8;//草約
					//var ContractNameVec = getContractNameList2(ArtIns);
					if(ContractNameVec.indexOf(PaName7) != -1){
						if(&quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName7)+1))){
							if(ContractNameVec.indexOf(PaName8) != -1){
								if(&quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName8)+1))){
									ContractMsg1 += tabStr + &quot;[&quot; + PaName7 + &quot;]&quot; + &quot; 與 [&quot;+PaName8+&quot;] 請二擇一勾選。\n&quot;;
								}
							}
						}
					}
					
					//其他協議書------------------------------------------------------------------------
					var tblContractList = ArtIns.getAppDataMap().get(&quot;tblContractList&quot;);
					
					for(var i=0;i&lt;tblContractList.size();i++){
						var Row = tblContractList.get(i);
						var chk = Row.get(&quot;ITEM1&quot;);
						var Name = Row.get(&quot;ITEM3&quot;);
						if(&quot;其他協議書&quot;.equals(Name)){
							if(&quot;true&quot;.equals(chk)){
								if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;atchOtherContract&quot;)))ContractMsg1 += tabStr + &quot;請上傳 [其他協議書] \n&quot;;
								else if((ArtIns.getAppValue(&quot;atchOtherContract&quot;)+&quot;&quot;).indexOf(&quot;_&quot;) != -1)ContractMsg1 += tabStr + &quot;[其他協議書] 檔案名稱不可包含 [_] 字元 \n&quot;;
							}
							break;
						}
					}
					if(!&quot;&quot;.equals(ContractMsg1)){
						Errmsg = &quot;本約簽呈-契約一覽表：\n\n&quot; + ContractMsg1 + &quot;\n\n&quot; + Errmsg;
					}
				}
			}
		}

		if(StoreType3.equals(cmbStoreType) 
		|| true){//契約期滿續約
			var txtEditContractInsID = ArtIns.getAppValue(&quot;txtEditContractInsID&quot;);
			if(&quot;&quot;.equals(txtEditContractInsID)){
				Errmsg += &quot;[本約簽呈]-請於[契約一覽表]中合約內容進行[合約填寫]\n&quot;;
			}else{
				var tabStr = &quot;\t&quot;;
				var ContractArtIns = Client.getArtInstance(txtEditContractInsID);
				if(ContractArtIns != null){
					var ContractMsg1 = &quot;&quot;;
					var ContractNameVec = getContractNameList2(ArtIns);
					
					if(ContractNameVec.indexOf(PaName1) != -1){//本約------------------------------------------------------------------------
						if(From == 2){
							//建物門牌
							var tblStoreAddress = ContractArtIns.getAppDataMap().get(&quot;tblStoreAddress&quot;);
							var tblStoreAddressFlag = true;
							for(var i=0;i&lt;tblStoreAddress.size();i++){
								var chk = tblStoreAddress.get(i).get(&quot;ITEM1&quot;);
								if(&quot;true&quot;.equals(chk)){
									tblStoreAddressFlag = false;
								}
							}
							if(tblStoreAddressFlag)ContractMsg1 += &quot;請勾選 店舖建物之門牌.\n&quot;;
							//承租人
							var chkLessee1 = ContractArtIns.getAppValue(&quot;chkLessee1&quot;);
							var chkLessee2 = ContractArtIns.getAppValue(&quot;chkLessee2&quot;);
							var txtLessee2 = ContractArtIns.getAppValue(&quot;txtLessee2&quot;);
							if(&quot;false&quot;.equals(chkLessee1) &amp;&amp; &quot;false&quot;.equals(chkLessee2)){
								ContractMsg1 += tabStr + &quot;請勾選 承租人.\n&quot;;
							}else if(&quot;true&quot;.equals(chkLessee2) &amp;&amp; &quot;&quot;.equals(txtLessee2)){
								ContractMsg1 += tabStr + &quot;勾選承租人其他 請填寫承租人.\n&quot;;
							}
							//租賃期間
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSY&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSM&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSD&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtEY&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtEM&quot;))||
							&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtED&quot;))
							){
								ContractMsg1 += tabStr + &quot;請填寫 租賃期間.\n&quot;;
							}else{
								var SDate = (parseInt(ContractArtIns.getAppValue(&quot;txtSY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtSM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtSD&quot;);
								var EDate = (parseInt(ContractArtIns.getAppValue(&quot;txtEY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtEM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtED&quot;);
								if(!ChkDateTime(SDate) ||
								!ChkDateTime(EDate)
								){
									ContractMsg1 += tabStr + &quot;租賃期間 格式不正確(請填數字).\n&quot;;
								}else if(EDate &lt; SDate){
									ContractMsg1 += tabStr + &quot;租賃期間 結束日期 不可小於 開始日期.\n&quot;;
								}else if(parseInt(ContractArtIns.getAppValue(&quot;txtSY&quot;),10)&gt;=1000 ||
								parseInt(ContractArtIns.getAppValue(&quot;txtEY&quot;),10)&gt;=1000){
									ContractMsg1 += tabStr + &quot;租賃期間 格式不正確(請使用民國年).\n&quot;;
								}
							}
						}
						if(From == 0 || From == 1 || From == 2){
							//Layout
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;AtchLayout&quot;))){
								ContractMsg1 += tabStr + &quot;請上傳 店舖LAYOUT.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName1+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName2) != -1 &amp;&amp; From == 2){//附帶契約(法遵)------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						//開店型態
						var rdoStoreType1 = ContractArtIns.getAppValue(&quot;rdoStoreType1&quot;);
						var rdoStoreType2 = ContractArtIns.getAppValue(&quot;rdoStoreType2&quot;);
						if(&quot;false&quot;.equals(rdoStoreType1) &amp;&amp; &quot;false&quot;.equals(rdoStoreType2)){
							ContractMsg1 += tabStr + &quot;請勾選 開店型態.\n&quot;;
						}
						//店舖保險費
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsD&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;))
						){
							ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關資料.\n&quot;;
						}else{
							if(!ChkDateTime((parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtStoreInsM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtStoreInsD&quot;))
							){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關日期欄位 格式不正確(請填數字).\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsY&quot;),10)&gt;=1000){
								ContractMsg1 += tabStr + &quot;第１３條（店舖保險費）相關日期欄位 格式不正確(請使用民國年).\n&quot;;
							}
							
							if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)) ||
							&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10))){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關金額欄位 格式不正確(請填數字).\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)&gt;9 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10)&gt;9 || (
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsT&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsH&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsP&quot;),10)==0 &amp;&amp;
							parseInt(ContractArtIns.getAppValue(&quot;txtStoreInsO&quot;),10)==0
							) ){
								ContractMsg1 += tabStr + &quot;請填寫 第１３條（店舖保險費）相關金額欄位 數字需小於10，總額 不可等於0.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName2+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName3) != -1){//讓渡金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
	
						//讓渡金
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 讓渡金(未稅).\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10))){
							ContractMsg1 += tabStr + &quot;讓渡金(未稅) 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10)==0){
							ContractMsg1 += tabStr + &quot;讓渡金為0，可取消勾選讓渡金協議書或填寫讓渡金金額.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtTransferMoney&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;讓渡金(未稅) 需大於0.\n&quot;;
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName3+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName4) != -1){//K專案營業激勵獎金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						
						//自開店日起之次月起月份
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 自開店日起之次月起月份\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10))){
							ContractMsg1 += tabStr + &quot;自開店日起之次月起月份 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10)&gt;KopenStoreMonthMax &amp;&amp;
						parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreMonth&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;自開店日起之次月起月份 範圍需於1~&quot; + KopenStoreMonthMax + &quot;之間.\n&quot;;
						}
						//毛利
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 毛利%.\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10))){
							ContractMsg1 += tabStr + &quot;毛利% 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10)&gt;KGrossProfitMax &amp;&amp;
						parseInt(ContractArtIns.getAppValue(&quot;txtGrossProfit&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;毛利% 範圍需於1~&quot; + KGrossProfitMax + &quot;之間.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName4+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName5) != -1){//員工激勵獎金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						//日期期間
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusSD&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusEM&quot;))||
						&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonusED&quot;))
						){
							ContractMsg1 += tabStr + &quot;請填寫 日期期間.\n&quot;;
						}else{
							var SDate = (parseInt(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusSM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusSD&quot;);
							var EDate = (parseInt(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;),10)+1911) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusEM&quot;) + &quot;/&quot; + ContractArtIns.getAppValue(&quot;txtbonusED&quot;);
							if(!ChkDateTime(SDate) ||
							!ChkDateTime(EDate)
							){
								ContractMsg1 += tabStr + &quot;日期期間 格式不正確(請填數字).\n&quot;;
							}else if(EDate &lt; SDate){
								ContractMsg1 += tabStr + &quot;日期期間 結束日期 不可小於 開始日期.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtbonusSY&quot;),10)&gt;=1000 ||
							parseInt(ContractArtIns.getAppValue(&quot;txtbonusEY&quot;),10)&gt;=1000){
								ContractMsg1 += tabStr + &quot;日期期間 格式不正確(請使用民國年).\n&quot;;
							}
						}
						//營業總利益加計%
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtbonus&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 營業總利益加計%.\n&quot;;
						}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10))){
							ContractMsg1 += tabStr + &quot;營業總毛利加計% 請寫數字.\n&quot;;
						}else if(parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10)&gt;bonusMax ||
						parseInt(ContractArtIns.getAppValue(&quot;txtbonus&quot;),10)&lt;=0){
							ContractMsg1 += tabStr + &quot;營業總毛利加計% 範圍需於1~&quot; + bonusMax + &quot;之間.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName5+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName15) != -1){//薪傳保險補助金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLISAOS1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原簽約者一.\n&quot;;
						}
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLISARC1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 續簽約者一.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName15+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName16) != -1){//薪傳獎勵金協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBAOS1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原簽約者一.\n&quot;;
						}
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBARC1&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 續簽約者一.\n&quot;;
						}

						var txtLBAAmt = parseInt((ContractArtIns.getAppValue(&quot;txtLBAAmt&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;),10);
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtLBAAmt&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 獎勵金.\n&quot;;
						}else if(&quot;NaN&quot;.equals(txtLBAAmt)){
							ContractMsg1 += tabStr + &quot;獎勵金 請寫數字.\n&quot;;
						}else if(txtLBAAmt&lt;=0){
							ContractMsg1 += tabStr + &quot;獎勵金，金額需大於0.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName16+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName17) != -1 &amp;&amp; From == 2){//續約特別協議書(法遵)------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						
						if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtRSCOFS&quot;))){
							ContractMsg1 += tabStr + &quot;請填寫 原加盟店.\n&quot;;
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName17+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName11) != -1){//複數特別協議書------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						if(From == 2){//法遵
							var tblPSAOS = ContractArtIns.getAppDataMap().get(&quot;tblPSAOS&quot;);
							var tblPSAOSFlag = false;
							for(var i=0;i&lt;tblPSAOS.size();i++){
								var StoreNo = tblPSAOS.get(i).get(&quot;ITEM1&quot;);
								var StoreName = tblPSAOS.get(i).get(&quot;ITEM2&quot;);
								if(&quot;&quot;.equals(StoreNo) || &quot;&quot;.equals(StoreName)){
									tblPSAOSFlag = true;
									break;
								}
							}
							if(tblPSAOS.size() == 0)ContractMsg1 += &quot;請填寫 [原店鋪].\n&quot;;
							if(tblPSAOSFlag)ContractMsg1 += &quot;[原店鋪] 店號 或 店名 不可為空.\n&quot;;
						}

						if(From == 1){//開發
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtPSAEATF&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 教育訓練費.\n&quot;;
							}
						}

						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName11+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}

					if(ContractNameVec.indexOf(PaName18) != -1){//新接店特別契約------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOperiod&quot;))){//第X期
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 第幾期.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOsy&quot;))){//起始年
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 起始年.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOsm&quot;))){//起始月
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 起始月.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOey&quot;))){//終止年
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 終止年.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSOem&quot;))){//終止月
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 終止月.\n&quot;;
						}else if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;txtSecurityCommittee&quot;))){//保障委任
							ContractMsg1 += tabStr + &quot;請填寫 新設店特約 保障委任.\n&quot;;
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName18+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					/*if(ContractNameVec.indexOf(PaName11) != -1){
						var chkPlural = ArtIns.getAppValue(&quot;chkPlural&quot;);//複數
						if(&quot;true&quot;.equals(chkPlural) &amp;&amp; &quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName11) + 1))){//勾選複數，無勾選複數特別協議書
							ContractMsg1 += tabStr + &quot;表單有勾選 [複數]，請勾選契約一覽表[&quot;+PaName11 +&quot;].\n&quot;;
						}else if(&quot;false&quot;.equals(chkPlural) &amp;&amp; &quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName11) + 1))){//無勾選複數，有勾選複數特別協議書
							ContractMsg1 += tabStr + &quot;表單無勾選 [複數]，請勿勾選契約一覽表[&quot;+PaName11 +&quot;].\n&quot;;
						}
					}*/

					if(ContractNameVec.indexOf(PaName6) != -1){//保證金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName6) + 1))){//無勾選保證金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [保證金金額]，請勾選契約一覽表[&quot;+PaName6 +&quot;].\n&quot;;
							}
						}else{
							//保證金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 保證金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10))){
								ContractMsg1 += tabStr + &quot;保證金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;保證金，金額需大於0.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtMarginProvision&quot;),10)&gt;=1000){
								//ContractMsg1 += tabStr + &quot;保證金，金額異常高.\n&quot;;
							}
							
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName6+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName7) != -1){//加盟金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName7) + 1))){//無勾選加盟金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [開店準備金金額]，請勾選契約一覽表[&quot;+PaName7 +&quot;].\n&quot;;
							}
						}else{
							//草約金減免
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 草約金減免.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10))){
								ContractMsg1 += tabStr + &quot;草約金減免 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10)&lt;0){
								ContractMsg1 += tabStr + &quot;草約金減免，金額需大於等於0.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10)&gt;100000){
								ContractMsg1 += tabStr + &quot;草約金減免，金額不可大於10萬.\n&quot;;
							}
							//本約金減免
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 本約金減免.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10))){
								ContractMsg1 += tabStr + &quot;本約金減免 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10)&lt;0){
								ContractMsg1 += tabStr + &quot;本約金減免，金額需大於等於0.\n&quot;;
							}else if(&quot;&quot;.equals(ContractMsg1)){//加盟金減免 = 草約金減免 + 本約金減免
								if(parseInt((ArtIns.getAppValue(&quot;txtFranchise&quot;)+&quot;&quot;).split(&quot;,&quot;).join(&quot;&quot;),10) != parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10) + parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10)){
									ContractMsg1 += tabStr + &quot;金額錯誤，草約金減免 + 本約金減免 需等於 加盟金減免.\n&quot;;
								}
							}
							//開店準備金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 開店準備金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10))){
								ContractMsg1 += tabStr + &quot;開店準備金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;開店準備金，金額需大於0.\n&quot;;
							}else if(&quot;&quot;.equals(ContractMsg1)){
								var txtOpenStoreAmount = parseInt(ContractArtIns.getAppValue(&quot;txtOpenStoreAmount&quot;),10);//開店準備金(申請人填寫)
								var txtContractAmount = parseInt(ArtIns.getAppValue(&quot;txtContractAmount&quot;),10)*10000;//主單-本約金未稅
								var txtReduceAmount1 = parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount1&quot;),10);//草約金減免(申請人填寫)
								var txtReduceAmount2 = parseInt(ContractArtIns.getAppValue(&quot;txtReduceAmount2&quot;),10);//本約金減免(申請人填寫)
								var OpenStoreAmount = 0;
								if(&quot;NaN&quot;.equals(txtContractAmount))txtContractAmount = 0;
								if(txtContractAmount == 0)ContractMsg1 += tabStr + &quot;本約金(未稅) 不可為空 或為 0\n&quot;;

								if(StoreType1.equals(cmbStoreType) || StoreType2.equals(cmbStoreType) || StoreType7.equals(cmbStoreType)){
									//新進、複數、機構 規則
									//開店準備金 = (草約金10萬 - 草約金減免 + 本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免
									OpenStoreAmount = (100000 - txtReduceAmount1 + txtContractAmount - txtReduceAmount2)*0.05 + txtContractAmount - txtReduceAmount2;
								}else {
									//非新進、複數、機構 規則
									//開店準備金 = (本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免
									OpenStoreAmount = parseInt((parseFloat(txtContractAmount - txtReduceAmount2)*0.05).toFixed(0),10) + txtContractAmount - txtReduceAmount2;
								}
								if(txtOpenStoreAmount != OpenStoreAmount)
								ContractMsg1 += tabStr + &quot;開店準備金，金額有誤，請使用以下運算式檢查：\n[&quot;+StoreType1+&quot;、&quot;+StoreType2+&quot;、&quot;+StoreType7+&quot;]：開店準備金 = (草約金10萬 - 草約金減免 + 本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免\n\n[&quot;+StoreType3+&quot;、&quot;+StoreType4+&quot;、&quot;+StoreType5+&quot;、&quot;+StoreType6+&quot;]開店準備金 = (本約金(未稅) - 本約金減免) * 0.05 + 本約金(未稅)-本約金減免\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName7+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName8) != -1){//教育訓練費稅金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;

						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName8) + 1))){//無勾選教育訓練費稅金
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [教育訓練費稅金]，請勾選契約一覽表[&quot;+PaName8 +&quot;].\n&quot;;
							}
						}else{
							//教育訓練費稅金收據
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 教育訓練費稅金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;),10))){
								ContractMsg1 += tabStr + &quot;教育訓練費稅金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtGrassTax&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;教育訓練費稅金，金額需大於0.\n&quot;;
							}
						}
						
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName8+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(ContractNameVec.indexOf(PaName9) != -1){//讓渡金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						var txtTransferMoney2 = ContractArtIns.getAppValue(&quot;txtTransferMoney2&quot;);
						var txtTransferMoney2Split = ContractArtIns.getAppValue(&quot;txtTransferMoney2Split&quot;);
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName9) + 1))){//無勾選讓渡金收據
							
							if(!&quot;&quot;.equals(txtTransferMoney2) &amp;&amp; !&quot;0&quot;.equals(txtTransferMoney2)){
								ContractMsg1 += tabStr + &quot;有設定 [讓渡金(含稅)]，請勾選契約一覽表[&quot;+PaName9 +&quot;].\n&quot;;
							}
							if(!&quot;&quot;.equals(txtTransferMoney2Split) &amp;&amp; !&quot;0&quot;.equals(txtTransferMoney2Split)){
								ContractMsg1 += tabStr + &quot;有設定 [讓渡金分期給付(含稅)]，請勾選契約一覽表[&quot;+PaName9 +&quot;].\n&quot;;
							}
						}else{
							//讓渡金
							if(&quot;&quot;.equals(txtTransferMoney2Split) || &quot;0&quot;.equals(txtTransferMoney2Split)){
								if(&quot;&quot;.equals(txtTransferMoney2)){
									ContractMsg1 += tabStr + &quot;請填寫 讓渡金(含稅).\n&quot;;
								}else if(&quot;NaN&quot;.equals(parseInt(txtTransferMoney2,10))){
									ContractMsg1 += tabStr + &quot;讓渡金(含稅) 請寫數字.\n&quot;;
								}else if(parseInt(txtTransferMoney2,10)&lt;=0){
									ContractMsg1 += tabStr + &quot;讓渡金(含稅)，金額需大於0.\n&quot;;
								}
							}else{
								if(&quot;NaN&quot;.equals(parseInt(txtTransferMoney2Split,10))){
									ContractMsg1 += tabStr + &quot;讓渡金分期給付(含稅) 請寫數字.\n&quot;;
								}
							}
						}
						
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName9+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					if(ContractNameVec.indexOf(PaName10) != -1){//擔保金收據------------------------------------------------------------------------
						ContractMsg1 = &quot;&quot;;
						if(&quot;false&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName10) + 1))){//無勾選擔保金收據
							if(!&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;)) &amp;&amp; !&quot;0&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;))){
								ContractMsg1 += tabStr + &quot;有設定 [擔保金金額]，請勾選契約一覽表[&quot;+PaName10 +&quot;].\n&quot;;
							}
						}else{
							//擔保金
							if(&quot;&quot;.equals(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;))){
								ContractMsg1 += tabStr + &quot;請填寫 擔保金.\n&quot;;
							}else if(&quot;NaN&quot;.equals(parseInt(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;),10))){
								ContractMsg1 += tabStr + &quot;擔保金 請寫數字.\n&quot;;
							}else if(parseInt(ContractArtIns.getAppValue(&quot;txtSecurityDeposit&quot;),10)&lt;=0){
								ContractMsg1 += tabStr + &quot;擔保金，金額需大於0.\n&quot;;
							}
						}
						if(!&quot;&quot;.equals(ContractMsg1)){
							Errmsg += &quot;[&quot;+PaName10+&quot;]\n&quot;;
							Errmsg += ContractMsg1 + &quot;\n&quot;;
						}
					}
					
					if(!&quot;&quot;.equals(Errmsg)){//------------------------------------------------------------------------
						Errmsg = &quot;本約簽呈-合約填寫：\n\n&quot; + Errmsg;
					}

					//契約一覽表卡控
					ContractMsg1 = &quot;&quot;;
					
					//存貨報廢------------------------------------------------------------------------
					var MsgFlag = false;
					var flag = true;
					for(var i=0;i&lt;ContractNameVec.size();i+=2){//存貨報廢 多版本的關係需在這卡控
						var getContractName = ContractNameVec.get(i);
						var getContractChk = ContractNameVec.get(i+1);
						if((PaName12+&quot;&quot;).equals(getContractName+&quot;&quot;)){
							MsgFlag = true;
							if(&quot;true&quot;.equals(getContractChk)){
								flag = false;
							}
						}
					}
					if(MsgFlag &amp;&amp; flag){
						ContractMsg1 += &quot;[&quot; + PaName12 + &quot;] 為必有，請勾選。&quot; + &quot;\n&quot;;
					}
					
					
					//var Config = getConfig();
					//var PaName7 = Config.PaName7;//加盟
					//var PaName8 = Config.PaName8;//草約
					//var ContractNameVec = getContractNameList2(ArtIns);
					if(ContractNameVec.indexOf(PaName7) != -1){
						if(&quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName7)+1))){
							if(ContractNameVec.indexOf(PaName8) != -1){
								if(&quot;true&quot;.equals(ContractNameVec.get(ContractNameVec.indexOf(PaName8)+1))){
									ContractMsg1 += tabStr + &quot;[&quot; + PaName7 + &quot;]&quot; + &quot; 與 [&quot;+PaName8+&quot;] 請二擇一勾選。\n&quot;;
								}
							}
						}
					}
					
					//其他協議書------------------------------------------------------------------------
					var tblContractList = ArtIns.getAppDataMap().get(&quot;tblContractList&quot;);
					
					for(var i=0;i&lt;tblContractList.size();i++){
						var Row = tblContractList.get(i);
						var chk = Row.get(&quot;ITEM1&quot;);
						var Name = Row.get(&quot;ITEM3&quot;);
						if(&quot;其他協議書&quot;.equals(Name)){
							if(&quot;true&quot;.equals(chk)){
								if(&quot;&quot;.equals(ArtIns.getAppValue(&quot;atchOtherContract&quot;)))ContractMsg1 += tabStr + &quot;請上傳 [其他協議書] \n&quot;;
								else if((ArtIns.getAppValue(&quot;atchOtherContract&quot;)+&quot;&quot;).indexOf(&quot;_&quot;) != -1)ContractMsg1 += tabStr + &quot;[其他協議書] 檔案名稱不可包含 [_] 字元 \n&quot;;
							}
							break;
						}
					}
					if(!&quot;&quot;.equals(ContractMsg1)){
						Errmsg = &quot;本約簽呈-契約一覽表：\n\n&quot; + ContractMsg1 + &quot;\n\n&quot; + Errmsg;
					}
				}
			}
		}
	}
	return Errmsg;
}

function ChkDateTime(str){//檢查日期
	var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	if(r==null)return false;
	var d= new Date(r[1], r[3]-1, r[4]);
	return (d.getFullYear()==r[1]&amp;&amp;(d.getMonth()+1)==r[3]&amp;&amp;d.getDate()==r[4]);
}

function getContractNameList(ArtIns){//取得需列印之合約名稱
	var tblContractList = ArtIns.getAppDataMap().get(&quot;tblContractList&quot;);
	var ContractNameVec = new java.util.Vector();
	for(var i=0;i&lt;tblContractList.size();i++){
		var chk = tblContractList.get(i).get(&quot;ITEM1&quot;);
		if(&quot;true&quot;.equals(chk)){
			var ftlNo = tblContractList.get(i).get(&quot;ITEM4&quot;);
			var NoVec = Client.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_PRIMARY where FtlNo like &apos;%&quot; + ftlNo + &quot;%&apos;&quot;);
			if(NoVec.size()&gt;0){
				for(var j=0;j&lt;NoVec.size();j++){
					var FtlNoList = (NoVec.get(j).get(&quot;FtlNo&quot;)+&quot;&quot;).split(&quot;;&quot;);
					for(var k=0;k&lt;FtlNoList.length;k++){
						if(ftlNo.equals(FtlNoList[k])){
							var PriNo = (NoVec.get(j).get(&quot;No&quot;)+&quot;&quot;).split(&quot;_&quot;);
							if(PriNo.length == 4){
								var ContractNo = PriNo[3];
								var ContractVec = Client.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_CONTRACT where No = &apos;&quot; + ContractNo +&quot;&apos;&quot;);
								if(ContractVec.size()&gt;0){
									ContractNameVec.add(ContractVec.get(0).get(&quot;Name&quot;)+&quot;&quot;);
								}
							}
						}
					}
					
				}
			}
		}
	}
	return ContractNameVec;
}

function getContractNameList2(ArtIns){//取得需列印之合約名稱
	var tblContractList = ArtIns.getAppDataMap().get(&quot;tblContractList&quot;);
	var ContractNameVec = new java.util.Vector();
	for(var i=0;i&lt;tblContractList.size();i++){
		var chk = tblContractList.get(i).get(&quot;ITEM1&quot;);
		if(&quot;true&quot;.equals(chk)){
			var ftlNo = tblContractList.get(i).get(&quot;ITEM4&quot;);
			var NoVec = Client.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_PRIMARY where FtlNo like &apos;%&quot; + ftlNo + &quot;%&apos;&quot;);
			if(NoVec.size()&gt;0){
				for(var j=0;j&lt;NoVec.size();j++){
					var FtlNoList = (NoVec.get(j).get(&quot;FtlNo&quot;)+&quot;&quot;).split(&quot;;&quot;);
					for(var k=0;k&lt;FtlNoList.length;k++){
						if(ftlNo.equals(FtlNoList[k])){
							var PriNo = (NoVec.get(j).get(&quot;No&quot;)+&quot;&quot;).split(&quot;_&quot;);
							if(PriNo.length == 4){
								var ContractNo = PriNo[3];
								var ContractVec = Client.SQLloadValue(&quot;select * from BPM_SMART_CONTRACT_CONTRACT where No = &apos;&quot; + ContractNo +&quot;&apos;&quot;);
								if(ContractVec.size()&gt;0){
									ContractNameVec.add(ContractVec.get(0).get(&quot;Name&quot;)+&quot;&quot;);
									ContractNameVec.add(chk+&quot;&quot;);
								}
							}
						}
					}
					
				}
			}
		}
	}
	return ContractNameVec;
}


//本約簽呈-契約一覽表---chkTblContractList---------------------------------------------------------------------------------------
function chkTblContractList(){
    var Config = &quot;&quot;;
	var tblContractList = Form.getComponent(&quot;tblContractList&quot;);
    var selectRow = tblContractList.getSelectedRow();
	var RowList = tblContractList.getRowList();
    var hm = RowList.get(selectRow);
    var ArtID = Form.getArtifactID();
    var ErrMsg = &quot;&quot;;

    if(&quot;ART00001636444102368&quot;.equals(ArtID)){//本約簽呈
        Config = getConfig();
        var cmbMargin = Form.getComponent(&quot;cmbMargin&quot;).getSelectedIndex();
        var cmbGuarantor = Form.getComponent(&quot;cmbGuarantor&quot;).getSelectedIndex();

        var chkType = hm.get(&quot;ITEM8&quot;);
        var chk = hm.get(&quot;ITEM1&quot;);
        var Name = hm.get(&quot;ITEM3&quot;)+&quot;&quot;;
        var SysNo = hm.get(&quot;ITEM9&quot;)+&quot;&quot;;

        if(&quot;1&quot;.equals(chkType) &amp;&amp; &quot;false&quot;.equals(chk)
        ){//不可編輯
            var Flag = true;
            for(var i=0;i&lt;RowList.size();i++){//必有多版本需至少勾選1個
                var AllSysNo = RowList.get(i).get(&quot;ITEM9&quot;)+&quot;&quot;;
                if(SysNo.equals(AllSysNo) &amp;&amp; &quot;true&quot;.equals(RowList.get(i).get(&quot;ITEM1&quot;))){
                    Flag = false;
                }
            }
            if(Flag){
                ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;為必有，不可取消勾選。(多版本必須至少保留1個)\n&quot;;
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(selectRow,hm); 
            }
        }
        if(Name.indexOf(Config.ContractName1) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=2 ){//&quot;保證金變更協議書(30萬+100萬設定)&quot;
            ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName2 + &quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
        }else if(Name.indexOf(Config.ContractName4) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=3 ){//&quot;保證金變更協議書(200萬設定)&quot;
            ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName5 + &quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
        }
        var cmbGuarantor = Form.getComponent(&quot;cmbGuarantor&quot;).getSelectedIndex();
        if(Name.indexOf(Config.ContractName7) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=2 ){//&quot;保證人變更協議書(無連保人.60萬現金)&quot;
            ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot;+Config.ContractName8+&quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
        }else if(Name.indexOf(Config.ContractName10) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=3 ){//&quot;保證人變更協議書(100萬抵押權)&quot;
            ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName11 + &quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
        }
		var chkPlural = Form.getValue(&quot;chkPlural&quot;);
		var RealContractName = getRealContractName(SysNo);
		if(&quot;true&quot;.equals(chkPlural) &amp;&amp; RealContractName.indexOf(Config.ContractName15) != -1 &amp;&amp; &quot;false&quot;.equals(chk)){//複數特別協議書
            ErrMsg += &quot;[&quot; + RealContractName + &quot;]&quot; + &quot;，&quot;+Config.ContractName16+Name+&quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
            RowList.set(selectRow,hm);
        }else if(&quot;false&quot;.equals(chkPlural) &amp;&amp; RealContractName.indexOf(Config.ContractName15) != -1 &amp;&amp; &quot;true&quot;.equals(chk)){//複數特別協議書
            ErrMsg += &quot;[&quot; + RealContractName + &quot;]&quot; + &quot;，&quot;+Config.ContractName17+Name+&quot;\n&quot;;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
        }
    }else if(&quot;ART00591636522248424&quot;.equals(ArtID)){//草約簽呈
        Config = getDraftConfig();
        var chkType = hm.get(&quot;ITEM8&quot;);
        var chk = hm.get(&quot;ITEM1&quot;);
        var Name = hm.get(&quot;ITEM3&quot;)+&quot;&quot;;
        var SysNo = hm.get(&quot;ITEM9&quot;)+&quot;&quot;;

        if(&quot;1&quot;.equals(chkType) &amp;&amp; &quot;false&quot;.equals(chk)
        ){//不可編輯
            var Flag = true;
            for(var i=0;i&lt;RowList.size();i++){//必有多版本需至少勾選1個
                var AllSysNo = RowList.get(i).get(&quot;ITEM9&quot;)+&quot;&quot;;
                if(SysNo.equals(AllSysNo) &amp;&amp; &quot;true&quot;.equals(RowList.get(i).get(&quot;ITEM1&quot;))){
                    Flag = false;
                }
            }
            if(Flag){
                ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;為必有，不可取消勾選。(多版本必須至少保留1個)\n&quot;;
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(selectRow,hm); 
            }
        }
    }
    var chk = hm.get(&quot;ITEM1&quot;);
    var Name = hm.get(&quot;ITEM3&quot;)+&quot;&quot;;
    if(Name.equals(Config.OtherContract)){//其他協議書
        if(!chkIsLegal()){
            ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，僅開放法遵室(會辦)使用。\n&quot;;
            if(&quot;false&quot;.equals(chk))hm.put(&quot;ITEM1&quot;,&quot;true&quot;); 
            else hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(selectRow,hm);
            SetOtherContractUi();
        }   
    }
    if(!&quot;&quot;.equals(ErrMsg)){
        Form.showMessageDialog(ErrMsg);
        tblContractList.setRowList(RowList);
    }
    
    return true;
	
	for(var i=0;i&lt;RowList.size();i++){
		var hm = RowList.get(i);
		var chkType = hm.get(&quot;ITEM8&quot;);
		var chk = hm.get(&quot;ITEM1&quot;);
		var Name = hm.get(&quot;ITEM3&quot;)+&quot;&quot;;
		if(&quot;1&quot;.equals(chkType) &amp;&amp; &quot;false&quot;.equals(chk)
			&amp;&amp; Name.indexOf(Config.ContractName18) == -1 //存貨報廢於送出時卡控
		){//不可編輯
			ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;為必有，不可取消勾選。\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}
		
		if(Name.indexOf(Config.ContractName1) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=2 ){//&quot;保證金變更協議書(30萬+100萬設定)&quot;
			ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName2 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}else if(Name.indexOf(Config.ContractName4) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=3 ){//&quot;保證金變更協議書(200萬設定)&quot;
			ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName5 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}/*else if(Name.indexOf(Config.ContractName1) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbMargin == 2 ){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，&quot; + Config.ContractName3 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}else if(Name.indexOf(Config.ContractName4) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbMargin == 3 ){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，&quot; + Config.ContractName6 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}*/
		
		if(Name.indexOf(Config.ContractName7) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=2 ){//&quot;保證人變更協議書(無連保人.60萬現金)&quot;
			ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot;+Config.ContractName8+&quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}else if(Name.indexOf(Config.ContractName10) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=3 ){//&quot;保證人變更協議書(100萬抵押權)&quot;
			ErrMsg += &quot;[&quot; + Name + &quot;]&quot; + &quot;，&quot; + Config.ContractName11 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}/*else if(Name.indexOf(Config.ContractName7) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbGuarantor == 2 ){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，&quot; + Config.ContractName9 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}else if(Name.indexOf(Config.ContractName10) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbGuarantor == 3 ){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，&quot; + Config.ContractName12 + &quot;\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}*/
	
		/*var txtContractAmount = Form.getValue(&quot;txtContractAmount&quot;);//本約金 空或0 出 教育訓練費稅金收據 / 本約金 有值 出 加盟金收據
		if(Name.indexOf(&quot;教育訓練費稅金收據&quot;) != -1 &amp;&amp; (&quot;&quot;.equals(txtContractAmount) || &quot;0&quot;.equals(txtContractAmount)) ){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，因 本約金 為 [空] 或 [0] 需出&quot; + Name + &quot;。\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}else if(Name.indexOf(&quot;加盟金收據&quot;) != -1 &amp;&amp; !&quot;&quot;.equals(txtContractAmount) &amp;&amp; !&quot;0&quot;.equals(txtContractAmount)){
			ErrMsg += &quot;[&quot; + Name + &quot;] 不可取消勾選&quot; + &quot;，因 本約金 不為 [空] 或 [0] 需出&quot; + Name + &quot;。\n&quot;;
			hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
			RowList.set(i,hm);
		}*/
	}
	
	if(!&quot;&quot;.equals(ErrMsg)){
		Form.showMessageDialog(ErrMsg);
		tblContractList.setRowList(RowList);
	}
}
function getRealContractName(SysNo){
	try{
		var PrjNo = (SysNo+&quot;&quot;).split(&quot;_&quot;)[0];
		var NameNo = (SysNo+&quot;&quot;).split(&quot;_&quot;)[3];
		var SqlV = Client.SQLloadValue(&quot;select Name from BPM_SMART_CONTRACT_CONTRACT where No = &apos;&quot;+NameNo+&quot;&apos; and PrjNo = &apos;&quot;+PrjNo+&quot;&apos;&quot;);
		if(SqlV.size()&gt;0){
			return SqlV.get(0).get(&quot;Name&quot;)+&quot;&quot;;
		}
	}catch(ex){}

	return &quot;&quot;;
}

function SetOtherContractUi(){//其他協議書
	var tblContractList = Form.getComponent(&quot;tblContractList&quot;);
	var RowList = tblContractList.getRowList();
	var ShowFlag = false;
    var EditFlag = false;
	for(var i=0;i&lt;RowList.size();i++){
		var Row = RowList.get(i);
		var chk = Row.get(&quot;ITEM1&quot;);
		var Name = Row.get(&quot;ITEM3&quot;);
		if(&quot;其他協議書&quot;.equals(Name)){
			if(&quot;true&quot;.equals(chk)){
                ShowFlag = true;
				var Task = Form.getCurrentTask();
				if(Task != null){
					
				}else{//僅限法遵可用
					if(chkIsLegal())EditFlag = true;
				}
			}
			break;
		}
	}
	Form.getComponent(&quot;atchOtherContract&quot;).setVisible(ShowFlag);
    Form.getComponent(&quot;lblOtherContract&quot;).setVisible(ShowFlag);
    Form.getComponent(&quot;cmbContractorNum&quot;).setVisible(ShowFlag);
    Form.getComponent(&quot;lblContractorNum&quot;).setVisible(ShowFlag);
    Form.getComponent(&quot;atchOtherContract&quot;).setEnabled(EditFlag);
    Form.getComponent(&quot;lblOtherContract&quot;).setEnabled(EditFlag);
    Form.getComponent(&quot;cmbContractorNum&quot;).setEnabled(EditFlag);
    Form.getComponent(&quot;lblContractorNum&quot;).setEnabled(EditFlag);
    return EditFlag;
}
function chkIsLegal(){
	var Task = Form.getCurrentTask();
	if(Task != null){//只有會辦才可使用
		//return false;
	}
	var InsID = Form.getArtInstance().getID();
	var TskID = Client.getArtTskID(InsID);
	var Task = Client.getTask(TskID);
	var RootTask = Client.getTask(Task.getRootID());
	var ProID = Task.getProcessID();
	var EndTime = RootTask.getEndTime();
	//會辦時，法遵開啟
	if(EndTime == 0){
		var allEditTrueVec = new java.util.Vector();
		var member = Client.getCurrentMember();
		var memID = member.getID();
		var memMyID = member.getMyID();
		var rolelist = member.getRoleList();
		if(rolelist.size()&gt;0){
			for (var x = 0 ; x&lt;rolelist.size(); x++){
				var roleID = rolelist.get(x).getRoleID();
				var role = Client.getRole(roleID);
				var SignLevel =role.getSignLevel();
				var parentID = role.getParentID(); 				
				var dep = Client.getDepartment(parentID);//取得該員部門資料
				if(new java.lang.String((dep.getMyID()+&quot;&quot;)).startsWith(&quot;G18&quot;)){
					return true;
				}
			}
		}
	}
	return false;
}
//本約簽呈-契約一覽表---setContractListLimitCheck---------------------------------------------------------------------------------------
function setContractListLimitCheck(Type){//預設契約一覽表數值
	var Config = getConfig();
	var tblContractList = Form.getComponent(&quot;tblContractList&quot;);
	var RowList = tblContractList.getRowList();
	
	for(var i=0;i&lt;RowList.size();i++){
		var hm = RowList.get(i);
		var chkType = hm.get(&quot;ITEM8&quot;);
		var chk = hm.get(&quot;ITEM1&quot;);
		var Name = hm.get(&quot;ITEM3&quot;)+&quot;&quot;;
		var SysNo = hm.get(&quot;ITEM9&quot;)+&quot;&quot;;
		var cmbMargin = Form.getComponent(&quot;cmbMargin&quot;).getSelectedIndex();
		if(Name.indexOf(Config.ContractName1) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=2 ){ //&quot;保證金變更協議書(30萬+100萬設定)&quot;
            hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
            RowList.set(i,hm);
        }
		if(Name.indexOf(Config.ContractName4) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbMargin !=3 ){//&quot;保證金變更協議書(200萬設定)&quot;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}
		var cmbGuarantor = Form.getComponent(&quot;cmbGuarantor&quot;).getSelectedIndex();
		if(Name.indexOf(Config.ContractName7) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=2 ){//&quot;保證人變更協議書(無連保人.60萬現金)&quot;
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}
		if(Name.indexOf(Config.ContractName10) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; cmbGuarantor !=3 ){//保證人變更協議書(100萬抵押權)
			hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
			RowList.set(i,hm);
		}
		if(&quot;Init&quot;.equals(Type)){//初始化時套用
            if(&quot;1&quot;.equals(chkType) &amp;&amp; &quot;false&quot;.equals(chk)){//不可編輯
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
            if(Name.indexOf(Config.ContractName1) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbMargin ==2 ){//&quot;保證金變更協議書(30萬+100萬設定)&quot;
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
            if(Name.indexOf(Config.ContractName4) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbMargin ==3 ){//&quot;保證金變更協議書(200萬設定)&quot;
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
            if(Name.indexOf(Config.ContractName7) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbGuarantor ==2 ){//&quot;保證人變更協議書(無連保人.60萬現金)&quot;
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
            if(Name.indexOf(Config.ContractName10) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; cmbGuarantor ==3 ){//保證人變更協議書(100萬抵押權)
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
			var chkPlural = Form.getValue(&quot;chkPlural&quot;);
			var RealContractName = getRealContractName(SysNo);
			if(RealContractName.indexOf(Config.ContractName15) != -1 &amp;&amp; &quot;false&quot;.equals(chk) &amp;&amp; &quot;true&quot;.equals(chkPlural)){//複數
                hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
                RowList.set(i,hm);
            }
			else if(RealContractName.indexOf(Config.ContractName15) != -1 &amp;&amp; &quot;true&quot;.equals(chk) &amp;&amp; &quot;false&quot;.equals(chkPlural)){//複數
                hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
                RowList.set(i,hm);
            }
			var txtContractAmount = Form.getValue(&quot;txtContractAmount&quot;);//本約金 空或0 出 教育訓練費稅金收據 / 本約金 有值 出 加盟金收據
			if(Name.indexOf(Config.ContractName13) != -1 &amp;&amp; (&quot;&quot;.equals(txtContractAmount) || &quot;0&quot;.equals(txtContractAmount)) ){//&quot;教育訓練費稅金收據&quot;
				hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
				RowList.set(i,hm);
			}else if(Name.indexOf(Config.ContractName13) != -1 &amp;&amp; !&quot;&quot;.equals(txtContractAmount) &amp;&amp; !&quot;0&quot;.equals(txtContractAmount) ){
				hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
				RowList.set(i,hm);
			}
			
			if(Name.indexOf(Config.ContractName14) != -1 &amp;&amp; !&quot;&quot;.equals(txtContractAmount) &amp;&amp; !&quot;0&quot;.equals(txtContractAmount)){//&quot;加盟金收據&quot;
				hm.put(&quot;ITEM1&quot;,&quot;true&quot;);
				RowList.set(i,hm);
			}else if(Name.indexOf(Config.ContractName14) != -1 &amp;&amp; (&quot;&quot;.equals(txtContractAmount) || &quot;0&quot;.equals(txtContractAmount)) ){
				hm.put(&quot;ITEM1&quot;,&quot;false&quot;);
				RowList.set(i,hm);
			}
		}
	}
	tblContractList.setRowList(RowList);
}


//暫無使用-----------------------------------------------------------------------------------------------------------------------------
function AtchGetPath(Str){
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
	var pathn = &quot;C:\\AF4.0\\FileUpload\\&quot;+ArtID+&quot;\\&quot;+InsID+&quot;&quot;+officeITEM ;//來源		
	var vec = Client.SQLloadValue(&quot;select * from BPM_FLOW_CONFIG where NAME=&apos;FileUpLoad&apos;&quot;);
	if(vec.size()&gt;0){
		pathn = vec.get(0).get(&quot;VALUE&quot;)+&quot;\\&quot;+ArtID+&quot;\\&quot;+InsID+&quot;&quot;+officeITEM ;//來源	
	}
	return pathn + &quot;\\&quot; + fileName;
}
</string>
     </void>
     <void property="synopsis">
      <string>草約&amp;本約
表單UI、卡控、參數等等設定
20231128-調整本約貼條文字/複數特別協議書新增[間就甲方]、[下總稱原契約]選擇欄位 改為輸入欄位

</string>
     </void>
    </object>
   </void>
  </void>
 </object>
</java>
