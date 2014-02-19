/*Completeness/Missingness*/ data _null_;
proc format; value $missing_str
	' '='Missing'
	other='Not missing';
run;

proc format; value missing_num
	.='Missing'
	other='Not missing';
run;

/*Demographic*/ data _null_;
proc format; value $bth_sex
	'F'='Female'
	'M'='Male'
	'T'='Total' /*this last value for the denominator dataset*/;
run;

proc format; value $birth_sex
	'F'='Female'
	'M'='Male'
	'T'='Total' /*this last value for the denominator dataset*/;
run;

proc format; value $current_gender
	'F'='Female'
	'FM'='Female to Male'
	'M'='Male'
	'MF'='Male to Female';
run;

proc format; value $race
	'1'='Hispanic, All races'
	'2'='Not Hispanic, Amer Indian/Alaska Nat'
	'3'='Not Hispanic, Asian'
	'4'='Not Hispanic, Black'
	'5'='Not Hispanic, Nat Hawaiian/Pac Isl'
	'6'='Not Hispanic, White'
	'7'='Not Hispanic, Legacy Asian/Pac Isl'
	'8'='Not Hispanic, Multi-race'
	'9'='Unknown';
run;

proc format; value $race1F
	'R1'='American Indian/Alaska Native'
	'R2'='Asian'
	'R3'='Black/African American'
	'R4'='Native Hawaiian/Pacific Islander'
	'R5'='White'
	'UNK'='Unknown';
run;

proc format; value $race2F
	'R1'='American Indian/Alaska Native'
	'R2'='Asian'
	'R3'='Black/African American'
	'R4'='Native Hawaiian/Pacific Islander'
	'R5'='White';
run;

proc format; value $ethnicity1F
	'E1'='Hispanic/Latino'
	'E2'='Not HIspanic/Latino'
	'UNK'='Unknown'
	'UN'='Unknown';
run;

proc format; value $race_eth1Fl
	"E1"="Latino"
	"R5"="White"
	"R3"="AfrAmer"
	"R1"="American Indian or Alaska Native"
	"R2"="Asian"
	"R4"="Native Hawaiian or Other Pacific Islander"
	"O"="Some other race"
	"M"="Two or more races"
	"UNK"="Unkown"
	" "="Unknown"
	"T"="Total" /*this last value for the denominator dataset*/;

proc format; value $race_eth2Fs /*To collapse categories (Asian + PI-->API, AI/AA + Other + Multi + UNK-->Other/Unknown*/
    'E1'='E1'
	'R5'='R5'
    'R3'='R3'
    'R2'='R2'
	'R4'='R2'
    'R1'='O'
	'O'='O'
	'M'='O'
	' '='O'
	'T'='T' /*this last value for the denominator dataset*/;


	proc format; value $race_eth2Fl /*to display collapsed categories of race*/
	    'E1'='Hispanic/Latino'
		'R5'='White'
	    'R3'='African American'
	    'R2'='API'
		'R4'='API'
	    'R1'='Other/Unknown'
		'O'='Other/Unknown'
		'M'='Other/Unknown'
		' '='Other/Unknown'
		'T'='Total' /*this last value for the denominator dataset*/;

proc format; value $race_eth2_order_Fs /*to order categories of race as desired*/
	'T'='1'
    'R3'='2'
    'R2'='3'
	'E1'='4'
	'R5'='5'
	'O'='6';

	proc format; value $race_eth2_order_Fl /*to display ordered categories of race*/
		'1'='Total'
		'2'='African American'
	    '3'='API'
	    '4'='Hispanic/Latino'
		'5'='White'
		'6'='Other/Unk';

proc format; value agegrp1Fs
	low-4='G1'
	5-12='G2'
	13-19='G3'
	20-24='G4'
	25-29='G5'
	30-39='G6'
	40-49='G7'
	50-120='G8'
	999='T' /*this last value for the denominator dataset*/
	other=' ';

		proc format; value $agegrp1Fl
			'G1'='0-4'
			'G2'='5-12'
			'G3'='13-19'
			'G4'='20-24'
			'G5'='25-29'
			'G6'='30-39'
			'G7'='40-49'
			'G8'='50 and over'
			'T'='Total' /*this last value for the denominator dataset*/;

