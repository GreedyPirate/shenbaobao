﻿-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: shenbaobao
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('20002',1,'G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515424639982\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1515424639982\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"_4\" name=\"UserTask\"/>\r\n    <sequenceFlow id=\"_5\" sourceRef=\"_2\" targetRef=\"_3\"/>\r\n    <sequenceFlow id=\"_6\" sourceRef=\"_3\" targetRef=\"_4\"/>\r\n    <endEvent id=\"_7\" name=\"EndEvent\"/>\r\n    <sequenceFlow id=\"_8\" sourceRef=\"_4\" targetRef=\"_7\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"40.0\" y=\"75.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"245.0\" y=\"75.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"405.0\" y=\"60.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"440.0\" y=\"175.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <di:waypoint x=\"72.0\" y=\"91.0\"/>\r\n        <di:waypoint x=\"245.0\" y=\"102.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <di:waypoint x=\"330.0\" y=\"102.5\"/>\r\n        <di:waypoint x=\"405.0\" y=\"87.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_4\" targetElement=\"_7\">\r\n        <di:waypoint x=\"456.0\" y=\"115.0\"/>\r\n        <di:waypoint x=\"456.0\" y=\"175.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('20003',1,'G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.bpmn20.xml','20001','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/test\">\r\n    <process id=\"joinProcess\" name=\"Join process\" isExecutable=\"true\">\r\n        <startEvent id=\"startevent1\" name=\"Start\">\r\n            <extensionElements>\r\n                <activiti:formProperty id=\"personId\" name=\"person id\" type=\"long\"\r\n                                       required=\"true\"></activiti:formProperty>\r\n                <activiti:formProperty id=\"compId\" name=\"company Id\" type=\"long\"\r\n                                       required=\"true\"></activiti:formProperty>\r\n            </extensionElements>\r\n        </startEvent>\r\n        <endEvent id=\"endevent1\" name=\"End\"></endEvent>\r\n        <userTask id=\"ApprovalTask\" name=\"Approval Task\"\r\n                  activiti:candidateUsers=\"${joinService.findUsers(execution)}\" isForCompensation=\"true\">\r\n            <extensionElements>\r\n                <activiti:formProperty id=\"joinApproved\" name=\"Join Approved\" type=\"enum\">\r\n                    <activiti:value id=\"true\" name=\"Approve\"></activiti:value>\r\n                    <activiti:value id=\"false\" name=\"Reject\"></activiti:value>\r\n                </activiti:formProperty>\r\n            </extensionElements>\r\n        </userTask>\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"ApprovalTask\"></sequenceFlow>\r\n        <serviceTask id=\"AutoTask\" name=\"Auto Task\"\r\n                     activiti:expression=\"${joinService.joinGroup(execution)}\"></serviceTask>\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"ApprovalTask\" targetRef=\"AutoTask\"></sequenceFlow>\r\n        <sequenceFlow id=\"flow3\" sourceRef=\"AutoTask\" targetRef=\"endevent1\"></sequenceFlow>\r\n    </process>\r\n</definitions>',0),('20004',1,'G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.myProcess_1.png','20001','塒NG\r\n\Z\n\0\0\0\rIHDR\0\0\鬨0\0\0\?\0\0\0謸轮\0\0袸DATx陧\?榎eyp*R犚b[[さ堲\?-E譜猅@﹍6沴`\?\?\?呅p	r\?惔Xi\?!淞\"\"14!BHXP丂67r鄢<搮\\6贊輽鼅象>3怀欃\?s}\?叻踤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@縒臶焲蛏[嫦\?谳w遌躸譣jj脂Y舽鬏鰾T嫿\n€0\?wn阎諺琜種鞤=艤9s^妏?翞@Ue薥橑hǒ\?\?{\0U曒靷竒+}\?€罂B盖桨g\?龝WO.妇X<雼曶髙\\\?P#伨+奊gL(过焱*織\?q\?@\r嬁髥0铿gO\?€Z\?晨才@锨劯@\?\?n1畜1!.\?\?\0\?\?獇K仦\?q\?@\r鱋輇犵cB\\\?P侢\?媻Gg\?祁鲽^>&\?:\05鑉司\?z~O€鬨瞣\?3f\?u暝.绝\?菐弧档\?8p`岩也閷3蝀{辻\?q\?|k渊Q蠖\?柉磡e舻k嬊縲\?慧銂鶚逧g燒郙7輙柩6lXq\?q +V甛Y捶\?i\?K\?X盃\?mZ1t栊M#G廃楦q憔刎馗彿 跄驎柉煜仦3\?\?\?濩锨\?穻z漪>砱蠟9b膱M\揬'O.-Z\?苒k疋臙存婼N9逭3\?\?oC陞\?-_\?=Z\?咖濄\?鏉\?\?\?z妒/混矖茖S,\\赴\?\?鯴1j渊崸漹趍瓄y;R\?_i\?枸j昸緕蹶弾?~梍^键蛩EO犬鵻\綷r脟煟瀦矧Tㄕ\?锭U镜趾骺l檊榑t袳牌\?嫗v誙W瓘桗瑔唵穤[R飦n鵍乛oG眉踌u\?\?箪f蠔yo剏/絫MKK送迻詓燵綬犽!\?鯔\0楃蘽獩}k蒿脝\r{i嗬\乗r逇噪镇\?]犤\?G崇H鰆葋r\?^鍇:鮶@祙桷\?懽欑\?i窑G+\?oO犟€j\?\?许U\?厘\?誮漺Z瞕珊A\?-7@伄篅\?跆蝢V\蝄0讻岫さ档╅poQ觏€j鵍\?许U梥崇t畗a蕯)8蒣攝;燴綬\?t鸰斟B+97{_\?o抻璺x婻oT薟\n纛hjj\Z剀軀s\?抄訍蔺稥筳Z.匆^x釁烣牄脵簂!Y綬爋\?罂虝+耸單抹黯V犌觮詵绢╆|蕻誗糠\?C喖緅Z靛b/庇秼\?\?_)谢”瘪}乛Y常Z+琢ē@镩\?枸\?M_首許燵綬狅@狅硡@铿纾畩鶳o忿Zr\?\?{霶旖鬓臛>驊鈮\'瀤}观O<必s\?;g?[<筇3\?G和 \?gNq鹆w嘉~W躳\肻r踻缟)鼠鐬k雝襂\'m戢zl\?蕽鯐║Qym\?Q鱃蛨骀\?洑毊岤J詙Qg器O\峔Zu\\<q{X軂`袪A\?;郫}粞{\?\?钖痶@莨普+\?\鮘rQ/鰒狅伙\?鳁-[V<\?\?旱档汶\?~竎%渭塐|b崇日焳鲑mz唝>覱?蓠X绢禴矿y庅揙>冼Wi熵表}u江\?\?d葠稥 \?a齵Q<`纮#怫o.昴xlX\?南~1n/壽k=曛ɑ\?坺4戛惏秙鐝z&cq▄孃熄嵑,闗聒?F崒\鸤'琼€鴃鸱\?|$^\?孫消G\?祷8抿\?\?\?\?菗邖c薩漶,廵y嫼6峻N\?鯎驑踮V曼稏枛\?交\'}鬏wC犵黩\?G疡u稅T\\y鍟-髚,[婊u9炦\?踠 nOWy\?鐪\?謺弌眭痪鰁梋f玹\?慝Q\?f跳no峳蠎Ⅰi蝽\?~O\?\?轙\?覩沲>\?豕≦Q恽\?轡椙\?跬\?{芪夛?蹩Q+峺慰忐Z趺Q尝\?fZ&驱怫歙●貝ㄣ銂G\?;n(咪駀妆\?鸎\"\?剞9,_筴篏W阐\?瀨.鰸s泠\?濫蛵势赎╓岤^苑⒕\?峞/鉸q鴓焴+{汶o銴耨顪蛸炇畞炦他腮\Z\?8鄝幥<鹄\?}{C{k\?t蠥邲>}鷉弌眭;n膱縪v\?\鬨n\?M汗C\?a卖Z\?= \?G犉髳伕譹褙iQc銂缜鞥\?廁z鵩灆o禅笶q鸇詓\?蛲\?聒蕛\?q库鰡īQ_\嶾Z\?&n?唿帊7忡峼|€8@黌\?婅nwy\鎈0y镻w蒡\?@齾x霞3傶髢wTKNM]~8烿~h挫\\\?鶃??鼦絵儆72緉岥GFP\?魉蒈y<舷泫N\?讚仦-\?苵s缇~\?;彀\?緸7o^G讁捱\?\?W亲譤{mG穥\?蛉#w(\??t>O玢[{焝ii楦?{鰈佫i淙\?:t瑕>\?\?5S躰籑\?\?\?\?r磌l\?伤X\?o\?r攌责╯\?Pl\?Q_+痆齆苻Sv蔟钧Yy衁_\?I\?处\?鰇鵟q熲\?Q#首:\?￣4N屣樋k-ｋ{蟛!U\?j舣鋓\?厲в蔨\?e梐黀\?肪靬薧穀eo垆\?鱨%\?0熱逰=D_胲鞑k桔c8篞藯//\?戗嶱彤鰡唵\?炲c\?|G8唤矺<板c玍8彏忓客箸;栀暈蠎缌+呲隬矸咿q?\?揭柩\\铙缦项鰁鎟镙鉥蚔{掇\?_舵\?\'\?韽/[W擜栞唚d/A賉\?曩椝\?k②\?膘m鴁冫惤7暎q/.{)茤\?-Q\?寚缌13[EQ{鲹@_謚Rv]P狑m爂\?梨`仂她+鞯r葵V\?f7鳉r熗\?潠鹸\?灖\?暓鈘孡網涵\?麩S>\?~\骪'O灱亊趇汾Zm鼠\?効SvQ9>帏r祭轾吠\?矔撱\n\?\?捻]侪]秳枙鲵兟Kek)\?<\?屺镦\?\?斻.\?r澡驙躎炃l萻汃鳤y~3荗t髅bl閽〕:熛电k嫣橢禞宿㎡栣鰠\?i\?F俪\?虎\?d怂涟90鰵硳蝦郰嶴\?*\?>毗\'蟹鶋7>‘^紉qU曼\?菿覗Y漀yAv徠~駴貳歐擶\Z濈%￣>螿\?	妁\?衉W靜+痐\?栦L[鍋Cy鹣	椙縔\\喞輊麲\?廁梤鋛睄实Np@碣Z籿m紅ua\?菎|9{恟燞俪酤靟谡\?\?伨M#F\?z淙戨_~^\r\?k脂\?ev\?\?z[\?喂	r$q粤9溁喔r.兿G\?5a;}]vTT乶膑N?oO\?em/怺=t栊<w~摲%齀y覜咗\?8槂PP糊痜\?耯┫\?u旰^跽闫嵥	]ny矺1\?\錦0\?A\?G箈TT乶P?踉S縶\?椉蜿鯴7崦s\?螞\?暎顙r修	[閫陘*许5闏\?檝Э羧#弆苜p\?鬀刺橄-魸\?悟\?\?]狑鲀\\CKK藠笪;锷鲱t梅/X班\?\'_^氃鄊\?+篅鑮([誽.惫郭\荺'瀤\?\揬'O^8g螠瀚V璲缩趟u蚠葏Vf螠9#\?嗍 ?K;痶@\?\?地?T\?~s9僗{9€ń件鳀r鈴猛\0\?+P篅犏€j鵍T\?衼:8燴疽U\?t\?痶@\?▋+P篅PPwa9柩>樱曤3l癵丂W姜罨锞昺mm鰶\?+V|#隹%\?鐹燱\?鬈箝{锝髋鐬{nM--戂[\?娉f蚙u\?\?鑅tLl\?賃溮W畐\?vK\?t%匈N|颈瘪澏 \?:\?\?夽?貣\0篅Ф齘媡]燬麃~KSSS\?t丯m鶺洓泧\?€@柙v燨滩%\0\?些鞞拊詔\?t丯\rknn鮉[\?澸n\?銱w[\?澸n\? j\?t丯\r2d然辠K\0龏\?-_I\?66\?伨a饽塷\?€~抿晼\?\?蹈|em橻緍\梊nt蠊齇\?_貽蓑暬V牄\?\0\?型\?\0u桄s€:t蠊@葫\?犞櫹\0辏卬>w\0▋葫\?犞櫹\0陘燦樝\0\?型\?\0u桄s€:t蠊@葫\?\?輡\頫0P乶>w\0╱鎠€鷋\?\0隊卬>w\0╱鎠€:`>w\0\?鎠€\?t蠊@葫\?\?輡\頫0P乶>w\0▋@7\?\0訟牄\?\0j濝\?\?Z桄s€:h\?\0j濝\?\?樝\0闐午>x疣髂韠洑\?徾Z[[鞑e\0牊jnnn壚\?jz詡╡\?愣èy\?\0麸謝C楌~CE鑿饱\0\?圍[	赧魒豃\0邢刀毒=蠜o!衞矃\0燜455\r|矦0`狼m\0\?鄐\?唊hhx\?\0嫡J?糑牱\?\0P洝>\?篚\?€\Z肇馗O9@頶\?\0詯<O捃茳\?馡QwD阴<~W詤9崠;\0舣著\?\琝'FHx[撍t屐r锏\?[銶MM_4h蝎\?虍\?[鞿\靄0P齎\"\?\閈Z蚊\哱r+鏆b\?+婗鲻\"錷[[[裥C7辺c1f虡7{|8鳤\?\?\0TA^\?x疣蚮\?\?聑闫嵟鯶竝a1n芨\?\?[\0z9\?\r\Z处3€#貗橛+然后\?嬛种秃鄥:\0魭靎\?Ye鼹谣K嫗鹪SO#G庫赗\0=┘$響\?蟬\?)煰2泽満乺\0袃r4{e7{O堤攥マ齜[\0z@^g^yiZ\?颩yN津|zv觖+\0繬蔍c*G朝_烤鑝鐪sNe╛瀵\0\0;\?wpyiZ5,Z磆\?錼nx\r\0谹y鵛錊笣\?*\'熒惯\?\0`\?璽勱u譣WT哟i\?鼴\r\0伛@浚3Ts:譲暑龏n髻\Z\0般侢xgó\\共獊炞.疥\?\0;\?:C祍j勺珳巛_\0v<衉跃 \?@\0(\?t\0▋@7\?\0\?衇\?\0\?傯3}5S荑眩7\?\0z@五炵\?\05.\?痋m\璡Zq闫Ym\r\0zR畤『趜\鑌0P糇\荺r<竂簍i瘎鵖O=U渢襂\?齜[\0zHkk隵MMM?\? 椬夨魎\?F寈5蝓騯m}\0鐰皣Tv絞TK=[鏁a灟摨g\?@/0`狼+C=贿鬁斔s鎉嘿7D\?ck@C絪酐聟粆i趧	6洴絣\?s\0▎\?\?\賊r\?\?X盃c铟\?]\?蠎g桤p晸芓\?淄\0U\?质扬韂霉洉+篯l\0\0簟糔=Z諷*g斲蝂檽\?77d+@?懹臇s縊*Wi{麺|v.磼s硾\?\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Z\?兄{劶-P\0\0\0\0IEND瓸`\?,1),('7502',1,'G:\\AllCodes\\springboot\\process\\target\\classes\\processes\\process.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"process\" isExecutable=\"true\">\n    <startEvent id=\"sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728\"></startEvent>\n    <userTask id=\"sid-372FE834-32FD-4962-A72A-A296D7F22357\" name=\"鎻愪氦鐢宠\"></userTask>\n    <sequenceFlow id=\"sid-FFD1DA1A-A657-4FB5-9CA6-B3D111E6C827\" sourceRef=\"sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728\" targetRef=\"sid-372FE834-32FD-4962-A72A-A296D7F22357\"></sequenceFlow>\n    <userTask id=\"sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8\" name=\"涓婁紶璧勬枡\"></userTask>\n    <sequenceFlow id=\"sid-0E2AD719-DB2E-4590-BBAF-8E1B1B7BFB8E\" sourceRef=\"sid-372FE834-32FD-4962-A72A-A296D7F22357\" targetRef=\"sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8\"></sequenceFlow>\n    <userTask id=\"sid-911B100E-A975-4B5C-BF01-B0BD73B1C5F1\" name=\"瀹℃牳\"></userTask>\n    <sequenceFlow id=\"sid-E5D7C1A1-5C7E-40DD-A4CB-645A5CDA3CDD\" sourceRef=\"sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8\" targetRef=\"sid-911B100E-A975-4B5C-BF01-B0BD73B1C5F1\"></sequenceFlow>\n    <userTask id=\"sid-BB2C0FB9-B609-4C3D-B23C-4FE849FD6EF9\" name=\"瀹℃煡閫氳繃\"></userTask>\n    <sequenceFlow id=\"sid-7FD9A3E7-6CF6-494F-8BC9-88263DD6144A\" sourceRef=\"sid-911B100E-A975-4B5C-BF01-B0BD73B1C5F1\" targetRef=\"sid-BB2C0FB9-B609-4C3D-B23C-4FE849FD6EF9\"></sequenceFlow>\n    <endEvent id=\"sid-6313A6BA-BAC7-41A3-BA5D-EDE8B69B115F\"></endEvent>\n    <sequenceFlow id=\"sid-FF968019-196B-4EC2-8F87-B4A1425770C0\" sourceRef=\"sid-BB2C0FB9-B609-4C3D-B23C-4FE849FD6EF9\" targetRef=\"sid-6313A6BA-BAC7-41A3-BA5D-EDE8B69B115F\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728\" id=\"BPMNShape_sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"145.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-372FE834-32FD-4962-A72A-A296D7F22357\" id=\"BPMNShape_sid-372FE834-32FD-4962-A72A-A296D7F22357\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"180.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8\" id=\"BPMNShape_sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"360.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-911B100E-A975-4B5C-BF01-B0BD73B1C5F1\" id=\"BPMNShape_sid-911B100E-A975-4B5C-BF01-B0BD73B1C5F1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"540.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BB2C0FB9-B609-4C3D-B23C-4FE849FD6EF9\" id=\"BPMNShape_sid-BB2C0FB9-B609-4C3D-B23C-4FE849FD6EF9\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"705.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-6313A6BA-BAC7-41A3-BA5D-EDE8B69B115F\" id=\"BPMNShape_sid-6313A6BA-BAC7-41A3-BA5D-EDE8B69B115F\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"908.5\" y=\"146.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFD1DA1A-A657-4FB5-9CA6-B3D111E6C827\" id=\"BPMNEdge_sid-FFD1DA1A-A657-4FB5-9CA6-B3D111E6C827\">\n        <omgdi:waypoint x=\"75.0\" y=\"160.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"160.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E5D7C1A1-5C7E-40DD-A4CB-645A5CDA3CDD\" id=\"BPMNEdge_sid-E5D7C1A1-5C7E-40DD-A4CB-645A5CDA3CDD\">\n        <omgdi:waypoint x=\"460.0\" y=\"160.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"160.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FF968019-196B-4EC2-8F87-B4A1425770C0\" id=\"BPMNEdge_sid-FF968019-196B-4EC2-8F87-B4A1425770C0\">\n        <omgdi:waypoint x=\"805.0\" y=\"160.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"908.5\" y=\"160.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7FD9A3E7-6CF6-494F-8BC9-88263DD6144A\" id=\"BPMNEdge_sid-7FD9A3E7-6CF6-494F-8BC9-88263DD6144A\">\n        <omgdi:waypoint x=\"640.0\" y=\"160.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"705.0\" y=\"160.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-0E2AD719-DB2E-4590-BBAF-8E1B1B7BFB8E\" id=\"BPMNEdge_sid-0E2AD719-DB2E-4590-BBAF-8E1B1B7BFB8E\">\n        <omgdi:waypoint x=\"280.0\" y=\"160.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"160.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7503',1,'G:\\AllCodes\\springboot\\process\\target\\classes\\processes\\process.process.png','7501','塒NG\r\n\Z\n\0\0\0\rIHDR\0\0\瞈0\0\0\?\0\0\0w滭3\0\0窱DATx陧\?o怎纐饑\?黗\?驩\??纃\?9\?赥襍堈&dJJPb\?穌1!1\?]B矌	魦錕\?傽\'!聠\?殜\?嫡限飵#Gˉ敾腠铖H^侕庣鯐鱹}\?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0唷%I蜩楒剡邿赧鰵\nO___r翳\?刬R鯇烏琁€麍樨眂I.桲Η\n偷k讙#G嶾\?U闥翔Y蠚4\?XD糤誃獨\?蒇踸^晍\?z殖&\?\焅Zd!T蟿\?=\?=隮揊\揬0媹\?猨)%碁殉\?i4	P偉酏罚丧擄\'琥断M鼀鼩Eb)橘鑉蟴证&5	PuKir\"泑vhkr鯜\?\?/矻,%==隮蠚预&猨)}}\?w-ぢ\\9譪橷Jz6z殖\?㊣MT識:晌桼继2睌鬺衄g=kR摎íヴY锒桼继2睌鬺衄g=kR摎皵,%衄g=隮蠚4\?X頡婏8感R姉Y&枓瀺烏琯MjR\揬0U禂.齛隶/矻,%==隮蠚预&猨)峠G捪w荦○祒檈b)橘鑉蟴证&5	PUK)\?縡慩Jz6z殖\?㊣MT逺簓3箈鈴w?E(|-^f橷Jz6z殖\?㊣MT蚏殰\?唦苦隴鈋褡X(枓瀺烏琯MjR\揬0+粩n轑F/$<Ra獐壙\?瓥挒崬醅gMjR\揬0+矓顆彧{Z-%==隮蠚预&猨)-\?张頸礬,%==隮蠚预&*簲柣\怽nc筙Jz6z殖\?㊣MTt)KI螰蟴6z证&,%c)閅翔Y蠚4\?皵,%衄g==kR\揬0枓睌鬺衄gMj$I虺憫懱\?{巘vv^叽i覮sss瞯碲ぉ╅х\?~W_酱s缥\?縯峐J芌页殉烏琁\\:漗旿\?劤洲0肔苨W榺\?耬彲腳缵Z\鋅0\?~瘊氙蟣藜9y锝鲯後\?浲&鵿>夆徆\\.9u闠荷\?绝覭/絫沟祏絢蠷2枓瀺烏琯M\ZMr\r\r\r魡C晖[抓\蘚'狩4滚妱k\?o紂辰絵類:;;\?諜3g\?[短f2欝k脂鶇k覴2枓瀺烏琯M\ZMr穚},糖px阶sW8\?\?鐬{.殚閥\?靯LZZZ\?:k)KI螰蟴殖&\?筍*\昞ng械讑ラt:y笸7搧亖浍J钧罨钩諐7鏋;44旍诘+Y穘蔹渺d\?:眱儍吒qcr崧叅._緶凜裨\?+UK蒟Jz6z殖\?i4绍!錾p鴾)>纕uu徒ls)&&&鎫}鼄\?趐槶\?\?瘪辉+o┾熥谮:轾蹡挶旚l衄g=k襤\?v顟刿囏抖豆G_\?鴕衴囐\?w抛钠\?楆懾{=2覱O\?鮭閆J芌页濽ゞ=k襤\?輟M祉\?wtt軂r脓镓眂宬\?邼x碛\?卞t嗬仼t:|-%c)閅溪猿\?i4Y弉\?耥Gb\?[|槤魅毂毧2黜埙鷩~H薯\?^\?cK蒟Jz殖*醅gM\ZM轴!vu駅b楙t馀瀎\\鼩贇>w臛c沌钠徹﹦砱螻{T諶2枓烏琂=隮揊擋黨l|＆r桀町廏eGFF2\馶r\?鎐vTKK薠|n笖W\?孀枓イg==kR揟骣扤捺)>j:>>^柍V|7銀蚐涚\?{\?俳{wRI籿\?W渚2姙j袥Je)YJz6z殖殉&5Iyo/醟\n挎\?鱵 [涚挝朊妹=葹8q鈘窧{渚\?并^\?YJ枓瀺烏ld5㊣Js{	{o岵亮敛灧唵唺;j筌礽应櫻蜒\?d瞧苧\醆n齔頤s#粆颭駦蚏矓鬺衄g\?獻MR氎K怕譐\?O骵迟\?嗂<w577\'鵿劲嬴鲄+4/麝簯遻\?a)YJz6z殖q愓\?)夙e娥驲}湮b臩赭鎘\鯸n_	K鴩6+<朢u\?醅g=k襤\?σ绛\?\?筇3?U\?侃┅1徣V褰E\'S┰揙<衲&滢U==胭鑉摎窏疸dKh闫嵱晘嶌斋W?\鱘Z侏簯荼\孿n猰)\?N\?窋衄g=難ezwh肖锉毈呟嬜葨刂璠/V鷀\?:\?颶\\7睴\Z\ZV蟔F占\?鸝\?窋衄g=難ezw愓わ睔瑓蹕w-.狈邁{w\?G叮ｃ€蠎]\?\?颩禂,%=隮蟴v愓筹本荝炢嬒\?弊^{礴6l鴔vv禸oZ茇伉飌\?&麝f)YJz殖烏\?玤遚}彞4议舄p殙囁痼d||\?嚟墘塪莺u\?仝=w档谍朐㏒晍ZqW\?廔賀矓,%=\?YYM\?z?S秔漓觋*藋换\?[坨甮焳v退/\?S丟e\'\ZO\?\?[J枓イg=\?\?獻遚5Yg僬匔f|T对o\?鉴\?\?we2檻灋灢瀊汶q憬鱷\?枓)閅\?\?萰吟XM症pp衛kk+貵衲徿ioo裤沿\?w喷N反碙]竝\?囏憫扆犸mhhx\\緰挿曳旚琯U肿A\?浚I遚5身sW榢\?gGG荂f\?v菐艊厣\?w555\?櫶峔.W褻鞎+W\?66~\?艝挶旚l衄g=k襤厕┑\?~*<2卉\?沁7飸丐.蟏閠亥档u睺徧艷b\?6點m懍,%==隮蠚4歞顟冁饷l|mk|K}w怿芅暖墠S诅畑ASS吁\?麌x▔w辻琮鴗怿\?UK蒟Jz6z殖\?i4蓾绠0\?褁0崯3;888鱤k醝邱槊賚6\Z\ZJ迃鬏す郭\?l|:眘\?\?x北?撋対>}z闍>\'鲳崦葆 |2纠豮b-%c)橘鑉蟴证\?熁\?杇欍躸\?雯x\燶r\'gg绻闱\?櫷fG簌﹗jjj礻斋燋貂齯鄱mв镵駣岟xwbK蒟Jz6z殖\?i4梢蝅\?\?r€u詈弍@]歪娳鎷0鵞W^\?=a^夨(付,%c)橘鑉蟴证\?蝅`)YJ枓烏尀醅I\0K蒖页殉瀺\?㊣\0K蒟Jz6z殖\?i4	`)KI蟴F蟴证\?€)橘鑉螰蠚\?€,%==隮蠚4\?皵尌==k襤繰矓鬺衄gMj繰2枓瀺烏琯M\ZMXJ芌页炑碁5i4	`)YJz6z殖殉&5	`)KI螰蟴殖&\?,%c)閅翔Y蠚4\?皵,%==胭鑉摎皵尌=隮揊\揬0枓睌衄g衄gM\ZMXJ枓瀺烏l衄IMXJ芌页殉烏琁-h繰2枓烏尀醅I\0K蒖页殉瀺\?㊣\0K蒟Jz6z殖\?\?MT圑藸z&栆\?醅g衄gM\ZM,忤眩９\\蜝▊蒮\?K榧*醅g衄gM\ZM,b``\?儍冞~笸7S檬莴\ZR__邨a濺鯇烏琁€\?\?熿眄=煝_oa*>駔?o!閅翔Y蠚4\?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0犾\?蒼\?咫_\縗0\0\0\0IEND瓸`\?,1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','22501',10),('schema.history','create(5.21.0.0)',1),('schema.version','5.21.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('10002','process:1:7504','10001','10001','sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728',NULL,NULL,NULL,'startEvent',NULL,'2017-12-14 23:23:24','2017-12-14 23:23:24',29,''),('10006','process:1:7504','10001','10001','sid-372FE834-32FD-4962-A72A-A296D7F22357','10007',NULL,'提交申请','userTask',NULL,'2017-12-14 23:23:24','2017-12-14 23:28:07',283272,''),('12501','process:1:7504','10001','10001','sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8','12502',NULL,'上传资料','userTask',NULL,'2017-12-14 23:28:07',NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'process:1:7504','2017-12-14 23:23:24',NULL,NULL,NULL,'sid-FBE59DB8-B5E8-445D-B098-83BA9AB17728',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('10007','process:1:7504','sid-372FE834-32FD-4962-A72A-A296D7F22357','10001','10001','提交申请',NULL,NULL,NULL,NULL,'2017-12-14 23:23:24',NULL,'2017-12-14 23:28:07',283254,'completed',50,NULL,NULL,NULL,''),('12502','process:1:7504','sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8','10001','10001','上传资料',NULL,NULL,NULL,NULL,'2017-12-14 23:28:07',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('10003','10001','10001',NULL,'date','string',0,NULL,NULL,NULL,'2017-12-12',NULL,'2017-12-14 23:23:24','2017-12-14 23:23:24'),('10004','10001','10001',NULL,'startman','string',0,NULL,NULL,NULL,'jay',NULL,'2017-12-14 23:23:24','2017-12-14 23:23:24'),('10005','10001','10001',NULL,'content','string',0,NULL,NULL,NULL,'xxx',NULL,'2017-12-14 23:23:24','2017-12-14 23:23:24');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` VALUES ('soft',1,NULL,NULL);
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` VALUES ('jay','soft'),('tom','soft');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` VALUES ('jay',1,NULL,NULL,NULL,NULL,NULL),('tom',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('20001','SpringAutoDeployment',NULL,'','2018-01-08 15:19:40'),('7501','SpringAutoDeployment',NULL,'','2017-12-14 15:21:07');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('joinProcess:1:20006',1,'http://www.activiti.org/test','Join process','joinProcess',1,'20001','G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.bpmn20.xml',NULL,NULL,0,0,1,''),('myProcess_1:1:20005',1,'http://www.activiti.org/testm1515424639982',NULL,'myProcess_1',1,'20001','G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.bpmn','G:\\AllCodes\\springboot\\process\\registerProcess\\target\\classes\\processes\\flow.myProcess_1.png',NULL,0,1,1,''),('process:1:7504',1,'http://www.activiti.org/processdef',NULL,'process',1,'7501','G:\\AllCodes\\springboot\\process\\target\\classes\\processes\\process.bpmn20.xml','G:\\AllCodes\\springboot\\process\\target\\classes\\processes\\process.process.png',NULL,0,1,1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('10001',2,'10001',NULL,NULL,'process:1:7504',NULL,'sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8',1,0,1,0,1,2,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('12502',1,'10001','10001','process:1:7504','上传资料',NULL,NULL,'sid-C9AB55E3-A55A-467D-B8DC-A8B48C8F80B8',NULL,NULL,NULL,50,'2017-12-14 15:28:07',NULL,NULL,1,'',NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('10003',1,'string','date','10001','10001',NULL,NULL,NULL,NULL,'2017-12-12',NULL),('10004',1,'string','startman','10001','10001',NULL,NULL,NULL,NULL,'jay',NULL),('10005',1,'string','content','10001','10001',NULL,NULL,NULL,NULL,'xxx',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_archive_detail`
--

DROP TABLE IF EXISTS `s_archive_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_archive_detail` (
  `int` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `archiveid` int(20) DEFAULT NULL,
  PRIMARY KEY (`int`),
  KEY `fk_archive_detail` (`archiveid`),
  CONSTRAINT `fk_archive_detail` FOREIGN KEY (`archiveid`) REFERENCES `s_archives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_archive_detail`
--

LOCK TABLES `s_archive_detail` WRITE;
/*!40000 ALTER TABLE `s_archive_detail` DISABLE KEYS */;
INSERT INTO `s_archive_detail` VALUES (1,'普通','1',1),(2,'天猫','2',1),(3,'淘宝','3',1),(4,'亚马逊','4',1),(5,'居然之家','5',1),(6,'京东商城','6',1),(7,'汽车制造及维修','7',1),(8,'苏宁','8',1),(9,'单个','1',2),(10,'集团','2',2),(11,'进出口','3',2),(12,'人民币','1',3),(13,'美元','2',3),(14,'欧元','3',3),(15,'港币','4',3),(16,'日元','5',3),(17,'英镑','6',3),(18,'德国马克','7',3),(19,'瑞士法郎','8',3),(20,'澳门元','9',3),(21,'内资','1',4),(22,'国有全资','2',4),(23,'集体全资','3',4),(24,'股份合作','4',4),(25,'联营','5',4),(26,'国有联营','6',4),(27,'集体联营','7',4),(28,'国有与集体联营','8',4),(29,'其它联营','9',4),(30,'有限责任（公司）','10',4),(31,'国有独资（公司）','11',4),(32,'其它有限责任（公司）','12',4),(33,'股份有限（公司）','13',4);
/*!40000 ALTER TABLE `s_archive_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_archives`
--

DROP TABLE IF EXISTS `s_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_archives` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_archives`
--

LOCK TABLES `s_archives` WRITE;
/*!40000 ALTER TABLE `s_archives` DISABLE KEYS */;
INSERT INTO `s_archives` VALUES (1,'注册类型',NULL),(2,'企业类型',NULL),(3,'货币种类',NULL),(4,'经济类型',NULL);
/*!40000 ALTER TABLE `s_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_region`
--

DROP TABLE IF EXISTS `s_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_region` (
  `id` int(20) NOT NULL,
  `parent_id` int(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_region`
--

LOCK TABLES `s_region` WRITE;
/*!40000 ALTER TABLE `s_region` DISABLE KEYS */;
INSERT INTO `s_region` VALUES (110000,0,'北京市',1),(110100,110000,'北京城区',2),(110101,110100,'东城区',3),(110102,110100,'西城区',3),(110105,110100,'朝阳区',3),(110106,110100,'丰台区',3),(110107,110100,'石景山区',3),(110108,110100,'海淀区',3),(110109,110100,'门头沟区',3),(110111,110100,'房山区',3),(110112,110100,'通州区',3),(110113,110100,'顺义区',3),(110114,110100,'昌平区',3),(110115,110100,'大兴区',3),(110116,110100,'怀柔区',3),(110117,110100,'平谷区',3),(110118,110100,'密云区',3),(110119,110100,'延庆区',3),(120000,0,'天津市',1),(120100,120000,'天津城区',2),(120101,120100,'和平区',3),(120102,120100,'河东区',3),(120103,120100,'河西区',3),(120104,120100,'南开区',3),(120105,120100,'河北区',3),(120106,120100,'红桥区',3),(120110,120100,'东丽区',3),(120111,120100,'西青区',3),(120112,120100,'津南区',3),(120113,120100,'北辰区',3),(120114,120100,'武清区',3),(120115,120100,'宝坻区',3),(120116,120100,'滨海新区',3),(120117,120100,'宁河区',3),(120118,120100,'静海区',3),(120119,120100,'蓟州区',3),(130000,0,'河北省',1),(130100,130000,'石家庄市',2),(130102,130100,'长安区',3),(130104,130100,'桥西区',3),(130105,130100,'新华区',3),(130107,130100,'井陉矿区',3),(130108,130100,'裕华区',3),(130109,130100,'藁城区',3),(130110,130100,'鹿泉区',3),(130111,130100,'栾城区',3),(130121,130100,'井陉县',3),(130123,130100,'正定县',3),(130125,130100,'行唐县',3),(130126,130100,'灵寿县',3),(130127,130100,'高邑县',3),(130128,130100,'深泽县',3),(130129,130100,'赞皇县',3),(130130,130100,'无极县',3),(130131,130100,'平山县',3),(130132,130100,'元氏县',3),(130133,130100,'赵县',3),(130181,130100,'辛集市',3),(130183,130100,'晋州市',3),(130184,130100,'新乐市',3),(130200,130000,'唐山市',2),(130202,130200,'路南区',3),(130203,130200,'路北区',3),(130204,130200,'古冶区',3),(130205,130200,'开平区',3),(130207,130200,'丰南区',3),(130208,130200,'丰润区',3),(130209,130200,'曹妃甸区',3),(130223,130200,'滦县',3),(130224,130200,'滦南县',3),(130225,130200,'乐亭县',3),(130227,130200,'迁西县',3),(130229,130200,'玉田县',3),(130281,130200,'遵化市',3),(130283,130200,'迁安市',3),(130300,130000,'秦皇岛市',2),(130302,130300,'海港区',3),(130303,130300,'山海关区',3),(130304,130300,'北戴河区',3),(130306,130300,'抚宁区',3),(130321,130300,'青龙满族自治县',3),(130322,130300,'昌黎县',3),(130324,130300,'卢龙县',3),(130400,130000,'邯郸市',2),(130402,130400,'邯山区',3),(130403,130400,'丛台区',3),(130404,130400,'复兴区',3),(130406,130400,'峰峰矿区',3),(130407,130400,'肥乡区',3),(130408,130400,'永年区',3),(130423,130400,'临漳县',3),(130424,130400,'成安县',3),(130425,130400,'大名县',3),(130426,130400,'涉县',3),(130427,130400,'磁县',3),(130430,130400,'邱县',3),(130431,130400,'鸡泽县',3),(130432,130400,'广平县',3),(130433,130400,'馆陶县',3),(130434,130400,'魏县',3),(130435,130400,'曲周县',3),(130481,130400,'武安市',3),(130500,130000,'邢台市',2),(130502,130500,'桥东区',3),(130503,130500,'桥西区',3),(130521,130500,'邢台县',3),(130522,130500,'临城县',3),(130523,130500,'内丘县',3),(130524,130500,'柏乡县',3),(130525,130500,'隆尧县',3),(130526,130500,'任县',3),(130527,130500,'南和县',3),(130528,130500,'宁晋县',3),(130529,130500,'巨鹿县',3),(130530,130500,'新河县',3),(130531,130500,'广宗县',3),(130532,130500,'平乡县',3),(130533,130500,'威县',3),(130534,130500,'清河县',3),(130535,130500,'临西县',3),(130581,130500,'南宫市',3),(130582,130500,'沙河市',3),(130600,130000,'保定市',2),(130602,130600,'竞秀区',3),(130606,130600,'莲池区',3),(130607,130600,'满城区',3),(130608,130600,'清苑区',3),(130609,130600,'徐水区',3),(130623,130600,'涞水县',3),(130624,130600,'阜平县',3),(130626,130600,'定兴县',3),(130627,130600,'唐县',3),(130628,130600,'高阳县',3),(130629,130600,'容城县',3),(130630,130600,'涞源县',3),(130631,130600,'望都县',3),(130632,130600,'安新县',3),(130633,130600,'易县',3),(130634,130600,'曲阳县',3),(130635,130600,'蠡县',3),(130636,130600,'顺平县',3),(130637,130600,'博野县',3),(130638,130600,'雄县',3),(130681,130600,'涿州市',3),(130682,130600,'定州市',3),(130683,130600,'安国市',3),(130684,130600,'高碑店市',3),(130700,130000,'张家口市',2),(130702,130700,'桥东区',3),(130703,130700,'桥西区',3),(130705,130700,'宣化区',3),(130706,130700,'下花园区',3),(130708,130700,'万全区',3),(130709,130700,'崇礼区',3),(130722,130700,'张北县',3),(130723,130700,'康保县',3),(130724,130700,'沽源县',3),(130725,130700,'尚义县',3),(130726,130700,'蔚县',3),(130727,130700,'阳原县',3),(130728,130700,'怀安县',3),(130730,130700,'怀来县',3),(130731,130700,'涿鹿县',3),(130732,130700,'赤城县',3),(130800,130000,'承德市',2),(130802,130800,'双桥区',3),(130803,130800,'双滦区',3),(130804,130800,'鹰手营子矿区',3),(130821,130800,'承德县',3),(130822,130800,'兴隆县',3),(130824,130800,'滦平县',3),(130825,130800,'隆化县',3),(130826,130800,'丰宁满族自治县',3),(130827,130800,'宽城满族自治县',3),(130828,130800,'围场满族蒙古族自治县',3),(130881,130800,'平泉市',3),(130900,130000,'沧州市',2),(130902,130900,'新华区',3),(130903,130900,'运河区',3),(130921,130900,'沧县',3),(130922,130900,'青县',3),(130923,130900,'东光县',3),(130924,130900,'海兴县',3),(130925,130900,'盐山县',3),(130926,130900,'肃宁县',3),(130927,130900,'南皮县',3),(130928,130900,'吴桥县',3),(130929,130900,'献县',3),(130930,130900,'孟村回族自治县',3),(130981,130900,'泊头市',3),(130982,130900,'任丘市',3),(130983,130900,'黄骅市',3),(130984,130900,'河间市',3),(131000,130000,'廊坊市',2),(131002,131000,'安次区',3),(131003,131000,'广阳区',3),(131022,131000,'固安县',3),(131023,131000,'永清县',3),(131024,131000,'香河县',3),(131025,131000,'大城县',3),(131026,131000,'文安县',3),(131028,131000,'大厂回族自治县',3),(131081,131000,'霸州市',3),(131082,131000,'三河市',3),(131100,130000,'衡水市',2),(131102,131100,'桃城区',3),(131103,131100,'冀州区',3),(131121,131100,'枣强县',3),(131122,131100,'武邑县',3),(131123,131100,'武强县',3),(131124,131100,'饶阳县',3),(131125,131100,'安平县',3),(131126,131100,'故城县',3),(131127,131100,'景县',3),(131128,131100,'阜城县',3),(131182,131100,'深州市',3),(140000,0,'山西省',1),(140100,140000,'太原市',2),(140105,140100,'小店区',3),(140106,140100,'迎泽区',3),(140107,140100,'杏花岭区',3),(140108,140100,'尖草坪区',3),(140109,140100,'万柏林区',3),(140110,140100,'晋源区',3),(140121,140100,'清徐县',3),(140122,140100,'阳曲县',3),(140123,140100,'娄烦县',3),(140181,140100,'古交市',3),(140200,140000,'大同市',2),(140202,140200,'城区',3),(140203,140200,'矿区',3),(140211,140200,'南郊区',3),(140212,140200,'新荣区',3),(140221,140200,'阳高县',3),(140222,140200,'天镇县',3),(140223,140200,'广灵县',3),(140224,140200,'灵丘县',3),(140225,140200,'浑源县',3),(140226,140200,'左云县',3),(140227,140200,'大同县',3),(140300,140000,'阳泉市',2),(140302,140300,'城区',3),(140303,140300,'矿区',3),(140311,140300,'郊区',3),(140321,140300,'平定县',3),(140322,140300,'盂县',3),(140400,140000,'长治市',2),(140402,140400,'城区',3),(140411,140400,'郊区',3),(140421,140400,'长治县',3),(140423,140400,'襄垣县',3),(140424,140400,'屯留县',3),(140425,140400,'平顺县',3),(140426,140400,'黎城县',3),(140427,140400,'壶关县',3),(140428,140400,'长子县',3),(140429,140400,'武乡县',3),(140430,140400,'沁县',3),(140431,140400,'沁源县',3),(140481,140400,'潞城市',3),(140500,140000,'晋城市',2),(140502,140500,'城区',3),(140521,140500,'沁水县',3),(140522,140500,'阳城县',3),(140524,140500,'陵川县',3),(140525,140500,'泽州县',3),(140581,140500,'高平市',3),(140600,140000,'朔州市',2),(140602,140600,'朔城区',3),(140603,140600,'平鲁区',3),(140621,140600,'山阴县',3),(140622,140600,'应县',3),(140623,140600,'右玉县',3),(140624,140600,'怀仁县',3),(140700,140000,'晋中市',2),(140702,140700,'榆次区',3),(140721,140700,'榆社县',3),(140722,140700,'左权县',3),(140723,140700,'和顺县',3),(140724,140700,'昔阳县',3),(140725,140700,'寿阳县',3),(140726,140700,'太谷县',3),(140727,140700,'祁县',3),(140728,140700,'平遥县',3),(140729,140700,'灵石县',3),(140781,140700,'介休市',3),(140800,140000,'运城市',2),(140802,140800,'盐湖区',3),(140821,140800,'临猗县',3),(140822,140800,'万荣县',3),(140823,140800,'闻喜县',3),(140824,140800,'稷山县',3),(140825,140800,'新绛县',3),(140826,140800,'绛县',3),(140827,140800,'垣曲县',3),(140828,140800,'夏县',3),(140829,140800,'平陆县',3),(140830,140800,'芮城县',3),(140881,140800,'永济市',3),(140882,140800,'河津市',3),(140900,140000,'忻州市',2),(140902,140900,'忻府区',3),(140921,140900,'定襄县',3),(140922,140900,'五台县',3),(140923,140900,'代县',3),(140924,140900,'繁峙县',3),(140925,140900,'宁武县',3),(140926,140900,'静乐县',3),(140927,140900,'神池县',3),(140928,140900,'五寨县',3),(140929,140900,'岢岚县',3),(140930,140900,'河曲县',3),(140931,140900,'保德县',3),(140932,140900,'偏关县',3),(140981,140900,'原平市',3),(141000,140000,'临汾市',2),(141002,141000,'尧都区',3),(141021,141000,'曲沃县',3),(141022,141000,'翼城县',3),(141023,141000,'襄汾县',3),(141024,141000,'洪洞县',3),(141025,141000,'古县',3),(141026,141000,'安泽县',3),(141027,141000,'浮山县',3),(141028,141000,'吉县',3),(141029,141000,'乡宁县',3),(141030,141000,'大宁县',3),(141031,141000,'隰县',3),(141032,141000,'永和县',3),(141033,141000,'蒲县',3),(141034,141000,'汾西县',3),(141081,141000,'侯马市',3),(141082,141000,'霍州市',3),(141100,140000,'吕梁市',2),(141102,141100,'离石区',3),(141121,141100,'文水县',3),(141122,141100,'交城县',3),(141123,141100,'兴县',3),(141124,141100,'临县',3),(141125,141100,'柳林县',3),(141126,141100,'石楼县',3),(141127,141100,'岚县',3),(141128,141100,'方山县',3),(141129,141100,'中阳县',3),(141130,141100,'交口县',3),(141181,141100,'孝义市',3),(141182,141100,'汾阳市',3),(150000,0,'内蒙古自治区',1),(150100,150000,'呼和浩特市',2),(150102,150100,'新城区',3),(150103,150100,'回民区',3),(150104,150100,'玉泉区',3),(150105,150100,'赛罕区',3),(150121,150100,'土默特左旗',3),(150122,150100,'托克托县',3),(150123,150100,'和林格尔县',3),(150124,150100,'清水河县',3),(150125,150100,'武川县',3),(150200,150000,'包头市',2),(150202,150200,'东河区',3),(150203,150200,'昆都仑区',3),(150204,150200,'青山区',3),(150205,150200,'石拐区',3),(150206,150200,'白云鄂博矿区',3),(150207,150200,'九原区',3),(150221,150200,'土默特右旗',3),(150222,150200,'固阳县',3),(150223,150200,'达尔罕茂明安联合旗',3),(150300,150000,'乌海市',2),(150302,150300,'海勃湾区',3),(150303,150300,'海南区',3),(150304,150300,'乌达区',3),(150400,150000,'赤峰市',2),(150402,150400,'红山区',3),(150403,150400,'元宝山区',3),(150404,150400,'松山区',3),(150421,150400,'阿鲁科尔沁旗',3),(150422,150400,'巴林左旗',3),(150423,150400,'巴林右旗',3),(150424,150400,'林西县',3),(150425,150400,'克什克腾旗',3),(150426,150400,'翁牛特旗',3),(150428,150400,'喀喇沁旗',3),(150429,150400,'宁城县',3),(150430,150400,'敖汉旗',3),(150500,150000,'通辽市',2),(150502,150500,'科尔沁区',3),(150521,150500,'科尔沁左翼中旗',3),(150522,150500,'科尔沁左翼后旗',3),(150523,150500,'开鲁县',3),(150524,150500,'库伦旗',3),(150525,150500,'奈曼旗',3),(150526,150500,'扎鲁特旗',3),(150581,150500,'霍林郭勒市',3),(150600,150000,'鄂尔多斯市',2),(150602,150600,'东胜区',3),(150603,150600,'康巴什区',3),(150621,150600,'达拉特旗',3),(150622,150600,'准格尔旗',3),(150623,150600,'鄂托克前旗',3),(150624,150600,'鄂托克旗',3),(150625,150600,'杭锦旗',3),(150626,150600,'乌审旗',3),(150627,150600,'伊金霍洛旗',3),(150700,150000,'呼伦贝尔市',2),(150702,150700,'海拉尔区',3),(150703,150700,'扎赉诺尔区',3),(150721,150700,'阿荣旗',3),(150722,150700,'莫力达瓦达斡尔族自治旗',3),(150723,150700,'鄂伦春自治旗',3),(150724,150700,'鄂温克族自治旗',3),(150725,150700,'陈巴尔虎旗',3),(150726,150700,'新巴尔虎左旗',3),(150727,150700,'新巴尔虎右旗',3),(150781,150700,'满洲里市',3),(150782,150700,'牙克石市',3),(150783,150700,'扎兰屯市',3),(150784,150700,'额尔古纳市',3),(150785,150700,'根河市',3),(150800,150000,'巴彦淖尔市',2),(150802,150800,'临河区',3),(150821,150800,'五原县',3),(150822,150800,'磴口县',3),(150823,150800,'乌拉特前旗',3),(150824,150800,'乌拉特中旗',3),(150825,150800,'乌拉特后旗',3),(150826,150800,'杭锦后旗',3),(150900,150000,'乌兰察布市',2),(150902,150900,'集宁区',3),(150921,150900,'卓资县',3),(150922,150900,'化德县',3),(150923,150900,'商都县',3),(150924,150900,'兴和县',3),(150925,150900,'凉城县',3),(150926,150900,'察哈尔右翼前旗',3),(150927,150900,'察哈尔右翼中旗',3),(150928,150900,'察哈尔右翼后旗',3),(150929,150900,'四子王旗',3),(150981,150900,'丰镇市',3),(152200,150000,'兴安盟',2),(152201,152200,'乌兰浩特市',3),(152202,152200,'阿尔山市',3),(152221,152200,'科尔沁右翼前旗',3),(152222,152200,'科尔沁右翼中旗',3),(152223,152200,'扎赉特旗',3),(152224,152200,'突泉县',3),(152500,150000,'锡林郭勒盟',2),(152501,152500,'二连浩特市',3),(152502,152500,'锡林浩特市',3),(152522,152500,'阿巴嘎旗',3),(152523,152500,'苏尼特左旗',3),(152524,152500,'苏尼特右旗',3),(152525,152500,'东乌珠穆沁旗',3),(152526,152500,'西乌珠穆沁旗',3),(152527,152500,'太仆寺旗',3),(152528,152500,'镶黄旗',3),(152529,152500,'正镶白旗',3),(152530,152500,'正蓝旗',3),(152531,152500,'多伦县',3),(152900,150000,'阿拉善盟',2),(152921,152900,'阿拉善左旗',3),(152922,152900,'阿拉善右旗',3),(152923,152900,'额济纳旗',3),(210000,0,'辽宁省',1),(210100,210000,'沈阳市',2),(210102,210100,'和平区',3),(210103,210100,'沈河区',3),(210104,210100,'大东区',3),(210105,210100,'皇姑区',3),(210106,210100,'铁西区',3),(210111,210100,'苏家屯区',3),(210112,210100,'浑南区',3),(210113,210100,'沈北新区',3),(210114,210100,'于洪区',3),(210115,210100,'辽中区',3),(210123,210100,'康平县',3),(210124,210100,'法库县',3),(210181,210100,'新民市',3),(210200,210000,'大连市',2),(210202,210200,'中山区',3),(210203,210200,'西岗区',3),(210204,210200,'沙河口区',3),(210211,210200,'甘井子区',3),(210212,210200,'旅顺口区',3),(210213,210200,'金州区',3),(210214,210200,'普兰店区',3),(210224,210200,'长海县',3),(210281,210200,'瓦房店市',3),(210283,210200,'庄河市',3),(210300,210000,'鞍山市',2),(210302,210300,'铁东区',3),(210303,210300,'铁西区',3),(210304,210300,'立山区',3),(210311,210300,'千山区',3),(210321,210300,'台安县',3),(210323,210300,'岫岩满族自治县',3),(210381,210300,'海城市',3),(210400,210000,'抚顺市',2),(210402,210400,'新抚区',3),(210403,210400,'东洲区',3),(210404,210400,'望花区',3),(210411,210400,'顺城区',3),(210421,210400,'抚顺县',3),(210422,210400,'新宾满族自治县',3),(210423,210400,'清原满族自治县',3),(210500,210000,'本溪市',2),(210502,210500,'平山区',3),(210503,210500,'溪湖区',3),(210504,210500,'明山区',3),(210505,210500,'南芬区',3),(210521,210500,'本溪满族自治县',3),(210522,210500,'桓仁满族自治县',3),(210600,210000,'丹东市',2),(210602,210600,'元宝区',3),(210603,210600,'振兴区',3),(210604,210600,'振安区',3),(210624,210600,'宽甸满族自治县',3),(210681,210600,'东港市',3),(210682,210600,'凤城市',3),(210700,210000,'锦州市',2),(210702,210700,'古塔区',3),(210703,210700,'凌河区',3),(210711,210700,'太和区',3),(210726,210700,'黑山县',3),(210727,210700,'义县',3),(210781,210700,'凌海市',3),(210782,210700,'北镇市',3),(210800,210000,'营口市',2),(210802,210800,'站前区',3),(210803,210800,'西市区',3),(210804,210800,'鲅鱼圈区',3),(210811,210800,'老边区',3),(210881,210800,'盖州市',3),(210882,210800,'大石桥市',3),(210900,210000,'阜新市',2),(210902,210900,'海州区',3),(210903,210900,'新邱区',3),(210904,210900,'太平区',3),(210905,210900,'清河门区',3),(210911,210900,'细河区',3),(210921,210900,'阜新蒙古族自治县',3),(210922,210900,'彰武县',3),(211000,210000,'辽阳市',2),(211002,211000,'白塔区',3),(211003,211000,'文圣区',3),(211004,211000,'宏伟区',3),(211005,211000,'弓长岭区',3),(211011,211000,'太子河区',3),(211021,211000,'辽阳县',3),(211081,211000,'灯塔市',3),(211100,210000,'盘锦市',2),(211102,211100,'双台子区',3),(211103,211100,'兴隆台区',3),(211104,211100,'大洼区',3),(211122,211100,'盘山县',3),(211200,210000,'铁岭市',2),(211202,211200,'银州区',3),(211204,211200,'清河区',3),(211221,211200,'铁岭县',3),(211223,211200,'西丰县',3),(211224,211200,'昌图县',3),(211281,211200,'调兵山市',3),(211282,211200,'开原市',3),(211300,210000,'朝阳市',2),(211302,211300,'双塔区',3),(211303,211300,'龙城区',3),(211321,211300,'朝阳县',3),(211322,211300,'建平县',3),(211324,211300,'喀喇沁左翼蒙古族自治县',3),(211381,211300,'北票市',3),(211382,211300,'凌源市',3),(211400,210000,'葫芦岛市',2),(211402,211400,'连山区',3),(211403,211400,'龙港区',3),(211404,211400,'南票区',3),(211421,211400,'绥中县',3),(211422,211400,'建昌县',3),(211481,211400,'兴城市',3),(220000,0,'吉林省',1),(220100,220000,'长春市',2),(220102,220100,'南关区',3),(220103,220100,'宽城区',3),(220104,220100,'朝阳区',3),(220105,220100,'二道区',3),(220106,220100,'绿园区',3),(220112,220100,'双阳区',3),(220113,220100,'九台区',3),(220122,220100,'农安县',3),(220182,220100,'榆树市',3),(220183,220100,'德惠市',3),(220200,220000,'吉林市',2),(220202,220200,'昌邑区',3),(220203,220200,'龙潭区',3),(220204,220200,'船营区',3),(220211,220200,'丰满区',3),(220221,220200,'永吉县',3),(220281,220200,'蛟河市',3),(220282,220200,'桦甸市',3),(220283,220200,'舒兰市',3),(220284,220200,'磐石市',3),(220300,220000,'四平市',2),(220302,220300,'铁西区',3),(220303,220300,'铁东区',3),(220322,220300,'梨树县',3),(220323,220300,'伊通满族自治县',3),(220381,220300,'公主岭市',3),(220382,220300,'双辽市',3),(220400,220000,'辽源市',2),(220402,220400,'龙山区',3),(220403,220400,'西安区',3),(220421,220400,'东丰县',3),(220422,220400,'东辽县',3),(220500,220000,'通化市',2),(220502,220500,'东昌区',3),(220503,220500,'二道江区',3),(220521,220500,'通化县',3),(220523,220500,'辉南县',3),(220524,220500,'柳河县',3),(220581,220500,'梅河口市',3),(220582,220500,'集安市',3),(220600,220000,'白山市',2),(220602,220600,'浑江区',3),(220605,220600,'江源区',3),(220621,220600,'抚松县',3),(220622,220600,'靖宇县',3),(220623,220600,'长白朝鲜族自治县',3),(220681,220600,'临江市',3),(220700,220000,'松原市',2),(220702,220700,'宁江区',3),(220721,220700,'前郭尔罗斯蒙古族自治县',3),(220722,220700,'长岭县',3),(220723,220700,'乾安县',3),(220781,220700,'扶余市',3),(220800,220000,'白城市',2),(220802,220800,'洮北区',3),(220821,220800,'镇赉县',3),(220822,220800,'通榆县',3),(220881,220800,'洮南市',3),(220882,220800,'大安市',3),(222400,220000,'延边朝鲜族自治州',2),(222401,222400,'延吉市',3),(222402,222400,'图们市',3),(222403,222400,'敦化市',3),(222404,222400,'珲春市',3),(222405,222400,'龙井市',3),(222406,222400,'和龙市',3),(222424,222400,'汪清县',3),(222426,222400,'安图县',3),(230000,0,'黑龙江省',1),(230100,230000,'哈尔滨市',2),(230102,230100,'道里区',3),(230103,230100,'南岗区',3),(230104,230100,'道外区',3),(230108,230100,'平房区',3),(230109,230100,'松北区',3),(230110,230100,'香坊区',3),(230111,230100,'呼兰区',3),(230112,230100,'阿城区',3),(230113,230100,'双城区',3),(230123,230100,'依兰县',3),(230124,230100,'方正县',3),(230125,230100,'宾县',3),(230126,230100,'巴彦县',3),(230127,230100,'木兰县',3),(230128,230100,'通河县',3),(230129,230100,'延寿县',3),(230183,230100,'尚志市',3),(230184,230100,'五常市',3),(230200,230000,'齐齐哈尔市',2),(230202,230200,'龙沙区',3),(230203,230200,'建华区',3),(230204,230200,'铁锋区',3),(230205,230200,'昂昂溪区',3),(230206,230200,'富拉尔基区',3),(230207,230200,'碾子山区',3),(230208,230200,'梅里斯达斡尔族区',3),(230221,230200,'龙江县',3),(230223,230200,'依安县',3),(230224,230200,'泰来县',3),(230225,230200,'甘南县',3),(230227,230200,'富裕县',3),(230229,230200,'克山县',3),(230230,230200,'克东县',3),(230231,230200,'拜泉县',3),(230281,230200,'讷河市',3),(230300,230000,'鸡西市',2),(230302,230300,'鸡冠区',3),(230303,230300,'恒山区',3),(230304,230300,'滴道区',3),(230305,230300,'梨树区',3),(230306,230300,'城子河区',3),(230307,230300,'麻山区',3),(230321,230300,'鸡东县',3),(230381,230300,'虎林市',3),(230382,230300,'密山市',3),(230400,230000,'鹤岗市',2),(230402,230400,'向阳区',3),(230403,230400,'工农区',3),(230404,230400,'南山区',3),(230405,230400,'兴安区',3),(230406,230400,'东山区',3),(230407,230400,'兴山区',3),(230421,230400,'萝北县',3),(230422,230400,'绥滨县',3),(230500,230000,'双鸭山市',2),(230502,230500,'尖山区',3),(230503,230500,'岭东区',3),(230505,230500,'四方台区',3),(230506,230500,'宝山区',3),(230521,230500,'集贤县',3),(230522,230500,'友谊县',3),(230523,230500,'宝清县',3),(230524,230500,'饶河县',3),(230600,230000,'大庆市',2),(230602,230600,'萨尔图区',3),(230603,230600,'龙凤区',3),(230604,230600,'让胡路区',3),(230605,230600,'红岗区',3),(230606,230600,'大同区',3),(230621,230600,'肇州县',3),(230622,230600,'肇源县',3),(230623,230600,'林甸县',3),(230624,230600,'杜尔伯特蒙古族自治县',3),(230700,230000,'伊春市',2),(230702,230700,'伊春区',3),(230703,230700,'南岔区',3),(230704,230700,'友好区',3),(230705,230700,'西林区',3),(230706,230700,'翠峦区',3),(230707,230700,'新青区',3),(230708,230700,'美溪区',3),(230709,230700,'金山屯区',3),(230710,230700,'五营区',3),(230711,230700,'乌马河区',3),(230712,230700,'汤旺河区',3),(230713,230700,'带岭区',3),(230714,230700,'乌伊岭区',3),(230715,230700,'红星区',3),(230716,230700,'上甘岭区',3),(230722,230700,'嘉荫县',3),(230781,230700,'铁力市',3),(230800,230000,'佳木斯市',2),(230803,230800,'向阳区',3),(230804,230800,'前进区',3),(230805,230800,'东风区',3),(230811,230800,'郊区',3),(230822,230800,'桦南县',3),(230826,230800,'桦川县',3),(230828,230800,'汤原县',3),(230881,230800,'同江市',3),(230882,230800,'富锦市',3),(230883,230800,'抚远市',3),(230900,230000,'七台河市',2),(230902,230900,'新兴区',3),(230903,230900,'桃山区',3),(230904,230900,'茄子河区',3),(230921,230900,'勃利县',3),(231000,230000,'牡丹江市',2),(231002,231000,'东安区',3),(231003,231000,'阳明区',3),(231004,231000,'爱民区',3),(231005,231000,'西安区',3),(231025,231000,'林口县',3),(231081,231000,'绥芬河市',3),(231083,231000,'海林市',3),(231084,231000,'宁安市',3),(231085,231000,'穆棱市',3),(231086,231000,'东宁市',3),(231100,230000,'黑河市',2),(231102,231100,'爱辉区',3),(231121,231100,'嫩江县',3),(231123,231100,'逊克县',3),(231124,231100,'孙吴县',3),(231181,231100,'北安市',3),(231182,231100,'五大连池市',3),(231200,230000,'绥化市',2),(231202,231200,'北林区',3),(231221,231200,'望奎县',3),(231222,231200,'兰西县',3),(231223,231200,'青冈县',3),(231224,231200,'庆安县',3),(231225,231200,'明水县',3),(231226,231200,'绥棱县',3),(231281,231200,'安达市',3),(231282,231200,'肇东市',3),(231283,231200,'海伦市',3),(232700,230000,'大兴安岭地区',2),(232701,232700,'加格达奇区',3),(232721,232700,'呼玛县',3),(232722,232700,'塔河县',3),(232723,232700,'漠河县',3),(310000,0,'上海市',1),(310100,310000,'上海城区',2),(310101,310100,'黄浦区',3),(310104,310100,'徐汇区',3),(310105,310100,'长宁区',3),(310106,310100,'静安区',3),(310107,310100,'普陀区',3),(310109,310100,'虹口区',3),(310110,310100,'杨浦区',3),(310112,310100,'闵行区',3),(310113,310100,'宝山区',3),(310114,310100,'嘉定区',3),(310115,310100,'浦东新区',3),(310116,310100,'金山区',3),(310117,310100,'松江区',3),(310118,310100,'青浦区',3),(310120,310100,'奉贤区',3),(310151,310100,'崇明区',3),(320000,0,'江苏省',1),(320100,320000,'南京市',2),(320102,320100,'玄武区',3),(320104,320100,'秦淮区',3),(320105,320100,'建邺区',3),(320106,320100,'鼓楼区',3),(320111,320100,'浦口区',3),(320113,320100,'栖霞区',3),(320114,320100,'雨花台区',3),(320115,320100,'江宁区',3),(320116,320100,'六合区',3),(320117,320100,'溧水区',3),(320118,320100,'高淳区',3),(320200,320000,'无锡市',2),(320205,320200,'锡山区',3),(320206,320200,'惠山区',3),(320211,320200,'滨湖区',3),(320213,320200,'梁溪区',3),(320214,320200,'新吴区',3),(320281,320200,'江阴市',3),(320282,320200,'宜兴市',3),(320300,320000,'徐州市',2),(320302,320300,'鼓楼区',3),(320303,320300,'云龙区',3),(320305,320300,'贾汪区',3),(320311,320300,'泉山区',3),(320312,320300,'铜山区',3),(320321,320300,'丰县',3),(320322,320300,'沛县',3),(320324,320300,'睢宁县',3),(320381,320300,'新沂市',3),(320382,320300,'邳州市',3),(320400,320000,'常州市',2),(320402,320400,'天宁区',3),(320404,320400,'钟楼区',3),(320411,320400,'新北区',3),(320412,320400,'武进区',3),(320413,320400,'金坛区',3),(320481,320400,'溧阳市',3),(320500,320000,'苏州市',2),(320505,320500,'虎丘区',3),(320506,320500,'吴中区',3),(320507,320500,'相城区',3),(320508,320500,'姑苏区',3),(320509,320500,'吴江区',3),(320581,320500,'常熟市',3),(320582,320500,'张家港市',3),(320583,320500,'昆山市',3),(320585,320500,'太仓市',3),(320600,320000,'南通市',2),(320602,320600,'崇川区',3),(320611,320600,'港闸区',3),(320612,320600,'通州区',3),(320621,320600,'海安县',3),(320623,320600,'如东县',3),(320681,320600,'启东市',3),(320682,320600,'如皋市',3),(320684,320600,'海门市',3),(320700,320000,'连云港市',2),(320703,320700,'连云区',3),(320706,320700,'海州区',3),(320707,320700,'赣榆区',3),(320722,320700,'东海县',3),(320723,320700,'灌云县',3),(320724,320700,'灌南县',3),(320800,320000,'淮安市',2),(320803,320800,'淮安区',3),(320804,320800,'淮阴区',3),(320812,320800,'清江浦区',3),(320813,320800,'洪泽区',3),(320826,320800,'涟水县',3),(320830,320800,'盱眙县',3),(320831,320800,'金湖县',3),(320900,320000,'盐城市',2),(320902,320900,'亭湖区',3),(320903,320900,'盐都区',3),(320904,320900,'大丰区',3),(320921,320900,'响水县',3),(320922,320900,'滨海县',3),(320923,320900,'阜宁县',3),(320924,320900,'射阳县',3),(320925,320900,'建湖县',3),(320981,320900,'东台市',3),(321000,320000,'扬州市',2),(321002,321000,'广陵区',3),(321003,321000,'邗江区',3),(321012,321000,'江都区',3),(321023,321000,'宝应县',3),(321081,321000,'仪征市',3),(321084,321000,'高邮市',3),(321100,320000,'镇江市',2),(321102,321100,'京口区',3),(321111,321100,'润州区',3),(321112,321100,'丹徒区',3),(321181,321100,'丹阳市',3),(321182,321100,'扬中市',3),(321183,321100,'句容市',3),(321200,320000,'泰州市',2),(321202,321200,'海陵区',3),(321203,321200,'高港区',3),(321204,321200,'姜堰区',3),(321281,321200,'兴化市',3),(321282,321200,'靖江市',3),(321283,321200,'泰兴市',3),(321300,320000,'宿迁市',2),(321302,321300,'宿城区',3),(321311,321300,'宿豫区',3),(321322,321300,'沭阳县',3),(321323,321300,'泗阳县',3),(321324,321300,'泗洪县',3),(330000,0,'浙江省',1),(330100,330000,'杭州市',2),(330102,330100,'上城区',3),(330103,330100,'下城区',3),(330104,330100,'江干区',3),(330105,330100,'拱墅区',3),(330106,330100,'西湖区',3),(330108,330100,'滨江区',3),(330109,330100,'萧山区',3),(330110,330100,'余杭区',3),(330111,330100,'富阳区',3),(330122,330100,'桐庐县',3),(330127,330100,'淳安县',3),(330182,330100,'建德市',3),(330185,330100,'临安市',3),(330200,330000,'宁波市',2),(330203,330200,'海曙区',3),(330205,330200,'江北区',3),(330206,330200,'北仑区',3),(330211,330200,'镇海区',3),(330212,330200,'鄞州区',3),(330213,330200,'奉化区',3),(330225,330200,'象山县',3),(330226,330200,'宁海县',3),(330281,330200,'余姚市',3),(330282,330200,'慈溪市',3),(330300,330000,'温州市',2),(330302,330300,'鹿城区',3),(330303,330300,'龙湾区',3),(330304,330300,'瓯海区',3),(330305,330300,'洞头区',3),(330324,330300,'永嘉县',3),(330326,330300,'平阳县',3),(330327,330300,'苍南县',3),(330328,330300,'文成县',3),(330329,330300,'泰顺县',3),(330381,330300,'瑞安市',3),(330382,330300,'乐清市',3),(330400,330000,'嘉兴市',2),(330402,330400,'南湖区',3),(330411,330400,'秀洲区',3),(330421,330400,'嘉善县',3),(330424,330400,'海盐县',3),(330481,330400,'海宁市',3),(330482,330400,'平湖市',3),(330483,330400,'桐乡市',3),(330500,330000,'湖州市',2),(330502,330500,'吴兴区',3),(330503,330500,'南浔区',3),(330521,330500,'德清县',3),(330522,330500,'长兴县',3),(330523,330500,'安吉县',3),(330600,330000,'绍兴市',2),(330602,330600,'越城区',3),(330603,330600,'柯桥区',3),(330604,330600,'上虞区',3),(330624,330600,'新昌县',3),(330681,330600,'诸暨市',3),(330683,330600,'嵊州市',3),(330700,330000,'金华市',2),(330702,330700,'婺城区',3),(330703,330700,'金东区',3),(330723,330700,'武义县',3),(330726,330700,'浦江县',3),(330727,330700,'磐安县',3),(330781,330700,'兰溪市',3),(330782,330700,'义乌市',3),(330783,330700,'东阳市',3),(330784,330700,'永康市',3),(330800,330000,'衢州市',2),(330802,330800,'柯城区',3),(330803,330800,'衢江区',3),(330822,330800,'常山县',3),(330824,330800,'开化县',3),(330825,330800,'龙游县',3),(330881,330800,'江山市',3),(330900,330000,'舟山市',2),(330902,330900,'定海区',3),(330903,330900,'普陀区',3),(330921,330900,'岱山县',3),(330922,330900,'嵊泗县',3),(331000,330000,'台州市',2),(331002,331000,'椒江区',3),(331003,331000,'黄岩区',3),(331004,331000,'路桥区',3),(331021,331000,'玉环市',3),(331022,331000,'三门县',3),(331023,331000,'天台县',3),(331024,331000,'仙居县',3),(331081,331000,'温岭市',3),(331082,331000,'临海市',3),(331100,330000,'丽水市',2),(331102,331100,'莲都区',3),(331121,331100,'青田县',3),(331122,331100,'缙云县',3),(331123,331100,'遂昌县',3),(331124,331100,'松阳县',3),(331125,331100,'云和县',3),(331126,331100,'庆元县',3),(331127,331100,'景宁畲族自治县',3),(331181,331100,'龙泉市',3),(340000,0,'安徽省',1),(340100,340000,'合肥市',2),(340102,340100,'瑶海区',3),(340103,340100,'庐阳区',3),(340104,340100,'蜀山区',3),(340111,340100,'包河区',3),(340121,340100,'长丰县',3),(340122,340100,'肥东县',3),(340123,340100,'肥西县',3),(340124,340100,'庐江县',3),(340181,340100,'巢湖市',3),(340200,340000,'芜湖市',2),(340202,340200,'镜湖区',3),(340203,340200,'弋江区',3),(340207,340200,'鸠江区',3),(340208,340200,'三山区',3),(340221,340200,'芜湖县',3),(340222,340200,'繁昌县',3),(340223,340200,'南陵县',3),(340225,340200,'无为县',3),(340300,340000,'蚌埠市',2),(340302,340300,'龙子湖区',3),(340303,340300,'蚌山区',3),(340304,340300,'禹会区',3),(340311,340300,'淮上区',3),(340321,340300,'怀远县',3),(340322,340300,'五河县',3),(340323,340300,'固镇县',3),(340400,340000,'淮南市',2),(340402,340400,'大通区',3),(340403,340400,'田家庵区',3),(340404,340400,'谢家集区',3),(340405,340400,'八公山区',3),(340406,340400,'潘集区',3),(340421,340400,'凤台县',3),(340422,340400,'寿县',3),(340500,340000,'马鞍山市',2),(340503,340500,'花山区',3),(340504,340500,'雨山区',3),(340506,340500,'博望区',3),(340521,340500,'当涂县',3),(340522,340500,'含山县',3),(340523,340500,'和县',3),(340600,340000,'淮北市',2),(340602,340600,'杜集区',3),(340603,340600,'相山区',3),(340604,340600,'烈山区',3),(340621,340600,'濉溪县',3),(340700,340000,'铜陵市',2),(340705,340700,'铜官区',3),(340706,340700,'义安区',3),(340711,340700,'郊区',3),(340722,340700,'枞阳县',3),(340800,340000,'安庆市',2),(340802,340800,'迎江区',3),(340803,340800,'大观区',3),(340811,340800,'宜秀区',3),(340822,340800,'怀宁县',3),(340824,340800,'潜山县',3),(340825,340800,'太湖县',3),(340826,340800,'宿松县',3),(340827,340800,'望江县',3),(340828,340800,'岳西县',3),(340881,340800,'桐城市',3),(341000,340000,'黄山市',2),(341002,341000,'屯溪区',3),(341003,341000,'黄山区',3),(341004,341000,'徽州区',3),(341021,341000,'歙县',3),(341022,341000,'休宁县',3),(341023,341000,'黟县',3),(341024,341000,'祁门县',3),(341100,340000,'滁州市',2),(341102,341100,'琅琊区',3),(341103,341100,'南谯区',3),(341122,341100,'来安县',3),(341124,341100,'全椒县',3),(341125,341100,'定远县',3),(341126,341100,'凤阳县',3),(341181,341100,'天长市',3),(341182,341100,'明光市',3),(341200,340000,'阜阳市',2),(341202,341200,'颍州区',3),(341203,341200,'颍东区',3),(341204,341200,'颍泉区',3),(341221,341200,'临泉县',3),(341222,341200,'太和县',3),(341225,341200,'阜南县',3),(341226,341200,'颍上县',3),(341282,341200,'界首市',3),(341300,340000,'宿州市',2),(341302,341300,'埇桥区',3),(341321,341300,'砀山县',3),(341322,341300,'萧县',3),(341323,341300,'灵璧县',3),(341324,341300,'泗县',3),(341500,340000,'六安市',2),(341502,341500,'金安区',3),(341503,341500,'裕安区',3),(341504,341500,'叶集区',3),(341522,341500,'霍邱县',3),(341523,341500,'舒城县',3),(341524,341500,'金寨县',3),(341525,341500,'霍山县',3),(341600,340000,'亳州市',2),(341602,341600,'谯城区',3),(341621,341600,'涡阳县',3),(341622,341600,'蒙城县',3),(341623,341600,'利辛县',3),(341700,340000,'池州市',2),(341702,341700,'贵池区',3),(341721,341700,'东至县',3),(341722,341700,'石台县',3),(341723,341700,'青阳县',3),(341800,340000,'宣城市',2),(341802,341800,'宣州区',3),(341821,341800,'郎溪县',3),(341822,341800,'广德县',3),(341823,341800,'泾县',3),(341824,341800,'绩溪县',3),(341825,341800,'旌德县',3),(341881,341800,'宁国市',3),(350000,0,'福建省',1),(350100,350000,'福州市',2),(350102,350100,'鼓楼区',3),(350103,350100,'台江区',3),(350104,350100,'仓山区',3),(350105,350100,'马尾区',3),(350111,350100,'晋安区',3),(350121,350100,'闽侯县',3),(350122,350100,'连江县',3),(350123,350100,'罗源县',3),(350124,350100,'闽清县',3),(350125,350100,'永泰县',3),(350128,350100,'平潭县',3),(350181,350100,'福清市',3),(350182,350100,'长乐市',3),(350200,350000,'厦门市',2),(350203,350200,'思明区',3),(350205,350200,'海沧区',3),(350206,350200,'湖里区',3),(350211,350200,'集美区',3),(350212,350200,'同安区',3),(350213,350200,'翔安区',3),(350300,350000,'莆田市',2),(350302,350300,'城厢区',3),(350303,350300,'涵江区',3),(350304,350300,'荔城区',3),(350305,350300,'秀屿区',3),(350322,350300,'仙游县',3),(350400,350000,'三明市',2),(350402,350400,'梅列区',3),(350403,350400,'三元区',3),(350421,350400,'明溪县',3),(350423,350400,'清流县',3),(350424,350400,'宁化县',3),(350425,350400,'大田县',3),(350426,350400,'尤溪县',3),(350427,350400,'沙县',3),(350428,350400,'将乐县',3),(350429,350400,'泰宁县',3),(350430,350400,'建宁县',3),(350481,350400,'永安市',3),(350500,350000,'泉州市',2),(350502,350500,'鲤城区',3),(350503,350500,'丰泽区',3),(350504,350500,'洛江区',3),(350505,350500,'泉港区',3),(350521,350500,'惠安县',3),(350524,350500,'安溪县',3),(350525,350500,'永春县',3),(350526,350500,'德化县',3),(350527,350500,'金门县',3),(350581,350500,'石狮市',3),(350582,350500,'晋江市',3),(350583,350500,'南安市',3),(350600,350000,'漳州市',2),(350602,350600,'芗城区',3),(350603,350600,'龙文区',3),(350622,350600,'云霄县',3),(350623,350600,'漳浦县',3),(350624,350600,'诏安县',3),(350625,350600,'长泰县',3),(350626,350600,'东山县',3),(350627,350600,'南靖县',3),(350628,350600,'平和县',3),(350629,350600,'华安县',3),(350681,350600,'龙海市',3),(350700,350000,'南平市',2),(350702,350700,'延平区',3),(350703,350700,'建阳区',3),(350721,350700,'顺昌县',3),(350722,350700,'浦城县',3),(350723,350700,'光泽县',3),(350724,350700,'松溪县',3),(350725,350700,'政和县',3),(350781,350700,'邵武市',3),(350782,350700,'武夷山市',3),(350783,350700,'建瓯市',3),(350800,350000,'龙岩市',2),(350802,350800,'新罗区',3),(350803,350800,'永定区',3),(350821,350800,'长汀县',3),(350823,350800,'上杭县',3),(350824,350800,'武平县',3),(350825,350800,'连城县',3),(350881,350800,'漳平市',3),(350900,350000,'宁德市',2),(350902,350900,'蕉城区',3),(350921,350900,'霞浦县',3),(350922,350900,'古田县',3),(350923,350900,'屏南县',3),(350924,350900,'寿宁县',3),(350925,350900,'周宁县',3),(350926,350900,'柘荣县',3),(350981,350900,'福安市',3),(350982,350900,'福鼎市',3),(360000,0,'江西省',1),(360100,360000,'南昌市',2),(360102,360100,'东湖区',3),(360103,360100,'西湖区',3),(360104,360100,'青云谱区',3),(360105,360100,'湾里区',3),(360111,360100,'青山湖区',3),(360112,360100,'新建区',3),(360121,360100,'南昌县',3),(360123,360100,'安义县',3),(360124,360100,'进贤县',3),(360200,360000,'景德镇市',2),(360202,360200,'昌江区',3),(360203,360200,'珠山区',3),(360222,360200,'浮梁县',3),(360281,360200,'乐平市',3),(360300,360000,'萍乡市',2),(360302,360300,'安源区',3),(360313,360300,'湘东区',3),(360321,360300,'莲花县',3),(360322,360300,'上栗县',3),(360323,360300,'芦溪县',3),(360400,360000,'九江市',2),(360402,360400,'濂溪区',3),(360403,360400,'浔阳区',3),(360421,360400,'九江县',3),(360423,360400,'武宁县',3),(360424,360400,'修水县',3),(360425,360400,'永修县',3),(360426,360400,'德安县',3),(360428,360400,'都昌县',3),(360429,360400,'湖口县',3),(360430,360400,'彭泽县',3),(360481,360400,'瑞昌市',3),(360482,360400,'共青城市',3),(360483,360400,'庐山市',3),(360500,360000,'新余市',2),(360502,360500,'渝水区',3),(360521,360500,'分宜县',3),(360600,360000,'鹰潭市',2),(360602,360600,'月湖区',3),(360622,360600,'余江县',3),(360681,360600,'贵溪市',3),(360700,360000,'赣州市',2),(360702,360700,'章贡区',3),(360703,360700,'南康区',3),(360704,360700,'赣县区',3),(360722,360700,'信丰县',3),(360723,360700,'大余县',3),(360724,360700,'上犹县',3),(360725,360700,'崇义县',3),(360726,360700,'安远县',3),(360727,360700,'龙南县',3),(360728,360700,'定南县',3),(360729,360700,'全南县',3),(360730,360700,'宁都县',3),(360731,360700,'于都县',3),(360732,360700,'兴国县',3),(360733,360700,'会昌县',3),(360734,360700,'寻乌县',3),(360735,360700,'石城县',3),(360781,360700,'瑞金市',3),(360800,360000,'吉安市',2),(360802,360800,'吉州区',3),(360803,360800,'青原区',3),(360821,360800,'吉安县',3),(360822,360800,'吉水县',3),(360823,360800,'峡江县',3),(360824,360800,'新干县',3),(360825,360800,'永丰县',3),(360826,360800,'泰和县',3),(360827,360800,'遂川县',3),(360828,360800,'万安县',3),(360829,360800,'安福县',3),(360830,360800,'永新县',3),(360881,360800,'井冈山市',3),(360900,360000,'宜春市',2),(360902,360900,'袁州区',3),(360921,360900,'奉新县',3),(360922,360900,'万载县',3),(360923,360900,'上高县',3),(360924,360900,'宜丰县',3),(360925,360900,'靖安县',3),(360926,360900,'铜鼓县',3),(360981,360900,'丰城市',3),(360982,360900,'樟树市',3),(360983,360900,'高安市',3),(361000,360000,'抚州市',2),(361002,361000,'临川区',3),(361003,361000,'东乡区',3),(361021,361000,'南城县',3),(361022,361000,'黎川县',3),(361023,361000,'南丰县',3),(361024,361000,'崇仁县',3),(361025,361000,'乐安县',3),(361026,361000,'宜黄县',3),(361027,361000,'金溪县',3),(361028,361000,'资溪县',3),(361030,361000,'广昌县',3),(361100,360000,'上饶市',2),(361102,361100,'信州区',3),(361103,361100,'广丰区',3),(361121,361100,'上饶县',3),(361123,361100,'玉山县',3),(361124,361100,'铅山县',3),(361125,361100,'横峰县',3),(361126,361100,'弋阳县',3),(361127,361100,'余干县',3),(361128,361100,'鄱阳县',3),(361129,361100,'万年县',3),(361130,361100,'婺源县',3),(361181,361100,'德兴市',3),(370000,0,'山东省',1),(370100,370000,'济南市',2),(370102,370100,'历下区',3),(370103,370100,'市中区',3),(370104,370100,'槐荫区',3),(370105,370100,'天桥区',3),(370112,370100,'历城区',3),(370113,370100,'长清区',3),(370114,370100,'章丘区',3),(370124,370100,'平阴县',3),(370125,370100,'济阳县',3),(370126,370100,'商河县',3),(370200,370000,'青岛市',2),(370202,370200,'市南区',3),(370203,370200,'市北区',3),(370211,370200,'黄岛区',3),(370212,370200,'崂山区',3),(370213,370200,'李沧区',3),(370214,370200,'城阳区',3),(370281,370200,'胶州市',3),(370282,370200,'即墨市',3),(370283,370200,'平度市',3),(370285,370200,'莱西市',3),(370300,370000,'淄博市',2),(370302,370300,'淄川区',3),(370303,370300,'张店区',3),(370304,370300,'博山区',3),(370305,370300,'临淄区',3),(370306,370300,'周村区',3),(370321,370300,'桓台县',3),(370322,370300,'高青县',3),(370323,370300,'沂源县',3),(370400,370000,'枣庄市',2),(370402,370400,'市中区',3),(370403,370400,'薛城区',3),(370404,370400,'峄城区',3),(370405,370400,'台儿庄区',3),(370406,370400,'山亭区',3),(370481,370400,'滕州市',3),(370500,370000,'东营市',2),(370502,370500,'东营区',3),(370503,370500,'河口区',3),(370505,370500,'垦利区',3),(370522,370500,'利津县',3),(370523,370500,'广饶县',3),(370600,370000,'烟台市',2),(370602,370600,'芝罘区',3),(370611,370600,'福山区',3),(370612,370600,'牟平区',3),(370613,370600,'莱山区',3),(370634,370600,'长岛县',3),(370681,370600,'龙口市',3),(370682,370600,'莱阳市',3),(370683,370600,'莱州市',3),(370684,370600,'蓬莱市',3),(370685,370600,'招远市',3),(370686,370600,'栖霞市',3),(370687,370600,'海阳市',3),(370700,370000,'潍坊市',2),(370702,370700,'潍城区',3),(370703,370700,'寒亭区',3),(370704,370700,'坊子区',3),(370705,370700,'奎文区',3),(370724,370700,'临朐县',3),(370725,370700,'昌乐县',3),(370781,370700,'青州市',3),(370782,370700,'诸城市',3),(370783,370700,'寿光市',3),(370784,370700,'安丘市',3),(370785,370700,'高密市',3),(370786,370700,'昌邑市',3),(370800,370000,'济宁市',2),(370811,370800,'任城区',3),(370812,370800,'兖州区',3),(370826,370800,'微山县',3),(370827,370800,'鱼台县',3),(370828,370800,'金乡县',3),(370829,370800,'嘉祥县',3),(370830,370800,'汶上县',3),(370831,370800,'泗水县',3),(370832,370800,'梁山县',3),(370881,370800,'曲阜市',3),(370883,370800,'邹城市',3),(370900,370000,'泰安市',2),(370902,370900,'泰山区',3),(370911,370900,'岱岳区',3),(370921,370900,'宁阳县',3),(370923,370900,'东平县',3),(370982,370900,'新泰市',3),(370983,370900,'肥城市',3),(371000,370000,'威海市',2),(371002,371000,'环翠区',3),(371003,371000,'文登区',3),(371082,371000,'荣成市',3),(371083,371000,'乳山市',3),(371100,370000,'日照市',2),(371102,371100,'东港区',3),(371103,371100,'岚山区',3),(371121,371100,'五莲县',3),(371122,371100,'莒县',3),(371200,370000,'莱芜市',2),(371202,371200,'莱城区',3),(371203,371200,'钢城区',3),(371300,370000,'临沂市',2),(371302,371300,'兰山区',3),(371311,371300,'罗庄区',3),(371312,371300,'河东区',3),(371321,371300,'沂南县',3),(371322,371300,'郯城县',3),(371323,371300,'沂水县',3),(371324,371300,'兰陵县',3),(371325,371300,'费县',3),(371326,371300,'平邑县',3),(371327,371300,'莒南县',3),(371328,371300,'蒙阴县',3),(371329,371300,'临沭县',3),(371400,370000,'德州市',2),(371402,371400,'德城区',3),(371403,371400,'陵城区',3),(371422,371400,'宁津县',3),(371423,371400,'庆云县',3),(371424,371400,'临邑县',3),(371425,371400,'齐河县',3),(371426,371400,'平原县',3),(371427,371400,'夏津县',3),(371428,371400,'武城县',3),(371481,371400,'乐陵市',3),(371482,371400,'禹城市',3),(371500,370000,'聊城市',2),(371502,371500,'东昌府区',3),(371521,371500,'阳谷县',3),(371522,371500,'莘县',3),(371523,371500,'茌平县',3),(371524,371500,'东阿县',3),(371525,371500,'冠县',3),(371526,371500,'高唐县',3),(371581,371500,'临清市',3),(371600,370000,'滨州市',2),(371602,371600,'滨城区',3),(371603,371600,'沾化区',3),(371621,371600,'惠民县',3),(371622,371600,'阳信县',3),(371623,371600,'无棣县',3),(371625,371600,'博兴县',3),(371626,371600,'邹平县',3),(371700,370000,'菏泽市',2),(371702,371700,'牡丹区',3),(371703,371700,'定陶区',3),(371721,371700,'曹县',3),(371722,371700,'单县',3),(371723,371700,'成武县',3),(371724,371700,'巨野县',3),(371725,371700,'郓城县',3),(371726,371700,'鄄城县',3),(371728,371700,'东明县',3),(410000,0,'河南省',1),(410100,410000,'郑州市',2),(410102,410100,'中原区',3),(410103,410100,'二七区',3),(410104,410100,'管城回族区',3),(410105,410100,'金水区',3),(410106,410100,'上街区',3),(410108,410100,'惠济区',3),(410122,410100,'中牟县',3),(410181,410100,'巩义市',3),(410182,410100,'荥阳市',3),(410183,410100,'新密市',3),(410184,410100,'新郑市',3),(410185,410100,'登封市',3),(410200,410000,'开封市',2),(410202,410200,'龙亭区',3),(410203,410200,'顺河回族区',3),(410204,410200,'鼓楼区',3),(410205,410200,'禹王台区',3),(410212,410200,'祥符区',3),(410221,410200,'杞县',3),(410222,410200,'通许县',3),(410223,410200,'尉氏县',3),(410225,410200,'兰考县',3),(410300,410000,'洛阳市',2),(410302,410300,'老城区',3),(410303,410300,'西工区',3),(410304,410300,'瀍河回族区',3),(410305,410300,'涧西区',3),(410306,410300,'吉利区',3),(410311,410300,'洛龙区',3),(410322,410300,'孟津县',3),(410323,410300,'新安县',3),(410324,410300,'栾川县',3),(410325,410300,'嵩县',3),(410326,410300,'汝阳县',3),(410327,410300,'宜阳县',3),(410328,410300,'洛宁县',3),(410329,410300,'伊川县',3),(410381,410300,'偃师市',3),(410400,410000,'平顶山市',2),(410402,410400,'新华区',3),(410403,410400,'卫东区',3),(410404,410400,'石龙区',3),(410411,410400,'湛河区',3),(410421,410400,'宝丰县',3),(410422,410400,'叶县',3),(410423,410400,'鲁山县',3),(410425,410400,'郏县',3),(410481,410400,'舞钢市',3),(410482,410400,'汝州市',3),(410500,410000,'安阳市',2),(410502,410500,'文峰区',3),(410503,410500,'北关区',3),(410505,410500,'殷都区',3),(410506,410500,'龙安区',3),(410522,410500,'安阳县',3),(410523,410500,'汤阴县',3),(410526,410500,'滑县',3),(410527,410500,'内黄县',3),(410581,410500,'林州市',3),(410600,410000,'鹤壁市',2),(410602,410600,'鹤山区',3),(410603,410600,'山城区',3),(410611,410600,'淇滨区',3),(410621,410600,'浚县',3),(410622,410600,'淇县',3),(410700,410000,'新乡市',2),(410702,410700,'红旗区',3),(410703,410700,'卫滨区',3),(410704,410700,'凤泉区',3),(410711,410700,'牧野区',3),(410721,410700,'新乡县',3),(410724,410700,'获嘉县',3),(410725,410700,'原阳县',3),(410726,410700,'延津县',3),(410727,410700,'封丘县',3),(410728,410700,'长垣县',3),(410781,410700,'卫辉市',3),(410782,410700,'辉县市',3),(410800,410000,'焦作市',2),(410802,410800,'解放区',3),(410803,410800,'中站区',3),(410804,410800,'马村区',3),(410811,410800,'山阳区',3),(410821,410800,'修武县',3),(410822,410800,'博爱县',3),(410823,410800,'武陟县',3),(410825,410800,'温县',3),(410882,410800,'沁阳市',3),(410883,410800,'孟州市',3),(410900,410000,'濮阳市',2),(410902,410900,'华龙区',3),(410922,410900,'清丰县',3),(410923,410900,'南乐县',3),(410926,410900,'范县',3),(410927,410900,'台前县',3),(410928,410900,'濮阳县',3),(411000,410000,'许昌市',2),(411002,411000,'魏都区',3),(411003,411000,'建安区',3),(411024,411000,'鄢陵县',3),(411025,411000,'襄城县',3),(411081,411000,'禹州市',3),(411082,411000,'长葛市',3),(411100,410000,'漯河市',2),(411102,411100,'源汇区',3),(411103,411100,'郾城区',3),(411104,411100,'召陵区',3),(411121,411100,'舞阳县',3),(411122,411100,'临颍县',3),(411200,410000,'三门峡市',2),(411202,411200,'湖滨区',3),(411203,411200,'陕州区',3),(411221,411200,'渑池县',3),(411224,411200,'卢氏县',3),(411281,411200,'义马市',3),(411282,411200,'灵宝市',3),(411300,410000,'南阳市',2),(411302,411300,'宛城区',3),(411303,411300,'卧龙区',3),(411321,411300,'南召县',3),(411322,411300,'方城县',3),(411323,411300,'西峡县',3),(411324,411300,'镇平县',3),(411325,411300,'内乡县',3),(411326,411300,'淅川县',3),(411327,411300,'社旗县',3),(411328,411300,'唐河县',3),(411329,411300,'新野县',3),(411330,411300,'桐柏县',3),(411381,411300,'邓州市',3),(411400,410000,'商丘市',2),(411402,411400,'梁园区',3),(411403,411400,'睢阳区',3),(411421,411400,'民权县',3),(411422,411400,'睢县',3),(411423,411400,'宁陵县',3),(411424,411400,'柘城县',3),(411425,411400,'虞城县',3),(411426,411400,'夏邑县',3),(411481,411400,'永城市',3),(411500,410000,'信阳市',2),(411502,411500,'浉河区',3),(411503,411500,'平桥区',3),(411521,411500,'罗山县',3),(411522,411500,'光山县',3),(411523,411500,'新县',3),(411524,411500,'商城县',3),(411525,411500,'固始县',3),(411526,411500,'潢川县',3),(411527,411500,'淮滨县',3),(411528,411500,'息县',3),(411600,410000,'周口市',2),(411602,411600,'川汇区',3),(411621,411600,'扶沟县',3),(411622,411600,'西华县',3),(411623,411600,'商水县',3),(411624,411600,'沈丘县',3),(411625,411600,'郸城县',3),(411626,411600,'淮阳县',3),(411627,411600,'太康县',3),(411628,411600,'鹿邑县',3),(411681,411600,'项城市',3),(411700,410000,'驻马店市',2),(411702,411700,'驿城区',3),(411721,411700,'西平县',3),(411722,411700,'上蔡县',3),(411723,411700,'平舆县',3),(411724,411700,'正阳县',3),(411725,411700,'确山县',3),(411726,411700,'泌阳县',3),(411727,411700,'汝南县',3),(411728,411700,'遂平县',3),(411729,411700,'新蔡县',3),(419001,410000,'济源市',2),(420000,0,'湖北省',1),(420100,420000,'武汉市',2),(420102,420100,'江岸区',3),(420103,420100,'江汉区',3),(420104,420100,'硚口区',3),(420105,420100,'汉阳区',3),(420106,420100,'武昌区',3),(420107,420100,'青山区',3),(420111,420100,'洪山区',3),(420112,420100,'东西湖区',3),(420113,420100,'汉南区',3),(420114,420100,'蔡甸区',3),(420115,420100,'江夏区',3),(420116,420100,'黄陂区',3),(420117,420100,'新洲区',3),(420200,420000,'黄石市',2),(420202,420200,'黄石港区',3),(420203,420200,'西塞山区',3),(420204,420200,'下陆区',3),(420205,420200,'铁山区',3),(420222,420200,'阳新县',3),(420281,420200,'大冶市',3),(420300,420000,'十堰市',2),(420302,420300,'茅箭区',3),(420303,420300,'张湾区',3),(420304,420300,'郧阳区',3),(420322,420300,'郧西县',3),(420323,420300,'竹山县',3),(420324,420300,'竹溪县',3),(420325,420300,'房县',3),(420381,420300,'丹江口市',3),(420500,420000,'宜昌市',2),(420502,420500,'西陵区',3),(420503,420500,'伍家岗区',3),(420504,420500,'点军区',3),(420505,420500,'猇亭区',3),(420506,420500,'夷陵区',3),(420525,420500,'远安县',3),(420526,420500,'兴山县',3),(420527,420500,'秭归县',3),(420528,420500,'长阳土家族自治县',3),(420529,420500,'五峰土家族自治县',3),(420581,420500,'宜都市',3),(420582,420500,'当阳市',3),(420583,420500,'枝江市',3),(420600,420000,'襄阳市',2),(420602,420600,'襄城区',3),(420606,420600,'樊城区',3),(420607,420600,'襄州区',3),(420624,420600,'南漳县',3),(420625,420600,'谷城县',3),(420626,420600,'保康县',3),(420682,420600,'老河口市',3),(420683,420600,'枣阳市',3),(420684,420600,'宜城市',3),(420700,420000,'鄂州市',2),(420702,420700,'梁子湖区',3),(420703,420700,'华容区',3),(420704,420700,'鄂城区',3),(420800,420000,'荆门市',2),(420802,420800,'东宝区',3),(420804,420800,'掇刀区',3),(420821,420800,'京山县',3),(420822,420800,'沙洋县',3),(420881,420800,'钟祥市',3),(420900,420000,'孝感市',2),(420902,420900,'孝南区',3),(420921,420900,'孝昌县',3),(420922,420900,'大悟县',3),(420923,420900,'云梦县',3),(420981,420900,'应城市',3),(420982,420900,'安陆市',3),(420984,420900,'汉川市',3),(421000,420000,'荆州市',2),(421002,421000,'沙市区',3),(421003,421000,'荆州区',3),(421022,421000,'公安县',3),(421023,421000,'监利县',3),(421024,421000,'江陵县',3),(421081,421000,'石首市',3),(421083,421000,'洪湖市',3),(421087,421000,'松滋市',3),(421100,420000,'黄冈市',2),(421102,421100,'黄州区',3),(421121,421100,'团风县',3),(421122,421100,'红安县',3),(421123,421100,'罗田县',3),(421124,421100,'英山县',3),(421125,421100,'浠水县',3),(421126,421100,'蕲春县',3),(421127,421100,'黄梅县',3),(421181,421100,'麻城市',3),(421182,421100,'武穴市',3),(421200,420000,'咸宁市',2),(421202,421200,'咸安区',3),(421221,421200,'嘉鱼县',3),(421222,421200,'通城县',3),(421223,421200,'崇阳县',3),(421224,421200,'通山县',3),(421281,421200,'赤壁市',3),(421300,420000,'随州市',2),(421303,421300,'曾都区',3),(421321,421300,'随县',3),(421381,421300,'广水市',3),(422800,420000,'恩施土家族苗族自治州',2),(422801,422800,'恩施市',3),(422802,422800,'利川市',3),(422822,422800,'建始县',3),(422823,422800,'巴东县',3),(422825,422800,'宣恩县',3),(422826,422800,'咸丰县',3),(422827,422800,'来凤县',3),(422828,422800,'鹤峰县',3),(429004,420000,'仙桃市',2),(429005,420000,'潜江市',2),(429006,420000,'天门市',2),(429021,420000,'神农架林区',2),(430000,0,'湖南省',1),(430100,430000,'长沙市',2),(430102,430100,'芙蓉区',3),(430103,430100,'天心区',3),(430104,430100,'岳麓区',3),(430105,430100,'开福区',3),(430111,430100,'雨花区',3),(430112,430100,'望城区',3),(430121,430100,'长沙县',3),(430124,430100,'宁乡市',3),(430181,430100,'浏阳市',3),(430200,430000,'株洲市',2),(430202,430200,'荷塘区',3),(430203,430200,'芦淞区',3),(430204,430200,'石峰区',3),(430211,430200,'天元区',3),(430221,430200,'株洲县',3),(430223,430200,'攸县',3),(430224,430200,'茶陵县',3),(430225,430200,'炎陵县',3),(430281,430200,'醴陵市',3),(430300,430000,'湘潭市',2),(430302,430300,'雨湖区',3),(430304,430300,'岳塘区',3),(430321,430300,'湘潭县',3),(430381,430300,'湘乡市',3),(430382,430300,'韶山市',3),(430400,430000,'衡阳市',2),(430405,430400,'珠晖区',3),(430406,430400,'雁峰区',3),(430407,430400,'石鼓区',3),(430408,430400,'蒸湘区',3),(430412,430400,'南岳区',3),(430421,430400,'衡阳县',3),(430422,430400,'衡南县',3),(430423,430400,'衡山县',3),(430424,430400,'衡东县',3),(430426,430400,'祁东县',3),(430481,430400,'耒阳市',3),(430482,430400,'常宁市',3),(430500,430000,'邵阳市',2),(430502,430500,'双清区',3),(430503,430500,'大祥区',3),(430511,430500,'北塔区',3),(430521,430500,'邵东县',3),(430522,430500,'新邵县',3),(430523,430500,'邵阳县',3),(430524,430500,'隆回县',3),(430525,430500,'洞口县',3),(430527,430500,'绥宁县',3),(430528,430500,'新宁县',3),(430529,430500,'城步苗族自治县',3),(430581,430500,'武冈市',3),(430600,430000,'岳阳市',2),(430602,430600,'岳阳楼区',3),(430603,430600,'云溪区',3),(430611,430600,'君山区',3),(430621,430600,'岳阳县',3),(430623,430600,'华容县',3),(430624,430600,'湘阴县',3),(430626,430600,'平江县',3),(430681,430600,'汨罗市',3),(430682,430600,'临湘市',3),(430700,430000,'常德市',2),(430702,430700,'武陵区',3),(430703,430700,'鼎城区',3),(430721,430700,'安乡县',3),(430722,430700,'汉寿县',3),(430723,430700,'澧县',3),(430724,430700,'临澧县',3),(430725,430700,'桃源县',3),(430726,430700,'石门县',3),(430781,430700,'津市市',3),(430800,430000,'张家界市',2),(430802,430800,'永定区',3),(430811,430800,'武陵源区',3),(430821,430800,'慈利县',3),(430822,430800,'桑植县',3),(430900,430000,'益阳市',2),(430902,430900,'资阳区',3),(430903,430900,'赫山区',3),(430921,430900,'南县',3),(430922,430900,'桃江县',3),(430923,430900,'安化县',3),(430981,430900,'沅江市',3),(431000,430000,'郴州市',2),(431002,431000,'北湖区',3),(431003,431000,'苏仙区',3),(431021,431000,'桂阳县',3),(431022,431000,'宜章县',3),(431023,431000,'永兴县',3),(431024,431000,'嘉禾县',3),(431025,431000,'临武县',3),(431026,431000,'汝城县',3),(431027,431000,'桂东县',3),(431028,431000,'安仁县',3),(431081,431000,'资兴市',3),(431100,430000,'永州市',2),(431102,431100,'零陵区',3),(431103,431100,'冷水滩区',3),(431121,431100,'祁阳县',3),(431122,431100,'东安县',3),(431123,431100,'双牌县',3),(431124,431100,'道县',3),(431125,431100,'江永县',3),(431126,431100,'宁远县',3),(431127,431100,'蓝山县',3),(431128,431100,'新田县',3),(431129,431100,'江华瑶族自治县',3),(431200,430000,'怀化市',2),(431202,431200,'鹤城区',3),(431221,431200,'中方县',3),(431222,431200,'沅陵县',3),(431223,431200,'辰溪县',3),(431224,431200,'溆浦县',3),(431225,431200,'会同县',3),(431226,431200,'麻阳苗族自治县',3),(431227,431200,'新晃侗族自治县',3),(431228,431200,'芷江侗族自治县',3),(431229,431200,'靖州苗族侗族自治县',3),(431230,431200,'通道侗族自治县',3),(431281,431200,'洪江市',3),(431300,430000,'娄底市',2),(431302,431300,'娄星区',3),(431321,431300,'双峰县',3),(431322,431300,'新化县',3),(431381,431300,'冷水江市',3),(431382,431300,'涟源市',3),(433100,430000,'湘西土家族苗族自治州',2),(433101,433100,'吉首市',3),(433122,433100,'泸溪县',3),(433123,433100,'凤凰县',3),(433124,433100,'花垣县',3),(433125,433100,'保靖县',3),(433126,433100,'古丈县',3),(433127,433100,'永顺县',3),(433130,433100,'龙山县',3),(440000,0,'广东省',1),(440100,440000,'广州市',2),(440103,440100,'荔湾区',3),(440104,440100,'越秀区',3),(440105,440100,'海珠区',3),(440106,440100,'天河区',3),(440111,440100,'白云区',3),(440112,440100,'黄埔区',3),(440113,440100,'番禺区',3),(440114,440100,'花都区',3),(440115,440100,'南沙区',3),(440117,440100,'从化区',3),(440118,440100,'增城区',3),(440200,440000,'韶关市',2),(440203,440200,'武江区',3),(440204,440200,'浈江区',3),(440205,440200,'曲江区',3),(440222,440200,'始兴县',3),(440224,440200,'仁化县',3),(440229,440200,'翁源县',3),(440232,440200,'乳源瑶族自治县',3),(440233,440200,'新丰县',3),(440281,440200,'乐昌市',3),(440282,440200,'南雄市',3),(440300,440000,'深圳市',2),(440303,440300,'罗湖区',3),(440304,440300,'福田区',3),(440305,440300,'南山区',3),(440306,440300,'宝安区',3),(440307,440300,'龙岗区',3),(440308,440300,'盐田区',3),(440309,440300,'龙华区',3),(440310,440300,'坪山区',3),(440400,440000,'珠海市',2),(440402,440400,'香洲区',3),(440403,440400,'斗门区',3),(440404,440400,'金湾区',3),(440500,440000,'汕头市',2),(440507,440500,'龙湖区',3),(440511,440500,'金平区',3),(440512,440500,'濠江区',3),(440513,440500,'潮阳区',3),(440514,440500,'潮南区',3),(440515,440500,'澄海区',3),(440523,440500,'南澳县',3),(440600,440000,'佛山市',2),(440604,440600,'禅城区',3),(440605,440600,'南海区',3),(440606,440600,'顺德区',3),(440607,440600,'三水区',3),(440608,440600,'高明区',3),(440700,440000,'江门市',2),(440703,440700,'蓬江区',3),(440704,440700,'江海区',3),(440705,440700,'新会区',3),(440781,440700,'台山市',3),(440783,440700,'开平市',3),(440784,440700,'鹤山市',3),(440785,440700,'恩平市',3),(440800,440000,'湛江市',2),(440802,440800,'赤坎区',3),(440803,440800,'霞山区',3),(440804,440800,'坡头区',3),(440811,440800,'麻章区',3),(440823,440800,'遂溪县',3),(440825,440800,'徐闻县',3),(440881,440800,'廉江市',3),(440882,440800,'雷州市',3),(440883,440800,'吴川市',3),(440900,440000,'茂名市',2),(440902,440900,'茂南区',3),(440904,440900,'电白区',3),(440981,440900,'高州市',3),(440982,440900,'化州市',3),(440983,440900,'信宜市',3),(441200,440000,'肇庆市',2),(441202,441200,'端州区',3),(441203,441200,'鼎湖区',3),(441204,441200,'高要区',3),(441223,441200,'广宁县',3),(441224,441200,'怀集县',3),(441225,441200,'封开县',3),(441226,441200,'德庆县',3),(441284,441200,'四会市',3),(441300,440000,'惠州市',2),(441302,441300,'惠城区',3),(441303,441300,'惠阳区',3),(441322,441300,'博罗县',3),(441323,441300,'惠东县',3),(441324,441300,'龙门县',3),(441400,440000,'梅州市',2),(441402,441400,'梅江区',3),(441403,441400,'梅县区',3),(441422,441400,'大埔县',3),(441423,441400,'丰顺县',3),(441424,441400,'五华县',3),(441426,441400,'平远县',3),(441427,441400,'蕉岭县',3),(441481,441400,'兴宁市',3),(441500,440000,'汕尾市',2),(441502,441500,'城区',3),(441521,441500,'海丰县',3),(441523,441500,'陆河县',3),(441581,441500,'陆丰市',3),(441600,440000,'河源市',2),(441602,441600,'源城区',3),(441621,441600,'紫金县',3),(441622,441600,'龙川县',3),(441623,441600,'连平县',3),(441624,441600,'和平县',3),(441625,441600,'东源县',3),(441700,440000,'阳江市',2),(441702,441700,'江城区',3),(441704,441700,'阳东区',3),(441721,441700,'阳西县',3),(441781,441700,'阳春市',3),(441800,440000,'清远市',2),(441802,441800,'清城区',3),(441803,441800,'清新区',3),(441821,441800,'佛冈县',3),(441823,441800,'阳山县',3),(441825,441800,'连山壮族瑶族自治县',3),(441826,441800,'连南瑶族自治县',3),(441881,441800,'英德市',3),(441882,441800,'连州市',3),(441900,440000,'东莞市',2),(442000,440000,'中山市',2),(442100,440000,'东沙群岛',2),(445100,440000,'潮州市',2),(445102,445100,'湘桥区',3),(445103,445100,'潮安区',3),(445122,445100,'饶平县',3),(445200,440000,'揭阳市',2),(445202,445200,'榕城区',3),(445203,445200,'揭东区',3),(445222,445200,'揭西县',3),(445224,445200,'惠来县',3),(445281,445200,'普宁市',3),(445300,440000,'云浮市',2),(445302,445300,'云城区',3),(445303,445300,'云安区',3),(445321,445300,'新兴县',3),(445322,445300,'郁南县',3),(445381,445300,'罗定市',3),(450000,0,'广西壮族自治区',1),(450100,450000,'南宁市',2),(450102,450100,'兴宁区',3),(450103,450100,'青秀区',3),(450105,450100,'江南区',3),(450107,450100,'西乡塘区',3),(450108,450100,'良庆区',3),(450109,450100,'邕宁区',3),(450110,450100,'武鸣区',3),(450123,450100,'隆安县',3),(450124,450100,'马山县',3),(450125,450100,'上林县',3),(450126,450100,'宾阳县',3),(450127,450100,'横县',3),(450200,450000,'柳州市',2),(450202,450200,'城中区',3),(450203,450200,'鱼峰区',3),(450204,450200,'柳南区',3),(450205,450200,'柳北区',3),(450206,450200,'柳江区',3),(450222,450200,'柳城县',3),(450223,450200,'鹿寨县',3),(450224,450200,'融安县',3),(450225,450200,'融水苗族自治县',3),(450226,450200,'三江侗族自治县',3),(450300,450000,'桂林市',2),(450302,450300,'秀峰区',3),(450303,450300,'叠彩区',3),(450304,450300,'象山区',3),(450305,450300,'七星区',3),(450311,450300,'雁山区',3),(450312,450300,'临桂区',3),(450321,450300,'阳朔县',3),(450323,450300,'灵川县',3),(450324,450300,'全州县',3),(450325,450300,'兴安县',3),(450326,450300,'永福县',3),(450327,450300,'灌阳县',3),(450328,450300,'龙胜各族自治县',3),(450329,450300,'资源县',3),(450330,450300,'平乐县',3),(450331,450300,'荔浦县',3),(450332,450300,'恭城瑶族自治县',3),(450400,450000,'梧州市',2),(450403,450400,'万秀区',3),(450405,450400,'长洲区',3),(450406,450400,'龙圩区',3),(450421,450400,'苍梧县',3),(450422,450400,'藤县',3),(450423,450400,'蒙山县',3),(450481,450400,'岑溪市',3),(450500,450000,'北海市',2),(450502,450500,'海城区',3),(450503,450500,'银海区',3),(450512,450500,'铁山港区',3),(450521,450500,'合浦县',3),(450600,450000,'防城港市',2),(450602,450600,'港口区',3),(450603,450600,'防城区',3),(450621,450600,'上思县',3),(450681,450600,'东兴市',3),(450700,450000,'钦州市',2),(450702,450700,'钦南区',3),(450703,450700,'钦北区',3),(450721,450700,'灵山县',3),(450722,450700,'浦北县',3),(450800,450000,'贵港市',2),(450802,450800,'港北区',3),(450803,450800,'港南区',3),(450804,450800,'覃塘区',3),(450821,450800,'平南县',3),(450881,450800,'桂平市',3),(450900,450000,'玉林市',2),(450902,450900,'玉州区',3),(450903,450900,'福绵区',3),(450921,450900,'容县',3),(450922,450900,'陆川县',3),(450923,450900,'博白县',3),(450924,450900,'兴业县',3),(450981,450900,'北流市',3),(451000,450000,'百色市',2),(451002,451000,'右江区',3),(451021,451000,'田阳县',3),(451022,451000,'田东县',3),(451023,451000,'平果县',3),(451024,451000,'德保县',3),(451026,451000,'那坡县',3),(451027,451000,'凌云县',3),(451028,451000,'乐业县',3),(451029,451000,'田林县',3),(451030,451000,'西林县',3),(451031,451000,'隆林各族自治县',3),(451081,451000,'靖西市',3),(451100,450000,'贺州市',2),(451102,451100,'八步区',3),(451103,451100,'平桂区',3),(451121,451100,'昭平县',3),(451122,451100,'钟山县',3),(451123,451100,'富川瑶族自治县',3),(451200,450000,'河池市',2),(451202,451200,'金城江区',3),(451203,451200,'宜州区',3),(451221,451200,'南丹县',3),(451222,451200,'天峨县',3),(451223,451200,'凤山县',3),(451224,451200,'东兰县',3),(451225,451200,'罗城仫佬族自治县',3),(451226,451200,'环江毛南族自治县',3),(451227,451200,'巴马瑶族自治县',3),(451228,451200,'都安瑶族自治县',3),(451229,451200,'大化瑶族自治县',3),(451300,450000,'来宾市',2),(451302,451300,'兴宾区',3),(451321,451300,'忻城县',3),(451322,451300,'象州县',3),(451323,451300,'武宣县',3),(451324,451300,'金秀瑶族自治县',3),(451381,451300,'合山市',3),(451400,450000,'崇左市',2),(451402,451400,'江州区',3),(451421,451400,'扶绥县',3),(451422,451400,'宁明县',3),(451423,451400,'龙州县',3),(451424,451400,'大新县',3),(451425,451400,'天等县',3),(451481,451400,'凭祥市',3),(460000,0,'海南省',1),(460100,460000,'海口市',2),(460105,460100,'秀英区',3),(460106,460100,'龙华区',3),(460107,460100,'琼山区',3),(460108,460100,'美兰区',3),(460200,460000,'三亚市',2),(460202,460200,'海棠区',3),(460203,460200,'吉阳区',3),(460204,460200,'天涯区',3),(460205,460200,'崖州区',3),(460300,460000,'三沙市',2),(460321,460300,'西沙群岛',3),(460322,460300,'南沙群岛',3),(460323,460300,'中沙群岛的岛礁及其海域',3),(460400,460000,'儋州市',2),(469001,460000,'五指山市',2),(469002,460000,'琼海市',2),(469005,460000,'文昌市',2),(469006,460000,'万宁市',2),(469007,460000,'东方市',2),(469021,460000,'定安县',2),(469022,460000,'屯昌县',2),(469023,460000,'澄迈县',2),(469024,460000,'临高县',2),(469025,460000,'白沙黎族自治县',2),(469026,460000,'昌江黎族自治县',2),(469027,460000,'乐东黎族自治县',2),(469028,460000,'陵水黎族自治县',2),(469029,460000,'保亭黎族苗族自治县',2),(469030,460000,'琼中黎族苗族自治县',2),(500000,0,'重庆市',1),(500100,500000,'重庆城区',2),(500101,500100,'万州区',3),(500102,500100,'涪陵区',3),(500103,500100,'渝中区',3),(500104,500100,'大渡口区',3),(500105,500100,'江北区',3),(500106,500100,'沙坪坝区',3),(500107,500100,'九龙坡区',3),(500108,500100,'南岸区',3),(500109,500100,'北碚区',3),(500110,500100,'綦江区',3),(500111,500100,'大足区',3),(500112,500100,'渝北区',3),(500113,500100,'巴南区',3),(500114,500100,'黔江区',3),(500115,500100,'长寿区',3),(500116,500100,'江津区',3),(500117,500100,'合川区',3),(500118,500100,'永川区',3),(500119,500100,'南川区',3),(500120,500100,'璧山区',3),(500151,500100,'铜梁区',3),(500152,500100,'潼南区',3),(500153,500100,'荣昌区',3),(500154,500100,'开州区',3),(500155,500200,'梁平区',3),(500156,500200,'武隆区',3),(500200,500000,'重庆郊县',2),(500229,500200,'城口县',3),(500230,500200,'丰都县',3),(500231,500200,'垫江县',3),(500233,500200,'忠县',3),(500235,500200,'云阳县',3),(500236,500200,'奉节县',3),(500237,500200,'巫山县',3),(500238,500200,'巫溪县',3),(500240,500200,'石柱土家族自治县',3),(500241,500200,'秀山土家族苗族自治县',3),(500242,500200,'酉阳土家族苗族自治县',3),(500243,500200,'彭水苗族土家族自治县',3),(510000,0,'四川省',1),(510100,510000,'成都市',2),(510104,510100,'锦江区',3),(510105,510100,'青羊区',3),(510106,510100,'金牛区',3),(510107,510100,'武侯区',3),(510108,510100,'成华区',3),(510112,510100,'龙泉驿区',3),(510113,510100,'青白江区',3),(510114,510100,'新都区',3),(510115,510100,'温江区',3),(510116,510100,'双流区',3),(510117,510100,'郫都区',3),(510121,510100,'金堂县',3),(510129,510100,'大邑县',3),(510131,510100,'蒲江县',3),(510132,510100,'新津县',3),(510181,510100,'都江堰市',3),(510182,510100,'彭州市',3),(510183,510100,'邛崃市',3),(510184,510100,'崇州市',3),(510185,510100,'简阳市',3),(510300,510000,'自贡市',2),(510302,510300,'自流井区',3),(510303,510300,'贡井区',3),(510304,510300,'大安区',3),(510311,510300,'沿滩区',3),(510321,510300,'荣县',3),(510322,510300,'富顺县',3),(510400,510000,'攀枝花市',2),(510402,510400,'东区',3),(510403,510400,'西区',3),(510411,510400,'仁和区',3),(510421,510400,'米易县',3),(510422,510400,'盐边县',3),(510500,510000,'泸州市',2),(510502,510500,'江阳区',3),(510503,510500,'纳溪区',3),(510504,510500,'龙马潭区',3),(510521,510500,'泸县',3),(510522,510500,'合江县',3),(510524,510500,'叙永县',3),(510525,510500,'古蔺县',3),(510600,510000,'德阳市',2),(510603,510600,'旌阳区',3),(510623,510600,'中江县',3),(510626,510600,'罗江县',3),(510681,510600,'广汉市',3),(510682,510600,'什邡市',3),(510683,510600,'绵竹市',3),(510700,510000,'绵阳市',2),(510703,510700,'涪城区',3),(510704,510700,'游仙区',3),(510705,510700,'安州区',3),(510722,510700,'三台县',3),(510723,510700,'盐亭县',3),(510725,510700,'梓潼县',3),(510726,510700,'北川羌族自治县',3),(510727,510700,'平武县',3),(510781,510700,'江油市',3),(510800,510000,'广元市',2),(510802,510800,'利州区',3),(510811,510800,'昭化区',3),(510812,510800,'朝天区',3),(510821,510800,'旺苍县',3),(510822,510800,'青川县',3),(510823,510800,'剑阁县',3),(510824,510800,'苍溪县',3),(510900,510000,'遂宁市',2),(510903,510900,'船山区',3),(510904,510900,'安居区',3),(510921,510900,'蓬溪县',3),(510922,510900,'射洪县',3),(510923,510900,'大英县',3),(511000,510000,'内江市',2),(511002,511000,'市中区',3),(511011,511000,'东兴区',3),(511024,511000,'威远县',3),(511025,511000,'资中县',3),(511028,511000,'隆昌市',3),(511100,510000,'乐山市',2),(511102,511100,'市中区',3),(511111,511100,'沙湾区',3),(511112,511100,'五通桥区',3),(511113,511100,'金口河区',3),(511123,511100,'犍为县',3),(511124,511100,'井研县',3),(511126,511100,'夹江县',3),(511129,511100,'沐川县',3),(511132,511100,'峨边彝族自治县',3),(511133,511100,'马边彝族自治县',3),(511181,511100,'峨眉山市',3),(511300,510000,'南充市',2),(511302,511300,'顺庆区',3),(511303,511300,'高坪区',3),(511304,511300,'嘉陵区',3),(511321,511300,'南部县',3),(511322,511300,'营山县',3),(511323,511300,'蓬安县',3),(511324,511300,'仪陇县',3),(511325,511300,'西充县',3),(511381,511300,'阆中市',3),(511400,510000,'眉山市',2),(511402,511400,'东坡区',3),(511403,511400,'彭山区',3),(511421,511400,'仁寿县',3),(511423,511400,'洪雅县',3),(511424,511400,'丹棱县',3),(511425,511400,'青神县',3),(511500,510000,'宜宾市',2),(511502,511500,'翠屏区',3),(511503,511500,'南溪区',3),(511521,511500,'宜宾县',3),(511523,511500,'江安县',3),(511524,511500,'长宁县',3),(511525,511500,'高县',3),(511526,511500,'珙县',3),(511527,511500,'筠连县',3),(511528,511500,'兴文县',3),(511529,511500,'屏山县',3),(511600,510000,'广安市',2),(511602,511600,'广安区',3),(511603,511600,'前锋区',3),(511621,511600,'岳池县',3),(511622,511600,'武胜县',3),(511623,511600,'邻水县',3),(511681,511600,'华蓥市',3),(511700,510000,'达州市',2),(511702,511700,'通川区',3),(511703,511700,'达川区',3),(511722,511700,'宣汉县',3),(511723,511700,'开江县',3),(511724,511700,'大竹县',3),(511725,511700,'渠县',3),(511781,511700,'万源市',3),(511800,510000,'雅安市',2),(511802,511800,'雨城区',3),(511803,511800,'名山区',3),(511822,511800,'荥经县',3),(511823,511800,'汉源县',3),(511824,511800,'石棉县',3),(511825,511800,'天全县',3),(511826,511800,'芦山县',3),(511827,511800,'宝兴县',3),(511900,510000,'巴中市',2),(511902,511900,'巴州区',3),(511903,511900,'恩阳区',3),(511921,511900,'通江县',3),(511922,511900,'南江县',3),(511923,511900,'平昌县',3),(512000,510000,'资阳市',2),(512002,512000,'雁江区',3),(512021,512000,'安岳县',3),(512022,512000,'乐至县',3),(513200,510000,'阿坝藏族羌族自治州',2),(513201,513200,'马尔康市',3),(513221,513200,'汶川县',3),(513222,513200,'理县',3),(513223,513200,'茂县',3),(513224,513200,'松潘县',3),(513225,513200,'九寨沟县',3),(513226,513200,'金川县',3),(513227,513200,'小金县',3),(513228,513200,'黑水县',3),(513230,513200,'壤塘县',3),(513231,513200,'阿坝县',3),(513232,513200,'若尔盖县',3),(513233,513200,'红原县',3),(513300,510000,'甘孜藏族自治州',2),(513301,513300,'康定市',3),(513322,513300,'泸定县',3),(513323,513300,'丹巴县',3),(513324,513300,'九龙县',3),(513325,513300,'雅江县',3),(513326,513300,'道孚县',3),(513327,513300,'炉霍县',3),(513328,513300,'甘孜县',3),(513329,513300,'新龙县',3),(513330,513300,'德格县',3),(513331,513300,'白玉县',3),(513332,513300,'石渠县',3),(513333,513300,'色达县',3),(513334,513300,'理塘县',3),(513335,513300,'巴塘县',3),(513336,513300,'乡城县',3),(513337,513300,'稻城县',3),(513338,513300,'得荣县',3),(513400,510000,'凉山彝族自治州',2),(513401,513400,'西昌市',3),(513422,513400,'木里藏族自治县',3),(513423,513400,'盐源县',3),(513424,513400,'德昌县',3),(513425,513400,'会理县',3),(513426,513400,'会东县',3),(513427,513400,'宁南县',3),(513428,513400,'普格县',3),(513429,513400,'布拖县',3),(513430,513400,'金阳县',3),(513431,513400,'昭觉县',3),(513432,513400,'喜德县',3),(513433,513400,'冕宁县',3),(513434,513400,'越西县',3),(513435,513400,'甘洛县',3),(513436,513400,'美姑县',3),(513437,513400,'雷波县',3),(520000,0,'贵州省',1),(520100,520000,'贵阳市',2),(520102,520100,'南明区',3),(520103,520100,'云岩区',3),(520111,520100,'花溪区',3),(520112,520100,'乌当区',3),(520113,520100,'白云区',3),(520115,520100,'观山湖区',3),(520121,520100,'开阳县',3),(520122,520100,'息烽县',3),(520123,520100,'修文县',3),(520181,520100,'清镇市',3),(520200,520000,'六盘水市',2),(520201,520200,'钟山区',3),(520203,520200,'六枝特区',3),(520221,520200,'水城县',3),(520222,520200,'盘州市',3),(520300,520000,'遵义市',2),(520302,520300,'红花岗区',3),(520303,520300,'汇川区',3),(520304,520300,'播州区',3),(520322,520300,'桐梓县',3),(520323,520300,'绥阳县',3),(520324,520300,'正安县',3),(520325,520300,'道真仡佬族苗族自治县',3),(520326,520300,'务川仡佬族苗族自治县',3),(520327,520300,'凤冈县',3),(520328,520300,'湄潭县',3),(520329,520300,'余庆县',3),(520330,520300,'习水县',3),(520381,520300,'赤水市',3),(520382,520300,'仁怀市',3),(520400,520000,'安顺市',2),(520402,520400,'西秀区',3),(520403,520400,'平坝区',3),(520422,520400,'普定县',3),(520423,520400,'镇宁布依族苗族自治县',3),(520424,520400,'关岭布依族苗族自治县',3),(520425,520400,'紫云苗族布依族自治县',3),(520500,520000,'毕节市',2),(520502,520500,'七星关区',3),(520521,520500,'大方县',3),(520522,520500,'黔西县',3),(520523,520500,'金沙县',3),(520524,520500,'织金县',3),(520525,520500,'纳雍县',3),(520526,520500,'威宁彝族回族苗族自治县',3),(520527,520500,'赫章县',3),(520600,520000,'铜仁市',2),(520602,520600,'碧江区',3),(520603,520600,'万山区',3),(520621,520600,'江口县',3),(520622,520600,'玉屏侗族自治县',3),(520623,520600,'石阡县',3),(520624,520600,'思南县',3),(520625,520600,'印江土家族苗族自治县',3),(520626,520600,'德江县',3),(520627,520600,'沿河土家族自治县',3),(520628,520600,'松桃苗族自治县',3),(522300,520000,'黔西南布依族苗族自治州',2),(522301,522300,'兴义市',3),(522322,522300,'兴仁县',3),(522323,522300,'普安县',3),(522324,522300,'晴隆县',3),(522325,522300,'贞丰县',3),(522326,522300,'望谟县',3),(522327,522300,'册亨县',3),(522328,522300,'安龙县',3),(522600,520000,'黔东南苗族侗族自治州',2),(522601,522600,'凯里市',3),(522622,522600,'黄平县',3),(522623,522600,'施秉县',3),(522624,522600,'三穗县',3),(522625,522600,'镇远县',3),(522626,522600,'岑巩县',3),(522627,522600,'天柱县',3),(522628,522600,'锦屏县',3),(522629,522600,'剑河县',3),(522630,522600,'台江县',3),(522631,522600,'黎平县',3),(522632,522600,'榕江县',3),(522633,522600,'从江县',3),(522634,522600,'雷山县',3),(522635,522600,'麻江县',3),(522636,522600,'丹寨县',3),(522700,520000,'黔南布依族苗族自治州',2),(522701,522700,'都匀市',3),(522702,522700,'福泉市',3),(522722,522700,'荔波县',3),(522723,522700,'贵定县',3),(522725,522700,'瓮安县',3),(522726,522700,'独山县',3),(522727,522700,'平塘县',3),(522728,522700,'罗甸县',3),(522729,522700,'长顺县',3),(522730,522700,'龙里县',3),(522731,522700,'惠水县',3),(522732,522700,'三都水族自治县',3),(530000,0,'云南省',1),(530100,530000,'昆明市',2),(530102,530100,'五华区',3),(530103,530100,'盘龙区',3),(530111,530100,'官渡区',3),(530112,530100,'西山区',3),(530113,530100,'东川区',3),(530114,530100,'呈贡区',3),(530115,530100,'晋宁区',3),(530124,530100,'富民县',3),(530125,530100,'宜良县',3),(530126,530100,'石林彝族自治县',3),(530127,530100,'嵩明县',3),(530128,530100,'禄劝彝族苗族自治县',3),(530129,530100,'寻甸回族彝族自治县',3),(530181,530100,'安宁市',3),(530300,530000,'曲靖市',2),(530302,530300,'麒麟区',3),(530303,530300,'沾益区',3),(530321,530300,'马龙县',3),(530322,530300,'陆良县',3),(530323,530300,'师宗县',3),(530324,530300,'罗平县',3),(530325,530300,'富源县',3),(530326,530300,'会泽县',3),(530381,530300,'宣威市',3),(530400,530000,'玉溪市',2),(530402,530400,'红塔区',3),(530403,530400,'江川区',3),(530422,530400,'澄江县',3),(530423,530400,'通海县',3),(530424,530400,'华宁县',3),(530425,530400,'易门县',3),(530426,530400,'峨山彝族自治县',3),(530427,530400,'新平彝族傣族自治县',3),(530428,530400,'元江哈尼族彝族傣族自治县',3),(530500,530000,'保山市',2),(530502,530500,'隆阳区',3),(530521,530500,'施甸县',3),(530523,530500,'龙陵县',3),(530524,530500,'昌宁县',3),(530581,530500,'腾冲市',3),(530600,530000,'昭通市',2),(530602,530600,'昭阳区',3),(530621,530600,'鲁甸县',3),(530622,530600,'巧家县',3),(530623,530600,'盐津县',3),(530624,530600,'大关县',3),(530625,530600,'永善县',3),(530626,530600,'绥江县',3),(530627,530600,'镇雄县',3),(530628,530600,'彝良县',3),(530629,530600,'威信县',3),(530630,530600,'水富县',3),(530700,530000,'丽江市',2),(530702,530700,'古城区',3),(530721,530700,'玉龙纳西族自治县',3),(530722,530700,'永胜县',3),(530723,530700,'华坪县',3),(530724,530700,'宁蒗彝族自治县',3),(530800,530000,'普洱市',2),(530802,530800,'思茅区',3),(530821,530800,'宁洱哈尼族彝族自治县',3),(530822,530800,'墨江哈尼族自治县',3),(530823,530800,'景东彝族自治县',3),(530824,530800,'景谷傣族彝族自治县',3),(530825,530800,'镇沅彝族哈尼族拉祜族自治县',3),(530826,530800,'江城哈尼族彝族自治县',3),(530827,530800,'孟连傣族拉祜族佤族自治县',3),(530828,530800,'澜沧拉祜族自治县',3),(530829,530800,'西盟佤族自治县',3),(530900,530000,'临沧市',2),(530902,530900,'临翔区',3),(530921,530900,'凤庆县',3),(530922,530900,'云县',3),(530923,530900,'永德县',3),(530924,530900,'镇康县',3),(530925,530900,'双江拉祜族佤族布朗族傣族自治县',3),(530926,530900,'耿马傣族佤族自治县',3),(530927,530900,'沧源佤族自治县',3),(532300,530000,'楚雄彝族自治州',2),(532301,532300,'楚雄市',3),(532322,532300,'双柏县',3),(532323,532300,'牟定县',3),(532324,532300,'南华县',3),(532325,532300,'姚安县',3),(532326,532300,'大姚县',3),(532327,532300,'永仁县',3),(532328,532300,'元谋县',3),(532329,532300,'武定县',3),(532331,532300,'禄丰县',3),(532500,530000,'红河哈尼族彝族自治州',2),(532501,532500,'个旧市',3),(532502,532500,'开远市',3),(532503,532500,'蒙自市',3),(532504,532500,'弥勒市',3),(532523,532500,'屏边苗族自治县',3),(532524,532500,'建水县',3),(532525,532500,'石屏县',3),(532527,532500,'泸西县',3),(532528,532500,'元阳县',3),(532529,532500,'红河县',3),(532530,532500,'金平苗族瑶族傣族自治县',3),(532531,532500,'绿春县',3),(532532,532500,'河口瑶族自治县',3),(532600,530000,'文山壮族苗族自治州',2),(532601,532600,'文山市',3),(532622,532600,'砚山县',3),(532623,532600,'西畴县',3),(532624,532600,'麻栗坡县',3),(532625,532600,'马关县',3),(532626,532600,'丘北县',3),(532627,532600,'广南县',3),(532628,532600,'富宁县',3),(532800,530000,'西双版纳傣族自治州',2),(532801,532800,'景洪市',3),(532822,532800,'勐海县',3),(532823,532800,'勐腊县',3),(532900,530000,'大理白族自治州',2),(532901,532900,'大理市',3),(532922,532900,'漾濞彝族自治县',3),(532923,532900,'祥云县',3),(532924,532900,'宾川县',3),(532925,532900,'弥渡县',3),(532926,532900,'南涧彝族自治县',3),(532927,532900,'巍山彝族回族自治县',3),(532928,532900,'永平县',3),(532929,532900,'云龙县',3),(532930,532900,'洱源县',3),(532931,532900,'剑川县',3),(532932,532900,'鹤庆县',3),(533100,530000,'德宏傣族景颇族自治州',2),(533102,533100,'瑞丽市',3),(533103,533100,'芒市',3),(533122,533100,'梁河县',3),(533123,533100,'盈江县',3),(533124,533100,'陇川县',3),(533300,530000,'怒江傈僳族自治州',2),(533301,533300,'泸水市',3),(533323,533300,'福贡县',3),(533324,533300,'贡山独龙族怒族自治县',3),(533325,533300,'兰坪白族普米族自治县',3),(533400,530000,'迪庆藏族自治州',2),(533401,533400,'香格里拉市',3),(533422,533400,'德钦县',3),(533423,533400,'维西傈僳族自治县',3),(540000,0,'西藏自治区',1),(540100,540000,'拉萨市',2),(540102,540100,'城关区',3),(540103,540100,'堆龙德庆区',3),(540121,540100,'林周县',3),(540122,540100,'当雄县',3),(540123,540100,'尼木县',3),(540124,540100,'曲水县',3),(540126,540100,'达孜县',3),(540127,540100,'墨竹工卡县',3),(540200,540000,'日喀则市',2),(540202,540200,'桑珠孜区',3),(540221,540200,'南木林县',3),(540222,540200,'江孜县',3),(540223,540200,'定日县',3),(540224,540200,'萨迦县',3),(540225,540200,'拉孜县',3),(540226,540200,'昂仁县',3),(540227,540200,'谢通门县',3),(540228,540200,'白朗县',3),(540229,540200,'仁布县',3),(540230,540200,'康马县',3),(540231,540200,'定结县',3),(540232,540200,'仲巴县',3),(540233,540200,'亚东县',3),(540234,540200,'吉隆县',3),(540235,540200,'聂拉木县',3),(540236,540200,'萨嘎县',3),(540237,540200,'岗巴县',3),(540300,540000,'昌都市',2),(540302,540300,'卡若区',3),(540321,540300,'江达县',3),(540322,540300,'贡觉县',3),(540323,540300,'类乌齐县',3),(540324,540300,'丁青县',3),(540325,540300,'察雅县',3),(540326,540300,'八宿县',3),(540327,540300,'左贡县',3),(540328,540300,'芒康县',3),(540329,540300,'洛隆县',3),(540330,540300,'边坝县',3),(540400,540000,'林芝市',2),(540402,540400,'巴宜区',3),(540421,540400,'工布江达县',3),(540422,540400,'米林县',3),(540423,540400,'墨脱县',3),(540424,540400,'波密县',3),(540425,540400,'察隅县',3),(540426,540400,'朗县',3),(540500,540000,'山南市',2),(540502,540500,'乃东区',3),(540521,540500,'扎囊县',3),(540522,540500,'贡嘎县',3),(540523,540500,'桑日县',3),(540524,540500,'琼结县',3),(540525,540500,'曲松县',3),(540526,540500,'措美县',3),(540527,540500,'洛扎县',3),(540528,540500,'加查县',3),(540529,540500,'隆子县',3),(540530,540500,'错那县',3),(540531,540500,'浪卡子县',3),(542400,540000,'那曲地区',2),(542421,542400,'那曲县',3),(542422,542400,'嘉黎县',3),(542423,542400,'比如县',3),(542424,542400,'聂荣县',3),(542425,542400,'安多县',3),(542426,542400,'申扎县',3),(542427,542400,'索县',3),(542428,542400,'班戈县',3),(542429,542400,'巴青县',3),(542430,542400,'尼玛县',3),(542431,542400,'双湖县',3),(542500,540000,'阿里地区',2),(542521,542500,'普兰县',3),(542522,542500,'札达县',3),(542523,542500,'噶尔县',3),(542524,542500,'日土县',3),(542525,542500,'革吉县',3),(542526,542500,'改则县',3),(542527,542500,'措勤县',3),(610000,0,'陕西省',1),(610100,610000,'西安市',2),(610102,610100,'新城区',3),(610103,610100,'碑林区',3),(610104,610100,'莲湖区',3),(610111,610100,'灞桥区',3),(610112,610100,'未央区',3),(610113,610100,'雁塔区',3),(610114,610100,'阎良区',3),(610115,610100,'临潼区',3),(610116,610100,'长安区',3),(610117,610100,'高陵区',3),(610118,610100,'鄠邑区',3),(610122,610100,'蓝田县',3),(610124,610100,'周至县',3),(610200,610000,'铜川市',2),(610202,610200,'王益区',3),(610203,610200,'印台区',3),(610204,610200,'耀州区',3),(610222,610200,'宜君县',3),(610300,610000,'宝鸡市',2),(610302,610300,'渭滨区',3),(610303,610300,'金台区',3),(610304,610300,'陈仓区',3),(610322,610300,'凤翔县',3),(610323,610300,'岐山县',3),(610324,610300,'扶风县',3),(610326,610300,'眉县',3),(610327,610300,'陇县',3),(610328,610300,'千阳县',3),(610329,610300,'麟游县',3),(610330,610300,'凤县',3),(610331,610300,'太白县',3),(610400,610000,'咸阳市',2),(610402,610400,'秦都区',3),(610403,610400,'杨陵区',3),(610404,610400,'渭城区',3),(610422,610400,'三原县',3),(610423,610400,'泾阳县',3),(610424,610400,'乾县',3),(610425,610400,'礼泉县',3),(610426,610400,'永寿县',3),(610427,610400,'彬县',3),(610428,610400,'长武县',3),(610429,610400,'旬邑县',3),(610430,610400,'淳化县',3),(610431,610400,'武功县',3),(610481,610400,'兴平市',3),(610500,610000,'渭南市',2),(610502,610500,'临渭区',3),(610503,610500,'华州区',3),(610522,610500,'潼关县',3),(610523,610500,'大荔县',3),(610524,610500,'合阳县',3),(610525,610500,'澄城县',3),(610526,610500,'蒲城县',3),(610527,610500,'白水县',3),(610528,610500,'富平县',3),(610581,610500,'韩城市',3),(610582,610500,'华阴市',3),(610600,610000,'延安市',2),(610602,610600,'宝塔区',3),(610603,610600,'安塞区',3),(610621,610600,'延长县',3),(610622,610600,'延川县',3),(610623,610600,'子长县',3),(610625,610600,'志丹县',3),(610626,610600,'吴起县',3),(610627,610600,'甘泉县',3),(610628,610600,'富县',3),(610629,610600,'洛川县',3),(610630,610600,'宜川县',3),(610631,610600,'黄龙县',3),(610632,610600,'黄陵县',3),(610700,610000,'汉中市',2),(610702,610700,'汉台区',3),(610721,610700,'南郑县',3),(610722,610700,'城固县',3),(610723,610700,'洋县',3),(610724,610700,'西乡县',3),(610725,610700,'勉县',3),(610726,610700,'宁强县',3),(610727,610700,'略阳县',3),(610728,610700,'镇巴县',3),(610729,610700,'留坝县',3),(610730,610700,'佛坪县',3),(610800,610000,'榆林市',2),(610802,610800,'榆阳区',3),(610803,610800,'横山区',3),(610822,610800,'府谷县',3),(610824,610800,'靖边县',3),(610825,610800,'定边县',3),(610826,610800,'绥德县',3),(610827,610800,'米脂县',3),(610828,610800,'佳县',3),(610829,610800,'吴堡县',3),(610830,610800,'清涧县',3),(610831,610800,'子洲县',3),(610881,610800,'神木市',3),(610900,610000,'安康市',2),(610902,610900,'汉滨区',3),(610921,610900,'汉阴县',3),(610922,610900,'石泉县',3),(610923,610900,'宁陕县',3),(610924,610900,'紫阳县',3),(610925,610900,'岚皋县',3),(610926,610900,'平利县',3),(610927,610900,'镇坪县',3),(610928,610900,'旬阳县',3),(610929,610900,'白河县',3),(611000,610000,'商洛市',2),(611002,611000,'商州区',3),(611021,611000,'洛南县',3),(611022,611000,'丹凤县',3),(611023,611000,'商南县',3),(611024,611000,'山阳县',3),(611025,611000,'镇安县',3),(611026,611000,'柞水县',3),(620000,0,'甘肃省',1),(620100,620000,'兰州市',2),(620102,620100,'城关区',3),(620103,620100,'七里河区',3),(620104,620100,'西固区',3),(620105,620100,'安宁区',3),(620111,620100,'红古区',3),(620121,620100,'永登县',3),(620122,620100,'皋兰县',3),(620123,620100,'榆中县',3),(620200,620000,'嘉峪关市',2),(620300,620000,'金昌市',2),(620302,620300,'金川区',3),(620321,620300,'永昌县',3),(620400,620000,'白银市',2),(620402,620400,'白银区',3),(620403,620400,'平川区',3),(620421,620400,'靖远县',3),(620422,620400,'会宁县',3),(620423,620400,'景泰县',3),(620500,620000,'天水市',2),(620502,620500,'秦州区',3),(620503,620500,'麦积区',3),(620521,620500,'清水县',3),(620522,620500,'秦安县',3),(620523,620500,'甘谷县',3),(620524,620500,'武山县',3),(620525,620500,'张家川回族自治县',3),(620600,620000,'武威市',2),(620602,620600,'凉州区',3),(620621,620600,'民勤县',3),(620622,620600,'古浪县',3),(620623,620600,'天祝藏族自治县',3),(620700,620000,'张掖市',2),(620702,620700,'甘州区',3),(620721,620700,'肃南裕固族自治县',3),(620722,620700,'民乐县',3),(620723,620700,'临泽县',3),(620724,620700,'高台县',3),(620725,620700,'山丹县',3),(620800,620000,'平凉市',2),(620802,620800,'崆峒区',3),(620821,620800,'泾川县',3),(620822,620800,'灵台县',3),(620823,620800,'崇信县',3),(620824,620800,'华亭县',3),(620825,620800,'庄浪县',3),(620826,620800,'静宁县',3),(620900,620000,'酒泉市',2),(620902,620900,'肃州区',3),(620921,620900,'金塔县',3),(620922,620900,'瓜州县',3),(620923,620900,'肃北蒙古族自治县',3),(620924,620900,'阿克塞哈萨克族自治县',3),(620981,620900,'玉门市',3),(620982,620900,'敦煌市',3),(621000,620000,'庆阳市',2),(621002,621000,'西峰区',3),(621021,621000,'庆城县',3),(621022,621000,'环县',3),(621023,621000,'华池县',3),(621024,621000,'合水县',3),(621025,621000,'正宁县',3),(621026,621000,'宁县',3),(621027,621000,'镇原县',3),(621100,620000,'定西市',2),(621102,621100,'安定区',3),(621121,621100,'通渭县',3),(621122,621100,'陇西县',3),(621123,621100,'渭源县',3),(621124,621100,'临洮县',3),(621125,621100,'漳县',3),(621126,621100,'岷县',3),(621200,620000,'陇南市',2),(621202,621200,'武都区',3),(621221,621200,'成县',3),(621222,621200,'文县',3),(621223,621200,'宕昌县',3),(621224,621200,'康县',3),(621225,621200,'西和县',3),(621226,621200,'礼县',3),(621227,621200,'徽县',3),(621228,621200,'两当县',3),(622900,620000,'临夏回族自治州',2),(622901,622900,'临夏市',3),(622921,622900,'临夏县',3),(622922,622900,'康乐县',3),(622923,622900,'永靖县',3),(622924,622900,'广河县',3),(622925,622900,'和政县',3),(622926,622900,'东乡族自治县',3),(622927,622900,'积石山保安族东乡族撒拉族自治县',3),(623000,620000,'甘南藏族自治州',2),(623001,623000,'合作市',3),(623021,623000,'临潭县',3),(623022,623000,'卓尼县',3),(623023,623000,'舟曲县',3),(623024,623000,'迭部县',3),(623025,623000,'玛曲县',3),(623026,623000,'碌曲县',3),(623027,623000,'夏河县',3),(630000,0,'青海省',1),(630100,630000,'西宁市',2),(630102,630100,'城东区',3),(630103,630100,'城中区',3),(630104,630100,'城西区',3),(630105,630100,'城北区',3),(630121,630100,'大通回族土族自治县',3),(630122,630100,'湟中县',3),(630123,630100,'湟源县',3),(630200,630000,'海东市',2),(630202,630200,'乐都区',3),(630203,630200,'平安区',3),(630222,630200,'民和回族土族自治县',3),(630223,630200,'互助土族自治县',3),(630224,630200,'化隆回族自治县',3),(630225,630200,'循化撒拉族自治县',3),(632200,630000,'海北藏族自治州',2),(632221,632200,'门源回族自治县',3),(632222,632200,'祁连县',3),(632223,632200,'海晏县',3),(632224,632200,'刚察县',3),(632300,630000,'黄南藏族自治州',2),(632321,632300,'同仁县',3),(632322,632300,'尖扎县',3),(632323,632300,'泽库县',3),(632324,632300,'河南蒙古族自治县',3),(632500,630000,'海南藏族自治州',2),(632521,632500,'共和县',3),(632522,632500,'同德县',3),(632523,632500,'贵德县',3),(632524,632500,'兴海县',3),(632525,632500,'贵南县',3),(632600,630000,'果洛藏族自治州',2),(632621,632600,'玛沁县',3),(632622,632600,'班玛县',3),(632623,632600,'甘德县',3),(632624,632600,'达日县',3),(632625,632600,'久治县',3),(632626,632600,'玛多县',3),(632700,630000,'玉树藏族自治州',2),(632701,632700,'玉树市',3),(632722,632700,'杂多县',3),(632723,632700,'称多县',3),(632724,632700,'治多县',3),(632725,632700,'囊谦县',3),(632726,632700,'曲麻莱县',3),(632800,630000,'海西蒙古族藏族自治州',2),(632801,632800,'格尔木市',3),(632802,632800,'德令哈市',3),(632821,632800,'乌兰县',3),(632822,632800,'都兰县',3),(632823,632800,'天峻县',3),(632825,632800,'海西蒙古族藏族自治州直辖',3),(640000,0,'宁夏回族自治区',1),(640100,640000,'银川市',2),(640104,640100,'兴庆区',3),(640105,640100,'西夏区',3),(640106,640100,'金凤区',3),(640121,640100,'永宁县',3),(640122,640100,'贺兰县',3),(640181,640100,'灵武市',3),(640200,640000,'石嘴山市',2),(640202,640200,'大武口区',3),(640205,640200,'惠农区',3),(640221,640200,'平罗县',3),(640300,640000,'吴忠市',2),(640302,640300,'利通区',3),(640303,640300,'红寺堡区',3),(640323,640300,'盐池县',3),(640324,640300,'同心县',3),(640381,640300,'青铜峡市',3),(640400,640000,'固原市',2),(640402,640400,'原州区',3),(640422,640400,'西吉县',3),(640423,640400,'隆德县',3),(640424,640400,'泾源县',3),(640425,640400,'彭阳县',3),(640500,640000,'中卫市',2),(640502,640500,'沙坡头区',3),(640521,640500,'中宁县',3),(640522,640500,'海原县',3),(650000,0,'新疆维吾尔自治区',1),(650100,650000,'乌鲁木齐市',2),(650102,650100,'天山区',3),(650103,650100,'沙依巴克区',3),(650104,650100,'新市区',3),(650105,650100,'水磨沟区',3),(650106,650100,'头屯河区',3),(650107,650100,'达坂城区',3),(650109,650100,'米东区',3),(650121,650100,'乌鲁木齐县',3),(650200,650000,'克拉玛依市',2),(650202,650200,'独山子区',3),(650203,650200,'克拉玛依区',3),(650204,650200,'白碱滩区',3),(650205,650200,'乌尔禾区',3),(650400,650000,'吐鲁番市',2),(650402,650400,'高昌区',3),(650421,650400,'鄯善县',3),(650422,650400,'托克逊县',3),(650500,650000,'哈密市',2),(650502,650500,'伊州区',3),(650521,650500,'巴里坤哈萨克自治县',3),(650522,650500,'伊吾县',3),(652300,650000,'昌吉回族自治州',2),(652301,652300,'昌吉市',3),(652302,652300,'阜康市',3),(652323,652300,'呼图壁县',3),(652324,652300,'玛纳斯县',3),(652325,652300,'奇台县',3),(652327,652300,'吉木萨尔县',3),(652328,652300,'木垒哈萨克自治县',3),(652700,650000,'博尔塔拉蒙古自治州',2),(652701,652700,'博乐市',3),(652702,652700,'阿拉山口市',3),(652722,652700,'精河县',3),(652723,652700,'温泉县',3),(652800,650000,'巴音郭楞蒙古自治州',2),(652801,652800,'库尔勒市',3),(652822,652800,'轮台县',3),(652823,652800,'尉犁县',3),(652824,652800,'若羌县',3),(652825,652800,'且末县',3),(652826,652800,'焉耆回族自治县',3),(652827,652800,'和静县',3),(652828,652800,'和硕县',3),(652829,652800,'博湖县',3),(652900,650000,'阿克苏地区',2),(652901,652900,'阿克苏市',3),(652922,652900,'温宿县',3),(652923,652900,'库车县',3),(652924,652900,'沙雅县',3),(652925,652900,'新和县',3),(652926,652900,'拜城县',3),(652927,652900,'乌什县',3),(652928,652900,'阿瓦提县',3),(652929,652900,'柯坪县',3),(653000,650000,'克孜勒苏柯尔克孜自治州',2),(653001,653000,'阿图什市',3),(653022,653000,'阿克陶县',3),(653023,653000,'阿合奇县',3),(653024,653000,'乌恰县',3),(653100,650000,'喀什地区',2),(653101,653100,'喀什市',3),(653121,653100,'疏附县',3),(653122,653100,'疏勒县',3),(653123,653100,'英吉沙县',3),(653124,653100,'泽普县',3),(653125,653100,'莎车县',3),(653126,653100,'叶城县',3),(653127,653100,'麦盖提县',3),(653128,653100,'岳普湖县',3),(653129,653100,'伽师县',3),(653130,653100,'巴楚县',3),(653131,653100,'塔什库尔干塔吉克自治县',3),(653200,650000,'和田地区',2),(653201,653200,'和田市',3),(653221,653200,'和田县',3),(653222,653200,'墨玉县',3),(653223,653200,'皮山县',3),(653224,653200,'洛浦县',3),(653225,653200,'策勒县',3),(653226,653200,'于田县',3),(653227,653200,'民丰县',3),(654000,650000,'伊犁哈萨克自治州',2),(654002,654000,'伊宁市',3),(654003,654000,'奎屯市',3),(654004,654000,'霍尔果斯市',3),(654021,654000,'伊宁县',3),(654022,654000,'察布查尔锡伯自治县',3),(654023,654000,'霍城县',3),(654024,654000,'巩留县',3),(654025,654000,'新源县',3),(654026,654000,'昭苏县',3),(654027,654000,'特克斯县',3),(654028,654000,'尼勒克县',3),(654200,650000,'塔城地区',2),(654201,654200,'塔城市',3),(654202,654200,'乌苏市',3),(654221,654200,'额敏县',3),(654223,654200,'沙湾县',3),(654224,654200,'托里县',3),(654225,654200,'裕民县',3),(654226,654200,'和布克赛尔蒙古自治县',3),(654300,650000,'阿勒泰地区',2),(654301,654300,'阿勒泰市',3),(654321,654300,'布尔津县',3),(654322,654300,'富蕴县',3),(654323,654300,'福海县',3),(654324,654300,'哈巴河县',3),(654325,654300,'青河县',3),(654326,654300,'吉木乃县',3),(659001,650000,'石河子市',2),(659002,650000,'阿拉尔市',2),(659003,650000,'图木舒克市',2),(659004,650000,'五家渠市',2),(659005,650000,'北屯市',2),(659006,650000,'铁门关市',2),(659007,650000,'双河市',2),(659008,650000,'可克达拉市',2),(659009,650000,'昆玉市',2),(710000,0,'台湾省',1),(810000,0,'香港特别行政区',1),(810001,810000,'中西区',2),(810002,810000,'湾仔区',2),(810003,810000,'东区',2),(810004,810000,'南区',2),(810005,810000,'油尖旺区',2),(810006,810000,'深水埗区',2),(810007,810000,'九龙城区',2),(810008,810000,'黄大仙区',2),(810009,810000,'观塘区',2),(810010,810000,'荃湾区',2),(810011,810000,'屯门区',2),(810012,810000,'元朗区',2),(810013,810000,'北区',2),(810014,810000,'大埔区',2),(810015,810000,'西贡区',2),(810016,810000,'沙田区',2),(810017,810000,'葵青区',2),(810018,810000,'离岛区',2),(820000,0,'澳门特别行政区',1),(820001,820000,'花地玛堂区',2),(820002,820000,'花王堂区',2),(820003,820000,'望德堂区',2),(820004,820000,'大堂区',2),(820005,820000,'风顺堂区',2),(820006,820000,'嘉模堂区',2),(820007,820000,'路凼填海区',2),(820008,820000,'圣方济各堂区',2);
/*!40000 ALTER TABLE `s_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛鍚?,
  `password` varchar(255) DEFAULT NULL COMMENT '瀵嗙爜',
  `phoneNumber` varchar(20) DEFAULT NULL COMMENT '鎵嬫満鍙?,
  `avatar` varchar(255) DEFAULT NULL COMMENT '澶村儚',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user`
--

LOCK TABLES `s_user` WRITE;
/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;
INSERT INTO `s_user` VALUES (1,'紫夜','123','18335166203',NULL),(2,'紫夜','yj14213..','18335166203',NULL),(3,'紫夜','yj14213..','18335166203',NULL);
/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-06  1:27:14
