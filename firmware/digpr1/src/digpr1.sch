<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="P0" />
        <signal name="XLXN_18" />
        <signal name="D2" />
        <signal name="P1" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="P3" />
        <signal name="D3" />
        <signal name="DCE" />
        <signal name="RST" />
        <signal name="CLK1" />
        <signal name="XLXN_58" />
        <signal name="DIN(3:0)" />
        <signal name="DIN(0)" />
        <signal name="DIN(1)" />
        <signal name="DIN(2)" />
        <signal name="DIN(3)" />
        <signal name="GPIO22" />
        <signal name="Yout(7:0)" />
        <signal name="Yout(3)" />
        <signal name="Yout(1)" />
        <signal name="Yout(0)" />
        <signal name="Yout(2)" />
        <signal name="XLXN_240" />
        <signal name="XLXN_241" />
        <signal name="XLXN_242" />
        <signal name="CLK3" />
        <signal name="DSEL" />
        <signal name="P4" />
        <signal name="P5" />
        <signal name="XLXN_299" />
        <signal name="XLXN_300" />
        <signal name="XLXN_301" />
        <signal name="XLXN_302" />
        <signal name="Yout(7)" />
        <signal name="Yout(6)" />
        <signal name="Yout(5)" />
        <signal name="Yout(4)" />
        <signal name="Yout(7:4)" />
        <signal name="P2" />
        <signal name="XLXN_303" />
        <signal name="XLXN_306" />
        <signal name="XLXN_309" />
        <port polarity="Output" name="P0" />
        <port polarity="Input" name="D2" />
        <port polarity="Output" name="P1" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D1" />
        <port polarity="Output" name="P3" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="DCE" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="CLK1" />
        <port polarity="Input" name="GPIO22" />
        <port polarity="Output" name="Yout(7:0)" />
        <port polarity="Input" name="CLK3" />
        <port polarity="Input" name="DSEL" />
        <port polarity="Output" name="P4" />
        <port polarity="Output" name="P5" />
        <port polarity="Output" name="P2" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="nor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="mux4_2">
            <timestamp>2018-9-25T14:31:14</timestamp>
            <rect width="256" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-384" y2="-384" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-64" y2="-64" x1="320" />
        </blockdef>
        <blockdef name="LUT4_4">
            <timestamp>2018-9-7T9:57:31</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="counter4">
            <timestamp>2018-9-25T15:19:4</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-336" y2="-336" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-48" y2="-48" x1="320" />
        </blockdef>
        <blockdef name="fdce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="cb4cle">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
        </blockdef>
        <blockdef name="fd4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="fdc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
        </blockdef>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D0" name="I1" />
            <blockpin signalname="P0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D0" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_13">
            <blockpin signalname="D2" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="P1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_17">
            <blockpin signalname="P2" name="I" />
            <blockpin signalname="XLXN_309" name="O" />
        </block>
        <block symbolname="mux4_2" name="XLXI_24">
            <blockpin signalname="XLXN_58" name="A0" />
            <blockpin signalname="GPIO22" name="SEL0" />
            <blockpin signalname="XLXN_302" name="B3" />
            <blockpin signalname="Yout(0)" name="Y0" />
            <blockpin signalname="Yout(1)" name="Y1" />
            <blockpin signalname="Yout(2)" name="Y2" />
            <blockpin signalname="Yout(3)" name="Y3" />
            <blockpin signalname="XLXN_242" name="A1" />
            <blockpin signalname="XLXN_241" name="A2" />
            <blockpin signalname="XLXN_299" name="B0" />
            <blockpin signalname="XLXN_240" name="A3" />
            <blockpin signalname="XLXN_301" name="B2" />
            <blockpin signalname="XLXN_300" name="B1" />
        </block>
        <block symbolname="LUT4_4" name="XLXI_28">
            <blockpin signalname="Yout(7:4)" name="LIN(3:0)" />
            <blockpin signalname="DIN(3:0)" name="DOUT(3:0)" />
        </block>
        <block symbolname="fdce" name="XLXI_32">
            <blockpin signalname="CLK3" name="C" />
            <blockpin signalname="DCE" name="CE" />
            <blockpin signalname="RST" name="CLR" />
            <blockpin signalname="D3" name="D" />
            <blockpin signalname="P3" name="Q" />
        </block>
        <block symbolname="counter4" name="XLXI_31">
            <blockpin signalname="XLXN_242" name="Q1" />
            <blockpin signalname="XLXN_240" name="Q3" />
            <blockpin signalname="RST" name="RST" />
            <blockpin signalname="CLK1" name="clk" />
            <blockpin signalname="DCE" name="CE" />
            <blockpin signalname="D0" name="D0" />
            <blockpin signalname="D1" name="D1" />
            <blockpin signalname="D3" name="D3" />
            <blockpin signalname="D2" name="D2" />
            <blockpin signalname="DSEL" name="SEL" />
            <blockpin signalname="XLXN_241" name="Q2" />
            <blockpin signalname="XLXN_58" name="Q0" />
        </block>
        <block symbolname="cb4cle" name="XLXI_42">
            <blockpin signalname="CLK1" name="C" />
            <blockpin signalname="DCE" name="CE" />
            <blockpin signalname="RST" name="CLR" />
            <blockpin signalname="D0" name="D0" />
            <blockpin signalname="D1" name="D1" />
            <blockpin signalname="D2" name="D2" />
            <blockpin signalname="D3" name="D3" />
            <blockpin signalname="DSEL" name="L" />
            <blockpin signalname="P4" name="CEO" />
            <blockpin signalname="XLXN_299" name="Q0" />
            <blockpin signalname="XLXN_300" name="Q1" />
            <blockpin signalname="XLXN_301" name="Q2" />
            <blockpin signalname="XLXN_302" name="Q3" />
            <blockpin signalname="P5" name="TC" />
        </block>
        <block symbolname="fd4ce" name="XLXI_43">
            <blockpin signalname="CLK1" name="C" />
            <blockpin signalname="DCE" name="CE" />
            <blockpin signalname="RST" name="CLR" />
            <blockpin signalname="DIN(0)" name="D0" />
            <blockpin signalname="DIN(1)" name="D1" />
            <blockpin signalname="DIN(2)" name="D2" />
            <blockpin signalname="DIN(3)" name="D3" />
            <blockpin signalname="Yout(4)" name="Q0" />
            <blockpin signalname="Yout(5)" name="Q1" />
            <blockpin signalname="Yout(6)" name="Q2" />
            <blockpin signalname="Yout(7)" name="Q3" />
        </block>
        <block symbolname="fdc" name="XLXI_45">
            <blockpin signalname="CLK3" name="C" />
            <blockpin signalname="RST" name="CLR" />
            <blockpin signalname="XLXN_309" name="D" />
            <blockpin signalname="P2" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="P0">
            <wire x2="832" y1="240" y2="240" x1="704" />
        </branch>
        <instance x="448" y="336" name="XLXI_11" orien="R0" />
        <instance x="448" y="608" name="XLXI_12" orien="R0" />
        <branch name="XLXN_18">
            <wire x2="736" y1="512" y2="512" x1="704" />
        </branch>
        <instance x="736" y="640" name="XLXI_13" orien="R0" />
        <branch name="P1">
            <wire x2="1024" y1="544" y2="544" x1="992" />
        </branch>
        <iomarker fontsize="28" x="272" y="592" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1024" y="544" name="P1" orien="R0" />
        <iomarker fontsize="28" x="224" y="272" name="D1" orien="R180" />
        <iomarker fontsize="28" x="224" y="208" name="D0" orien="R180" />
        <branch name="P3">
            <wire x2="2720" y1="832" y2="832" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2720" y="832" name="P3" orien="R0" />
        <rect width="1236" x="88" y="104" height="256" />
        <text style="fontsize:40;fontname:Arial" x="964" y="220">2A</text>
        <text style="fontsize:40;fontname:Arial" x="2828" y="964">3A</text>
        <text style="fontsize:40;fontname:Arial" x="2820" y="256">3B</text>
        <rect width="1224" x="92" y="412" height="512" />
        <rect width="1096" x="1928" y="56" height="564" />
        <rect width="1104" x="1928" y="640" height="488" />
        <iomarker fontsize="28" x="832" y="240" name="P0" orien="R0" />
        <iomarker fontsize="28" x="192" y="2496" name="CLK1" orien="R180" />
        <branch name="DIN(3:0)">
            <wire x2="576" y1="1760" y2="1760" x1="528" />
            <wire x2="576" y1="1760" y2="1792" x1="576" />
            <wire x2="576" y1="1792" y2="1856" x1="576" />
            <wire x2="576" y1="1856" y2="1872" x1="576" />
            <wire x2="576" y1="1632" y2="1664" x1="576" />
            <wire x2="576" y1="1664" y2="1728" x1="576" />
            <wire x2="576" y1="1728" y2="1760" x1="576" />
        </branch>
        <bustap x2="672" y1="1664" y2="1664" x1="576" />
        <branch name="DIN(0)">
            <wire x2="720" y1="1664" y2="1664" x1="672" />
        </branch>
        <bustap x2="672" y1="1728" y2="1728" x1="576" />
        <branch name="DIN(1)">
            <wire x2="720" y1="1728" y2="1728" x1="672" />
        </branch>
        <bustap x2="672" y1="1792" y2="1792" x1="576" />
        <branch name="DIN(2)">
            <wire x2="720" y1="1792" y2="1792" x1="672" />
        </branch>
        <bustap x2="672" y1="1856" y2="1856" x1="576" />
        <branch name="DIN(3)">
            <wire x2="720" y1="1856" y2="1856" x1="672" />
        </branch>
        <rect width="1408" x="28" y="1064" height="1044" />
        <text style="fontsize:36;fontname:Arial" x="300" y="1172">5</text>
        <branch name="GPIO22">
            <wire x2="2624" y1="1984" y2="1984" x1="2576" />
        </branch>
        <text style="fontsize:40;fontname:Arial" x="2896" y="2416">4</text>
        <instance x="2624" y="2272" name="XLXI_24" orien="R0">
        </instance>
        <branch name="Yout(7:0)">
            <wire x2="3280" y1="1648" y2="1648" x1="3152" />
            <wire x2="3152" y1="1648" y2="1728" x1="3152" />
            <wire x2="3152" y1="1728" y2="1888" x1="3152" />
            <wire x2="3152" y1="1888" y2="2048" x1="3152" />
            <wire x2="3152" y1="2048" y2="2208" x1="3152" />
            <wire x2="3152" y1="2208" y2="2224" x1="3152" />
        </branch>
        <bustap x2="3056" y1="1728" y2="1728" x1="3152" />
        <branch name="Yout(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3024" y="1728" type="branch" />
            <wire x2="3024" y1="1728" y2="1728" x1="3008" />
            <wire x2="3056" y1="1728" y2="1728" x1="3024" />
        </branch>
        <bustap x2="3056" y1="1888" y2="1888" x1="3152" />
        <branch name="Yout(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="1888" type="branch" />
            <wire x2="3040" y1="1888" y2="1888" x1="3008" />
            <wire x2="3056" y1="1888" y2="1888" x1="3040" />
        </branch>
        <bustap x2="3056" y1="2048" y2="2048" x1="3152" />
        <branch name="Yout(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="2048" type="branch" />
            <wire x2="3040" y1="2048" y2="2048" x1="3008" />
            <wire x2="3056" y1="2048" y2="2048" x1="3040" />
        </branch>
        <bustap x2="3056" y1="2208" y2="2208" x1="3152" />
        <branch name="Yout(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="2208" type="branch" />
            <wire x2="3040" y1="2208" y2="2208" x1="3008" />
            <wire x2="3056" y1="2208" y2="2208" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3280" y="1648" name="Yout(7:0)" orien="R0" />
        <instance x="144" y="1792" name="XLXI_28" orien="R0">
        </instance>
        <rect width="1964" x="1488" y="1216" height="1408" />
        <branch name="XLXN_58">
            <wire x2="2608" y1="1344" y2="1344" x1="2304" />
            <wire x2="2608" y1="1344" y2="1728" x1="2608" />
            <wire x2="2624" y1="1728" y2="1728" x1="2608" />
        </branch>
        <branch name="DCE">
            <wire x2="368" y1="2432" y2="2432" x1="192" />
            <wire x2="1616" y1="2432" y2="2432" x1="368" />
            <wire x2="2080" y1="2432" y2="2432" x1="1616" />
            <wire x2="720" y1="1920" y2="1920" x1="368" />
            <wire x2="368" y1="1920" y2="2432" x1="368" />
            <wire x2="1920" y1="1664" y2="1664" x1="1616" />
            <wire x2="1616" y1="1664" y2="2432" x1="1616" />
        </branch>
        <instance x="2304" y="1088" name="XLXI_32" orien="R0" />
        <branch name="D3">
            <wire x2="2304" y1="832" y2="832" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="832" name="D3" orien="R180" />
        <branch name="DCE">
            <wire x2="2304" y1="896" y2="896" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="896" name="DCE" orien="R180" />
        <branch name="RST">
            <wire x2="2304" y1="1056" y2="1056" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1056" name="RST" orien="R180" />
        <iomarker fontsize="28" x="2576" y="1984" name="GPIO22" orien="R180" />
        <branch name="RST">
            <wire x2="560" y1="2592" y2="2592" x1="176" />
            <wire x2="1824" y1="2592" y2="2592" x1="560" />
            <wire x2="2080" y1="2592" y2="2592" x1="1824" />
            <wire x2="720" y1="2080" y2="2080" x1="560" />
            <wire x2="560" y1="2080" y2="2592" x1="560" />
            <wire x2="1920" y1="1792" y2="1792" x1="1824" />
            <wire x2="1824" y1="1792" y2="2592" x1="1824" />
        </branch>
        <branch name="CLK1">
            <wire x2="480" y1="2496" y2="2496" x1="192" />
            <wire x2="1728" y1="2496" y2="2496" x1="480" />
            <wire x2="2080" y1="2496" y2="2496" x1="1728" />
            <wire x2="720" y1="1984" y2="1984" x1="480" />
            <wire x2="480" y1="1984" y2="2496" x1="480" />
            <wire x2="1920" y1="1728" y2="1728" x1="1728" />
            <wire x2="1728" y1="1728" y2="2496" x1="1728" />
        </branch>
        <branch name="DSEL">
            <wire x2="1920" y1="1600" y2="1600" x1="1808" />
        </branch>
        <branch name="D3">
            <wire x2="1920" y1="1536" y2="1536" x1="1824" />
        </branch>
        <branch name="D2">
            <wire x2="1920" y1="1472" y2="1472" x1="1808" />
        </branch>
        <branch name="D1">
            <wire x2="1920" y1="1408" y2="1408" x1="1808" />
        </branch>
        <branch name="D0">
            <wire x2="1920" y1="1344" y2="1344" x1="1808" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1536" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1600" name="DSEL" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1472" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1408" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1344" name="D0" orien="R180" />
        <instance x="1920" y="1824" name="XLXI_31" orien="R0">
        </instance>
        <branch name="XLXN_242">
            <wire x2="2448" y1="1488" y2="1488" x1="2304" />
            <wire x2="2448" y1="1488" y2="1792" x1="2448" />
            <wire x2="2624" y1="1792" y2="1792" x1="2448" />
        </branch>
        <branch name="XLXN_241">
            <wire x2="2432" y1="1632" y2="1632" x1="2304" />
            <wire x2="2432" y1="1632" y2="1856" x1="2432" />
            <wire x2="2624" y1="1856" y2="1856" x1="2432" />
        </branch>
        <branch name="XLXN_240">
            <wire x2="2416" y1="1776" y2="1776" x1="2304" />
            <wire x2="2416" y1="1776" y2="1920" x1="2416" />
            <wire x2="2624" y1="1920" y2="1920" x1="2416" />
        </branch>
        <branch name="P4">
            <wire x2="2496" y1="2432" y2="2432" x1="2464" />
        </branch>
        <branch name="P5">
            <wire x2="2480" y1="2496" y2="2496" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="176" y="2592" name="RST" orien="R180" />
        <iomarker fontsize="28" x="192" y="2432" name="DCE" orien="R180" />
        <branch name="XLXN_299">
            <wire x2="2624" y1="2048" y2="2048" x1="2464" />
        </branch>
        <branch name="XLXN_300">
            <wire x2="2624" y1="2112" y2="2112" x1="2464" />
        </branch>
        <branch name="XLXN_301">
            <wire x2="2624" y1="2176" y2="2176" x1="2464" />
        </branch>
        <branch name="XLXN_302">
            <wire x2="2624" y1="2240" y2="2240" x1="2464" />
        </branch>
        <branch name="D0">
            <wire x2="2080" y1="2048" y2="2048" x1="2064" />
        </branch>
        <iomarker fontsize="28" x="2480" y="2496" name="P5" orien="R0" />
        <iomarker fontsize="28" x="2496" y="2432" name="P4" orien="R0" />
        <instance x="2080" y="2624" name="XLXI_42" orien="R0" />
        <iomarker fontsize="28" x="2064" y="2048" name="D0" orien="R180" />
        <branch name="D1">
            <wire x2="2080" y1="2112" y2="2112" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="2048" y="2112" name="D1" orien="R180" />
        <branch name="D2">
            <wire x2="2080" y1="2176" y2="2176" x1="2048" />
        </branch>
        <branch name="D3">
            <wire x2="2080" y1="2240" y2="2240" x1="2048" />
        </branch>
        <branch name="DSEL">
            <wire x2="2080" y1="2368" y2="2368" x1="2032" />
        </branch>
        <iomarker fontsize="28" x="2048" y="2176" name="D2" orien="R180" />
        <iomarker fontsize="28" x="2048" y="2240" name="D3" orien="R180" />
        <iomarker fontsize="28" x="2032" y="2368" name="DSEL" orien="R180" />
        <text style="fontsize:40;fontname:Arial" x="1148" y="576">2B</text>
        <branch name="D2">
            <wire x2="720" y1="592" y2="592" x1="272" />
            <wire x2="736" y1="576" y2="576" x1="720" />
            <wire x2="720" y1="576" y2="592" x1="720" />
        </branch>
        <branch name="D0">
            <wire x2="400" y1="208" y2="208" x1="224" />
            <wire x2="448" y1="208" y2="208" x1="400" />
            <wire x2="400" y1="208" y2="480" x1="400" />
            <wire x2="448" y1="480" y2="480" x1="400" />
        </branch>
        <branch name="D1">
            <wire x2="352" y1="272" y2="272" x1="224" />
            <wire x2="448" y1="272" y2="272" x1="352" />
            <wire x2="352" y1="272" y2="544" x1="352" />
            <wire x2="448" y1="544" y2="544" x1="352" />
        </branch>
        <instance x="720" y="2112" name="XLXI_43" orien="R0" />
        <branch name="Yout(7:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1264" y="1216" type="branch" />
            <wire x2="1264" y1="1120" y2="1216" x1="1264" />
            <wire x2="1264" y1="1216" y2="1232" x1="1264" />
            <wire x2="1264" y1="1232" y2="1344" x1="1264" />
        </branch>
        <bustap x2="1168" y1="1232" y2="1232" x1="1264" />
        <bustap x2="1232" y1="1856" y2="1856" x1="1328" />
        <branch name="Yout(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1856" type="branch" />
            <wire x2="1168" y1="1856" y2="1856" x1="1104" />
            <wire x2="1232" y1="1856" y2="1856" x1="1168" />
        </branch>
        <bustap x2="1232" y1="1792" y2="1792" x1="1328" />
        <branch name="Yout(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1792" type="branch" />
            <wire x2="1168" y1="1792" y2="1792" x1="1104" />
            <wire x2="1232" y1="1792" y2="1792" x1="1168" />
        </branch>
        <bustap x2="1232" y1="1728" y2="1728" x1="1328" />
        <branch name="Yout(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1728" type="branch" />
            <wire x2="1168" y1="1728" y2="1728" x1="1104" />
            <wire x2="1232" y1="1728" y2="1728" x1="1168" />
        </branch>
        <bustap x2="1232" y1="1664" y2="1664" x1="1328" />
        <branch name="Yout(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1664" type="branch" />
            <wire x2="1168" y1="1664" y2="1664" x1="1104" />
            <wire x2="1232" y1="1664" y2="1664" x1="1168" />
        </branch>
        <branch name="Yout(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="160" y="1392" type="branch" />
            <wire x2="112" y1="1392" y2="1760" x1="112" />
            <wire x2="144" y1="1760" y2="1760" x1="112" />
            <wire x2="160" y1="1392" y2="1392" x1="112" />
            <wire x2="672" y1="1392" y2="1392" x1="160" />
            <wire x2="1328" y1="1392" y2="1392" x1="672" />
            <wire x2="1328" y1="1392" y2="1664" x1="1328" />
            <wire x2="1328" y1="1664" y2="1728" x1="1328" />
            <wire x2="1328" y1="1728" y2="1792" x1="1328" />
            <wire x2="1328" y1="1792" y2="1856" x1="1328" />
            <wire x2="672" y1="1232" y2="1392" x1="672" />
            <wire x2="1168" y1="1232" y2="1232" x1="672" />
        </branch>
        <iomarker fontsize="28" x="2768" y="320" name="P2" orien="R0" />
        <branch name="P2">
            <wire x2="2688" y1="240" y2="240" x1="1984" />
            <wire x2="2688" y1="240" y2="352" x1="2688" />
            <wire x2="2720" y1="352" y2="352" x1="2688" />
            <wire x2="1984" y1="240" y2="352" x1="1984" />
            <wire x2="2688" y1="352" y2="352" x1="2656" />
            <wire x2="2768" y1="320" y2="320" x1="2720" />
            <wire x2="2720" y1="320" y2="352" x1="2720" />
        </branch>
        <instance x="1984" y="384" name="XLXI_17" orien="R0" />
        <branch name="RST">
            <wire x2="2272" y1="576" y2="576" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="576" name="RST" orien="R180" />
        <branch name="XLXN_309">
            <wire x2="2272" y1="352" y2="352" x1="2208" />
        </branch>
        <branch name="CLK3">
            <wire x2="2272" y1="480" y2="480" x1="2080" />
        </branch>
        <branch name="CLK3">
            <wire x2="2304" y1="960" y2="960" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2080" y="480" name="CLK3" orien="R180" />
        <iomarker fontsize="28" x="2288" y="960" name="CLK3" orien="R180" />
        <instance x="2272" y="608" name="XLXI_45" orien="R0" />
    </sheet>
</drawing>