///////////////////////////////////////////////////////////////////////////////
// NFG / 11th ABN Milsim Starter Files
///////////////////////////////////////////////////////////////////////////////
/* This is a custom diary.sqf file and is the basic file for some
	of the commonly used scrips and commands needed for mission templates.
- http://nfggaming.us/ */

///////////////////////////////////////////////////////////////////////////////
// Start of Custom Diary File.
///////////////////////////////////////////////////////////////////////////////

if (!hasInterface) exitWith {};
waitUntil {!isNull player};

/*
modifiers, links, and font options
<marker name='marker_name'>text with link</marker>
<img image='Image file name jpeg or paa' />
<font color='#FF0000' size='14' face='vbs2_digital'>Text you want in this font</font>
<br/> New Line

https://www.w3schools.com/colors/colors_picker.asp

https://community.bistudio.com/wikidata/images/archive/0/0e/20140217182059%21Arma3Fonts.png
*/

///////////////////////////////////////////////////////////////////////////////
// Additional Intel
///////////////////////////////////////////////////////////////////////////////

/*player createDiaryRecord ["Diary",["Additional Intel",
""]];
*/

///////////////////////////////////////////////////////////////////////////////
// Rules Of Engagement
///////////////////////////////////////////////////////////////////////////////

player createDiaryRecord ["Diary",["Rules Of Engagement",
""]];

///////////////////////////////////////////////////////////////////////////////
// Communication
///////////////////////////////////////////////////////////////////////////////

player createDiaryRecord ["Diary",["Communication",
"<font color='#FF0000' size=14 face='vbs2_digital'>AN/PRC148 Short Range</font>
<br/>
CMDGRP        -       Command Group<br/>
ALPHCO        -       Alpha Company<br/>
ASECACO       -       Alpha Section Alpha Company<br/>
BSECACO       -       Bravo Section Alpha Company<br/>
CASFW         -       CAS Fixed Wing<br/>
CASROTARY     -       CAS Helicopters<br/>
AIROPS        -       Air OPS<br/>
FIRES         -       Fires NET<br/>
LOGISTICS     -       Logistics (Supply Drops)<br/>
SUPPORT       -       Support<br/>
<br/>
<font color='#FF0000' size=14 face='vbs2_digital'>AN/PRC117F Long Range</font>
<br/>
CMDGRP        -       Command Group<br/>
ALPHCO        -       Alpha Company<br/>
ASECACO       -       Alpha Section Alpha Company<br/>
BSECACO       -       Bravo Section Alpha Company<br/>
CASFW         -       CAS Fixed Wing<br/>
CASROTARY     -       CAS Helicopters<br/>
AIROPS        -       Air OPS<br/>
FIRES         -       Fires NET<br/>
LOGISTICS     -       Logistics (Supply Drops)<br/>
SUPPORT       -       Support<br/>
<br/><br/>"]];

///////////////////////////////////////////////////////////////////////////////
// Signals Section
///////////////////////////////////////////////////////////////////////////////

player createDiaryRecord ["Diary",["Signals",
"<font size=28>Radio Singals</font><br/>
<font color='#FFFFFF' size=18>INDEX</font> - End of Mission.<br/>
Others to be determined.<br/><br/>
<font size=28>Smoke Colors Refrence</font><br/>
<font color='#00FF00' size=18>Green</font> and <font color='#0000FF' size=18>Blue</font> marks friendly units.<br/>
<font color='#FF0000' size=18>Red</font> marks enemy positions.<br/>
<font color='#FFFFFF' size=18>White</font> and <font color='#FFFF00' size=18>Yellow</font> should be used for concealment."]];

///////////////////////////////////////////////////////////////////////////////
// Objectives
///////////////////////////////////////////////////////////////////////////////

/*player createDiaryRecord ["Diary",["Objectives",
""]];

///////////////////////////////////////////////////////////////////////////////
// Current Situation
///////////////////////////////////////////////////////////////////////////////

//player createDiaryRecord ["Diary",["Current Situation",
""]];

///////////////////////////////////////////////////////////////////////////////
// Background
///////////////////////////////////////////////////////////////////////////////

//player createDiaryRecord ["Diary",["Background",
""]];

///////////////////////////////////////////////////////////////////////////////
// Mission Info
///////////////////////////////////////////////////////////////////////////////

//player createDiaryRecord ["Diary",["Mission Info",
""]];

///////////////////////////////////////////////////////////////////////////////
// Help Section
///////////////////////////////////////////////////////////////////////////////

//player createDiaryRecord ["Diary",["Help Section",
""]];

*/
