<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_343" />
        <signal name="XLXN_344" />
        <signal name="CLR" />
        <signal name="CLK" />
        <signal name="CNTE_out" />
        <signal name="D" />
        <signal name="EnA" />
        <signal name="Q(15:0)" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="CNTE_out" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="EnA" />
        <port polarity="Output" name="Q(15:0)" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="and3b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="cb16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="fd" name="XLXI_74">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="D" name="D" />
            <blockpin signalname="XLXN_343" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_116">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_343" name="D" />
            <blockpin signalname="XLXN_344" name="Q" />
        </block>
        <block symbolname="and3b1" name="XLXI_82">
            <blockpin signalname="XLXN_344" name="I0" />
            <blockpin signalname="XLXN_343" name="I1" />
            <blockpin signalname="EnA" name="I2" />
            <blockpin signalname="CNTE_out" name="O" />
        </block>
        <block symbolname="cb16ce" name="XLXI_118">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CNTE_out" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="Q(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_343">
            <wire x2="1520" y1="1152" y2="1152" x1="1504" />
            <wire x2="1536" y1="1152" y2="1152" x1="1520" />
            <wire x2="1920" y1="1008" y2="1008" x1="1520" />
            <wire x2="1920" y1="1008" y2="1088" x1="1920" />
            <wire x2="1968" y1="1088" y2="1088" x1="1920" />
            <wire x2="1520" y1="1008" y2="1152" x1="1520" />
        </branch>
        <branch name="XLXN_344">
            <wire x2="1968" y1="1152" y2="1152" x1="1920" />
        </branch>
        <branch name="CLR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="1504" type="branch" />
            <wire x2="2112" y1="1504" y2="1504" x1="1952" />
            <wire x2="2160" y1="1504" y2="1504" x1="2112" />
            <wire x2="2240" y1="1504" y2="1504" x1="2160" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1792" y="1408" type="branch" />
            <wire x2="1120" y1="1408" y2="1408" x1="976" />
            <wire x2="1536" y1="1408" y2="1408" x1="1120" />
            <wire x2="1792" y1="1408" y2="1408" x1="1536" />
            <wire x2="2240" y1="1408" y2="1408" x1="1792" />
            <wire x2="1120" y1="1280" y2="1408" x1="1120" />
            <wire x2="1536" y1="1280" y2="1408" x1="1536" />
        </branch>
        <branch name="CNTE_out">
            <wire x2="2224" y1="1088" y2="1344" x1="2224" />
            <wire x2="2240" y1="1344" y2="1344" x1="2224" />
            <wire x2="2384" y1="1088" y2="1088" x1="2224" />
        </branch>
        <instance x="1120" y="1408" name="XLXI_74" orien="R0" />
        <instance x="1536" y="1408" name="XLXI_116" orien="R0" />
        <instance x="1968" y="1216" name="XLXI_82" orien="R0" />
        <instance x="2240" y="1536" name="XLXI_118" orien="R0" />
        <branch name="D">
            <wire x2="1104" y1="1152" y2="1152" x1="1056" />
            <wire x2="1120" y1="1152" y2="1152" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1056" y="1152" name="D" orien="R180" />
        <iomarker fontsize="28" x="976" y="1408" name="CLK" orien="R180" />
        <branch name="EnA">
            <wire x2="1936" y1="896" y2="896" x1="1776" />
            <wire x2="1968" y1="896" y2="896" x1="1936" />
            <wire x2="1968" y1="896" y2="1024" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="1776" y="896" name="EnA" orien="R180" />
        <iomarker fontsize="28" x="1952" y="1504" name="CLR" orien="R180" />
        <branch name="Q(15:0)">
            <wire x2="2784" y1="1280" y2="1280" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2784" y="1280" name="Q(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2384" y="1088" name="CNTE_out" orien="R0" />
    </sheet>
</drawing>