<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q3" />
        <signal name="Q1" />
        <signal name="XLXN_5" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="Q0" />
        <signal name="Q2" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_25" />
        <signal name="CE" />
        <signal name="clk" />
        <signal name="RST" />
        <signal name="XLXN_62" />
        <signal name="XLXN_64" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="SEL" />
        <signal name="D2" />
        <signal name="D3" />
        <port polarity="Output" name="Q3" />
        <port polarity="Output" name="Q1" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="SEL" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D3" />
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="and3b3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="40" y1="-192" y2="-192" x1="0" />
            <circle r="12" cx="52" cy="-192" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
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
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
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
        <block symbolname="and3b3" name="XLXI_5">
            <blockpin signalname="Q3" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_6">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q3" name="I2" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_7">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q3" name="I2" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_8">
            <blockpin signalname="Q3" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_4">
            <blockpin signalname="XLXN_9" name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="XLXN_7" name="I2" />
            <blockpin signalname="XLXN_5" name="I3" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_13">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q3" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_14">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q3" name="I2" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_15">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_16">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q3" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_17">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_18">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_20">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q3" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_21">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q3" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_23">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_17" name="I2" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_24">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_14" name="I2" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_22">
            <blockpin signalname="XLXN_22" name="I0" />
            <blockpin signalname="XLXN_21" name="I1" />
            <blockpin signalname="XLXN_20" name="I2" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="mux4_2" name="XLXI_43">
            <blockpin signalname="XLXN_10" name="A0" />
            <blockpin signalname="SEL" name="SEL0" />
            <blockpin signalname="D3" name="B3" />
            <blockpin signalname="XLXN_64" name="Y0" />
            <blockpin signalname="XLXN_67" name="Y1" />
            <blockpin signalname="XLXN_68" name="Y2" />
            <blockpin signalname="XLXN_69" name="Y3" />
            <blockpin signalname="XLXN_23" name="A1" />
            <blockpin signalname="XLXN_62" name="A2" />
            <blockpin signalname="D0" name="B0" />
            <blockpin signalname="XLXN_25" name="A3" />
            <blockpin signalname="D2" name="B2" />
            <blockpin signalname="D1" name="B1" />
        </block>
        <block symbolname="fd4ce" name="XLXI_45">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="RST" name="CLR" />
            <blockpin signalname="XLXN_64" name="D0" />
            <blockpin signalname="XLXN_67" name="D1" />
            <blockpin signalname="XLXN_68" name="D2" />
            <blockpin signalname="XLXN_69" name="D3" />
            <blockpin signalname="Q0" name="Q0" />
            <blockpin signalname="Q1" name="Q1" />
            <blockpin signalname="Q2" name="Q2" />
            <blockpin signalname="Q3" name="Q3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Q3">
            <wire x2="1968" y1="1264" y2="1264" x1="1600" />
            <wire x2="1968" y1="1264" y2="1360" x1="1968" />
            <wire x2="2032" y1="1360" y2="1360" x1="1968" />
            <wire x2="1968" y1="1360" y2="1744" x1="1968" />
            <wire x2="1968" y1="1744" y2="2304" x1="1968" />
            <wire x2="1968" y1="2304" y2="2496" x1="1968" />
            <wire x2="2032" y1="2496" y2="2496" x1="1968" />
            <wire x2="1968" y1="2496" y2="2624" x1="1968" />
            <wire x2="2320" y1="2624" y2="2624" x1="1968" />
            <wire x2="2032" y1="2304" y2="2304" x1="1968" />
            <wire x2="2032" y1="1744" y2="1744" x1="1968" />
            <wire x2="2032" y1="1264" y2="1264" x1="1968" />
            <wire x2="2064" y1="368" y2="368" x1="1968" />
            <wire x2="1968" y1="368" y2="480" x1="1968" />
            <wire x2="2064" y1="480" y2="480" x1="1968" />
            <wire x2="1968" y1="480" y2="704" x1="1968" />
            <wire x2="2064" y1="704" y2="704" x1="1968" />
            <wire x2="1968" y1="704" y2="1040" x1="1968" />
            <wire x2="1968" y1="1040" y2="1264" x1="1968" />
            <wire x2="2064" y1="1040" y2="1040" x1="1968" />
        </branch>
        <branch name="Q1">
            <wire x2="1712" y1="1136" y2="1136" x1="1600" />
            <wire x2="1712" y1="1136" y2="1552" x1="1712" />
            <wire x2="2032" y1="1552" y2="1552" x1="1712" />
            <wire x2="1712" y1="1552" y2="1680" x1="1712" />
            <wire x2="2032" y1="1680" y2="1680" x1="1712" />
            <wire x2="1712" y1="1680" y2="1872" x1="1712" />
            <wire x2="1712" y1="1872" y2="2016" x1="1712" />
            <wire x2="2032" y1="2016" y2="2016" x1="1712" />
            <wire x2="1712" y1="2016" y2="2432" x1="1712" />
            <wire x2="2032" y1="2432" y2="2432" x1="1712" />
            <wire x2="2032" y1="1872" y2="1872" x1="1712" />
            <wire x2="1744" y1="1136" y2="1136" x1="1712" />
            <wire x2="2064" y1="240" y2="240" x1="1712" />
            <wire x2="1712" y1="240" y2="608" x1="1712" />
            <wire x2="2064" y1="608" y2="608" x1="1712" />
            <wire x2="1712" y1="608" y2="768" x1="1712" />
            <wire x2="2064" y1="768" y2="768" x1="1712" />
            <wire x2="1712" y1="768" y2="912" x1="1712" />
            <wire x2="1712" y1="912" y2="1136" x1="1712" />
            <wire x2="2064" y1="912" y2="912" x1="1712" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2464" y1="304" y2="304" x1="2320" />
            <wire x2="2464" y1="304" y2="512" x1="2464" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="2400" y1="544" y2="544" x1="2320" />
            <wire x2="2400" y1="544" y2="576" x1="2400" />
            <wire x2="2464" y1="576" y2="576" x1="2400" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="2336" y1="768" y2="768" x1="2320" />
            <wire x2="2336" y1="640" y2="768" x1="2336" />
            <wire x2="2464" y1="640" y2="640" x1="2336" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2448" y1="976" y2="976" x1="2320" />
            <wire x2="2448" y1="704" y2="976" x1="2448" />
            <wire x2="2464" y1="704" y2="704" x1="2448" />
        </branch>
        <branch name="Q0">
            <wire x2="1616" y1="1072" y2="1072" x1="1600" />
            <wire x2="1616" y1="1072" y2="1328" x1="1616" />
            <wire x2="2032" y1="1328" y2="1328" x1="1616" />
            <wire x2="1616" y1="1328" y2="1488" x1="1616" />
            <wire x2="2032" y1="1488" y2="1488" x1="1616" />
            <wire x2="1616" y1="1488" y2="1616" x1="1616" />
            <wire x2="2032" y1="1616" y2="1616" x1="1616" />
            <wire x2="1616" y1="1616" y2="1808" x1="1616" />
            <wire x2="2032" y1="1808" y2="1808" x1="1616" />
            <wire x2="1616" y1="1808" y2="2224" x1="1616" />
            <wire x2="2032" y1="2224" y2="2224" x1="1616" />
            <wire x2="1616" y1="2224" y2="2368" x1="1616" />
            <wire x2="2032" y1="2368" y2="2368" x1="1616" />
            <wire x2="1744" y1="1072" y2="1072" x1="1616" />
        </branch>
        <branch name="Q2">
            <wire x2="1872" y1="1200" y2="1200" x1="1600" />
            <wire x2="2032" y1="1200" y2="1200" x1="1872" />
            <wire x2="1872" y1="1200" y2="1424" x1="1872" />
            <wire x2="2032" y1="1424" y2="1424" x1="1872" />
            <wire x2="1872" y1="1424" y2="1936" x1="1872" />
            <wire x2="2032" y1="1936" y2="1936" x1="1872" />
            <wire x2="1872" y1="1936" y2="2080" x1="1872" />
            <wire x2="2032" y1="2080" y2="2080" x1="1872" />
            <wire x2="1872" y1="2080" y2="2160" x1="1872" />
            <wire x2="2032" y1="2160" y2="2160" x1="1872" />
            <wire x2="1872" y1="2160" y2="2560" x1="1872" />
            <wire x2="2032" y1="2560" y2="2560" x1="1872" />
            <wire x2="1872" y1="2560" y2="2672" x1="1872" />
            <wire x2="2320" y1="2672" y2="2672" x1="1872" />
            <wire x2="2064" y1="304" y2="304" x1="1872" />
            <wire x2="1872" y1="304" y2="544" x1="1872" />
            <wire x2="2064" y1="544" y2="544" x1="1872" />
            <wire x2="1872" y1="544" y2="832" x1="1872" />
            <wire x2="2064" y1="832" y2="832" x1="1872" />
            <wire x2="1872" y1="832" y2="976" x1="1872" />
            <wire x2="2064" y1="976" y2="976" x1="1872" />
            <wire x2="1872" y1="976" y2="1200" x1="1872" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2368" y1="1264" y2="1264" x1="2288" />
            <wire x2="2368" y1="1264" y2="1360" x1="2368" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2368" y1="1424" y2="1424" x1="2288" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2368" y1="1584" y2="1584" x1="2288" />
            <wire x2="2368" y1="1488" y2="1584" x1="2368" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="2384" y1="1744" y2="1744" x1="2288" />
            <wire x2="2384" y1="1744" y2="1840" x1="2384" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="2384" y1="1904" y2="1904" x1="2288" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="2384" y1="2048" y2="2048" x1="2288" />
            <wire x2="2384" y1="1968" y2="2048" x1="2384" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="2400" y1="2192" y2="2192" x1="2288" />
            <wire x2="2400" y1="2192" y2="2272" x1="2400" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="2400" y1="2336" y2="2336" x1="2288" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2400" y1="2496" y2="2496" x1="2288" />
            <wire x2="2400" y1="2400" y2="2496" x1="2400" />
        </branch>
        <branch name="CE">
            <wire x2="1216" y1="1328" y2="1328" x1="1152" />
        </branch>
        <branch name="clk">
            <wire x2="1216" y1="1392" y2="1392" x1="1184" />
        </branch>
        <branch name="RST">
            <wire x2="1216" y1="1488" y2="1488" x1="1184" />
        </branch>
        <instance x="2064" y="432" name="XLXI_5" orien="R0" />
        <instance x="2064" y="672" name="XLXI_6" orien="R0" />
        <instance x="2064" y="896" name="XLXI_7" orien="R0" />
        <instance x="2064" y="1104" name="XLXI_8" orien="R0" />
        <instance x="2464" y="768" name="XLXI_4" orien="R0" />
        <instance x="2032" y="1136" name="XLXI_13" orien="M180" />
        <instance x="2032" y="1552" name="XLXI_14" orien="R0" />
        <instance x="2032" y="1680" name="XLXI_15" orien="R0" />
        <instance x="2032" y="1872" name="XLXI_16" orien="R0" />
        <instance x="2032" y="2000" name="XLXI_17" orien="R0" />
        <instance x="2032" y="2144" name="XLXI_18" orien="R0" />
        <instance x="2032" y="2288" name="XLXI_19" orien="R0" />
        <instance x="2032" y="2432" name="XLXI_20" orien="R0" />
        <instance x="2032" y="2624" name="XLXI_21" orien="R0" />
        <instance x="2384" y="2032" name="XLXI_23" orien="R0" />
        <instance x="2368" y="1552" name="XLXI_24" orien="R0" />
        <instance x="2400" y="2464" name="XLXI_22" orien="R0" />
        <iomarker fontsize="28" x="1744" y="1072" name="Q0" orien="R0" />
        <iomarker fontsize="28" x="1744" y="1136" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="2320" y="2624" name="Q3" orien="R0" />
        <iomarker fontsize="28" x="2320" y="2672" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="1184" y="1488" name="RST" orien="R180" />
        <iomarker fontsize="28" x="1152" y="1328" name="CE" orien="R180" />
        <iomarker fontsize="28" x="1184" y="1392" name="clk" orien="R180" />
        <instance x="592" y="1472" name="XLXI_43" orien="R0">
        </instance>
        <branch name="XLXN_64">
            <wire x2="1088" y1="928" y2="928" x1="976" />
            <wire x2="1088" y1="928" y2="1072" x1="1088" />
            <wire x2="1216" y1="1072" y2="1072" x1="1088" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="1024" y1="1088" y2="1088" x1="976" />
            <wire x2="1024" y1="1088" y2="1136" x1="1024" />
            <wire x2="1216" y1="1136" y2="1136" x1="1024" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="1088" y1="1248" y2="1248" x1="976" />
            <wire x2="1088" y1="1200" y2="1248" x1="1088" />
            <wire x2="1216" y1="1200" y2="1200" x1="1088" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="1040" y1="1408" y2="1408" x1="976" />
            <wire x2="1216" y1="1264" y2="1264" x1="1040" />
            <wire x2="1040" y1="1264" y2="1408" x1="1040" />
        </branch>
        <branch name="SEL">
            <wire x2="592" y1="1184" y2="1184" x1="560" />
        </branch>
        <iomarker fontsize="28" x="560" y="1184" name="SEL" orien="R180" />
        <iomarker fontsize="28" x="432" y="1440" name="D3" orien="R180" />
        <branch name="D3">
            <wire x2="592" y1="1440" y2="1440" x1="432" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2736" y1="144" y2="144" x1="352" />
            <wire x2="2736" y1="144" y2="608" x1="2736" />
            <wire x2="352" y1="144" y2="928" x1="352" />
            <wire x2="592" y1="928" y2="928" x1="352" />
            <wire x2="2736" y1="608" y2="608" x1="2720" />
        </branch>
        <branch name="D2">
            <wire x2="576" y1="1376" y2="1376" x1="432" />
            <wire x2="592" y1="1376" y2="1376" x1="576" />
        </branch>
        <iomarker fontsize="28" x="432" y="1376" name="D2" orien="R180" />
        <branch name="D1">
            <wire x2="576" y1="1312" y2="1312" x1="432" />
            <wire x2="592" y1="1312" y2="1312" x1="576" />
        </branch>
        <iomarker fontsize="28" x="432" y="1312" name="D1" orien="R180" />
        <branch name="D0">
            <wire x2="576" y1="1248" y2="1248" x1="432" />
            <wire x2="592" y1="1248" y2="1248" x1="576" />
        </branch>
        <iomarker fontsize="28" x="432" y="1248" name="D0" orien="R180" />
        <branch name="XLXN_23">
            <wire x2="2912" y1="112" y2="112" x1="320" />
            <wire x2="2912" y1="112" y2="1424" x1="2912" />
            <wire x2="320" y1="112" y2="992" x1="320" />
            <wire x2="592" y1="992" y2="992" x1="320" />
            <wire x2="2912" y1="1424" y2="1424" x1="2624" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="3200" y1="64" y2="64" x1="272" />
            <wire x2="3200" y1="64" y2="1904" x1="3200" />
            <wire x2="272" y1="64" y2="1056" x1="272" />
            <wire x2="592" y1="1056" y2="1056" x1="272" />
            <wire x2="3200" y1="1904" y2="1904" x1="2640" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="3264" y1="16" y2="16" x1="240" />
            <wire x2="3264" y1="16" y2="2336" x1="3264" />
            <wire x2="240" y1="16" y2="1120" x1="240" />
            <wire x2="592" y1="1120" y2="1120" x1="240" />
            <wire x2="3264" y1="2336" y2="2336" x1="2656" />
        </branch>
        <instance x="1216" y="1520" name="XLXI_45" orien="R0" />
    </sheet>
</drawing>