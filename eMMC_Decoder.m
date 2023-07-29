clc;
clf;
clear all;
close all;
tic;

pkg load image;
%iFile_1 = 'RawData\SD-INIT-2-4_CLK_CMD_D0_D3.Wfm.csv';
%iFile_2 = 'RawData\SD-INIT-2-4_CLK_D1_D2_D3.Wfm.csv';
iFile_1 = 'RawData\SD-INIT-1_CLK_CMD.Wfm.csv';

global CRC7_Polynomial = logical([1 0 0 0 1 0 0 1]);
global CRC16_Polynomial = logical([1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]);
global VCC = 3.3;
global VH = VCC*0.9;
global VL = VCC*0.1;
global VT = VCC*0.5;

eMMC = 0;
if eMMC == 1
  CMD_Label(1)={"CMD0"};
  CMD_Label(2)={"CMD1"};
  CMD_Label(3)={"CMD2"};
  CMD_Label(4)={"CMD3"};
  CMD_Label(5)={"CMD4"};
  CMD_Label(6)={"CMD5"};
  CMD_Label(7)={"CMD6"};
  CMD_Label(8)={"CMD7"};
  CMD_Label(9)={"CMD8"};
  CMD_Label(10)={"CMD9"};
  CMD_Label(11)={"CMD10"};
  CMD_Label(12)={"CMD11"};
  CMD_Label(13)={"CMD12"};
  CMD_Label(14)={"CMD13"};
  CMD_Label(15)={"CMD14"};
  CMD_Label(16)={"CMD15"};
  CMD_Label(17)={"CMD16"};
  CMD_Label(18)={"CMD17"};
  CMD_Label(19)={"CMD18"};
  CMD_Label(20)={"CMD19"};
  CMD_Label(21)={"CMD20"};
  CMD_Label(22)={"CMD21"};
  CMD_Label(23)={"CMD22"};
  CMD_Label(24)={"CMD23"};
  CMD_Label(25)={"CMD24"};
  CMD_Label(26)={"CMD25"};
  CMD_Label(27)={"CMD26"};
  CMD_Label(28)={"CMD27"};
  CMD_Label(29)={"CMD28"};
  CMD_Label(30)={"CMD29"};
  CMD_Label(31)={"CMD30"};
  CMD_Label(32)={"CMD31"};
  CMD_Label(33)={"CMD32"};
  CMD_Label(34)={"CMD33"};
  CMD_Label(35)={"CMD34"};
  CMD_Label(36)={"CMD35"};
  CMD_Label(37)={"CMD36"};
  CMD_Label(38)={"CMD37"};
  CMD_Label(39)={"CMD38"};
  CMD_Label(40)={"CMD39"};
  CMD_Label(41)={"CMD40"};
  CMD_Label(42)={"CMD41"};
  CMD_Label(43)={"CMD42"};
  CMD_Label(44)={"CMD43"};
  CMD_Label(45)={"CMD44"};
  CMD_Label(46)={"CMD45"};
  CMD_Label(47)={"CMD46"};
  CMD_Label(48)={"CMD47"};
  CMD_Label(49)={"CMD48"};
  CMD_Label(50)={"CMD49"};
  CMD_Label(51)={"CMD50"};
  CMD_Label(52)={"CMD51"};
  CMD_Label(53)={"CMD52"};
  CMD_Label(54)={"CMD53"};
  CMD_Label(55)={"CMD54"};
  CMD_Label(56)={"CMD55"};
  CMD_Label(57)={"CMD56"};
  CMD_Label(58)={"CMD57"};
  CMD_Label(59)={"CMD58"};
  CMD_Label(60)={"CMD59"};
  CMD_Label(61)={"CMD60"};
  CMD_Label(62)={"CMD61"};
  CMD_Label(63)={"CMD62"};
  CMD_Label(64)={"CMD63"};
  CMD_Label(65)={"-"};
  CMD_Label(66)={"-"};
  CMD_Label(67)={"-"};
  CMD_Label(68)={"-"};
  CMD_Label(69)={"-"};
  CMD_Label(70)={"-"};
  CMD_Label(71)={"-"};
  CMD_Label(72)={"-"};
  CMD_Label(73)={"-"};
  CMD_Label(74)={"-"};
  CMD_Label(75)={"-"};
  CMD_Label(76)={"-"};
  CMD_Label(77)={"-"};
  CMD_Label(78)={"-"};
  CMD_Label(79)={"-"};
  CMD_Label(80)={"-"};
  CMD_Label(81)={"-"};
  CMD_Label(82)={"-"};
  CMD_Label(83)={"-"};
  CMD_Label(84)={"-"};
  CMD_Label(85)={"-"};
  CMD_Label(86)={"-"};
  CMD_Label(87)={"-"};
  CMD_Label(88)={"-"};
  CMD_Label(89)={"-"};
  CMD_Label(90)={"-"};
  CMD_Label(91)={"-"};
  CMD_Label(92)={"-"};
  CMD_Label(93)={"-"};
  CMD_Label(94)={"-"};
  CMD_Label(95)={"-"};
  CMD_Label(96)={"-"};
  CMD_Label(97)={"-"};
  CMD_Label(98)={"-"};
  CMD_Label(99)={"-"};
  CMD_Label(100)={"-"};
  CMD_Label(101)={"ACMD1"};
  CMD_Label(102)={"ACMD2"};
  CMD_Label(103)={"ACMD3"};
  CMD_Label(104)={"ACMD4"};
  CMD_Label(105)={"ACMD5"};
  CMD_Label(106)={"ACMD6"};
  CMD_Label(107)={"ACMD7"};
  CMD_Label(108)={"ACMD8"};
  CMD_Label(109)={"ACMD9"};
  CMD_Label(110)={"ACMD10"};
  CMD_Label(111)={"ACMD11"};
  CMD_Label(112)={"ACMD12"};
  CMD_Label(113)={"ACMD13"};
  CMD_Label(114)={"ACMD14"};
  CMD_Label(115)={"ACMD15"};
  CMD_Label(116)={"ACMD16"};
  CMD_Label(117)={"ACMD17"};
  CMD_Label(118)={"ACMD18"};
  CMD_Label(119)={"ACMD19"};
  CMD_Label(120)={"ACMD20"};
  CMD_Label(121)={"ACMD21"};
  CMD_Label(122)={"ACMD22"};
  CMD_Label(123)={"ACMD23"};
  CMD_Label(124)={"ACMD24"};
  CMD_Label(125)={"ACMD25"};
  CMD_Label(126)={"ACMD26"};
  CMD_Label(127)={"ACMD27"};
  CMD_Label(128)={"ACMD28"};
  CMD_Label(129)={"ACMD29"};
  CMD_Label(130)={"ACMD30"};
  CMD_Label(131)={"ACMD31"};
  CMD_Label(132)={"ACMD32"};
  CMD_Label(133)={"ACMD33"};
  CMD_Label(134)={"ACMD34"};
  CMD_Label(135)={"ACMD35"};
  CMD_Label(136)={"ACMD36"};
  CMD_Label(137)={"ACMD37"};
  CMD_Label(138)={"ACMD38"};
  CMD_Label(139)={"ACMD39"};
  CMD_Label(140)={"ACMD40"};
  CMD_Label(141)={"ACMD41"};
  CMD_Label(142)={"ACMD42"};
  CMD_Label(143)={"ACMD43"};
  CMD_Label(144)={"ACMD44"};
  CMD_Label(145)={"ACMD45"};
  CMD_Label(146)={"ACMD46"};
  CMD_Label(147)={"ACMD47"};
  CMD_Label(148)={"ACMD48"};
  CMD_Label(149)={"ACMD49"};
  CMD_Label(150)={"ACMD50"};
  CMD_Label(151)={"ACMD51"};
  CMD_Label(152)={"ACMD52"};
  CMD_Label(153)={"ACMD53"};
  CMD_Label(154)={"ACMD54"};
  CMD_Label(155)={"ACMD55"};
  CMD_Label(156)={"ACMD56"};
  CMD_Label(157)={"ACMD57"};
  CMD_Label(158)={"ACMD58"};
  CMD_Label(159)={"ACMD59"};

  Resp(1)={"-"};
  Resp(2)={"R3"};
  Resp(3)={"R2"};
  Resp(4)={"R1"};
  Resp(5)={"-"};
  Resp(6)={"R1b"};
  Resp(7)={"R1b"};
  Resp(8)={"R1b"};
  Resp(9)={"R1"};
  Resp(10)={"R2"};
  Resp(11)={"R2"};
  Resp(12)={"-"};
  Resp(13)={"R1b"};
  Resp(14)={"R1"};
  Resp(15)={"R1"};
  Resp(16)={"-"};
  Resp(17)={"R1"};
  Resp(18)={"R1"};
  Resp(19)={"R1"};
  Resp(20)={"R1"};
  Resp(21)={"-"};
  Resp(22)={"R1"};
  Resp(23)={"-"};
  Resp(24)={"R1"};
  Resp(25)={"R1"};
  Resp(26)={"R1"};
  Resp(27)={"R1"};
  Resp(28)={"R1"};
  Resp(29)={"R1b"};
  Resp(30)={"R1b"};
  Resp(31)={"R1"};
  Resp(32)={"R1"};
  Resp(33)={"-"};
  Resp(34)={"-"};
  Resp(35)={"-"};
  Resp(36)={"R1"};
  Resp(37)={"R1"};
  Resp(38)={"-"};
  Resp(39)={"R1b"};
  Resp(40)={"R4"};
  Resp(41)={"R5"};
  Resp(42)={"-"};
  Resp(43)={"R1"};
  Resp(44)={"-"};
  Resp(45)={"R1"};
  Resp(46)={"R1"};
  Resp(47)={"R1"};
  Resp(48)={"R1"};
  Resp(49)={"R1b"};
  Resp(50)={"R1"};
  Resp(51)={"-"};
  Resp(52)={"-"};
  Resp(53)={"-"};
  Resp(54)={"R1"};
  Resp(55)={"R1"};
  Resp(56)={"R1"};
  Resp(57)={"R1"};
  Resp(58)={"-"};
  Resp(59)={"-"};
  Resp(60)={"-"};
  Resp(61)={"-"};
  Resp(62)={"-"};
  Resp(63)={"-"};
  Resp(64)={"-"};
  Resp(65)={"-"};
  Resp(66)={"-"};
  Resp(67)={"-"};
  Resp(68)={"-"};
  Resp(69)={"-"};
  Resp(70)={"-"};
  Resp(71)={"-"};
  Resp(72)={"-"};
  Resp(73)={"-"};
  Resp(74)={"-"};
  Resp(75)={"-"};
  Resp(76)={"-"};
  Resp(77)={"-"};
  Resp(78)={"-"};
  Resp(79)={"-"};
  Resp(80)={"-"};
  Resp(81)={"-"};
  Resp(82)={"-"};
  Resp(83)={"-"};
  Resp(84)={"-"};
  Resp(85)={"-"};
  Resp(86)={"-"};
  Resp(87)={"-"};
  Resp(88)={"-"};
  Resp(89)={"-"};
  Resp(90)={"-"};
  Resp(91)={"-"};
  Resp(92)={"-"};
  Resp(93)={"-"};
  Resp(94)={"-"};
  Resp(95)={"-"};
  Resp(96)={"-"};
  Resp(97)={"-"};
  Resp(98)={"-"};
  Resp(99)={"-"};
  Resp(100)={"-"};
  Resp(101)={"-"};
  Resp(102)={"-"};
  Resp(103)={"-"};
  Resp(104)={"-"};
  Resp(105)={"-"};
  Resp(106)={"-"};
  Resp(107)={"-"};
  Resp(108)={"-"};
  Resp(109)={"-"};
  Resp(110)={"-"};
  Resp(111)={"-"};
  Resp(112)={"-"};
  Resp(113)={"-"};
  Resp(114)={"-"};
  Resp(115)={"-"};
  Resp(116)={"-"};
  Resp(117)={"-"};
  Resp(118)={"-"};
  Resp(119)={"-"};
  Resp(120)={"-"};
  Resp(121)={"-"};
  Resp(122)={"-"};
  Resp(123)={"-"};
  Resp(124)={"-"};
  Resp(125)={"-"};
  Resp(126)={"-"};
  Resp(127)={"-"};
  Resp(128)={"-"};
  Resp(129)={"-"};
  Resp(130)={"-"};
  Resp(131)={"-"};
  Resp(132)={"-"};
  Resp(133)={"-"};
  Resp(134)={"-"};
  Resp(135)={"-"};
  Resp(136)={"-"};
  Resp(137)={"-"};
  Resp(138)={"-"};
  Resp(139)={"-"};
  Resp(140)={"-"};
  Resp(141)={"-"};
  Resp(142)={"-"};
  Resp(143)={"-"};
  Resp(144)={"-"};
  Resp(145)={"-"};
  Resp(146)={"-"};
  Resp(147)={"-"};
  Resp(148)={"-"};
  Resp(149)={"-"};
  Resp(150)={"-"};
  Resp(151)={"-"};
  Resp(152)={"-"};
  Resp(153)={"-"};
  Resp(154)={"-"};
  Resp(155)={"-"};
  Resp(156)={"-"};
  Resp(157)={"-"};
  Resp(158)={"-"};
  Resp(159)={"-"};

  Abbreviation(1)={"Resets"};
  Abbreviation(2)={"SEND_OP_COND"};
  Abbreviation(3)={"ALL_SEND_CID"};
  Abbreviation(4)={"SET_RELATIVE_ADDR"};
  Abbreviation(5)={"SET_DSR"};
  Abbreviation(6)={"SLEEP_AWAKE"};
  Abbreviation(7)={"SWITCH"};
  Abbreviation(8)={"SELECT/DESELECT_CARD"};
  Abbreviation(9)={"SEND_EXT_CSD"};
  Abbreviation(10)={"SEND_CSD"};
  Abbreviation(11)={"SEND_CID"};
  Abbreviation(12)={"-"};
  Abbreviation(13)={"STOP_TRANSMISSION"};
  Abbreviation(14)={"SEND_STATUS"};
  Abbreviation(15)={"BUSTEST_R"};
  Abbreviation(16)={"GO_INACTIVE_STATE"};
  Abbreviation(17)={"SET_BLOCKLEN"};
  Abbreviation(18)={"READ_SINGLE_ BLOCK"};
  Abbreviation(19)={"READ_MULTIPLE_ BLOCK"};
  Abbreviation(20)={"BUSTEST_W"};
  Abbreviation(21)={"-"};
  Abbreviation(22)={"SEND_TUNING_ BLOCK"};
  Abbreviation(23)={"-"};
  Abbreviation(24)={"SET_BLOCK_COUNT"};
  Abbreviation(25)={"WRITE_BLOCK"};
  Abbreviation(26)={"WRITE_MULTIPLE_ BLOCK"};
  Abbreviation(27)={"PROGRAM_CID"};
  Abbreviation(28)={"PROGRAM_CSD"};
  Abbreviation(29)={"SET_WRITE_PROT"};
  Abbreviation(30)={"CLR_WRITE_PROT"};
  Abbreviation(31)={"SEND_WRITE_PROT"};
  Abbreviation(32)={"SEND_WRITE_PROT _TYPE"};
  Abbreviation(33)={"-"};
  Abbreviation(34)={"-"};
  Abbreviation(35)={"-"};
  Abbreviation(36)={"ERASE_GROUP_START"};
  Abbreviation(37)={"ERASE_GROUP_END"};
  Abbreviation(38)={"-"};
  Abbreviation(39)={"ERASE"};
  Abbreviation(40)={"FAST_IO"};
  Abbreviation(41)={"GO_IRQ_STATE"};
  Abbreviation(42)={"-"};
  Abbreviation(43)={"LOCK_UNLOCK"};
  Abbreviation(44)={"-"};
  Abbreviation(45)={"QUEUED_TASK _PARAMS"};
  Abbreviation(46)={"QUEUED_TASK _ADDRESS"};
  Abbreviation(47)={"EXECUTE_READ _TASK"};
  Abbreviation(48)={"EXECUTE_WRITE _TASK"};
  Abbreviation(49)={"CMDQ_TASK _MGMT"};
  Abbreviation(50)={"SET_TIME"};
  Abbreviation(51)={"-"};
  Abbreviation(52)={"-"};
  Abbreviation(53)={"-"};
  Abbreviation(54)={"PROTOCOL_RD"};
  Abbreviation(55)={"PROTOCOL_WR"};
  Abbreviation(56)={"APP_CMD"};
  Abbreviation(57)={"GEN_CMD"};
  Abbreviation(58)={"-"};
  Abbreviation(59)={"-"};
  Abbreviation(60)={"-"};
  Abbreviation(61)={"-"};
  Abbreviation(62)={"-"};
  Abbreviation(63)={"-"};
  Abbreviation(64)={"-"};
  Abbreviation(65)={"-"};
  Abbreviation(66)={"-"};
  Abbreviation(67)={"-"};
  Abbreviation(68)={"-"};
  Abbreviation(69)={"-"};
  Abbreviation(70)={"-"};
  Abbreviation(71)={"-"};
  Abbreviation(72)={"-"};
  Abbreviation(73)={"-"};
  Abbreviation(74)={"-"};
  Abbreviation(75)={"-"};
  Abbreviation(76)={"-"};
  Abbreviation(77)={"-"};
  Abbreviation(78)={"-"};
  Abbreviation(79)={"-"};
  Abbreviation(80)={"-"};
  Abbreviation(81)={"-"};
  Abbreviation(82)={"-"};
  Abbreviation(83)={"-"};
  Abbreviation(84)={"-"};
  Abbreviation(85)={"-"};
  Abbreviation(86)={"-"};
  Abbreviation(87)={"-"};
  Abbreviation(88)={"-"};
  Abbreviation(89)={"-"};
  Abbreviation(90)={"-"};
  Abbreviation(91)={"-"};
  Abbreviation(92)={"-"};
  Abbreviation(93)={"-"};
  Abbreviation(94)={"-"};
  Abbreviation(95)={"-"};
  Abbreviation(96)={"-"};
  Abbreviation(97)={"-"};
  Abbreviation(98)={"-"};
  Abbreviation(99)={"-"};
  Abbreviation(100)={"-"};
  Abbreviation(101)={"-"};
  Abbreviation(102)={"-"};
  Abbreviation(103)={"-"};
  Abbreviation(104)={"-"};
  Abbreviation(105)={"-"};
  Abbreviation(106)={"-"};
  Abbreviation(107)={"-"};
  Abbreviation(108)={"-"};
  Abbreviation(109)={"-"};
  Abbreviation(110)={"-"};
  Abbreviation(111)={"-"};
  Abbreviation(112)={"-"};
  Abbreviation(113)={"-"};
  Abbreviation(114)={"-"};
  Abbreviation(115)={"-"};
  Abbreviation(116)={"-"};
  Abbreviation(117)={"-"};
  Abbreviation(118)={"-"};
  Abbreviation(119)={"-"};
  Abbreviation(120)={"-"};
  Abbreviation(121)={"-"};
  Abbreviation(122)={"-"};
  Abbreviation(123)={"-"};
  Abbreviation(124)={"-"};
  Abbreviation(125)={"-"};
  Abbreviation(126)={"-"};
  Abbreviation(127)={"-"};
  Abbreviation(128)={"-"};
  Abbreviation(129)={"-"};
  Abbreviation(130)={"-"};
  Abbreviation(131)={"-"};
  Abbreviation(132)={"-"};
  Abbreviation(133)={"-"};
  Abbreviation(134)={"-"};
  Abbreviation(135)={"-"};
  Abbreviation(136)={"-"};
  Abbreviation(137)={"-"};
  Abbreviation(138)={"-"};
  Abbreviation(139)={"-"};
  Abbreviation(140)={"-"};
  Abbreviation(141)={"-"};
  Abbreviation(142)={"-"};
  Abbreviation(143)={"-"};
  Abbreviation(144)={"-"};
  Abbreviation(145)={"-"};
  Abbreviation(146)={"-"};
  Abbreviation(147)={"-"};
  Abbreviation(148)={"-"};
  Abbreviation(149)={"-"};
  Abbreviation(150)={"-"};
  Abbreviation(151)={"-"};
  Abbreviation(152)={"-"};
  Abbreviation(153)={"-"};
  Abbreviation(154)={"-"};
  Abbreviation(155)={"-"};
  Abbreviation(156)={"-"};
  Abbreviation(157)={"-"};
  Abbreviation(158)={"-"};
  Abbreviation(159)={"-"};  
