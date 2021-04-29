<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xbr" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A0" />
        <signal name="B0" />
        <signal name="A1" />
        <signal name="B1" />
        <signal name="SEL0" />
        <signal name="A2" />
        <signal name="B2" />
        <signal name="A3" />
        <signal name="B3" />
        <signal name="Y3" />
        <signal name="Y2" />
        <signal name="Y1" />
        <signal name="Y0" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="SEL0" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="B3" />
        <port polarity="Output" name="Y3" />
        <port polarity="Output" name="Y2" />
        <port polarity="Output" name="Y1" />
        <port polarity="Output" name="Y0" />
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
        <block symbolname="m2_1" name="XLXI_1">
            <blockpin signalname="A0" name="D0" />
            <blockpin signalname="B0" name="D1" />
            <blockpin signalname="SEL0" name="S0" />
            <blockpin signalname="Y0" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_2">
            <blockpin signalname="A1" name="D0" />
            <blockpin signalname="B1" name="D1" />
            <blockpin signalname="SEL0" name="S0" />
            <blockpin signalname="Y1" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_3">
            <blockpin signalname="A2" name="D0" />
            <blockpin signalname="B2" name="D1" />
            <blockpin signalname="SEL0" name="S0" />
            <blockpin signalname="Y2" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_4">
            <blockpin signalname="A3" name="D0" />
            <blockpin signalname="B3" name="D1" />
            <blockpin signalname="SEL0" name="S0" />
            <blockpin signalname="Y3" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1392" y="944" name="XLXI_1" orien="R0" />
        <instance x="1424" y="1216" name="XLXI_2" orien="R0" />
        <instance x="1392" y="1504" name="XLXI_3" orien="R0" />
        <instance x="1408" y="1760" name="XLXI_4" orien="R0" />
        <branch name="A0">
            <wire x2="1376" y1="784" y2="784" x1="1344" />
            <wire x2="1392" y1="784" y2="784" x1="1376" />
        </branch>
        <branch name="B0">
            <wire x2="1376" y1="848" y2="848" x1="1328" />
            <wire x2="1392" y1="848" y2="848" x1="1376" />
        </branch>
        <branch name="A1">
            <wire x2="1408" y1="1056" y2="1056" x1="1344" />
            <wire x2="1424" y1="1056" y2="1056" x1="1408" />
        </branch>
        <branch name="B1">
            <wire x2="1408" y1="1120" y2="1120" x1="1344" />
            <wire x2="1424" y1="1120" y2="1120" x1="1408" />
        </branch>
        <branch name="SEL0">
            <wire x2="1072" y1="1184" y2="1184" x1="1008" />
            <wire x2="1072" y1="1184" y2="1472" x1="1072" />
            <wire x2="1072" y1="1472" y2="1728" x1="1072" />
            <wire x2="1408" y1="1728" y2="1728" x1="1072" />
            <wire x2="1392" y1="1472" y2="1472" x1="1072" />
            <wire x2="1136" y1="1184" y2="1184" x1="1072" />
            <wire x2="1424" y1="1184" y2="1184" x1="1136" />
            <wire x2="1392" y1="912" y2="912" x1="1136" />
            <wire x2="1136" y1="912" y2="1184" x1="1136" />
        </branch>
        <branch name="A2">
            <wire x2="1376" y1="1344" y2="1344" x1="1344" />
            <wire x2="1392" y1="1344" y2="1344" x1="1376" />
        </branch>
        <branch name="B2">
            <wire x2="1392" y1="1408" y2="1408" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1408" name="B2" orien="R180" />
        <branch name="A3">
            <wire x2="1392" y1="1600" y2="1600" x1="1360" />
            <wire x2="1408" y1="1600" y2="1600" x1="1392" />
        </branch>
        <branch name="B3">
            <wire x2="1408" y1="1664" y2="1664" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1376" y="1664" name="B3" orien="R180" />
        <branch name="Y3">
            <wire x2="1760" y1="1632" y2="1632" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1632" name="Y3" orien="R0" />
        <branch name="Y2">
            <wire x2="1744" y1="1376" y2="1376" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1744" y="1376" name="Y2" orien="R0" />
        <branch name="Y1">
            <wire x2="1760" y1="1088" y2="1088" x1="1744" />
            <wire x2="1776" y1="1088" y2="1088" x1="1760" />
        </branch>
        <branch name="Y0">
            <wire x2="1728" y1="816" y2="816" x1="1712" />
            <wire x2="1744" y1="816" y2="816" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1744" y="816" name="Y0" orien="R0" />
        <iomarker fontsize="28" x="1008" y="1184" name="SEL0" orien="R180" />
        <iomarker fontsize="28" x="1776" y="1088" name="Y1" orien="R0" />
        <iomarker fontsize="28" x="1344" y="784" name="A0" orien="R180" />
        <iomarker fontsize="28" x="1344" y="1056" name="A1" orien="R180" />
        <iomarker fontsize="28" x="1344" y="1344" name="A2" orien="R180" />
        <iomarker fontsize="28" x="1360" y="1600" name="A3" orien="R180" />
        <iomarker fontsize="28" x="1344" y="1120" name="B1" orien="R180" />
        <iomarker fontsize="28" x="1328" y="848" name="B0" orien="R180" />
    </sheet>
</drawing>