proc format; value agegrp2Fs
    low-12='G1'
    13-19='G2'
    20-29='G3'
    30-39='G4'
    40-49='G5'
    50-59='G6'
    60-120='G7'
	999='T' /*this last value for the denominator dataset*/
	other=' ';

		proc format; value $agegrp2Fl
		    'G1'='0-12'
		    'G2'='13-19'
		    'G3'='20-29'
		    'G4'='30-39'
		    'G5'='40-49'
		    'G6'='50-59'
		    'G7'='60 & over'
			'T'='Total' /*this last value for the denominator dataset*/;

proc format; value $NewCityFs
	"BERKELEY"="01"
	"ALBANY"="02"
	"ALAMEDA"="03"
	"CASTRO VALLEY"="04"
	"DUBLIN"="05"
	"EMERYVILLE"="06"
	"FREMONT"="07"
	"HAYWARD"="08"
	"LIVERMORE"="09"
	"NEWARK"="10"
	"OAKLAND"="11"
	"PIEDMONT"="12"
	"PLEASANTON"="13"
	"SAN LEANDRO"="14"
	"SAN LORENZO"="15"
	"SUNOL"="16"
	"UNION CITY"="17"
	"ASHLAND"="18"
	"CHERRYLAND"="19"
	"FAIRVIEW"="20"
	"REMAINDER OF COUNTY"="22"
	" "="99" /*Missing*/
	other="21"; /*OUT OF COUNTY*/

		proc format; value $NewCityFl
			"00"="ALAMEDA COUNTY"
			"01"="BERKELEY"
			"02"="ALBANY"
			"03"="ALAMEDA"
			"04"="CASTRO VALLEY"
			"05"="DUBLIN"
			"06"="EMERYVILLE"
			"07"="FREMONT"
			"08"="HAYWARD"
			"09"="LIVERMORE"
			"10"="NEWARK"
			"11"="OAKLAND"
			"12"="PIEDMONT"
			"13"="PLEASANTON"
			"14"="SAN LEANDRO"
			"15"="SAN LORENZO"
			"16"="SUNOL"
			"17"="UNION CITY"
			"18"="ASHLAND"
			"19"="CHERRYLAND"
			"20"="FAIRVIEW"
			"21"="OUT OF COUNTY"
			"22"="REMAINDER OF COUNTY"
			"23"="NORTH COUNTY"
			"24"="OAKLAND AREA"
			"25"="CENTRAL COUNTY"
			"26"="SOUTH COUNTY"
			"27"="TRI-VALLEY"
			"99"="MISSING";

		proc format; value $City_to_region
			'22'='22'	/*REMAINDER OF COUNTY*/
			'01'='23'	/*BERKELEY*/
			'02'='23'	/*ALBANY*/
			'03'='24'	/*ALAMEDA*/
			'06'='24'	/*EMERYVILLE*/
			'11'='24'	/*OAKLAND*/
			'12'='24'	/*PIEDMONT*/
			'04'='25'	/*CASTRO VALLEY*/
			'08'='25'	/*HAYWARD*/
			'14'='25'	/*SAN LEANDRO*/
			'15'='25'	/*SAN LORENZO*/
			'18'='25'	/*ASHLAND*/
			'19'='25'	/*CHERRYLAND*/
			'20'='25'	/*FAIRVIEW*/
			'07'='26'	/*FREMONT*/
			'10'='26'	/*NEWARK*/
			'16'='26'	/*SUNOL*/
			'17'='26'	/*UNION CITY*/
			'05'='27'	/*DUBLIN*/
			'09'='27'	/*LIVERMORE*/
			'13'='27'	/*PLEASANTON*/;

/*11/05/2013 - HISTORICAL FORMAT USED FOR THE REGION VARIABLES;
			NOTE LONGER NEEDED AS AS THE $NewCityFl VARIABLES ABOVE
			NOW DECODES BOTH CITY AND REGION VARIABLES (IT WAS NECESSARY
			TO CREATE A SINGLE VARIABLE TO DO THIS AS BOTH CITY AND 
			REGION NAMES ARE VALID VALUES OF THE GEO VARIABLE IN THE 
			DENOMINATOR DATASET*/
/*proc format; value $RegionFl*/
/*	"21"="Out of County"*/
/*	'23'='North County'*/
/*	'24'='Oakland Area'*/
/*	'25'='Central County'*/
/*	'26'='South County'*/
/*	'27'='Tri-Valley';*/

proc format;
	value $addr_flagFl
		'01'='No address data'
		'02'='Out of county'
		'03'='Missing or unknown street address'
		'04'='Indeterminate street address (missing zip, city, and county)'
		'05'='Homeless'
		'06'='PO BOX'
		'07'='Potentially geocodable address potentially in Alameda County';