else
  CMD_Label(1)={"CMD0"};
  CMD_Label(2)={"CMD1"};
  CMD_Label(3)={"CMD2"};
  CMD_Label(4)={"CMD3"};
  CMD_Label(5)={"CMD4"};
  CMD_Label(6)={"CMD5"};
  CMD_Label(7)={"CMD6"};
  CMD_Label(8)={"CMD7"};
  CMD_Label(9)={"CMD8"};
  CMD_Label(10)={"CMD9"};
  CMD_Label(11)={"CMD10"};
  CMD_Label(12)={"CMD11"};
  CMD_Label(13)={"CMD12"};
  CMD_Label(14)={"CMD13"};
  CMD_Label(15)={"CMD14"};
  CMD_Label(16)={"CMD15"};
  CMD_Label(17)={"CMD16"};
  CMD_Label(18)={"CMD17"};
  CMD_Label(19)={"CMD18"};
  CMD_Label(20)={"CMD19"};
  CMD_Label(21)={"CMD20"};
  CMD_Label(22)={"CMD21"};
  CMD_Label(23)={"CMD22"};
  CMD_Label(24)={"CMD23"};
  CMD_Label(25)={"CMD24"};
  CMD_Label(26)={"CMD25"};
  CMD_Label(27)={"CMD26"};
  CMD_Label(28)={"CMD27"};
  CMD_Label(29)={"CMD28"};
  CMD_Label(30)={"CMD29"};
  CMD_Label(31)={"CMD30"};
  CMD_Label(32)={"CMD31"};
  CMD_Label(33)={"CMD32"};
  CMD_Label(34)={"CMD33"};
  CMD_Label(35)={"CMD34"};
  CMD_Label(36)={"CMD35"};
  CMD_Label(37)={"CMD36"};
  CMD_Label(38)={"CMD37"};
  CMD_Label(39)={"CMD38"};
  CMD_Label(40)={"CMD39"};
  CMD_Label(41)={"CMD40"};
  CMD_Label(42)={"CMD41"};
  CMD_Label(43)={"CMD42"};
  CMD_Label(44)={"CMD43"};
  CMD_Label(45)={"CMD44"};
  CMD_Label(46)={"CMD45"};
  CMD_Label(47)={"CMD46"};
  CMD_Label(48)={"CMD47"};
  CMD_Label(49)={"CMD48"};
  CMD_Label(50)={"CMD49"};
  CMD_Label(51)={"CMD50"};
  CMD_Label(52)={"CMD51"};
  CMD_Label(53)={"CMD52"};
  CMD_Label(54)={"CMD53"};
  CMD_Label(55)={"CMD54"};
  CMD_Label(56)={"CMD55"};
  CMD_Label(57)={"CMD56"};
  CMD_Label(58)={"CMD57"};
  CMD_Label(59)={"CMD58"};
  CMD_Label(60)={"CMD59"};
  CMD_Label(61)={"CMD60"};
  CMD_Label(62)={"CMD61"};
  CMD_Label(63)={"CMD62"};
  CMD_Label(64)={"CMD63"};
  CMD_Label(65)={""};
  CMD_Label(66)={""};
  CMD_Label(67)={""};
  CMD_Label(68)={""};
  CMD_Label(69)={""};
  CMD_Label(70)={""};
  CMD_Label(71)={""};
  CMD_Label(72)={""};
  CMD_Label(73)={""};
  CMD_Label(74)={""};
  CMD_Label(75)={""};
  CMD_Label(76)={""};
  CMD_Label(77)={""};
  CMD_Label(78)={""};
  CMD_Label(79)={""};
  CMD_Label(80)={""};
  CMD_Label(81)={""};
  CMD_Label(82)={""};
  CMD_Label(83)={""};
  CMD_Label(84)={""};
  CMD_Label(85)={""};
  CMD_Label(86)={""};
  CMD_Label(87)={""};
  CMD_Label(88)={""};
  CMD_Label(89)={""};
  CMD_Label(90)={""};
  CMD_Label(91)={""};
  CMD_Label(92)={""};
  CMD_Label(93)={""};
  CMD_Label(94)={""};
  CMD_Label(95)={""};
  CMD_Label(96)={""};
  CMD_Label(97)={""};
  CMD_Label(98)={""};
  CMD_Label(99)={""};
  CMD_Label(100)={""};
  CMD_Label(101)={"ACMD1"};
  CMD_Label(102)={"ACMD2"};
  CMD_Label(103)={"ACMD3"};
  CMD_Label(104)={"ACMD4"};
  CMD_Label(105)={"ACMD5"};
  CMD_Label(106)={"ACMD6"};
  CMD_Label(107)={"ACMD7"};
  CMD_Label(108)={"ACMD8"};
  CMD_Label(109)={"ACMD9"};
  CMD_Label(110)={"ACMD10"};
  CMD_Label(111)={"ACMD11"};
  CMD_Label(112)={"ACMD12"};
  CMD_Label(113)={"ACMD13"};
  CMD_Label(114)={"ACMD14"};
  CMD_Label(115)={"ACMD15"};
  CMD_Label(116)={"ACMD16"};
  CMD_Label(117)={"ACMD17"};
  CMD_Label(118)={"ACMD18"};
  CMD_Label(119)={"ACMD19"};
  CMD_Label(120)={"ACMD20"};
  CMD_Label(121)={"ACMD21"};
  CMD_Label(122)={"ACMD22"};
  CMD_Label(123)={"ACMD23"};
  CMD_Label(124)={"ACMD24"};
  CMD_Label(125)={"ACMD25"};
  CMD_Label(126)={"ACMD26"};
  CMD_Label(127)={"ACMD27"};
  CMD_Label(128)={"ACMD28"};
  CMD_Label(129)={"ACMD29"};
  CMD_Label(130)={"ACMD30"};
  CMD_Label(131)={"ACMD31"};
  CMD_Label(132)={"ACMD32"};
  CMD_Label(133)={"ACMD33"};
  CMD_Label(134)={"ACMD34"};
  CMD_Label(135)={"ACMD35"};
  CMD_Label(136)={"ACMD36"};
  CMD_Label(137)={"ACMD37"};
  CMD_Label(138)={"ACMD38"};
  CMD_Label(139)={"ACMD39"};
  CMD_Label(140)={"ACMD40"};
  CMD_Label(141)={"ACMD41"};
  CMD_Label(142)={"ACMD42"};
  CMD_Label(143)={"ACMD43"};
  CMD_Label(144)={"ACMD44"};
  CMD_Label(145)={"ACMD45"};
  CMD_Label(146)={"ACMD46"};
  CMD_Label(147)={"ACMD47"};
  CMD_Label(148)={"ACMD48"};
  CMD_Label(149)={"ACMD49"};
  CMD_Label(150)={"ACMD50"};
  CMD_Label(151)={"ACMD51"};
  CMD_Label(152)={"ACMD52"};
  CMD_Label(153)={"ACMD53"};
  CMD_Label(154)={"ACMD54"};
  CMD_Label(155)={"ACMD55"};
  CMD_Label(156)={"ACMD56"};
  CMD_Label(157)={"ACMD57"};
  CMD_Label(158)={"ACMD58"};
  CMD_Label(159)={"ACMD59"};

  Resp(1)={"-"};
  Resp(2)={"-"};
  Resp(3)={"R2"};
  Resp(4)={"R6"};
  Resp(5)={"-"};
  Resp(6)={"-"};
  Resp(7)={"R1"};
  Resp(8)={"R1b"};
  Resp(9)={"R7"};
  Resp(10)={"R2"};
  Resp(11)={"R2"};
  Resp(12)={"R1"};
  Resp(13)={"R1b"};
  Resp(14)={"R1"};
  Resp(15)={"-"};
  Resp(16)={"-"};
  Resp(17)={"R1"};
  Resp(18)={"R1"};
  Resp(19)={"R1"};
  Resp(20)={"R1"};
  Resp(21)={"R1b"};
  Resp(22)={"-"};
  Resp(23)={"R1"};
  Resp(24)={"R1"};
  Resp(25)={"R1"};
  Resp(26)={"R1"};
  Resp(27)={"-"};
  Resp(28)={"R1"};
  Resp(29)={"R1b"};
  Resp(30)={"R1b"};
  Resp(31)={"R1"};
  Resp(32)={"-"};
  Resp(33)={"R1"};
  Resp(34)={"R1"};
  Resp(35)={"-"};
  Resp(36)={"-"};
  Resp(37)={"-"};
  Resp(38)={"-"};
  Resp(39)={"R1b"};
  Resp(40)={"R1b"};
  Resp(41)={"R1"};
  Resp(42)={"-"};
  Resp(43)={"R1"};
  Resp(44)={"R1b"};
  Resp(45)={"R1"};
  Resp(46)={"R1"};
  Resp(47)={"R1"};
  Resp(48)={"R1"};
  Resp(49)={"R1"};
  Resp(50)={"R1"};
  Resp(51)={"-"};
  Resp(52)={"-"};
  Resp(53)={"R5"};
  Resp(54)={"R5"};
  Resp(55)={"-"};
  Resp(56)={"R1"};
  Resp(57)={"R1"};
  Resp(58)={"-"};
  Resp(59)={"R1"};
  Resp(60)={"R1"};
  Resp(61)={"-"};
  Resp(62)={"-"};
  Resp(63)={"-"};
  Resp(64)={"-"};
  Resp(65)={""};
  Resp(66)={""};
  Resp(67)={""};
  Resp(68)={""};
  Resp(69)={""};
  Resp(70)={""};
  Resp(71)={""};
  Resp(72)={""};
  Resp(73)={""};
  Resp(74)={""};
  Resp(75)={""};
  Resp(76)={""};
  Resp(77)={""};
  Resp(78)={""};
  Resp(79)={""};
  Resp(80)={""};
  Resp(81)={""};
  Resp(82)={""};
  Resp(83)={""};
  Resp(84)={""};
  Resp(85)={""};
  Resp(86)={""};
  Resp(87)={""};
  Resp(88)={""};
  Resp(89)={""};
  Resp(90)={""};
  Resp(91)={""};
  Resp(92)={""};
  Resp(93)={""};
  Resp(94)={""};
  Resp(95)={""};
  Resp(96)={""};
  Resp(97)={""};
  Resp(98)={""};
  Resp(99)={""};
  Resp(100)={""};
  Resp(101)={"-"};
  Resp(102)={"-"};
  Resp(103)={"-"};
  Resp(104)={"-"};
  Resp(105)={"-"};
  Resp(106)={"R1"};
  Resp(107)={"-"};
  Resp(108)={"-"};
  Resp(109)={"-"};
  Resp(110)={"-"};
  Resp(111)={"-"};
  Resp(112)={"-"};
  Resp(113)={"R1"};
  Resp(114)={"-"};
  Resp(115)={"-"};
  Resp(116)={"-"};
  Resp(117)={"-"};
  Resp(118)={"-"};
  Resp(119)={"-"};
  Resp(120)={"-"};
  Resp(121)={"-"};
  Resp(122)={"R1"};
  Resp(123)={"R1"};
  Resp(124)={"-"};
  Resp(125)={"-"};
  Resp(126)={"-"};
  Resp(127)={"-"};
  Resp(128)={"-"};
  Resp(129)={"-"};
  Resp(130)={"-"};
  Resp(131)={"-"};
  Resp(132)={"-"};
  Resp(133)={"-"};
  Resp(134)={"-"};
  Resp(135)={"-"};
  Resp(136)={"-"};
  Resp(137)={"-"};
  Resp(138)={"-"};
  Resp(139)={"-"};
  Resp(140)={"-"};
  Resp(141)={"R3"};
  Resp(142)={"R1"};
  Resp(143)={"-"};
  Resp(144)={"-"};
  Resp(145)={"-"};
  Resp(146)={"-"};
  Resp(147)={"-"};
  Resp(148)={"-"};
  Resp(149)={"-"};
  Resp(150)={"-"};
  Resp(151)={"R1"};
  Resp(152)={"-"};
  Resp(153)={"R1"};
  Resp(154)={"R1"};
  Resp(155)={"-"};
  Resp(156)={"-"};
  Resp(157)={"-"};
  Resp(158)={"-"};
  Resp(159)={"-"};

  Abbreviation(1)={"GO_IDLE_STATE"};
  Abbreviation(2)={"-"};
  Abbreviation(3)={"ALL_SEND_CID"};
  Abbreviation(4)={"SEND_RELATIVE_ADDR"};
  Abbreviation(5)={"SET_DSR"};
  Abbreviation(6)={"-"};
  Abbreviation(7)={"SWITCH_FUNC"};
  Abbreviation(8)={"SELECT/DESELECT_ CARD"};
  Abbreviation(9)={"SEND_IF_COND"};
  Abbreviation(10)={"SEND_CSD"};
  Abbreviation(11)={"SEND_CID"};
  Abbreviation(12)={"VOLTAGE_SWITCH"};
  Abbreviation(13)={"STOP_TRANSMISSION"};
  Abbreviation(14)={"SEND_STATUS/SEND_TASK_STATUS"};
  Abbreviation(15)={"-"};
  Abbreviation(16)={"GO_INACTIVE_STATE"};
  Abbreviation(17)={"SET_BLOCKLEN"};
  Abbreviation(18)={"READ_SINGLE_BLOCK"};
  Abbreviation(19)={"READ_MULTIPLE_BLOCK"};
  Abbreviation(20)={"SEND_TUNING_BLOCK"};
  Abbreviation(21)={"SPEED_CLASS_CONTROL"};
  Abbreviation(22)={"-"};
  Abbreviation(23)={"ADDRESS_EXTENSION"};
  Abbreviation(24)={"SET_BLOCK_COUNT"};
  Abbreviation(25)={"WRITE_BLOCK"};
  Abbreviation(26)={"WRITE_MULTIPLE_BLOCK"};
  Abbreviation(27)={"-"};
  Abbreviation(28)={"PROGRAM_CSD"};
  Abbreviation(29)={"SET_WRITE_PROT"};
  Abbreviation(30)={"CLR_WRITE_PROT"};
  Abbreviation(31)={"SEND_WRITE_PROT"};
  Abbreviation(32)={"-"};
  Abbreviation(33)={"ERASE_WR_BLK_START"};
  Abbreviation(34)={"ERASE_WR_BLK_END"};
  Abbreviation(35)={"-"};
  Abbreviation(36)={"-"};
  Abbreviation(37)={"-"};
  Abbreviation(38)={"-"};
  Abbreviation(39)={"ERASE"};
  Abbreviation(40)={"SELECT_CARD_ PARTITION"};
  Abbreviation(41)={"Defined by DPS Spec."};
  Abbreviation(42)={"-"};
  Abbreviation(43)={"LOCK_UNLOCK"};
  Abbreviation(44)={"Q_MANAGEMENT"};
  Abbreviation(45)={"Q_TASK_INFO_A"};
  Abbreviation(46)={"Q_TASK_INFO_B"};
  Abbreviation(47)={"Q_RD_TASK"};
  Abbreviation(48)={"Q_WR_TASK"};
  Abbreviation(49)={"READ_EXTR_SINGLE"};
  Abbreviation(50)={"WRITE_EXTR_SINGLE"};
  Abbreviation(51)={"-"};
  Abbreviation(52)={"-"};
  Abbreviation(53)={"IO_RW_DIRECT"};
  Abbreviation(54)={"IO_RW_EXTENDED"};
  Abbreviation(55)={"-"};
  Abbreviation(56)={"APP_CMD"};
  Abbreviation(57)={"GEN_CMD"};
  Abbreviation(58)={"-"};
  Abbreviation(59)={"READ_EXTR_MULTI"};
  Abbreviation(60)={"WRITE_EXTR_MULTI"};
  Abbreviation(61)={"-"};
  Abbreviation(62)={"-"};
  Abbreviation(63)={"-"};
  Abbreviation(64)={"-"};
  Abbreviation(65)={""};
  Abbreviation(66)={""};
  Abbreviation(67)={""};
  Abbreviation(68)={""};
  Abbreviation(69)={""};
  Abbreviation(70)={""};
  Abbreviation(71)={""};
  Abbreviation(72)={""};
  Abbreviation(73)={""};
  Abbreviation(74)={""};
  Abbreviation(75)={""};
  Abbreviation(76)={""};
  Abbreviation(77)={""};
  Abbreviation(78)={""};
  Abbreviation(79)={""};
  Abbreviation(80)={""};
  Abbreviation(81)={""};
  Abbreviation(82)={""};
  Abbreviation(83)={""};
  Abbreviation(84)={""};
  Abbreviation(85)={""};
  Abbreviation(86)={""};
  Abbreviation(87)={""};
  Abbreviation(88)={""};
  Abbreviation(89)={""};
  Abbreviation(90)={""};
  Abbreviation(91)={""};
  Abbreviation(92)={""};
  Abbreviation(93)={""};
  Abbreviation(94)={""};
  Abbreviation(95)={""};
  Abbreviation(96)={""};
  Abbreviation(97)={""};
  Abbreviation(98)={""};
  Abbreviation(99)={""};
  Abbreviation(100)={""};
  Abbreviation(101)={"-"};
  Abbreviation(102)={"-"};
  Abbreviation(103)={"-"};
  Abbreviation(104)={"-"};
  Abbreviation(105)={"-"};
  Abbreviation(106)={"SET_BUS_WIDTH"};
  Abbreviation(107)={"-"};
  Abbreviation(108)={"-"};
  Abbreviation(109)={"-"};
  Abbreviation(110)={"-"};
  Abbreviation(111)={"-"};
  Abbreviation(112)={"-"};
  Abbreviation(113)={"SD_STATUS"};
  Abbreviation(114)={"-"};
  Abbreviation(115)={"-"};
  Abbreviation(116)={"-"};
  Abbreviation(117)={"-"};
  Abbreviation(118)={"-"};
  Abbreviation(119)={"-"};
  Abbreviation(120)={"-"};
  Abbreviation(121)={"-"};
  Abbreviation(122)={"SEND_NUM_WR_BLOCKS"};
  Abbreviation(123)={"SET_WR_BLK_ERASE_COUNT"};
  Abbreviation(124)={"-"};
  Abbreviation(125)={"-"};
  Abbreviation(126)={"-"};
  Abbreviation(127)={"-"};
  Abbreviation(128)={"-"};
  Abbreviation(129)={"-"};
  Abbreviation(130)={"-"};
  Abbreviation(131)={"-"};
  Abbreviation(132)={"-"};
  Abbreviation(133)={"-"};
  Abbreviation(134)={"-"};
  Abbreviation(135)={"-"};
  Abbreviation(136)={"-"};
  Abbreviation(137)={"-"};
  Abbreviation(138)={"-"};
  Abbreviation(139)={"-"};
  Abbreviation(140)={"-"};
  Abbreviation(141)={"SD_SEND_OP_COND"};
  Abbreviation(142)={"SET_CLR_CARD_DETECT"};
  Abbreviation(143)={"-"};
  Abbreviation(144)={"-"};
  Abbreviation(145)={"-"};
  Abbreviation(146)={"-"};
  Abbreviation(147)={"-"};
  Abbreviation(148)={"-"};
  Abbreviation(149)={"-"};
  Abbreviation(150)={"-"};
  Abbreviation(151)={"SEND_SCR"};
  Abbreviation(152)={"-"};
  Abbreviation(153)={"SECURE_RECEIVE"};
  Abbreviation(154)={"SECURE_SEND"};
  Abbreviation(155)={"-"};
  Abbreviation(156)={"-"};
  Abbreviation(157)={"-"};
  Abbreviation(158)={"-"};
  Abbreviation(159)={"-"};
