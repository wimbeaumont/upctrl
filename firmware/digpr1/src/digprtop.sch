<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="RstN" />
        <signal name="clk1" />
        <signal name="sw(2)" />
        <signal name="sw(0)" />
        <signal name="sw(1)" />
        <signal name="sw(7)" />
        <signal name="sw(7:0)" />
        <signal name="clk3" />
        <signal name="sw(5)" />
        <signal name="sw(3)" />
        <signal name="A_B(7:0)" />
        <signal name="LED(7:0)" />
        <signal name="LED_P(4)" />
        <signal name="LED_P(5)" />
        <signal name="P(7:0)" />
        <signal name="LED_D(7:0)" />
        <signal name="LED_D(0)" />
        <signal name="LED_D(1)" />
        <signal name="LED_D(2)" />
        <signal name="LED_D(3)" />
        <signal name="LED_D(5)" />
        <signal name="LED_D(4)" />
        <signal name="LED_D(6)" />
        <signal name="LED_D(7)" />
        <signal name="LED_P(6)" />
        <signal name="LED_P(7)" />
        <signal name="sw(6)" />
        <signal name="LED_P(3)" />
        <signal name="LED_P(2)" />
        <signal name="LED_P(1)" />
        <signal name="LED_P(0)" />
        <signal name="A_B(4)" />
        <signal name="A_B(3)" />
        <signal name="A_B(2)" />
        <signal name="A_B(1)" />
        <signal name="A_B(0)" />
        <signal name="GPIO22" />
        <signal name="LED_P(7:0)" />
        <signal name="A_B(5)" />
        <signal name="XLXN_43(7:0)" />
        <signal name="XLXN_63(7:0)" />
        <signal name="XLXN_64(7:0)" />
        <signal name="A_B(7)" />
        <signal name="A_B(6)" />
        <signal name="D(7:0)" />
        <signal name="D(6)" />
        <signal name="D(5)" />
        <signal name="D(4)" />
        <signal name="D(3)" />
        <signal name="D(2)" />
        <signal name="D(1)" />
        <signal name="D(0)" />
        <signal name="P(7)" />
        <signal name="P(6)" />
        <signal name="P(5)" />
        <signal name="P(4)" />
        <signal name="P(3)" />
        <signal name="P(2)" />
        <signal name="P(1)" />
        <signal name="P(0)" />
        <signal name="sysclk" />
        <signal name="clk0" />
        <signal name="sw(4)" />
        <signal name="XLXN_77" />
        <signal name="Lid(3:0)" />
        <signal name="XLXN_78" />
        <signal name="SEL(1:0)" />
        <signal name="SEL(1)" />
        <signal name="SEL(0)" />
        <signal name="GPIO14" />
        <port polarity="Input" name="RstN" />
        <port polarity="Input" name="clk1" />
        <port polarity="Input" name="sw(7:0)" />
        <port polarity="Input" name="clk3" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="Output" name="P(7:0)" />
        <port polarity="Input" name="GPIO22" />
        <port polarity="Input" name="D(7:0)" />
        <port polarity="Input" name="sysclk" />
        <port polarity="Input" name="clk0" />
        <port polarity="Output" name="Lid(3:0)" />
        <port polarity="Input" name="SEL(1:0)" />
        <port polarity="Input" name="GPIO14" />
        <blockdef name="digpr1">
            <timestamp>2019-12-11T14:33:55</timestamp>
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="256" x="64" y="-704" height="896" />
            <line x2="0" y1="112" y2="112" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
        </blockdef>
        <blockdef name="logic_a">
            <timestamp>2019-12-13T13:10:53</timestamp>
            <rect width="256" x="64" y="-320" height="436" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="16" y2="16" x1="320" />
            <line x2="384" y1="64" y2="64" x1="320" />
        </blockdef>
        <blockdef name="Mux_8_2">
            <timestamp>2018-10-9T16:9:53</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="obuf4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="128" y1="-224" y2="-224" x1="224" />
            <line x2="128" y1="-160" y2="-160" x1="224" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="128" y1="-96" y2="-96" x1="224" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="nor4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="216" y1="-160" y2="-160" x1="256" />
            <circle r="12" cx="204" cy="-160" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="Mux_8_4">
            <timestamp>2019-12-11T15:14:24</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <blockdef name="adderinput">
            <timestamp>2020-2-21T7:53:40</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="68" y1="-128" y2="-128" x1="4" />
            <line x2="64" y1="-128" y2="-128" x1="68" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="ledid">
            <timestamp>2019-12-13T14:16:19</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <blockdef name="dbounce">
            <timestamp>2019-12-13T12:41:52</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
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
        <block symbolname="logic_a" name="XLXI_12">
            <blockpin signalname="sw(2)" name="sw2" />
            <blockpin signalname="sw(0)" name="sw0" />
            <blockpin signalname="sw(1)" name="sw1" />
            <blockpin signalname="XLXN_77" name="CLK0a" />
            <blockpin signalname="sw(4)" name="sw4" />
            <blockpin signalname="LED_D(0)" name="Led0" />
            <blockpin signalname="LED_D(1)" name="led1" />
            <blockpin signalname="LED_D(2)" name="led2" />
            <blockpin signalname="LED_D(5)" name="led5" />
            <blockpin signalname="LED_D(4)" name="led4" />
            <blockpin signalname="LED_D(6)" name="led6" />
            <blockpin signalname="LED_D(7)" name="led7" />
        </block>
        <block symbolname="Mux_8_2" name="XLXI_20">
            <blockpin signalname="sw(6)" name="S0" />
            <blockpin signalname="LED_P(7:0)" name="A(7:0)" />
            <blockpin signalname="LED_D(7:0)" name="B(7:0)" />
            <blockpin signalname="LED(7:0)" name="Y(7:0)" />
        </block>
        <block symbolname="nor4" name="XLXI_29">
            <blockpin signalname="sw(3)" name="I0" />
            <blockpin signalname="sw(5)" name="I1" />
            <blockpin signalname="sw(5)" name="I2" />
            <blockpin signalname="sw(7)" name="I3" />
            <blockpin signalname="LED_D(3)" name="O" />
        </block>
        <block symbolname="obuf4" name="XLXI_26">
            <blockpin signalname="LED_P(0)" name="I0" />
            <blockpin signalname="LED_P(1)" name="I1" />
            <blockpin signalname="LED_P(2)" name="I2" />
            <blockpin signalname="LED_P(3)" name="I3" />
            <blockpin signalname="P(0)" name="O0" />
            <blockpin signalname="P(1)" name="O1" />
            <blockpin signalname="P(2)" name="O2" />
            <blockpin signalname="P(3)" name="O3" />
        </block>
        <block symbolname="obuf4" name="XLXI_32">
            <blockpin signalname="LED_P(4)" name="I0" />
            <blockpin signalname="LED_P(5)" name="I1" />
            <blockpin signalname="LED_P(6)" name="I2" />
            <blockpin signalname="LED_P(7)" name="I3" />
            <blockpin signalname="P(4)" name="O0" />
            <blockpin signalname="P(5)" name="O1" />
            <blockpin signalname="P(6)" name="O2" />
            <blockpin signalname="P(7)" name="O3" />
        </block>
        <block symbolname="digpr1" name="DIG1">
            <blockpin signalname="D(0)" name="D0" />
            <blockpin signalname="D(1)" name="D1" />
            <blockpin signalname="D(2)" name="D2" />
            <blockpin signalname="D(3)" name="D3" />
            <blockpin signalname="D(4)" name="DCE" />
            <blockpin signalname="XLXN_78" name="RST" />
            <blockpin signalname="clk1" name="CLK1" />
            <blockpin signalname="GPIO22" name="GPIO22" />
            <blockpin signalname="D(5)" name="DSEL" />
            <blockpin signalname="A_B(0)" name="P0" />
            <blockpin signalname="A_B(1)" name="P1" />
            <blockpin signalname="A_B(3)" name="P3" />
            <blockpin signalname="A_B(4)" name="P4" />
            <blockpin signalname="A_B(5)" name="P5" />
            <blockpin signalname="XLXN_43(7:0)" name="Yout(7:0)" />
            <blockpin signalname="clk3" name="CLK3" />
            <blockpin signalname="A_B(2)" name="P2" />
        </block>
        <block symbolname="Mux_8_4" name="XLXI_34">
            <blockpin signalname="SEL(0)" name="S0" />
            <blockpin signalname="SEL(1)" name="S1" />
            <blockpin signalname="A_B(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_43(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_63(7:0)" name="C(7:0)" />
            <blockpin signalname="XLXN_64(7:0)" name="D(7:0)" />
            <blockpin signalname="LED_P(7:0)" name="Y(7:0)" />
        </block>
        <block symbolname="adderinput" name="XLXI_38">
            <blockpin signalname="GPIO22" name="sel" />
            <blockpin signalname="sysclk" name="clk" />
            <blockpin signalname="D(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_63(7:0)" name="Y(7:0)" />
            <blockpin signalname="XLXN_64(7:0)" name="Cout(7:0)" />
            <blockpin signalname="GPIO14" name="SUBTR" />
        </block>
        <block symbolname="buf" name="XLXI_39">
            <blockpin signalname="D(6)" name="I" />
            <blockpin signalname="A_B(6)" name="O" />
        </block>
        <block symbolname="ledid" name="XLXI_41">
            <blockpin signalname="clk3" name="clk" />
            <blockpin signalname="Lid(3:0)" name="Lid(3:0)" />
        </block>
        <block symbolname="dbounce" name="XLXI_42">
            <blockpin signalname="sysclk" name="clk" />
            <blockpin signalname="RstN" name="rst" />
            <blockpin signalname="clk0" name="A" />
            <blockpin signalname="XLXN_77" name="Y" />
        </block>
        <block symbolname="buf" name="XLXI_40">
            <blockpin signalname="sw(7)" name="I" />
            <blockpin signalname="A_B(7)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_45">
            <blockpin signalname="RstN" name="I" />
            <blockpin signalname="XLXN_78" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="sw(2)">
            <wire x2="784" y1="2032" y2="2032" x1="656" />
        </branch>
        <branch name="sw(0)">
            <wire x2="784" y1="2096" y2="2096" x1="656" />
        </branch>
        <branch name="sw(1)">
            <wire x2="784" y1="2160" y2="2160" x1="656" />
        </branch>
        <bustap x2="656" y1="2160" y2="2160" x1="560" />
        <bustap x2="656" y1="2096" y2="2096" x1="560" />
        <bustap x2="656" y1="2032" y2="2032" x1="560" />
        <branch name="sw(7:0)">
            <wire x2="560" y1="1840" y2="1840" x1="496" />
            <wire x2="560" y1="1840" y2="2032" x1="560" />
            <wire x2="560" y1="2032" y2="2096" x1="560" />
            <wire x2="560" y1="2096" y2="2160" x1="560" />
            <wire x2="560" y1="2160" y2="2288" x1="560" />
            <wire x2="560" y1="2288" y2="2304" x1="560" />
            <wire x2="560" y1="1376" y2="1504" x1="560" />
            <wire x2="560" y1="1504" y2="1568" x1="560" />
            <wire x2="560" y1="1568" y2="1632" x1="560" />
            <wire x2="560" y1="1632" y2="1696" x1="560" />
            <wire x2="560" y1="1696" y2="1808" x1="560" />
            <wire x2="560" y1="1808" y2="1840" x1="560" />
        </branch>
        <iomarker fontsize="28" x="496" y="1840" name="sw(7:0)" orien="R180" />
        <bustap x2="656" y1="1568" y2="1568" x1="560" />
        <branch name="sw(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1568" type="branch" />
            <wire x2="704" y1="1568" y2="1568" x1="656" />
            <wire x2="784" y1="1568" y2="1568" x1="704" />
        </branch>
        <bustap x2="656" y1="1504" y2="1504" x1="560" />
        <branch name="sw(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1504" type="branch" />
            <wire x2="672" y1="1504" y2="1504" x1="656" />
            <wire x2="784" y1="1504" y2="1504" x1="672" />
        </branch>
        <bustap x2="656" y1="1632" y2="1632" x1="560" />
        <branch name="sw(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="688" y="1632" type="branch" />
            <wire x2="688" y1="1632" y2="1632" x1="656" />
            <wire x2="784" y1="1632" y2="1632" x1="688" />
        </branch>
        <bustap x2="656" y1="1696" y2="1696" x1="560" />
        <branch name="sw(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="688" y="1696" type="branch" />
            <wire x2="688" y1="1696" y2="1696" x1="656" />
            <wire x2="784" y1="1696" y2="1696" x1="688" />
        </branch>
        <instance x="784" y="2320" name="XLXI_12" orien="R0">
        </instance>
        <iomarker fontsize="28" x="592" y="864" name="clk1" orien="R180" />
        <iomarker fontsize="28" x="576" y="1200" name="clk3" orien="R180" />
        <bustap x2="656" y1="1808" y2="1808" x1="560" />
        <branch name="sw(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="1808" type="branch" />
            <wire x2="704" y1="1808" y2="1808" x1="656" />
            <wire x2="2752" y1="1808" y2="1808" x1="704" />
        </branch>
        <instance x="2752" y="1968" name="XLXI_20" orien="R0">
        </instance>
        <branch name="LED(7:0)">
            <wire x2="3296" y1="1808" y2="1808" x1="3136" />
        </branch>
        <iomarker fontsize="28" x="3296" y="1808" name="LED(7:0)" orien="R0" />
        <branch name="P(7:0)">
            <wire x2="3184" y1="48" y2="96" x1="3184" />
            <wire x2="3184" y1="96" y2="160" x1="3184" />
            <wire x2="3184" y1="160" y2="224" x1="3184" />
            <wire x2="3184" y1="224" y2="288" x1="3184" />
            <wire x2="3184" y1="288" y2="384" x1="3184" />
            <wire x2="3184" y1="384" y2="448" x1="3184" />
            <wire x2="3184" y1="448" y2="512" x1="3184" />
            <wire x2="3184" y1="512" y2="576" x1="3184" />
            <wire x2="3184" y1="576" y2="704" x1="3184" />
            <wire x2="3280" y1="704" y2="704" x1="3184" />
        </branch>
        <iomarker fontsize="28" x="3280" y="704" name="P(7:0)" orien="R0" />
        <branch name="LED_D(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1616" y="1936" type="branch" />
            <wire x2="1408" y1="1488" y2="1600" x1="1408" />
            <wire x2="1408" y1="1600" y2="1936" x1="1408" />
            <wire x2="1616" y1="1936" y2="1936" x1="1408" />
            <wire x2="2752" y1="1936" y2="1936" x1="1616" />
            <wire x2="1408" y1="1936" y2="2032" x1="1408" />
            <wire x2="1408" y1="2032" y2="2096" x1="1408" />
            <wire x2="1408" y1="2096" y2="2160" x1="1408" />
            <wire x2="1408" y1="2160" y2="2224" x1="1408" />
            <wire x2="1408" y1="2224" y2="2288" x1="1408" />
            <wire x2="1408" y1="2288" y2="2336" x1="1408" />
            <wire x2="1408" y1="2336" y2="2384" x1="1408" />
            <wire x2="1408" y1="2384" y2="2480" x1="1408" />
        </branch>
        <bustap x2="1312" y1="2032" y2="2032" x1="1408" />
        <branch name="LED_D(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="2032" type="branch" />
            <wire x2="1184" y1="2032" y2="2032" x1="1168" />
            <wire x2="1312" y1="2032" y2="2032" x1="1184" />
        </branch>
        <bustap x2="1312" y1="2096" y2="2096" x1="1408" />
        <branch name="LED_D(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="2096" type="branch" />
            <wire x2="1200" y1="2096" y2="2096" x1="1168" />
            <wire x2="1312" y1="2096" y2="2096" x1="1200" />
        </branch>
        <bustap x2="1312" y1="2160" y2="2160" x1="1408" />
        <branch name="LED_D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="2160" type="branch" />
            <wire x2="1200" y1="2160" y2="2160" x1="1168" />
            <wire x2="1312" y1="2160" y2="2160" x1="1200" />
        </branch>
        <bustap x2="1312" y1="1600" y2="1600" x1="1408" />
        <branch name="LED_D(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="1600" type="branch" />
            <wire x2="1120" y1="1600" y2="1600" x1="1040" />
            <wire x2="1312" y1="1600" y2="1600" x1="1120" />
        </branch>
        <bustap x2="1312" y1="2224" y2="2224" x1="1408" />
        <branch name="LED_D(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="2224" type="branch" />
            <wire x2="1184" y1="2224" y2="2224" x1="1168" />
            <wire x2="1312" y1="2224" y2="2224" x1="1184" />
        </branch>
        <bustap x2="1312" y1="2288" y2="2288" x1="1408" />
        <branch name="LED_D(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="2288" type="branch" />
            <wire x2="1184" y1="2288" y2="2288" x1="1168" />
            <wire x2="1312" y1="2288" y2="2288" x1="1184" />
        </branch>
        <bustap x2="1312" y1="2336" y2="2336" x1="1408" />
        <branch name="LED_D(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1216" y="2336" type="branch" />
            <wire x2="1216" y1="2336" y2="2336" x1="1168" />
            <wire x2="1312" y1="2336" y2="2336" x1="1216" />
        </branch>
        <bustap x2="1312" y1="2384" y2="2384" x1="1408" />
        <branch name="LED_D(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="2384" type="branch" />
            <wire x2="1184" y1="2384" y2="2384" x1="1168" />
            <wire x2="1312" y1="2384" y2="2384" x1="1184" />
        </branch>
        <instance x="784" y="1760" name="XLXI_29" orien="R0" />
        <instance x="2672" y="320" name="XLXI_26" orien="R0" />
        <instance x="2688" y="608" name="XLXI_32" orien="R0" />
        <bustap x2="2576" y1="576" y2="576" x1="2480" />
        <branch name="LED_P(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2632" y="576" type="branch" />
            <wire x2="2688" y1="576" y2="576" x1="2576" />
        </branch>
        <bustap x2="2576" y1="512" y2="512" x1="2480" />
        <branch name="LED_P(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2632" y="512" type="branch" />
            <wire x2="2688" y1="512" y2="512" x1="2576" />
        </branch>
        <bustap x2="2576" y1="448" y2="448" x1="2480" />
        <branch name="LED_P(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2632" y="448" type="branch" />
            <wire x2="2688" y1="448" y2="448" x1="2576" />
        </branch>
        <bustap x2="2576" y1="384" y2="384" x1="2480" />
        <branch name="LED_P(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2632" y="384" type="branch" />
            <wire x2="2688" y1="384" y2="384" x1="2576" />
        </branch>
        <bustap x2="2576" y1="288" y2="288" x1="2480" />
        <branch name="LED_P(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2624" y="288" type="branch" />
            <wire x2="2624" y1="288" y2="288" x1="2576" />
            <wire x2="2672" y1="288" y2="288" x1="2624" />
        </branch>
        <bustap x2="2576" y1="224" y2="224" x1="2480" />
        <branch name="LED_P(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2624" y="224" type="branch" />
            <wire x2="2624" y1="224" y2="224" x1="2576" />
            <wire x2="2672" y1="224" y2="224" x1="2624" />
        </branch>
        <bustap x2="2576" y1="160" y2="160" x1="2480" />
        <branch name="LED_P(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2624" y="160" type="branch" />
            <wire x2="2624" y1="160" y2="160" x1="2576" />
            <wire x2="2672" y1="160" y2="160" x1="2624" />
        </branch>
        <bustap x2="2576" y1="96" y2="96" x1="2480" />
        <branch name="LED_P(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2624" y="96" type="branch" />
            <wire x2="2624" y1="96" y2="96" x1="2576" />
            <wire x2="2672" y1="96" y2="96" x1="2624" />
        </branch>
        <bustap x2="1584" y1="736" y2="736" x1="1680" />
        <branch name="A_B(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="736" type="branch" />
            <wire x2="1376" y1="736" y2="736" x1="1168" />
            <wire x2="1584" y1="736" y2="736" x1="1376" />
        </branch>
        <bustap x2="1584" y1="672" y2="672" x1="1680" />
        <bustap x2="1584" y1="608" y2="608" x1="1680" />
        <bustap x2="1584" y1="480" y2="480" x1="1680" />
        <bustap x2="1584" y1="416" y2="416" x1="1680" />
        <branch name="A_B(7:0)">
            <wire x2="1680" y1="320" y2="416" x1="1680" />
            <wire x2="1680" y1="416" y2="480" x1="1680" />
            <wire x2="1680" y1="480" y2="608" x1="1680" />
            <wire x2="1680" y1="608" y2="672" x1="1680" />
            <wire x2="1680" y1="672" y2="736" x1="1680" />
            <wire x2="1680" y1="736" y2="800" x1="1680" />
            <wire x2="1680" y1="800" y2="864" x1="1680" />
            <wire x2="1680" y1="864" y2="944" x1="1680" />
            <wire x2="1680" y1="944" y2="960" x1="1680" />
            <wire x2="1904" y1="960" y2="960" x1="1680" />
        </branch>
        <branch name="D(7:0)">
            <wire x2="384" y1="400" y2="400" x1="224" />
            <wire x2="384" y1="400" y2="416" x1="384" />
            <wire x2="384" y1="416" y2="480" x1="384" />
            <wire x2="384" y1="480" y2="544" x1="384" />
            <wire x2="384" y1="544" y2="672" x1="384" />
            <wire x2="384" y1="672" y2="736" x1="384" />
            <wire x2="384" y1="736" y2="928" x1="384" />
            <wire x2="384" y1="928" y2="1024" x1="384" />
        </branch>
        <iomarker fontsize="28" x="752" y="992" name="GPIO22" orien="R180" />
        <branch name="LED_P(7:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2480" y="720" type="branch" />
            <wire x2="2480" y1="832" y2="832" x1="2288" />
            <wire x2="2480" y1="832" y2="1872" x1="2480" />
            <wire x2="2752" y1="1872" y2="1872" x1="2480" />
            <wire x2="2480" y1="32" y2="96" x1="2480" />
            <wire x2="2480" y1="96" y2="160" x1="2480" />
            <wire x2="2480" y1="160" y2="224" x1="2480" />
            <wire x2="2480" y1="224" y2="288" x1="2480" />
            <wire x2="2480" y1="288" y2="384" x1="2480" />
            <wire x2="2480" y1="384" y2="448" x1="2480" />
            <wire x2="2480" y1="448" y2="512" x1="2480" />
            <wire x2="2480" y1="512" y2="576" x1="2480" />
            <wire x2="2480" y1="576" y2="720" x1="2480" />
            <wire x2="2480" y1="720" y2="832" x1="2480" />
        </branch>
        <instance x="1904" y="1184" name="XLXI_34" orien="R0">
        </instance>
        <iomarker fontsize="28" x="224" y="400" name="D(7:0)" orien="R180" />
        <bustap x2="1584" y1="800" y2="800" x1="1680" />
        <branch name="A_B(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="800" type="branch" />
            <wire x2="1376" y1="800" y2="800" x1="1168" />
            <wire x2="1584" y1="800" y2="800" x1="1376" />
        </branch>
        <branch name="XLXN_43(7:0)">
            <wire x2="1200" y1="1184" y2="1184" x1="1168" />
            <wire x2="1200" y1="1024" y2="1184" x1="1200" />
            <wire x2="1904" y1="1024" y2="1024" x1="1200" />
        </branch>
        <instance x="1424" y="1376" name="XLXI_38" orien="R0">
        </instance>
        <branch name="GPIO22">
            <wire x2="1424" y1="1216" y2="1216" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1216" name="GPIO22" orien="R180" />
        <branch name="XLXN_63(7:0)">
            <wire x2="1840" y1="1216" y2="1216" x1="1808" />
            <wire x2="1840" y1="1088" y2="1216" x1="1840" />
            <wire x2="1904" y1="1088" y2="1088" x1="1840" />
        </branch>
        <branch name="XLXN_64(7:0)">
            <wire x2="1872" y1="1344" y2="1344" x1="1808" />
            <wire x2="1872" y1="1152" y2="1344" x1="1872" />
            <wire x2="1904" y1="1152" y2="1152" x1="1872" />
        </branch>
        <bustap x2="1584" y1="944" y2="944" x1="1680" />
        <branch name="A_B(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1568" y="944" type="branch" />
            <wire x2="1568" y1="944" y2="944" x1="1552" />
            <wire x2="1584" y1="944" y2="944" x1="1568" />
        </branch>
        <bustap x2="1584" y1="864" y2="864" x1="1680" />
        <branch name="A_B(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1568" y="864" type="branch" />
            <wire x2="1568" y1="864" y2="864" x1="1536" />
            <wire x2="1584" y1="864" y2="864" x1="1568" />
        </branch>
        <branch name="A_B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="672" type="branch" />
            <wire x2="1376" y1="672" y2="672" x1="1168" />
            <wire x2="1584" y1="672" y2="672" x1="1376" />
        </branch>
        <branch name="A_B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="608" type="branch" />
            <wire x2="1376" y1="608" y2="608" x1="1168" />
            <wire x2="1584" y1="608" y2="608" x1="1376" />
        </branch>
        <branch name="A_B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="480" type="branch" />
            <wire x2="1376" y1="480" y2="480" x1="1168" />
            <wire x2="1584" y1="480" y2="480" x1="1376" />
        </branch>
        <branch name="A_B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="416" type="branch" />
            <wire x2="1376" y1="416" y2="416" x1="1168" />
            <wire x2="1584" y1="416" y2="416" x1="1376" />
        </branch>
        <branch name="D(7:0)">
            <attrtext style="alignment:SOFT-VRIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="880" type="branch" />
            <wire x2="1168" y1="832" y2="864" x1="1168" />
            <wire x2="1168" y1="864" y2="880" x1="1168" />
        </branch>
        <instance x="1312" y="896" name="XLXI_39" orien="R0" />
        <bustap x2="1264" y1="864" y2="864" x1="1168" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1288" y="864" type="branch" />
            <wire x2="1312" y1="864" y2="864" x1="1264" />
        </branch>
        <branch name="D(7:0)">
            <wire x2="1424" y1="1344" y2="1344" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="1280" y="1344" name="D(7:0)" orien="R180" />
        <bustap x2="480" y1="928" y2="928" x1="384" />
        <bustap x2="480" y1="736" y2="736" x1="384" />
        <bustap x2="480" y1="672" y2="672" x1="384" />
        <bustap x2="480" y1="544" y2="544" x1="384" />
        <bustap x2="480" y1="480" y2="480" x1="384" />
        <bustap x2="480" y1="416" y2="416" x1="384" />
        <bustap x2="3088" y1="576" y2="576" x1="3184" />
        <branch name="P(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3000" y="576" type="branch" />
            <wire x2="3088" y1="576" y2="576" x1="2912" />
        </branch>
        <bustap x2="3088" y1="512" y2="512" x1="3184" />
        <branch name="P(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3000" y="512" type="branch" />
            <wire x2="3088" y1="512" y2="512" x1="2912" />
        </branch>
        <bustap x2="3088" y1="448" y2="448" x1="3184" />
        <branch name="P(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3000" y="448" type="branch" />
            <wire x2="3088" y1="448" y2="448" x1="2912" />
        </branch>
        <bustap x2="3088" y1="384" y2="384" x1="3184" />
        <branch name="P(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3000" y="384" type="branch" />
            <wire x2="3088" y1="384" y2="384" x1="2912" />
        </branch>
        <bustap x2="3088" y1="288" y2="288" x1="3184" />
        <branch name="P(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2992" y="288" type="branch" />
            <wire x2="2992" y1="288" y2="288" x1="2896" />
            <wire x2="3088" y1="288" y2="288" x1="2992" />
        </branch>
        <bustap x2="3088" y1="224" y2="224" x1="3184" />
        <branch name="P(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2992" y="224" type="branch" />
            <wire x2="2992" y1="224" y2="224" x1="2896" />
            <wire x2="3088" y1="224" y2="224" x1="2992" />
        </branch>
        <bustap x2="3088" y1="160" y2="160" x1="3184" />
        <branch name="P(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2992" y="160" type="branch" />
            <wire x2="2992" y1="160" y2="160" x1="2896" />
            <wire x2="3088" y1="160" y2="160" x1="2992" />
        </branch>
        <bustap x2="3088" y1="96" y2="96" x1="3184" />
        <branch name="P(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2992" y="96" type="branch" />
            <wire x2="2992" y1="96" y2="96" x1="2896" />
            <wire x2="3088" y1="96" y2="96" x1="2992" />
        </branch>
        <instance x="2288" y="2416" name="XLXI_41" orien="R0">
        </instance>
        <branch name="clk3">
            <wire x2="2288" y1="2320" y2="2320" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2256" y="2320" name="clk3" orien="R180" />
        <branch name="sysclk">
            <wire x2="1408" y1="1280" y2="1280" x1="1264" />
            <wire x2="1424" y1="1280" y2="1280" x1="1408" />
        </branch>
        <branch name="RstN">
            <wire x2="160" y1="2288" y2="2288" x1="96" />
        </branch>
        <branch name="sysclk">
            <wire x2="160" y1="2224" y2="2224" x1="112" />
        </branch>
        <branch name="clk0">
            <wire x2="160" y1="2352" y2="2352" x1="96" />
        </branch>
        <bustap x2="656" y1="2288" y2="2288" x1="560" />
        <branch name="sw(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="720" y="2288" type="branch" />
            <wire x2="720" y1="2288" y2="2288" x1="656" />
            <wire x2="784" y1="2288" y2="2288" x1="720" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="784" y1="2224" y2="2224" x1="544" />
        </branch>
        <instance x="160" y="2384" name="XLXI_42" orien="R0">
        </instance>
        <iomarker fontsize="28" x="112" y="2224" name="sysclk" orien="R180" />
        <iomarker fontsize="28" x="96" y="2352" name="clk0" orien="R180" />
        <branch name="Lid(3:0)">
            <wire x2="2704" y1="2448" y2="2448" x1="2672" />
        </branch>
        <iomarker fontsize="28" x="2704" y="2448" name="Lid(3:0)" orien="R0" />
        <instance x="1328" y="976" name="XLXI_40" orien="R0" />
        <branch name="clk3">
            <wire x2="784" y1="1200" y2="1200" x1="576" />
        </branch>
        <branch name="GPIO22">
            <wire x2="784" y1="992" y2="992" x1="752" />
        </branch>
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="928" type="branch" />
            <wire x2="784" y1="928" y2="928" x1="480" />
        </branch>
        <branch name="clk1">
            <wire x2="784" y1="864" y2="864" x1="592" />
        </branch>
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="736" type="branch" />
            <wire x2="496" y1="736" y2="736" x1="480" />
            <wire x2="640" y1="736" y2="736" x1="496" />
            <wire x2="784" y1="736" y2="736" x1="640" />
        </branch>
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="672" type="branch" />
            <wire x2="496" y1="672" y2="672" x1="480" />
            <wire x2="640" y1="672" y2="672" x1="496" />
            <wire x2="784" y1="672" y2="672" x1="640" />
        </branch>
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="544" type="branch" />
            <wire x2="496" y1="544" y2="544" x1="480" />
            <wire x2="640" y1="544" y2="544" x1="496" />
            <wire x2="784" y1="544" y2="544" x1="640" />
        </branch>
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="480" type="branch" />
            <wire x2="496" y1="480" y2="480" x1="480" />
            <wire x2="640" y1="480" y2="480" x1="496" />
            <wire x2="784" y1="480" y2="480" x1="640" />
        </branch>
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="632" y="416" type="branch" />
            <wire x2="496" y1="416" y2="416" x1="480" />
            <wire x2="640" y1="416" y2="416" x1="496" />
            <wire x2="784" y1="416" y2="416" x1="640" />
        </branch>
        <instance x="784" y="1088" name="DIG1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="192" type="instance" />
        </instance>
        <branch name="sw(7:0)">
            <attrtext style="alignment:SOFT-VLEFT;fontsize:28;fontname:Arial" attrname="Name" x="1216" y="912" type="branch" />
            <wire x2="1216" y1="912" y2="944" x1="1216" />
            <wire x2="1216" y1="944" y2="976" x1="1216" />
            <wire x2="1216" y1="976" y2="992" x1="1216" />
        </branch>
        <bustap x2="1312" y1="944" y2="944" x1="1216" />
        <branch name="sw(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1320" y="944" type="branch" />
            <wire x2="1328" y1="944" y2="944" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="96" y="2288" name="RstN" orien="R180" />
        <branch name="XLXN_78">
            <wire x2="768" y1="800" y2="800" x1="752" />
            <wire x2="784" y1="800" y2="800" x1="768" />
        </branch>
        <instance x="528" y="832" name="XLXI_45" orien="R0" />
        <branch name="RstN">
            <wire x2="512" y1="800" y2="800" x1="496" />
            <wire x2="528" y1="800" y2="800" x1="512" />
        </branch>
        <iomarker fontsize="28" x="496" y="800" name="RstN" orien="R180" />
        <branch name="SEL(1:0)">
            <wire x2="1744" y1="608" y2="832" x1="1744" />
            <wire x2="1744" y1="832" y2="896" x1="1744" />
            <wire x2="1744" y1="896" y2="928" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1744" y="608" name="SEL(1:0)" orien="R270" />
        <bustap x2="1840" y1="896" y2="896" x1="1744" />
        <branch name="SEL(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="896" type="branch" />
            <wire x2="1872" y1="896" y2="896" x1="1840" />
            <wire x2="1904" y1="896" y2="896" x1="1872" />
        </branch>
        <bustap x2="1840" y1="832" y2="832" x1="1744" />
        <branch name="SEL(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="832" type="branch" />
            <wire x2="1872" y1="832" y2="832" x1="1840" />
            <wire x2="1904" y1="832" y2="832" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="1264" y="1280" name="sysclk" orien="R180" />
        <branch name="GPIO14">
            <wire x2="1424" y1="1248" y2="1248" x1="1392" />
        </branch>
        <iomarker fontsize="28" x="1392" y="1248" name="GPIO14" orien="R180" />
    </sheet>
</drawing>