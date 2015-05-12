<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<div align="center"> 
  <p>個人化頁面</p>
  <table width="70%" border="1">
    <tr> 
      <td width="50%" align="center"> <form name="form1" method="post" action="template.jsp">
          <p>閱讀樣版 </p>
          <p> 字型大小 
            <select name="select1">
              <option value="8">小</option>
              <option value="12" selected>預設</option>
              <option value="16">大</option>
              <option value="20">特大</option>
            </select>
          </p>
          <p> 字體 
            <select name="select2">
              <option value="細明體">細明體</option>
              <option value="新細明體" selected>新細明體</option>
              <option value="標楷體">標楷體</option>
              <option value="Times New Roman">Times New Roman</option>
            </select>
          </p>
          <p>文字顏色 
            <select name="select3">
              <option value="FFFFFF">白色</option>
              <option value="000000" selected>黑色</option>
              <option value="darkgreen">深綠色</option>
              <option value="lightblue ">深藍色</option>
              <option value="orange">橘色</option>
              <option value="purple">紫色</option>
              <option value="hotpink">粉紅色</option>
            </select>
          </p>
          <p>段落行距 
            <select name="select4">
              <option value="25">小</option>
              <option value="30" selected>預設</option>
              <option value="35">大</option>
              <option value="45">特大</option>
            </select>
          </p>
          <p>字元寬度 
            <select name="select5">
              <option value="-3">窄</option>
              <option value="3" selected>預設</option>
              <option value="6">寬</option>
              <option value="10">超寬</option>
            </select>
          </p>
          <p>背景顏色 
            <select name="select6">
              <option value="black">黑色</option>
              <option value="white" selected>白色</option>
              <option value="chocolate">巧克力色</option>
              <option value="lightblue ">深藍色</option>
              <option value="orange">橘色</option>
              <option value="purple">紫色</option>
              <option value="hotpink">粉紅色</option>
            </select>
          </p>
          <p> 背景圖案 
            <select name="select7">
              <option value="blank.gif" selected>無</option>
              <option value="bluebear.jpg">藍色小熊</option>
              <option value="bluestar.jpg">藍色流星</option>
              <option value="pinkstar.jpg">粉紅色流星</option>
              <option value="sunflower.gif">向日葵</option>
              <option value="bluewall.gif">藍色壁紙</option>
              <option value="pinkwall.gif">粉紅色壁紙</option>
              <option value="greenwall.gif">綠色壁紙</option>
            </select>
          </p>
          <p> 
            <input type="submit" name="Submit2" value="更動">
          </p>
        </form></td>
      <td width="50%" align="center"><form name="form2" method="post" action="password.jsp">
          <p>密碼更動</p>
          <p> 新的密碼： 
            <input type="password" name="textfield1">
          </p>
          <p> 密碼確認 ： 
            <input type="password" name="textfield2">
          </p>
          <p> 原始密碼： 
            <input type="password" name="textfield3">
          </p>
          <p> 
            <input type="submit" name="Submit222" value="更動">
          </p>
        </form></td>
    </tr>
    <tr> 
      <td><form name="form3" method="post" action="">
          <div align="center"> 
            <p>閱讀習慣</p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              每次閱讀從上次的章節繼續<br>
              <input type="radio" name="radiobutton" value="radiobutton">
              每次閱讀從頭開始</p>
            <p> 
              <input type="checkbox" name="checkbox22" value="checkbox">
              每隔 
              <input name="textfield" type="text" value="5" size="10">
              分鐘後，自動換頁</p>
            <p> 
              <input type="checkbox" name="checkbox222" value="checkbox">
              使用一次瀏覽功能 </p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              一次瀏覽所有章節</p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              一次瀏覽 
              <input name="textfield6" type="text" value="3" size="8">
              個章節<br>
            </p>
            <p> 
              <input type="submit" name="Submit23" value="更動">
            </p>
          </div>
        </form></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <div align="center">
                <p>隱私權保密</p>
                <p> 
                  <input type="checkbox" name="checkbox23" value="checkbox">
                  部落格公開</p>
                <p> 
                  <input type="checkbox" name="checkbox232" value="checkbox">
                  清除瀏覽紀錄 </p>
                <p> 
                  <input type="checkbox" name="checkbox2322" value="checkbox">
                  其他人可以看到我對每本書的註記</p>
                <p><br>
                  <input type="checkbox" name="checkbox2323" value="checkbox">
                  其他人可以回應我對每本書的註記</p>
                <p> 
                  <input type="submit" name="Submit242" value="更動">
                </p>
              </div>
              <p>&nbsp;</p>
              </div>
          </form>
        </div></td>
    </tr>
    <tr>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>環境設定</p>
              <p> 
                <input type="checkbox" name="checkbox2" value="checkbox">
                登入後，自動前往部落格 </p>
              <p> 
                <input type="submit" name="Submit24" value="更動">
              </p>
              <p>&nbsp; </p>
              <p>&nbsp;</p>
            </div>
          </form>
        </div></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>查詢設定</p>
              <p> 一次列出 
                <input name="textfield5" type="text" value="10" size="10">
                筆符合資料</p>
              <p> 
                <input type="submit" name="Submit243" value="更動">
              </p>
            </div>
          </form>
        </div></td>
    </tr>
    <tr> 
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>設定文章</p>
              <p> 
                <input type="checkbox" name="checkbox" value="checkbox">
                有人回覆文章時，自動寄信給我 </p>
              <p> 
                <input type="submit" name="Submit22" value="更動">
              </p>
            </div>
          </form>
        </div></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>會員權利</p>
              <p> 
                <input type="checkbox" name="checkbox26" value="checkbox">
                訂閱電子報 </p>
              <p> 
                <input type="submit" name="Submit245" value="更動">
              </p>
            </div>
          </form>
        </div></td>
    </tr>
  </table>


</div>