run;

/*Clinical*/ data _null_;
proc format; value $aids_categ
	'7'='AIDS case defined by immunologic test'
	'9'='Not an AIDS case'
	'A'='AIDS case defined by clinical disease';
run;

proc format; value $hiv_categ
	'1'='HIV positive, definitive'
	'2'='HIV positive, presumptive'
	'3'='HIV indeterminate'
	'5'='HIV negative, presumptive'
	'8'='Pending confirmation'
	'9'='Unknown';
run;

proc format; value $dx_status
	'1'='Adult HIV'
	'2'='Adult AIDS'
	'3'='Perinatal HIV exposure'
	'4'='Pediatric HIV'
	'5'='Pediatric AIDS'
	'9'='Unknown';
run;

proc format; value $dx_status_entered
	'1'='Adult HIV'
	'2'='Adult AIDS'
	'3'='Perinatal HIV exposure'
	'4'='Pediatric HIV'
	'5'='Pediatric AIDS';
run;

proc format; value $trans_categ
	'01'='Adult male sexual cntct male (MSM)'
	'02'='Adult injection drug use (IDU)'
	'03'='Adult MSM & IDU'
	'04'='Adult rcvd clotting factor'
	'05'='Adult heterosexual contact'
	'06'='Adult rcvd transfusion/transplant'
	'09'='Adult no identified risk factor (NIR)'
	'10'='Adult no risk factor reported (NRR)'
	'11'='Child rcvd clotting factor'
	'12'='Perinatal exposure'
	'13'='Child rcvd transfusion/transplant'
	'19'='Child no identified risk factor (NIR)'
	'20'='Child no risk factor reported (NRR)';
run;

proc format; value $trans_categ2Fs
	'01'='01'
	'02'='02'
	'03'='03'
	'04'='99'
	'05'='05'
	'06'='99'
	'09'='99'
	'10'='99'
	'11'='99'
	'12'='99'
	'13'='99'
	'19'='99'
	'20'='99';
run;

		proc format; value $trans_categ2Fl
			'01'='MSM'
			'02'='IDU'
			'03'='MSM & IDU'
			'05'='Hetero contact'
			'99'='Unknown';
		run;

proc format; value $transx_categ
	'01'='Adult male sexual cntct male (MSM)'
	'02'='Adult injection drug use (IDU)'
	'03'='Adult MSM & IDU'
	'04'='Adult rcvd clotting factor'
	'05'='Adult het cntct-IDU'
	'06'='Adult het cntct-MSM'
	'07'='Adult het cntct-person w/hemophilia'
	'10'='Adult het cntct-transf/transp, HIV+'
	'11'='Adult het cntct-person w/HIV'
	'13'='Adult rcvd transfusion/transplant'
	'14'='Adult undetermined transmission cat'
	'15'='Child rcvd clotting factor'
	'16'='Mother IDU'
	'17'='Mother het cntct-IDU'
	'23'='Mother het cntct-male w/HIV'
	'25'='Mother HIV+'
	'26'='Child rcvd transfusion/transplant'
	'27'='Child undetermined transmission cat';
run;

proc format; value vlF
	0-<75.5="Suppressed Undetectable (<=75)"
	75.5-<200.5="Suppressed Detectable (76-200)"
	200.5-high="Not Suppressed (>200)"
	.="VL result missing";
run;

proc format; value vl2F
	0-<75.5="Suppressed Undetectable (<75)"
	75.5-<200.5="Suppressed Detectable"
	200.5-100000="Not Suppressed"
	100001-high="High VL (>100,000)"
	.="Missing";
run;

proc format; value $vital_status
	'1'='Alive'
	'2'='Dead'
	'9'='Unknown';
run;

/*Miscellaneous*/ data _null_;
proc format; value $status_flag
	'A'='Active'
	'D'='Deleted'
	'E'='Error'
	'P'='Purged'
	'R'='Required field missing'
	'W'='Warning';
run;

