require "bundler/setup"
require "pry"
require "dlh"

RSpec.configure do |config|
  
end

class Helper
  VALID_DRIVERS_LICENSE_01 = "ANSI 6360100102DL00390171ZF02100065DL\nDAABAPTISTE,JEAN,EMMANUEL\nDAG520 NW 130TH ST\nDAIMIAMI\nDAJFL\nDAK33168-0000 \nDAQB132465932240DARE   DASNONEDATNONE\nDBA20220624\nDBB19930624\nDBC1\nDBD20140303DBHN\nDAU506ZFZFAREPLACED: 20170817ZFBZFCS111708170486ZFDZFE06-01-14ZFF"
  VALID_DRIVERS_LICENSE_01_v2 = "ANSI 6360050101DL00300203DL\nDAQ 287626792\nDAAWILLIAMS,SHANE,CHAD,\nDAG941 PARTRIDGE RD\nDAIORANGEBURG\nDAJSC\nDAK29118  DARD   DAS          DAT     \nDAU506\nDAW135\nDAY   DAZ   \nDBA20260517\nDBB19940517\nDBC1\nDBD20160526DBG2DBH2"
  VALID_DRIVERS_LICENSE_02 = "ANSI 6360350201DL00290176DLDAABEENE  JR,PAULDAQB50068093246DBA20190829DBB19930829DAG7309 S PAXTONDAICHICAGODAJILDAK606490000  DARDDAS********  DAT*****DBD20160325DBCMDAU511DAW160DAYBRN"
  VALID_DRIVERS_LICENSE_03 = "ANSI 636001030102DL00410258ZN02990070DL\nDCAD   \nDCBA1        \nDCDNONE  \nDBA10092018\nDCSDABO                     \nDCTSALIMOU                  \nDBD10112014\nDBB10091985\nDBC1\nDAYBRO\nDAU602   \nDAG1576 TAYLOR AVE 3F       \nDAIBRONX               \nDAJNY\nDAK104600000  \nDAQ369778100\nDCF7KME5R7U00\nDCGUSAZNZNADABOSALIMOU        ZNBTY0;8q2e=V*teg/cW^T% d9kDX?f\"H3 ;`ojWI\\"  
  VALID_DRIVERS_LICENSE_04 = "ANSI 636014040002DL00410280ZC03210033DL\nDCAC\nDCBNONE\nDCDNONE\nDBA05252018\nDCSNUBIA\nDACDARRIEAN\nDADMAURICE\nDBD03252016\nDBB05251990\nDBC1\nDAYBRN\nDAU070 IN\nDAG3758 W 118TH ST\nDAIHAWTHORNE\nDAJCA\nDAK902500000  \nDAQD8721031\nDCF03/03/201460936/BBFD/18\nDCGUSA\nDDEU\nDDFU\nDDGU\nDAW135DAZBLK\nDCK16085D87210310401DDB04162010\nDDD0"
  VALID_DRIVERS_LICENSE_05 = "ANSI 604431050001DL00310229DL\nDCA3\nDCBNONE\nDCDNONE\nDBA12242017\nDCSTALAVERA RAMOS \nDACFABIOLA\nDADNONE\nDBD03252017\nDBB07291993\nDBC2\nDAYBRO\nDAU063 in\nDAGBDA VENEZUELA 43 CALLE ACUEDUCTO, S\nDAISAN JUAN\nDAJPR\nDAK00926\nDAQ6247351\nDCF3\nDCGUSA\nDDEN\nDDFN\nDDGN\nDDAN"
  VALID_DRIVERS_LICENSE_06 = "ANSI 636055060102ID00410269ZG03100077ID\nDBA07292025\nDCSJONES\nDDEN\nDACDWIGHT\nDDFN\nDADANTHONY ZELTON\nDDGN\nDBD12012017\nDBB07291994\nDBC1\nDAYBRO\nDAU068 in\nDAG2825 ROBINSON WOOD DR\nDAIRIVERDALE\nDAJGA\nDAK302961682  \nDAQ056891746\nDCF328033860500043692\nDCGUSA\nDAW140\nDCK3280338605000401DCUIII\nDDAXDDB07012015DDK1ZGZGANZGBNZGC5-08ZGDFULTONZGENZGF32803386050ZGGZGH087ZGIZGJZGKZGL"
  VALID_DRIVERS_LICENSE_06_v2 = "ANSI 636053060002ID00410250ZT02910037ID\nDAQ121665492\nDCSJACKSON\nDDEU\nDACLORENZO\nDDFU\nDADDONTAVIUS\nDDGU\nDBD04222016\nDBB07211996\nDBA04222024\nDBC1\nDAU063 in\nDAYBRO\nDAG6846 INNSBROOK CV\nDAIMEMPHIS\nDAJTN\nDAK381155305  \nDCF3041604221444870\nDCGUSA\nDCK161130127446850501DDB12022011DDJ07212017ZTZTANZTBNZTCZTDNZTE1ZTFNZTG00"
  VALID_DRIVERS_LICENSE_08 = "ANSI 636035080002DL00410264ZI03050021DL\nDAQM46062490348\nDCSMILLER\nDDEN\nDACNIKO\nDDFN\nDADD\nDDGN\nDCAD\nDCBBF\nDCDNONE\nDBD01192018\nDBB12071990\nDBA12072021\nDBC1\nDAU071 in\nDAYBRO\nDAG2617 N HOYNE AVENUE\nDAICHICAGO\nDAJIL\nDAK606470000  \nDCF20180119303CN2284\nDCGUSA\nDAW190\nDCKM46062490348ILFLTL01DDB09172015DDK1ZIZIAORGZIBZICZID"
  VALID_DRIVERS_LICENSE_09 = "ANSI 636010090002DL00410257ZF02980064DL\nDAQM430321902210\nDCSMALLETTE\nDDEN\nDACHELTON\nDDFN\nDADARANDO\nDDGN\nDCAE\nDCBNONE\nDCDNONE\nDBD03282016\nDBB06211990\nDBA06212024\nDBC1\nDAU070 IN\nDAG21107 NW 14TH PL APT 439\nDAIMIAMI\nDAJFL\nDAK331690000  \nDCFR061710250595\nDCGUSA\nDCK0100306480017249\nDDAFDDB03162017"
end