<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>少女漫畫</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" height="971" border="1" align="center" bgcolor="#FF00CC">
  <tr>
    <td width="10%" height="68">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">更改註冊資料</a>　<a href="check.jsp">查詢借閱狀況</a>　預約新書　線上試閱</p></td>
  </tr>
  <tr valign="top">
    <td><p>你好,美女</p>
        <p><a href="logout.jsp">登出</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7"><strong>少女漫畫書籍排行 </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="48"><strong>名次 </strong></td>
        <td class="tabletitle" width="85"><strong>類別 </strong></td>
        <td class="tabletitle" width="155"><strong>書名 </strong></td>
        <td class="tabletitle" width="68"><strong>最新集數 </strong></td>
        <td class="tabletitle" width="86"><strong>出版社 </strong></td>
        <td class="tabletitle" width="86"><strong>作者 </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 男女ㄑㄧㄠㄑㄧㄠ板 </td>
        <td class="tableword">20 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">津田雅美 </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 完美小姐進化論 </td>
        <td class="tableword">12 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">早川智子 </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 彩妝美人-完 </td>
        <td class="tableword">16 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">相川桃子 </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 新暗行御史 </td>
        <td class="tableword">10 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">梁慶一 </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 愛情花瓣雨 </td>
        <td class="tableword">0 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">麻見雅 </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> NANA </td>
        <td class="tableword">12 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">矢澤愛 </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 禁斷純愛 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">青乃多万 </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 接吻的聲音 </td>
        <td class="tableword">7 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">志賀乃夷 </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 幻月樓奇譚 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">今市子 </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 輝夜姬 </td>
        <td class="tableword">27 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">清水玲子 </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 五箱物語 </td>
        <td class="tableword">0 </td>
        <td class="tableword">晶晶 </td>
        <td class="tableword">今市子 </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 櫻蘭高校男公關部 </td>
        <td class="tableword">5 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">葉鳥螺子 </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 絕對達令 </td>
        <td class="tableword">6 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">渡瀨悠宇 </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 甜甜相思病 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">真木雛 </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 美女是野獸 </td>
        <td class="tableword">4 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">松本友 </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀愛情結 </td>
        <td class="tableword">9 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">中原亞矢 </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戰慄情人不設防 </td>
        <td class="tableword">25 </td>
        <td class="tableword">尚禾 </td>
        <td class="tableword">森本秀 </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 禁斷-胸中的烈焰 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">刑部真芯 </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 高危險遊戲 </td>
        <td class="tableword">15 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">葉芝真己 </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 酒店女郎18歲 </td>
        <td class="tableword">4 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">深月水脈 </td>
      </tr>
      <tr>
        <td class="tableword">21 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 十億少女 </td>
        <td class="tableword">9 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">酒井美羽 </td>
      </tr>
      <tr>
        <td class="tableword">22 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 愛情的剎那 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">屋敷由佳 </td>
      </tr>
      <tr>
        <td class="tableword">23 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 制服美少年 </td>
        <td class="tableword">14 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">森生真實 </td>
      </tr>
      <tr>
        <td class="tableword">24 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 邂逅 </td>
        <td class="tableword">2 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">茉茉奇麗 </td>
      </tr>
      <tr>
        <td class="tableword">25 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 進化系LOVERS </td>
        <td class="tableword">2 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">星野正美 </td>
      </tr>
      <tr>
        <td class="tableword">26 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀愛型錄 </td>
        <td class="tableword">28 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">永田正實 </td>
      </tr>
      <tr>
        <td class="tableword">27 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 微憂青春日記 </td>
        <td class="tableword">25 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">美幸 </td>
      </tr>
      <tr>
        <td class="tableword">28 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 天才家庭-完 </td>
        <td class="tableword">11 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">二宮知子 </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 初戀-完 </td>
        <td class="tableword">10 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">宮板香帆 </td>
      </tr>
      <tr>
        <td class="tableword">30 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 就算你看不見 </td>
        <td class="tableword">1 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">流田雅美 </td>
      </tr>
      <tr>
        <td class="tableword">31 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 10年殺人情死行 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">月嵨次美 </td>
      </tr>
      <tr>
        <td class="tableword">32 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 婆媳平行線 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">三山節子 </td>
      </tr>
      <tr>
        <td class="tableword">33 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 沈睡的夏娃 </td>
        <td class="tableword">3 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">吉田秋生 </td>
      </tr>
      <tr>
        <td class="tableword">34 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 天使X密造 </td>
        <td class="tableword">1 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">佐久間智 </td>
      </tr>
      <tr>
        <td class="tableword">35 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 越洋愛之味 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">栗原美佳 </td>
      </tr>
      <tr>
        <td class="tableword">36 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀愛調教-男公關遊戲 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">渡邊志穗 </td>
      </tr>
      <tr>
        <td class="tableword">37 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> H戀愛學園 </td>
        <td class="tableword">4 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">高田理惠 </td>
      </tr>
      <tr>
        <td class="tableword">38 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 好學生的心得 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">MIZUHO K </td>
      </tr>
      <tr>
        <td class="tableword">39 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀妹思春期 </td>
        <td class="tableword">5 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">和泉兼好 </td>
      </tr>
      <tr>
        <td class="tableword">40 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 野獸的誘惑 </td>
        <td class="tableword">40 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">鮚川未緒 </td>
      </tr>
      <tr>
        <td class="tableword">41 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 導盲犬哈比 </td>
        <td class="tableword">21 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">波間信子 </td>
      </tr>
      <tr>
        <td class="tableword">42 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 調教師 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">藤井滿 </td>
      </tr>
      <tr>
        <td class="tableword">43 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀之卵-完 </td>
        <td class="tableword">4 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">慎村怜 </td>
      </tr>
      <tr>
        <td class="tableword">44 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 純愛女僕 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">渡邊志穗 </td>
      </tr>
      <tr>
        <td class="tableword">45 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 鋼鐵玫瑰 </td>
        <td class="tableword">2 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">賴安 </td>
      </tr>
      <tr>
        <td class="tableword">46 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 我心愛的主人 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">春田菜菜 </td>
      </tr>
      <tr>
        <td class="tableword">47 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 本陣殺人事件 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">長尾文子 </td>
      </tr>
      <tr>
        <td class="tableword">48 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 甜蜜唇膏 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">彬聖子 </td>
      </tr>
      <tr>
        <td class="tableword">49 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> SPARK!火花-完 </td>
        <td class="tableword">2 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">山田也 </td>
      </tr>
      <tr>
        <td class="tableword">50 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 美女人形師 </td>
        <td class="tableword">1 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">長池智子 </td>
      </tr>
      <tr>
        <td class="tableword">51 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 東方獵人JUNKS </td>
        <td class="tableword">1 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">市東亮子 </td>
      </tr>
      <tr>
        <td class="tableword">52 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 失業愛人 </td>
        <td class="tableword">0 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">山田由祁 </td>
      </tr>
      <tr>
        <td class="tableword">53 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 美貌的願望 </td>
        <td class="tableword">5 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">寄田美幸 </td>
      </tr>
      <tr>
        <td class="tableword">54 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 官能小說 </td>
        <td class="tableword">3 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">藤井滿 </td>
      </tr>
      <tr>
        <td class="tableword">55 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 幻影天使 </td>
        <td class="tableword">16 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">高屋奈月 </td>
      </tr>
      <tr>
        <td class="tableword">56 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 最愛貴公子 </td>
        <td class="tableword">2 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">新條真由 </td>
      </tr>
      <tr>
        <td class="tableword">57 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 花縴-完 </td>
        <td class="tableword">2 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">林青慧 </td>
      </tr>
      <tr>
        <td class="tableword">58 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 愛情魔力 </td>
        <td class="tableword">2 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">通野茉理 </td>
      </tr>
      <tr>
        <td class="tableword">59 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 毒伯爵該隱 </td>
        <td class="tableword">10 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">由貴香織 </td>
      </tr>
      <tr>
        <td class="tableword">60 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"> 戀愛GOGO </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">山本小鐵 </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