endif
%%%%%%%%%%%%%%%%%%%% Function Edge Detection Begin %%%%%%%%%%%%%%%%%%%% 
function [Ind_Rising Ind_Falling] = Edge_Detection(Time,CLK_Real_Waveform);

  global VT;  
  
  clear Temp;
  Temp = sign(CLK_Real_Waveform-VT);  
  Temp = (Temp+1)/2;  
  Temp(1:end-1) = Temp(2:end) - Temp(1:end-1);
  Temp(end) = 0;
  Ind_Rising = find(Temp == 1) + 1;
  Ind_Rising += 1;  
  Ind_Falling = find(Temp == -1) + 1;
  Ind_Falling += 1;
  
endfunction    
%%%%%%%%%%%%%%%%%%%% Function Edge Detection End %%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%% Function CRC Check Begin %%%%%%%%%%%%%%%%%%%% 
function [Result Cal_CRC] = Check_CRC(Data,Polynomial);
 
  clear Temp;
  Temp = Data;
  LPolynomial = length(Polynomial);
  Temp = reshape(Temp,1,length(Temp)); 
  clear CRC;
  CRC = Temp(end-LPolynomial+2:end);
  Cal_CRC = 0;
  for n=1:1:length(CRC)
    Cal_CRC += CRC(n)*2^(length(CRC)-n);
  endfor
  Temp(end-LPolynomial+2:end) = 0;
  clear CRC_Temp;
  clear CRC_Result;
  
  for n = 1:1:length(Temp)-LPolynomial+1
    if n == 1
      CRC_Temp = Temp(1:LPolynomial);
    else
      CRC_Temp(1:LPolynomial-1) = CRC_Temp(2:LPolynomial);    
      CRC_Temp(LPolynomial) = Temp(LPolynomial+n-1);     
    endif
    if CRC_Temp(1) == 1
      CRC_Result = xor(CRC_Temp,Polynomial);
      CRC_Temp = CRC_Result;
    endif
  endfor  
  clear Result;
  Result = 0;
  if CRC_Temp(2:LPolynomial) == CRC
    Result = 1;
  else  
    Result = 0;    
  endif   