proc format; value $birth_country_cd
	"050"="Baker Island"
	"074"="Swan Island"
	"075"="Pacific Trust Territories"
	"100"="Howland Island"
	"150"="Jarvis Island"
	"200"="Johnston Atoll"
	"250"="Kingman Reef"
	"300"="Midway Islands"
	"334"="Europa Island"
	"350"="Navassa Islands"
	"400"="Palmyra Atoll"
	"450"="Wake Island"
	"763"="St. Christopher"
	"832"="Spanish North Africa"
	"889"="Tromelin Island"
	"ABW"="Aruba"
	"AFG"="Afghanistan"
	"AGO"="Angola"
	"AIA"="Anguilla"
	"ALB"="Albania"
	"AND"="Andorra"
	"ANT"="Netherlands Antilles"
	"ARE"="United Arab Emirates"
	"ARG"="Argentina"
	"ARM"="Armenia"
	"ASM"="American Samoa"
	"ATA"="Antarctica"
	"ATG"="Antigua and Barbuda"
	"AUS"="Australia"
	"AUT"="Austria"
	"AZE"="Azerbaijan"
	"BDI"="Burundi"
	"BEL"="Belgium"
	"BEN"="Benin"
	"BFA"="Burkina Faso"
	"BGD"="Bangladesh"
	"BGR"="Bulgaria"
	"BHR"="Bahrain"
	"BHS"="Bahamas"
	"BIH"="Bosnia and Herzegovina"
	"BLR"="Belarus"
	"BLZ"="Belize"
	"BMU"="Bermuda"
	"BOL"="Bolivia"
	"BRA"="Brazil"
	"BRB"="Barbados"
	"BRN"="Brunei Darussalam"
	"BTN"="Bhutan"
	"BVT"="Bouvet Island"
	"BWA"="Botswana"
	"CAF"="Central African Republic"
	"CAN"="Canada"
	"CHE"="Switzerland"
	"CHL"="Chile"
	"CHN"="China"
	"CIV"="Cote d'Ivoire (Ivory Coast)"
	"CMR"="Cameroon"
	"COD"="Congo, the Democratic Republic of the (Zaire)"
	"COG"="Congo"
	"COK"="Cook Islands"
	"COL"="Colombia"
	"COM"="Comoros"
	"CPV"="Cape Verde"
	"CRI"="Costa Rica"
	"CUB"="Cuba"
	"CYM"="Cayman Islands"
	"CYP"="Cyprus"
	"CZE"="Czech Republic"
	"DEU"="Germany"
	"DJI"="Djibouti"
	"DMA"="Dominica"
	"DNK"="Denmark"
	"DOM"="Dominican Republic"
	"DZA"="Algeria"
	"ECU"="Ecuador"
	"EGY"="Egypt"
	"ERI"="Eritrea"
	"ESH"="Western Sahara"
	"ESP"="Spain"
	"EST"="Estonia"
	"ETH"="Ethiopia"
	"FIN"="Finland"
	"FJI"="Fiji"
	"FLK"="Falkland Islands (Malvinas)"
	"FRA"="France"
	"FRO"="Faroe Islands"
	"FSM"="Micronesia, Federated States of"
	"GAB"="Gabon"
	"GBR"="United Kingdom"
	"GEO"="Georgia"
	"GHA"="Ghana"
	"GIB"="Gibraltar"
	"GIN"="Guinea"
	"GLP"="Guadeloupe"
	"GMB"="Gambia"
	"GNB"="Guinea-Bissau"
	"GNQ"="Equatorial Guinea"
	"GRC"="Greece"
	"GRD"="Grenada"
	"GRL"="Greenland"
	"GTM"="Guatemala"
	"GUF"="French Guiana"
	"GUM"="Guam"
	"GUY"="Guyana"
	"HKG"="Hong Kong"
	"HMD"="Heard Island and McDonald Islands"
	"HND"="Honduras"
	"HRV"="Croatia"
	"HTI"="Haiti"
	"HUN"="Hungary"
	"IDN"="Indonesia"
	"IND"="India"
	"IOT"="Britain Indian Ocean Territory"
	"IRL"="Ireland"
	"IRN"="Iran, Islamic Republic of"
	"IRQ"="Iraq"
	"ISL"="Iceland"
	"ISR"="Israel"
	"ITA"="Italy"
	"JAM"="Jamaica"
	"JOR"="Jordan"
	"JPN"="Japan"
	"KAZ"="Kazakhstan"
	"KEN"="Kenya"
	"KGZ"="Kyrgyzstan"
	"KHM"="Cambodia"
	"KIR"="Kiribati"
	"KNA"="Saint Kitts and Nevis"
	"KOR"="Korea, Republic of (South)"
	"KWT"="Kuwait"
	"LAO"="Lao People's Democratic Republic"
	"LBN"="Lebanon"
	"LBR"="Liberia"
	"LBY"="Libyan Arab Jamahiriya"
	"LCA"="Saint Lucia"
	"LIE"="Liechtenstein"
	"LKA"="Sri Lanka"
	"LSO"="Lesotho"
	"LTU"="Lithuania"
	"LUX"="Luxembourg"
	"LVA"="Latvia"
	"MAC"="Macao"
	"MAR"="Morocco"
	"MCO"="Monaco"
	"MDA"="Moldova, Republic of"
	"MDG"="Madagascar"
	"MDV"="Maldives"
	"MEX"="Mexico"
	"MHL"="Marshall Islands"
	"MKD"="Macedonia, the Former Yugoslav Republic of"
	"MLI"="Mali"
	"MLT"="Malta"
	"MMR"="Myanmar (Burma)"
	"MNG"="Mongolia"
	"MNP"="Northern Mariana Islands"
	"MOZ"="Mozambique"
	"MRT"="Mauritania"
	"MSR"="Montserrat"
	"MTQ"="Martinique"
	"MUS"="Mauritius"
	"MWI"="Malawi"
	"MYS"="Malaysia"
	"MYT"="Mayotte"
	"NAM"="Namibia"
	"NCL"="New Caledonia"
	"NER"="Niger"
	"NFK"="Norfolk Island"
	"NGA"="Nigeria"
	"NIC"="Nicaragua"
	"NIU"="Niue"
	"NLD"="Netherlands"
	"NOR"="Norway"
	"NPL"="Nepal"
	"NRU"="Nauru"
	"NZL"="New Zealand"
	"OMN"="Oman"
	"PAK"="Pakistan"
	"PAN"="Panama"
	"PCN"="Pitcairn"
	"PER"="Peru"
	"PHL"="Philippines"
	"PLW"="Palau"
	"PNG"="Papua New Guinea"
	"POL"="Poland"
	"PRI"="Puerto Rico"
	"PRK"="Korea, Democratic People's Republic of (North)"
	"PRT"="Portugal"
	"PRY"="Paraguay"
	"PSE"="Palestinian Territory, Occupied"
	"PYF"="French Polynesia"
	"QAT"="Quatar"
	"REU"="Reunion"
	"ROU"="Romania"
	"RUS"="Russian Federation"
	"RWA"="Rwanda"
	"SAU"="Saudi Arabia"
	"SDN"="Sudan"
	"SEN"="Senegal"
	"SGP"="Singapore"
	"SHN"="Saint Helena"
	"SJM"="Svalbard and Jan Mayen"
	"SLB"="Solomon Islands"
	"SLE"="Sierra Leone"
	"SLV"="El Salvador"
	"SMR"="San Marino"
	"SOM"="Somalia"
	"SPM"="Saint Pierre and Miquelon"
	"STP"="Sao Tome and Principe"
	"SUR"="Suriname"
	"SVK"="Slovakia"
	"SVN"="Slovenia"
	"SWE"="Sweden"
	"SWZ"="Swaziland"
	"SYC"="Seychelles"
	"SYR"="Syrian Arab Republic"
	"TCA"="Turks and Caicos Islands"
	"TCD"="Chad"
	"TGO"="Togo"
	"THA"="Thailand"
	"TJK"="Tajikistan"
	"TKL"="Tokelau"
	"TKM"="Turkmenistan"
	"TLS"="Timor Leste"
	"TON"="Tonga"
	"TTO"="Trinidad and Tobago"
	"TUN"="Tunisia"
	"TUR"="Turkey"
	"TUV"="Tuvalu"
	"TWN"="Taiwan, Province of China"
	"TZA"="Tanzania, United Republic of"
	"UGA"="Uganda"
	"UKR"="Ukraine"
	"UMI"="U.S. Minor Outlying Areas"
	"URY"="Uruguay"
	"USA"="United States"
	"UZB"="Uzbekistan"
	"VAT"="Holy See (Vatican City State)"
	"VCT"="Saint Vincent and the Grenadines"
	"VEN"="Venezuela"
	"VGB"="Virgin Islands, British"
	"VIR"="Virgin Islands, U.S."
	"VNM"="Viet Nam"
	"VUT"="Vanuatu"
	"WLF"="Wallis and Futuna"
	"WSM"="Samoa"
	"X98"="Country Other"
	"X99"="Not Specified/Unknown"
	"XX1"="U.S. Misc Carribbean"
	"XX2"="U.S. Misc Pacific #1"
	"YEM"="Yemen"
	"YUG"="Yugoslavia"
	"ZAF"="South Africa"
	"ZMB"="Zambia"
	"ZWE"="Zimbabwe";
run;