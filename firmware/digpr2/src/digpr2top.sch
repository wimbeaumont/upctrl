<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK100" />
        <signal name="D0(7:0)" />
        <signal name="D0(15:8)" />
        <signal name="D1(7:0)" />
        <signal name="GPIO22" />
        <signal name="P(7:0)" />
        <signal name="D1(15:8)" />
        <signal name="D2(15:8)" />
        <signal name="D2(15:0)" />
        <signal name="D2(7:0)" />
        <signal name="D1(15:0)" />
        <signal name="D0(15:0)" />
        <signal name="LED(7:0)" />
        <signal name="D(2)" />
        <signal name="Lid(3:0)" />
        <signal name="clk4M" />
        <signal name="D6(7:0)" />
        <signal name="RstN" />
        <signal name="RST" />
        <signal name="XLXN_358" />
        <signal name="D(7:0)" />
        <signal name="GPIO15" />
        <signal name="D6(0)" />
        <signal name="D6(1)" />
        <signal name="D6(2)" />
        <signal name="D6(3)" />
        <signal name="D6(4)" />
        <signal name="SYSCLK" />
        <signal name="CNTCLR" />
        <signal name="SEL(1:0)" />
        <signal name="SEL(1)" />
        <signal name="SEL(0)" />
        <signal name="TD1" />
        <signal name="D(0)" />
        <signal name="Pin1" />
        <signal name="D(1)" />
        <signal name="Pin2" />
        <signal name="TD2" />
        <signal name="Pout3" />
        <signal name="Pout4" />
        <signal name="GPIO18" />
        <signal name="clk3" />
        <port polarity="Input" name="GPIO22" />
        <port polarity="Output" name="P(7:0)" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="Output" name="Lid(3:0)" />
        <port polarity="Input" name="RstN" />
        <port polarity="Input" name="D(7:0)" />
        <port polarity="Input" name="GPIO15" />
        <port polarity="Input" name="SYSCLK" />
        <port polarity="Input" name="SEL(1:0)" />
        <port polarity="Input" name="Pin1" />
        <port polarity="Input" name="Pin2" />
        <port polarity="Output" name="Pout3" />
        <port polarity="Output" name="Pout4" />
        <port polarity="Input" name="GPIO18" />
        <port polarity="Input" name="clk3" />
        <blockdef name="mux4_8_1">
            <timestamp>2021-3-18T15:26:16</timestamp>
            <rect width="256" x="64" y="-736" height="632" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <rect width="64" x="0" y="-524" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <rect width="64" x="0" y="-460" height="24" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="320" y="-716" height="24" />
            <line x2="384" y1="-704" y2="-704" x1="320" />
            <line x2="384" y1="-640" y2="-640" x1="320" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="4" y1="-144" y2="-144" x1="68" />
        </blockdef>
        <blockdef name="ledid">
            <timestamp>2019-12-13T14:16:19</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <blockdef name="clksrc">
            <timestamp>2020-1-5T13:21:49</timestamp>
            <rect width="188" x="36" y="0" height="128" />
            <line x2="0" y1="32" y2="32" x1="32" />
            <line x2="32" y1="64" y2="64" x1="0" />
            <line x2="224" y1="16" y2="16" x1="256" />
            <line x2="224" y1="48" y2="48" x1="256" />
            <line x2="224" y1="80" y2="80" x1="256" />
            <line x2="224" y1="112" y2="112" x1="256" />
        </blockdef>
        <blockdef name="pulsegen">
            <timestamp>2020-1-7T8:36:59</timestamp>
            <rect width="256" x="64" y="-288" height="284" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="384" y1="-256" y2="-256" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <line x2="64" y1="-176" y2="-176" x1="0" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="320" y1="-80" y2="-80" x1="388" />
            <line x2="324" y1="-80" y2="-80" x1="320" />
            <line x2="324" y1="-32" y2="-32" x1="384" />
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
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="pulse_count">
            <timestamp>2022-3-18T16:9:25</timestamp>
            <rect width="256" x="64" y="-320" height="188" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="4" y1="-192" y2="-192" x1="68" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <block symbolname="ledid" name="XLXI_60">
            <blockpin signalname="clk4M" name="clk" />
            <blockpin signalname="Lid(3:0)" name="Lid(3:0)" />
        </block>
        <block symbolname="inv" name="XLXI_68">
            <blockpin signalname="RstN" name="I" />
            <blockpin signalname="RST" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_123">
            <blockpin signalname="TD2" name="I0" />
            <blockpin signalname="TD1" name="I1" />
            <blockpin signalname="XLXN_358" name="O" />
        </block>
        <block symbolname="pulsegen" name="XLXI_66">
            <blockpin signalname="clk4M" name="clk" />
            <blockpin signalname="D(7:0)" name="D(7:0)" />
            <blockpin signalname="D6(0)" name="P1" />
            <blockpin signalname="D6(1)" name="P2" />
            <blockpin signalname="D6(2)" name="PAND" />
            <blockpin signalname="RST" name="RST" />
            <blockpin signalname="GPIO15" name="WE" />
            <blockpin signalname="D6(3)" name="zbar1" />
            <blockpin signalname="D6(4)" name="zbar2" />
        </block>
        <block symbolname="clksrc" name="XLXI_64">
            <blockpin signalname="SYSCLK" name="clk_in1" />
            <blockpin signalname="RST" name="reset" />
            <blockpin signalname="CLK100" name="clk_out1" />
            <blockpin name="clk_out2" />
            <blockpin signalname="clk4M" name="clk_out3" />
            <blockpin name="locked" />
        </block>
        <block symbolname="or2" name="XLXI_129">
            <blockpin signalname="RST" name="I0" />
            <blockpin signalname="GPIO18" name="I1" />
            <blockpin signalname="CNTCLR" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_136">
            <blockpin signalname="D(0)" name="D0" />
            <blockpin signalname="Pin1" name="D1" />
            <blockpin signalname="clk3" name="S0" />
            <blockpin signalname="TD1" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_137">
            <blockpin signalname="D(1)" name="D0" />
            <blockpin signalname="Pin2" name="D1" />
            <blockpin signalname="clk3" name="S0" />
            <blockpin signalname="TD2" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_141">
            <blockpin signalname="TD1" name="I" />
            <blockpin signalname="Pout4" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_142">
            <blockpin signalname="TD2" name="I" />
            <blockpin signalname="Pout3" name="O" />
        </block>
        <block symbolname="mux4_8_1" name="XLXI_143">
            <blockpin signalname="SEL(0)" name="sel0" />
            <blockpin signalname="SEL(1)" name="sel1" />
            <blockpin signalname="GPIO22" name="sel2" />
            <blockpin signalname="D0(7:0)" name="D0(7:0)" />
            <blockpin signalname="D0(15:8)" name="D1(7:0)" />
            <blockpin signalname="D1(7:0)" name="D2(7:0)" />
            <blockpin signalname="D1(15:8)" name="D3(7:0)" />
            <blockpin signalname="D2(7:0)" name="D4(7:0)" />
            <blockpin signalname="D2(15:8)" name="D5(7:0)" />
            <blockpin signalname="P(7:0)" name="P(7:0)" />
            <blockpin signalname="LED(7:0)" name="LED(7:0)" />
            <blockpin signalname="D6(7:0)" name="D6(7:0)" />
        </block>
        <block symbolname="pulse_count" name="XLXI_144">
            <blockpin signalname="XLXN_358" name="D" />
            <blockpin signalname="D(2)" name="EnA" />
            <blockpin name="CNTE_out" />
            <blockpin signalname="CNTCLR" name="CLR" />
            <blockpin signalname="CLK100" name="CLK" />
            <blockpin signalname="D1(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="pulse_count" name="XLXI_145">
            <blockpin signalname="TD2" name="D" />
            <blockpin signalname="D(2)" name="EnA" />
            <blockpin name="CNTE_out" />
            <blockpin signalname="CNTCLR" name="CLR" />
            <blockpin signalname="CLK100" name="CLK" />
            <blockpin signalname="D2(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="pulse_count" name="XLXI_147">
            <blockpin signalname="TD1" name="D" />
            <blockpin signalname="D(2)" name="EnA" />
            <blockpin name="CNTE_out" />
            <blockpin signalname="CNTCLR" name="CLR" />
            <blockpin signalname="CLK100" name="CLK" />
            <blockpin signalname="D0(15:0)" name="Q(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="D0(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2016" y="704" type="branch" />
            <wire x2="2016" y1="704" y2="704" x1="2000" />
            <wire x2="2032" y1="704" y2="704" x1="2016" />
            <wire x2="2032" y1="576" y2="640" x1="2032" />
            <wire x2="2032" y1="640" y2="704" x1="2032" />
        </branch>
        <branch name="D0(15:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2192" y="640" type="branch" />
            <wire x2="2192" y1="640" y2="640" x1="2128" />
            <wire x2="2800" y1="640" y2="640" x1="2192" />
        </branch>
        <bustap x2="2128" y1="640" y2="640" x1="2032" />
        <branch name="D1(15:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2112" y="1504" type="branch" />
            <wire x2="2112" y1="1520" y2="1520" x1="2032" />
            <wire x2="2112" y1="1392" y2="1408" x1="2112" />
            <wire x2="2112" y1="1408" y2="1456" x1="2112" />
            <wire x2="2112" y1="1456" y2="1504" x1="2112" />
            <wire x2="2112" y1="1504" y2="1520" x1="2112" />
        </branch>
        <branch name="GPIO22">
            <wire x2="2800" y1="512" y2="512" x1="2768" />
        </branch>
        <branch name="P(7:0)">
            <wire x2="3216" y1="384" y2="384" x1="3184" />
        </branch>
        <iomarker fontsize="28" x="2768" y="512" name="GPIO22" orien="R180" />
        <branch name="D1(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2368" y="704" type="branch" />
            <wire x2="2368" y1="1408" y2="1408" x1="2208" />
            <wire x2="2368" y1="704" y2="1408" x1="2368" />
            <wire x2="2800" y1="704" y2="704" x1="2368" />
        </branch>
        <branch name="D1(15:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2432" y="768" type="branch" />
            <wire x2="2432" y1="1456" y2="1456" x1="2208" />
            <wire x2="2800" y1="768" y2="768" x1="2432" />
            <wire x2="2432" y1="768" y2="1456" x1="2432" />
        </branch>
        <bustap x2="2208" y1="1456" y2="1456" x1="2112" />
        <bustap x2="2208" y1="1408" y2="1408" x1="2112" />
        <bustap x2="2128" y1="576" y2="576" x1="2032" />
        <branch name="D0(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="576" type="branch" />
            <wire x2="2464" y1="576" y2="576" x1="2128" />
            <wire x2="2800" y1="576" y2="576" x1="2464" />
        </branch>
        <branch name="D2(15:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2656" y="896" type="branch" />
            <wire x2="2656" y1="2192" y2="2192" x1="2288" />
            <wire x2="2800" y1="896" y2="896" x1="2656" />
            <wire x2="2656" y1="896" y2="2192" x1="2656" />
        </branch>
        <branch name="D2(15:0)">
            <wire x2="2192" y1="2224" y2="2224" x1="2112" />
            <wire x2="2192" y1="2080" y2="2192" x1="2192" />
            <wire x2="2192" y1="2192" y2="2224" x1="2192" />
        </branch>
        <bustap x2="2288" y1="2080" y2="2080" x1="2192" />
        <branch name="D2(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2608" y="832" type="branch" />
            <wire x2="2560" y1="2080" y2="2080" x1="2288" />
            <wire x2="2608" y1="832" y2="832" x1="2560" />
            <wire x2="2800" y1="832" y2="832" x1="2608" />
            <wire x2="2560" y1="832" y2="2080" x1="2560" />
        </branch>
        <bustap x2="2288" y1="2192" y2="2192" x1="2192" />
        <iomarker fontsize="28" x="3216" y="384" name="P(7:0)" orien="R0" />
        <branch name="LED(7:0)">
            <wire x2="3216" y1="448" y2="448" x1="3184" />
        </branch>
        <iomarker fontsize="28" x="3216" y="448" name="LED(7:0)" orien="R0" />
        <branch name="Lid(3:0)">
            <wire x2="3376" y1="2576" y2="2576" x1="3280" />
        </branch>
        <instance x="2896" y="2544" name="XLXI_60" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3376" y="2576" name="Lid(3:0)" orien="R0" />
        <branch name="D6(7:0)">
            <wire x2="2688" y1="944" y2="1088" x1="2688" />
            <wire x2="3488" y1="1088" y2="1088" x1="2688" />
            <wire x2="3488" y1="1088" y2="1280" x1="3488" />
            <wire x2="3488" y1="1280" y2="1344" x1="3488" />
            <wire x2="3488" y1="1344" y2="1408" x1="3488" />
            <wire x2="3488" y1="1408" y2="1456" x1="3488" />
            <wire x2="3488" y1="1456" y2="1504" x1="3488" />
            <wire x2="3488" y1="1504" y2="1552" x1="3488" />
            <wire x2="2800" y1="944" y2="944" x1="2688" />
        </branch>
        <branch name="RstN">
            <wire x2="352" y1="2592" y2="2592" x1="320" />
        </branch>
        <branch name="RST">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="688" y="2592" type="branch" />
            <wire x2="688" y1="2592" y2="2592" x1="576" />
            <wire x2="976" y1="2592" y2="2592" x1="688" />
        </branch>
        <instance x="352" y="2624" name="XLXI_68" orien="R0" />
        <iomarker fontsize="28" x="320" y="2592" name="RstN" orien="R180" />
        <branch name="clk4M">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2608" y="2448" type="branch" />
            <wire x2="2608" y1="2608" y2="2608" x1="1232" />
            <wire x2="2896" y1="2448" y2="2448" x1="2608" />
            <wire x2="2608" y1="2448" y2="2608" x1="2608" />
        </branch>
        <branch name="XLXN_358">
            <wire x2="1488" y1="1392" y2="1392" x1="544" />
            <wire x2="1488" y1="1392" y2="1456" x1="1488" />
            <wire x2="1648" y1="1456" y2="1456" x1="1488" />
        </branch>
        <instance x="288" y="1488" name="XLXI_123" orien="R0" />
        <branch name="D(7:0)">
            <wire x2="2880" y1="1408" y2="1408" x1="2832" />
        </branch>
        <branch name="GPIO15">
            <wire x2="2880" y1="1360" y2="1360" x1="2848" />
        </branch>
        <branch name="clk4M">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1280" type="branch" />
            <wire x2="2800" y1="1280" y2="1280" x1="2768" />
            <wire x2="2880" y1="1280" y2="1280" x1="2800" />
        </branch>
        <branch name="RST">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2832" y="1312" type="branch" />
            <wire x2="2832" y1="1312" y2="1312" x1="2768" />
            <wire x2="2880" y1="1312" y2="1312" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1360" name="GPIO15" orien="R180" />
        <iomarker fontsize="28" x="2832" y="1408" name="D(7:0)" orien="R180" />
        <instance x="2880" y="1536" name="XLXI_66" orien="R0">
        </instance>
        <branch name="D6(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="1280" type="branch" />
            <wire x2="3280" y1="1280" y2="1280" x1="3264" />
            <wire x2="3392" y1="1280" y2="1280" x1="3280" />
        </branch>
        <bustap x2="3392" y1="1280" y2="1280" x1="3488" />
        <branch name="D6(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3296" y="1344" type="branch" />
            <wire x2="3296" y1="1344" y2="1344" x1="3264" />
            <wire x2="3392" y1="1344" y2="1344" x1="3296" />
        </branch>
        <branch name="D6(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3296" y="1408" type="branch" />
            <wire x2="3296" y1="1408" y2="1408" x1="3264" />
            <wire x2="3392" y1="1408" y2="1408" x1="3296" />
        </branch>
        <branch name="D6(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3296" y="1456" type="branch" />
            <wire x2="3296" y1="1456" y2="1456" x1="3264" />
            <wire x2="3392" y1="1456" y2="1456" x1="3296" />
        </branch>
        <branch name="D6(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3296" y="1504" type="branch" />
            <wire x2="3296" y1="1504" y2="1504" x1="3264" />
            <wire x2="3392" y1="1504" y2="1504" x1="3296" />
        </branch>
        <bustap x2="3392" y1="1504" y2="1504" x1="3488" />
        <bustap x2="3392" y1="1456" y2="1456" x1="3488" />
        <bustap x2="3392" y1="1408" y2="1408" x1="3488" />
        <bustap x2="3392" y1="1344" y2="1344" x1="3488" />
        <branch name="SYSCLK">
            <wire x2="976" y1="2560" y2="2560" x1="944" />
        </branch>
        <instance x="976" y="2528" name="XLXI_64" orien="R0">
        </instance>
        <iomarker fontsize="28" x="944" y="2560" name="SYSCLK" orien="R180" />
        <branch name="CNTCLR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="928" type="branch" />
            <wire x2="1536" y1="928" y2="928" x1="1472" />
            <wire x2="1616" y1="928" y2="928" x1="1536" />
            <wire x2="1616" y1="768" y2="928" x1="1616" />
        </branch>
        <instance x="1216" y="1024" name="XLXI_129" orien="R0" />
        <branch name="RST">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="960" type="branch" />
            <wire x2="1040" y1="960" y2="960" x1="960" />
            <wire x2="1216" y1="960" y2="960" x1="1040" />
        </branch>
        <branch name="GPIO18">
            <wire x2="1216" y1="896" y2="896" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1184" y="896" name="GPIO18" orien="R180" />
        <branch name="SEL(1:0)">
            <wire x2="2624" y1="304" y2="304" x1="2416" />
            <wire x2="2624" y1="304" y2="384" x1="2624" />
            <wire x2="2624" y1="384" y2="448" x1="2624" />
            <wire x2="2624" y1="448" y2="464" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2416" y="304" name="SEL(1:0)" orien="R180" />
        <bustap x2="2720" y1="448" y2="448" x1="2624" />
        <branch name="SEL(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2760" y="448" type="branch" />
            <wire x2="2800" y1="448" y2="448" x1="2720" />
        </branch>
        <bustap x2="2720" y1="384" y2="384" x1="2624" />
        <branch name="SEL(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2760" y="384" type="branch" />
            <wire x2="2800" y1="384" y2="384" x1="2720" />
        </branch>
        <instance x="176" y="512" name="XLXI_136" orien="R0" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="96" y="352" type="branch" />
            <wire x2="96" y1="352" y2="352" x1="64" />
            <wire x2="176" y1="352" y2="352" x1="96" />
        </branch>
        <branch name="Pin1">
            <wire x2="176" y1="416" y2="416" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="416" name="Pin1" orien="R180" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="80" y="2064" type="branch" />
            <wire x2="80" y1="2064" y2="2064" x1="48" />
            <wire x2="144" y1="2064" y2="2064" x1="80" />
        </branch>
        <branch name="Pin2">
            <wire x2="144" y1="2128" y2="2128" x1="96" />
        </branch>
        <iomarker fontsize="28" x="96" y="2128" name="Pin2" orien="R180" />
        <branch name="TD2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="784" y="2096" type="branch" />
            <wire x2="288" y1="1424" y2="1424" x1="272" />
            <wire x2="272" y1="1424" y2="1824" x1="272" />
            <wire x2="576" y1="1824" y2="1824" x1="272" />
            <wire x2="576" y1="1824" y2="1840" x1="576" />
            <wire x2="576" y1="1840" y2="2096" x1="576" />
            <wire x2="784" y1="2096" y2="2096" x1="576" />
            <wire x2="1568" y1="2096" y2="2096" x1="784" />
            <wire x2="1568" y1="2096" y2="2160" x1="1568" />
            <wire x2="1728" y1="2160" y2="2160" x1="1568" />
            <wire x2="624" y1="1840" y2="1840" x1="576" />
            <wire x2="576" y1="2096" y2="2096" x1="464" />
        </branch>
        <instance x="624" y="1872" name="XLXI_142" orien="R0" />
        <branch name="Pout3">
            <wire x2="880" y1="1840" y2="1840" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1840" name="Pout3" orien="R0" />
        <branch name="Pout4">
            <wire x2="864" y1="240" y2="240" x1="832" />
        </branch>
        <iomarker fontsize="28" x="864" y="240" name="Pout4" orien="R0" />
        <instance x="2800" y="1088" name="XLXI_143" orien="R0">
        </instance>
        <branch name="clk3">
            <wire x2="144" y1="2192" y2="2192" x1="112" />
        </branch>
        <iomarker fontsize="28" x="112" y="2192" name="clk3" orien="R180" />
        <branch name="clk3">
            <wire x2="176" y1="480" y2="480" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="480" name="clk3" orien="R180" />
        <instance x="1648" y="1744" name="XLXI_144" orien="R0">
        </instance>
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="1520" type="branch" />
            <wire x2="1536" y1="1520" y2="1520" x1="1296" />
            <wire x2="1648" y1="1520" y2="1520" x1="1536" />
        </branch>
        <branch name="CLK100">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1552" type="branch" />
            <wire x2="1376" y1="1552" y2="1552" x1="1312" />
            <wire x2="1648" y1="1552" y2="1552" x1="1376" />
        </branch>
        <branch name="CNTCLR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1520" y="1584" type="branch" />
            <wire x2="1520" y1="1584" y2="1584" x1="1328" />
            <wire x2="1648" y1="1584" y2="1584" x1="1520" />
        </branch>
        <branch name="CLK100">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="2544" type="branch" />
            <wire x2="1280" y1="2544" y2="2544" x1="1232" />
            <wire x2="1328" y1="2544" y2="2544" x1="1280" />
        </branch>
        <instance x="144" y="2224" name="XLXI_137" orien="R0" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="2224" type="branch" />
            <wire x2="1536" y1="2224" y2="2224" x1="1376" />
            <wire x2="1728" y1="2224" y2="2224" x1="1536" />
        </branch>
        <branch name="CLK100">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1520" y="2256" type="branch" />
            <wire x2="1520" y1="2256" y2="2256" x1="1392" />
            <wire x2="1728" y1="2256" y2="2256" x1="1520" />
        </branch>
        <branch name="CNTCLR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1504" y="2288" type="branch" />
            <wire x2="1504" y1="2288" y2="2288" x1="1408" />
            <wire x2="1728" y1="2288" y2="2288" x1="1504" />
        </branch>
        <instance x="1728" y="2448" name="XLXI_145" orien="R0">
        </instance>
        <instance x="608" y="272" name="XLXI_141" orien="R0" />
        <instance x="1616" y="928" name="XLXI_147" orien="R0">
        </instance>
        <branch name="CLK100">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="736" type="branch" />
            <wire x2="1472" y1="736" y2="736" x1="1360" />
            <wire x2="1616" y1="736" y2="736" x1="1472" />
        </branch>
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="704" type="branch" />
            <wire x2="1408" y1="704" y2="704" x1="1360" />
            <wire x2="1616" y1="704" y2="704" x1="1408" />
        </branch>
        <branch name="TD1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="576" type="branch" />
            <wire x2="272" y1="576" y2="1360" x1="272" />
            <wire x2="288" y1="1360" y2="1360" x1="272" />
            <wire x2="352" y1="576" y2="576" x1="272" />
            <wire x2="448" y1="576" y2="576" x1="352" />
            <wire x2="1536" y1="576" y2="576" x1="448" />
            <wire x2="1536" y1="576" y2="640" x1="1536" />
            <wire x2="1616" y1="640" y2="640" x1="1536" />
            <wire x2="496" y1="512" y2="512" x1="352" />
            <wire x2="352" y1="512" y2="576" x1="352" />
            <wire x2="560" y1="384" y2="384" x1="496" />
            <wire x2="560" y1="384" y2="496" x1="560" />
            <wire x2="560" y1="496" y2="496" x1="496" />
            <wire x2="496" y1="496" y2="512" x1="496" />
            <wire x2="608" y1="240" y2="240" x1="560" />
            <wire x2="560" y1="240" y2="384" x1="560" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="1380" y="2596">clkout3 is 10MH !!!</text>
    </sheet>
</drawing>