endfunction   
%%%%%%%%%%%%%%%%%%%% Function CRC Check End %%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%% Function CMD Analysis Begin %%%%%%%%%%%%%%%%%%%% 
function [Ind_Start_Bit Ind_End_Bit CRC_Result CRC7] = CMD_Analysis(Digitalized_CMD);
  
  global CRC7_Polynomial;

  Packet_Count = 1;      
  Start = 1;
  Ptr = Start;

  clear Temp;
  Temp = Digitalized_CMD;
%  TheEnd = length(Temp);
  TheEnd = find(Temp == 1, 1, 'last');
  TX_CMD = 0;
  clear Ind_Start_Bit; 
  clear Ind_End_Bit; 
  clear CRC_Result;
  clear CRC7;  
  
  while( Ptr < TheEnd)  
    if isempty(find(Temp(Start:TheEnd) == 0, 1)) == 1  
      break;
    else
      Ptr = find(Temp(Start:TheEnd) == 0, 1)+Start-1;
      Start = Ptr;      
      CMD_Index = 0;      
      CMD_Index += Temp(Start+2)*2^5;
      CMD_Index += Temp(Start+3)*2^4;      
      CMD_Index += Temp(Start+4)*2^3;
      CMD_Index += Temp(Start+5)*2^2;     
      CMD_Index += Temp(Start+6)*2^1;
      CMD_Index += Temp(Start+7)*2^0;          
      if Temp(Start+1) == 1 % Command Token
        DataSize = 48;
        TX_CMD = CMD_Index;    
      else                  % Response Token     
        if TX_CMD == 2 || TX_CMD == 9 || TX_CMD == 10
          DataSize = 136;
        else
          DataSize = 48;          
        endif  
      endif
      Stop = Start + DataSize - 1;          
      [True_or_False Calculated_CRC] = Check_CRC(Temp(Start:Stop-1),CRC7_Polynomial);
      Ind_Start_Bit(Packet_Count) = Start;
      Ind_End_Bit(Packet_Count) = Stop; 
      CRC_Result(Packet_Count) = logical(True_or_False); 
      CRC7(Packet_Count) = uint8(Calculated_CRC);       
      Packet_Count++;    
      Start = Stop + 1;       
    endif
  endwhile
    
  if (exist('Ind_Start_Bit','var') == 0)  
    Ind_Start_Bit = 0;
    Ind_End_Bit = 0;
    CRC_Result = 0;
    CRC7 = 0;
  endif    
    
