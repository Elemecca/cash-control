<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="con-molex-odd">
<packages>
<package name="89400-0520">
<pad name="3" x="0" y="0" drill="0.8" shape="long" rot="R90"/>
<pad name="4" x="-2" y="0" drill="0.8" shape="long" rot="R90"/>
<pad name="5" x="-4" y="0" drill="0.8" shape="long" rot="R90"/>
<pad name="2" x="2" y="0" drill="0.8" shape="long" rot="R90"/>
<pad name="1" x="4" y="0" drill="0.8" shape="long" rot="R90"/>
<wire x1="-6" y1="2.95" x2="-6" y2="-1.7" width="0.127" layer="51"/>
<wire x1="-6" y1="-1.7" x2="6" y2="-1.7" width="0.127" layer="51"/>
<wire x1="6" y1="-1.7" x2="6" y2="2.95" width="0.127" layer="51"/>
<wire x1="6" y1="2.95" x2="-6" y2="2.95" width="0.127" layer="51"/>
<wire x1="-3" y1="-1.7" x2="-6" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-6" y1="-1.7" x2="-6" y2="2.95" width="0.127" layer="21"/>
<wire x1="-6" y1="2.95" x2="6" y2="2.95" width="0.127" layer="21"/>
<wire x1="6" y1="2.95" x2="6" y2="-1.7" width="0.127" layer="21"/>
<wire x1="6" y1="-1.7" x2="3" y2="-1.7" width="0.127" layer="21"/>
<circle x="6.5" y="-1" radius="0.2" width="0.4" layer="21"/>
<text x="6.5" y="1.5" size="0.8128" layer="25" ratio="18">&gt;Name</text>
<text x="6.5" y="0.5" size="0.4064" layer="27" ratio="10">&gt;Value</text>
</package>
</packages>
<symbols>
<symbol name="89400-0520">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">3</text>
<pin name="3" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<wire x1="1.27" y1="2.54" x2="0" y2="2.54" width="0.6096" layer="94"/>
<text x="2.54" y="1.778" size="1.524" layer="95">2</text>
<pin name="2" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
<wire x1="1.27" y1="5.08" x2="0" y2="5.08" width="0.6096" layer="94"/>
<text x="2.54" y="4.318" size="1.524" layer="95">1</text>
<pin name="1" x="-2.54" y="5.08" visible="off" length="short" direction="pas"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.6096" layer="94"/>
<text x="2.54" y="-3.302" size="1.524" layer="95">4</text>
<pin name="4" x="-2.54" y="-2.54" visible="off" length="short" direction="pas"/>
<wire x1="1.27" y1="-5.08" x2="0" y2="-5.08" width="0.6096" layer="94"/>
<text x="2.54" y="-5.842" size="1.524" layer="95">5</text>
<pin name="5" x="-2.54" y="-5.08" visible="off" length="short" direction="pas"/>
<wire x1="-1.27" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="-1.27" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-7.62" x2="-1.27" y2="7.62" width="0.254" layer="94"/>
<text x="-1.27" y="8.89" size="1.778" layer="95">&gt;Name</text>
<text x="-1.27" y="-10.16" size="1.778" layer="96">&gt;Value</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="89400-0520" prefix="J" uservalue="yes">
<gates>
<gate name="G$1" symbol="89400-0520" x="0" y="0"/>
</gates>
<devices>
<device name="" package="89400-0520">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="J1" library="con-molex-odd" deviceset="89400-0520" device="" value="Display"/>
<part name="J2" library="con-molex-odd" deviceset="89400-0520" device="" value="Logic"/>
<part name="J3" library="con-molex-odd" deviceset="89400-0520" device="" value="USB"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="J1" gate="G$1" x="83.82" y="53.34"/>
<instance part="J2" gate="G$1" x="53.34" y="53.34" rot="MR0"/>
<instance part="J3" gate="G$1" x="83.82" y="30.48"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="81.28" y1="58.42" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
<label x="76.2" y="58.42" size="1.778" layer="95"/>
<label x="55.88" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="5"/>
<pinref part="J1" gate="G$1" pin="5"/>
<wire x1="55.88" y1="48.26" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<wire x1="63.5" y1="48.26" x2="81.28" y2="48.26" width="0.1524" layer="91"/>
<wire x1="63.5" y1="48.26" x2="63.5" y2="25.4" width="0.1524" layer="91"/>
<junction x="63.5" y="48.26"/>
<pinref part="J3" gate="G$1" pin="5"/>
<wire x1="63.5" y1="25.4" x2="81.28" y2="25.4" width="0.1524" layer="91"/>
<label x="76.2" y="48.26" size="1.778" layer="95"/>
<label x="55.88" y="48.26" size="1.778" layer="95"/>
<label x="76.2" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="CS" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="81.28" y1="55.88" x2="66.04" y2="55.88" width="0.1524" layer="91"/>
<wire x1="66.04" y1="55.88" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<wire x1="66.04" y1="55.88" x2="66.04" y2="35.56" width="0.1524" layer="91"/>
<junction x="66.04" y="55.88"/>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="66.04" y1="35.56" x2="81.28" y2="35.56" width="0.1524" layer="91"/>
<label x="76.2" y="55.88" size="1.778" layer="95"/>
<label x="55.88" y="55.88" size="1.778" layer="95"/>
<label x="76.2" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLK" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="3"/>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="55.88" y1="53.34" x2="68.58" y2="53.34" width="0.1524" layer="91"/>
<wire x1="68.58" y1="53.34" x2="81.28" y2="53.34" width="0.1524" layer="91"/>
<wire x1="68.58" y1="53.34" x2="68.58" y2="33.02" width="0.1524" layer="91"/>
<junction x="68.58" y="53.34"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="68.58" y1="33.02" x2="81.28" y2="33.02" width="0.1524" layer="91"/>
<label x="76.2" y="53.34" size="1.778" layer="95"/>
<label x="55.88" y="53.34" size="1.778" layer="95"/>
<label x="76.2" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="4"/>
<wire x1="55.88" y1="50.8" x2="71.12" y2="50.8" width="0.1524" layer="91"/>
<wire x1="71.12" y1="50.8" x2="71.12" y2="30.48" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="3"/>
<wire x1="71.12" y1="30.48" x2="81.28" y2="30.48" width="0.1524" layer="91"/>
<label x="55.88" y="50.8" size="1.778" layer="95"/>
<label x="76.2" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="81.28" y1="50.8" x2="73.66" y2="50.8" width="0.1524" layer="91"/>
<wire x1="73.66" y1="50.8" x2="73.66" y2="27.94" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="4"/>
<wire x1="73.66" y1="27.94" x2="81.28" y2="27.94" width="0.1524" layer="91"/>
<label x="76.2" y="50.8" size="1.778" layer="95"/>
<label x="76.2" y="27.94" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