endfunction    
%%%%%%%%%%%%%%%%%%%% Function CMD Analysis End %%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%% Function Data Analysis End %%%%%%%%%%%%%%%%%%%% 
function [Ind_Start_Bit Ind_End_Bit CRC_Result CRC16] = DAT_Analysis(Digitalized_DAT);

  global CRC16_Polynomial;
  Packet_Count = 1;      
  Start = 1;
  Ptr = Start;

  clear Temp;
  Temp = Digitalized_DAT;
  TheEnd = length(Temp);
  clear Ind_Start_Bit; 
  clear Ind_End_Bit; 
  clear CRC_Result;
  clear CRC7;  

  DataSize = [64 128 256 512 1024 1032 2048 4096 8192];  

  while( Ptr < TheEnd)  
    %%%%% Hierarchy 1 %%%%%
    if isempty(find(Temp(Start:TheEnd) == 0, 1)) == 1  
      break;
    else
      Ptr = find(Temp(Start:TheEnd) == 0, 1)+Start;
      Start = Ptr;
      for n = 1:1:length(DataSize)
        Stop = Start+DataSize(n)+16-1;  
        if Stop >= TheEnd
          break;
        elseif Temp(Start-1) == 0 && Temp(Stop+1) == 1
          [True_or_False Calculated_CRC] = Check_CRC(Temp(Start:Stop),CRC16_Polynomial);
          CRC_Result(Packet_Count) = logical(True_or_False); 
          if CRC_Result(Packet_Count) == 1
            Ind_Start_Bit(Packet_Count) = Start;
            Ind_End_Bit(Packet_Count) = Stop; 
            CRC16(Packet_Count) = uint16(Calculated_CRC); 
            Packet_Count++;    
            Start = Stop + 1;                  
            n = length(DataSize)+1;    
          else
                  
          endif
        else
          n = length(DataSize)+1; % Leave the for loop ... Data format does not match
        endif    
      endfor

      if CRC_Result(end) == 0
        Start += 1; 
      endif
    endif  
    %%%%% Hierarchy 1 %%%%%  
  endwhile  

  if (exist('Ind_Start_Bit','var') == 0)  
    Ind_Start_Bit = 0;
    Ind_End_Bit = 0;
    CRC_Result = 0;
    CRC16 = 0;
  endif
  
endfunction
%%%%%%%%%%%%%%%%%%%% Function Data Analysis End %%%%%%%%%%%%%%%%%%%% 

indat = dlmread(iFile_1, ",");
[Rows Cols] = size(indat);
Start = 1;
Stop = length(indat);
Time = indat(Start:Stop,1);  
SamplingInterval = Time(2)-Time(1);
Ch1 = indat(Start:Stop,2);  
Ch2 = indat(Start:Stop,3);  
if Cols > 3 
  Ch3 = indat(Start:Stop,4);  
endif
if Cols > 4
  Ch4 = indat(Start:Stop,5);  
endif
Time_Plot = Time - min(Time);

[Ind1 Ind0] = Edge_Detection(Time,Ch1);
Period = Time(Ind1(2))-Time(Ind1(1));
Frequency = 1/(Period);

CMD_Digit = sign(Ch2(Ind1)-VT);
CMD_Digit = (CMD_Digit + 1)/2;
CMD_Digit = logical(CMD_Digit);

if (exist('Ch3','var') == 1)
  DA0_Digit = sign(Ch3(Ind1)-VT);
  DA0_Digit = (DA0_Digit + 1)/2;
  DA0_Digit = logical(DA0_Digit);
else
  DA0_Digit = ones(size(CMD_Digit));
endif  
  
if (exist('Ch4','var') == 1)
  DA3_Digit = sign(Ch4(Ind1)-VT);
  DA3_Digit = (DA3_Digit + 1)/2;
  DA3_Digit = logical(DA3_Digit);
else
  DA3_Digit = ones(size(CMD_Digit));
endif  

fid1 = fopen('Digit_Raw_1.csv','w');
fprintf(fid1,"Ind1,Time,CMD,DAT0,DAT3");
for m = 1:1:length(CMD_Digit)
  fprintf(fid1,"\n%d,%1.8f,%d,%d,%d",Ind1(m),Time(Ind1(m)),CMD_Digit(m),DA0_Digit(m),DA3_Digit(m));  
endfor
fclose(fid1);

[Ind_CMD(:,1) Ind_CMD(:,2) CRC_Rslt_CMD CRC7] = CMD_Analysis(CMD_Digit);
[Ind_DA0(:,1) Ind_DA0(:,2) CRC_Rslt_DA0 CRC_DA0] = DAT_Analysis(DA0_Digit);
[Ind_DA3(:,1) Ind_DA3(:,2) CRC_Rslt_DA3 CRC_DA3] = DAT_Analysis(DA3_Digit);
if Ind_CMD(1,1) == 0
  clear Ind_CMD;
endif  
if Ind_DA0(1,1) == 0
  clear Ind_DA0;
endif  
if Ind_DA3(1,1) == 0
  clear Ind_DA3;
endif 

elems = strsplit(iFile_1, {'_','.','\'});
oFile = char(strcat(elems(2),'.csv')); 
fid1 = fopen(oFile,'w');

fprintf(fid1,"Time,Error,CMD/Data,Response,CMD,Abbreviation,CRC,CRC Check");
for m = 1:1:17
  fprintf(fid1,",Byte%d",17-m);  
endfor

fprintf(fid1,"\n");  
fprintf(fid1,"Time,Error,CMD/Data,Response,CMD,Abbreviation,CRC,CRC Check");
for m = 1:1:6
  fprintf(fid1,",Byte%d",6-m);  
endfor

%%%%%%%%%%%%%%%%%%%% Output CMD Analysis Results %%%%%%%%%%%%%%%%%%%% 
if (exist('Ind_CMD','var') == 1)
  ACMD = 0;
  [Pkt_Num Col] = size(Ind_CMD);
  for m = 1:1:Pkt_Num
    clear Temp;
    Start = Ind_CMD(m,1);
    Stop = Ind_CMD(m,2);
    Temp = CMD_Digit(Start:Stop);
    fprintf(fid1,"\n");    
    fprintf(fid1,"%1.8f",Time(Ind1(Start)));  
    if Temp(end) == 0
      fprintf(fid1,",1");      
    else
      fprintf(fid1,",0");        
    endif
    fprintf(fid1,",CMD");    
    CMD_Index = 0;      
    CMD_Index += Temp(3)*2^5;
    CMD_Index += Temp(4)*2^4;      
    CMD_Index += Temp(5)*2^3;
    CMD_Index += Temp(6)*2^2;     
    CMD_Index += Temp(7)*2^1;
    CMD_Index += Temp(8)*2^0;     
  
    if Temp(2) == 1
      TX_CMD = CMD_Index;  
      fprintf(fid1,", ");      
      if ACMD == 1 
        fprintf(fid1,",%s",char(CMD_Label(TX_CMD+100))); 
        fprintf(fid1,",%s",char(Abbreviation(TX_CMD+100)));       
        Comment{m} = sprintf("%s %s",char(CMD_Label(TX_CMD+100)),char(Abbreviation(TX_CMD+100)));    
      else
        fprintf(fid1,",%s",char(CMD_Label(TX_CMD+1))); 
        fprintf(fid1,",%s",char(Abbreviation(TX_CMD+1)));     
        Comment{m} = sprintf("%s %s",char(CMD_Label(TX_CMD+1)),char(Abbreviation(TX_CMD+1)));          
      endif      
    else  
      if ACMD == 1
        fprintf(fid1,",%s",char(Resp(TX_CMD+100)));     
        Comment{m} = sprintf("%s Responses",char(Resp(TX_CMD+100)));       
      else
        fprintf(fid1,",%s",char(Resp(TX_CMD+1))); 
        Comment{m} = sprintf("%s Responses",char(Resp(TX_CMD+1)));       
      endif   
      fprintf(fid1,", , ");           
    endif
  
    Comment{m} = sprintf("%s (",Comment{m}); 
    fprintf(fid1,",%02X",CRC7(m));  
    fprintf(fid1,",%d",CRC_Rslt_CMD(m));   
    for n = 1:8:length(Temp)
      Bytes = 0;
      Bytes += Temp(n)*2^7;
      Bytes += Temp(n+1)*2^6;    
      Bytes += Temp(n+2)*2^5;   
      Bytes += Temp(n+3)*2^4;    
      Bytes += Temp(n+4)*2^3;   
      Bytes += Temp(n+5)*2^2;   
      Bytes += Temp(n+6)*2^1;    
      Bytes += Temp(n+7)*2^0;     
      fprintf(fid1,",%2X",Bytes);      
      Comment{m} = sprintf("%s %02X",Comment{m},Bytes); 
    endfor    
    Comment{m} = sprintf("%s )",Comment{m}); 

    if Temp(2) == 0
      if TX_CMD == 55
        ACMD = 1;
      else
        ACMD = 0;
      endif  
    endif
  
  endfor
endif
%%%%%%%%%%%%%%%%%%%% Output CMD Analysis Results %%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%% Output DATA0 Analysis Results %%%%%%%%%%%%%%%%%%%% 
if (exist('Ind_DA0','var') == 1)
  [Pkt_Num Col] = size(Ind_DA0);
  oFile2 = char(strcat(elems(2),'_DA0Bit.csv')); 
  fid2 = fopen(oFile2,'w');
  for m = 1:1:Pkt_Num  
    clear Temp;
    Start = Ind_DA0(m,1);
    Stop = Ind_DA0(m,2);
    Temp = DA0_Digit(Start:Stop);
    fprintf(fid1,"\n");    
    fprintf(fid1,"%1.8f",Time(Ind1(Start)));  
    fprintf(fid1,",");      
    fprintf(fid1,",DAT0");      
    fprintf(fid1,",,,");       
    fprintf(fid1,",%4X",CRC_DA0(m));  
    fprintf(fid1,",%d",CRC_Rslt_DA0(m));       
    
    Comment_DA0{m} = sprintf("DA0");    
    fprintf(fid2,"%1.8f\n",Time(Ind1(Start)));  
    for n = 1:8:length(Temp)
      Bytes = 0;
      Bytes += Temp(n)*2^7;
      Bytes += Temp(n+1)*2^6;    
      Bytes += Temp(n+2)*2^5;   
      Bytes += Temp(n+3)*2^4;    
      Bytes += Temp(n+4)*2^3;   
      Bytes += Temp(n+5)*2^2;   
      Bytes += Temp(n+6)*2^1;    
      Bytes += Temp(n+7)*2^0;     
      fprintf(fid1,",%2X",Bytes);      
      Comment_DA0{m} = sprintf("%s %02X",Comment_DA0{m},Bytes);
      if eMMC == 1
        fprintf(fid2,"%2X\n",Bytes);         
      else  
        fprintf(fid2,"%d\n",Temp(n));        
        fprintf(fid2,"%d\n",Temp(n+1));   
        fprintf(fid2,"%d\n",Temp(n+2));        
        fprintf(fid2,"%d\n",Temp(n+3));  
        fprintf(fid2,"%d\n",Temp(n+4));        
        fprintf(fid2,"%d\n",Temp(n+5));   
        fprintf(fid2,"%d\n",Temp(n+6));        
        fprintf(fid2,"%d\n",Temp(n+7));        
      endif
    endfor      
    
  endfor  
  fclose(fid2);
endif
%%%%%%%%%%%%%%%%%%%% Output DATA0 Analysis Results %%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%% File 2 Operation %%%%%%%%%%%%%%%%%%%% 
if (exist('iFile_2','var') == 1)
  indat2 = dlmread(iFile_2, ";");
  Start = 1;
  Stop = length(indat2);
  Time2 = indat2(Start:Stop,1);  
  Ch5 = indat2(Start:Stop,2);  
  Ch6 = indat2(Start:Stop,3);  
  Ch7 = indat2(Start:Stop,4);  
  Ch8 = indat2(Start:Stop,5);  
  [Ind__1 Ind__0] = Edge_Detection(Time2,Ch5);
  Period = Time2(Ind__1(2))-Time2(Ind__1(1));
  Frequency2 = 1/(Period);  
  
  DA1_Digit = sign(Ch6(Ind__1)-VT);
  DA1_Digit = (DA1_Digit + 1)/2;
  DA1_Digit = logical(DA1_Digit);  
  
  DA2_Digit = sign(Ch7(Ind__1)-VT);
  DA2_Digit = (DA2_Digit + 1)/2;
  DA2_Digit = logical(DA2_Digit);  
  
  DAT3_2_Digit = sign(Ch8(Ind__1)-VT);
  DAT3_2_Digit = (DAT3_2_Digit + 1)/2;
  DAT3_2_Digit = logical(DAT3_2_Digit);
  
  fid2 = fopen('Digit_Raw_2.csv','w');
  fprintf(fid2,"Ind__1,Time2,DAT1,DAT2,DAT3");
  for m = 1:1:length(DA1_Digit)
    fprintf(fid2,"\n%d,%1.8f,%d,%d,%d",Ind__1(m),Time2(Ind__1(m)),DA1_Digit(m),DA2_Digit(m),DAT3_2_Digit(m));  
  endfor
  fclose(fid2);  
  
  [Ind_DA3_2(:,1) Ind_DA3_2(:,2) CRC_Rslt_DA3_2 CRC_DA3_2] = DAT_Analysis(DAT3_2_Digit);  
  
  Wide_Bus = 0; 
  if size(Ind_DA3) != size(Ind_DA3_2)
    fprintf(1, "\n Failed to link File1 and File2\n");
  else  
    [Row Column] = size(Ind_DA3);
    for m = 1:1:Row
      Start1 = Ind_DA3(m,1);
      Stop1 = Ind_DA3(m,2);
      Start2 = Ind_DA3_2(m,1);
      Stop2 = Ind_DA3_2(m,2);    
      if DA3_Digit(Start1:Stop1) != DAT3_2_Digit(Start2:Stop2)
        fprintf(1, "\n Ind %d Failed to link\n", Ind_DA3(m,1));      
      else
        Wide_Bus = 1;         
      endif
    endfor    
  endif

  if Wide_Bus == 1
    
    oFile2 = char(strcat(elems(2),'_DataBit.csv')); 
    fid2 = fopen(oFile2,'w');
    
    [Row Column] = size(Ind_DA3);
    for m = 1:1:Row
      Start1 = Ind_DA3(m,1);
      Stop1 =  Ind_DA3(m,2)-16; % CRC = 16 bits
      Start2 = Ind_DA3_2(m,1);
      Stop2 =  Ind_DA3_2(m,2)-16; % CRC = 16 bits    
      fprintf(fid1,"\n");    
      fprintf(fid1,"%1.8f",Time(Ind1(Start)));  
      fprintf(fid1,",");      
      fprintf(fid1,",DATA");      
      fprintf(fid1,",,,");       
      fprintf(fid1,",");  
      fprintf(fid1,",");     
      
      fprintf(fid2,"%1.8f\n",Time(Ind1(Start)));  
      for n = 1:2:Stop1-Start1+1
        Byte = 0;
        Byte += DA3_Digit(n+Start1-1)*2^7;
        Byte += DA2_Digit(n+Start2-1)*2^6;    
        Byte += DA1_Digit(n+Start2-1)*2^5;    
        Byte += DA0_Digit(n+Start1-1)*2^4;    
        Byte += DA3_Digit(n+Start1)*2^3;        
        Byte += DA2_Digit(n+Start2)*2^2;    
        Byte += DA1_Digit(n+Start2)*2^1;    
        Byte += DA0_Digit(n+Start1)*2^0;            
        fprintf(fid1,",%X",Byte);        
        fprintf(fid2,"%d\n",DA3_Digit(n+Start1-1));  
        fprintf(fid2,"%d\n",DA2_Digit(n+Start2-1));  
        fprintf(fid2,"%d\n",DA1_Digit(n+Start2-1));  
        fprintf(fid2,"%d\n",DA0_Digit(n+Start1-1));  
        fprintf(fid2,"%d\n",DA3_Digit(n+Start1));  
        fprintf(fid2,"%d\n",DA2_Digit(n+Start2));  
        fprintf(fid2,"%d\n",DA1_Digit(n+Start2));  
        fprintf(fid2,"%d\n",DA0_Digit(n+Start1));         
      endfor
    endfor 
    fclose(fid2);
  endif
  
endif  
%%%%%%%%%%%%%%%%%%%% File 2 Operation %%%%%%%%%%%%%%%%%%%% 

fclose(fid1);

toc;