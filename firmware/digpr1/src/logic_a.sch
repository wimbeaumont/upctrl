<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Led0" />
        <signal name="XLXN_166" />
        <signal name="XLXN_167" />
        <signal name="sw2" />
        <signal name="led1" />
        <signal name="led2" />
        <signal name="sw0" />
        <signal name="sw1" />
        <signal name="XLXN_39" />
        <signal name="XLXN_42" />
        <signal name="led5" />
        <signal name="led4" />
        <signal name="CLK0a" />
        <signal name="sw4" />
        <signal name="XLXN_172" />
        <signal name="XLXN_175" />
        <signal name="led6" />
        <signal name="led7" />
        <port polarity="Output" name="Led0" />
        <port polarity="Input" name="sw2" />
        <port polarity="Output" name="led1" />
        <port polarity="Output" name="led2" />
        <port polarity="Input" name="sw0" />
        <port polarity="Input" name="sw1" />
        <port polarity="Output" name="led5" />
        <port polarity="Output" name="led4" />
        <port polarity="Input" name="CLK0a" />
        <port polarity="Input" name="sw4" />
        <port polarity="Output" name="led6" />
        <port polarity="Output" name="led7" />
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
        <blockdef name="or2b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="44" cy="-64" />
            <line x2="32" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="44" cy="-128" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <block symbolname="and2" name="XLXI_31">
            <blockpin signalname="sw1" name="I0" />
            <blockpin signalname="sw0" name="I1" />
            <blockpin signalname="Led0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_32">
            <blockpin signalname="sw1" name="I0" />
            <blockpin signalname="sw0" name="I1" />
            <blockpin signalname="XLXN_166" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_33">
            <blockpin signalname="sw2" name="I0" />
            <blockpin signalname="XLXN_166" name="I1" />
            <blockpin signalname="led1" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_34">
            <blockpin signalname="sw2" name="I0" />
            <blockpin signalname="XLXN_167" name="I1" />
            <blockpin signalname="led2" name="O" />
        </block>
        <block symbolname="or2b2" name="XLXI_35">
            <blockpin signalname="sw1" name="I0" />
            <blockpin signalname="sw0" name="I1" />
            <blockpin signalname="XLXN_167" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_16">
            <blockpin signalname="CLK0a" name="C" />
            <blockpin signalname="XLXN_39" name="D" />
            <blockpin signalname="XLXN_42" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_17">
            <blockpin signalname="XLXN_42" name="I" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="XLXN_42" name="I" />
            <blockpin signalname="led5" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="CLK0a" name="C" />
            <blockpin signalname="sw4" name="D" />
            <blockpin signalname="led4" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_39">
            <blockpin signalname="XLXN_172" name="I0" />
            <blockpin signalname="XLXN_175" name="I1" />
            <blockpin signalname="led6" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_40">
            <blockpin signalname="sw0" name="D0" />
            <blockpin signalname="sw1" name="D1" />
            <blockpin signalname="sw2" name="S0" />
            <blockpin signalname="led7" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_41">
            <blockpin signalname="sw2" name="I0" />
            <blockpin signalname="sw0" name="I1" />
            <blockpin signalname="XLXN_175" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_38">
            <blockpin signalname="sw2" name="I0" />
            <blockpin signalname="sw1" name="I1" />
            <blockpin signalname="XLXN_172" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Led0">
            <wire x2="1248" y1="336" y2="336" x1="864" />
        </branch>
        <instance x="608" y="432" name="XLXI_31" orien="R0" />
        <instance x="608" y="704" name="XLXI_32" orien="R0" />
        <branch name="XLXN_166">
            <wire x2="896" y1="608" y2="608" x1="864" />
        </branch>
        <instance x="896" y="736" name="XLXI_33" orien="R0" />
        <branch name="XLXN_167">
            <wire x2="912" y1="880" y2="880" x1="880" />
        </branch>
        <instance x="912" y="1008" name="XLXI_34" orien="R0" />
        <branch name="sw2">
            <wire x2="496" y1="688" y2="688" x1="432" />
            <wire x2="496" y1="688" y2="992" x1="496" />
            <wire x2="864" y1="992" y2="992" x1="496" />
            <wire x2="880" y1="688" y2="688" x1="496" />
            <wire x2="912" y1="944" y2="944" x1="864" />
            <wire x2="864" y1="944" y2="992" x1="864" />
            <wire x2="896" y1="672" y2="672" x1="880" />
            <wire x2="880" y1="672" y2="688" x1="880" />
        </branch>
        <branch name="led1">
            <wire x2="1184" y1="640" y2="640" x1="1152" />
        </branch>
        <branch name="led2">
            <wire x2="1200" y1="912" y2="912" x1="1168" />
        </branch>
        <instance x="624" y="976" name="XLXI_35" orien="R0" />
        <branch name="sw0">
            <wire x2="560" y1="304" y2="304" x1="384" />
            <wire x2="608" y1="304" y2="304" x1="560" />
            <wire x2="560" y1="304" y2="576" x1="560" />
            <wire x2="560" y1="576" y2="848" x1="560" />
            <wire x2="624" y1="848" y2="848" x1="560" />
            <wire x2="608" y1="576" y2="576" x1="560" />
        </branch>
        <branch name="sw1">
            <wire x2="512" y1="368" y2="368" x1="384" />
            <wire x2="608" y1="368" y2="368" x1="512" />
            <wire x2="512" y1="368" y2="640" x1="512" />
            <wire x2="512" y1="640" y2="912" x1="512" />
            <wire x2="624" y1="912" y2="912" x1="512" />
            <wire x2="608" y1="640" y2="640" x1="512" />
        </branch>
        <rect width="1236" x="248" y="200" height="256" />
        <text style="fontsize:40;fontname:Arial" x="1244" y="788">1B</text>
        <rect width="1224" x="252" y="508" height="512" />
        <iomarker fontsize="28" x="432" y="688" name="sw2" orien="R180" />
        <iomarker fontsize="28" x="1184" y="640" name="led1" orien="R0" />
        <iomarker fontsize="28" x="1200" y="912" name="led2" orien="R0" />
        <iomarker fontsize="28" x="384" y="368" name="sw1" orien="R180" />
        <iomarker fontsize="28" x="384" y="304" name="sw0" orien="R180" />
        <branch name="XLXN_39">
            <wire x2="1184" y1="1728" y2="1728" x1="1152" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="912" y1="1504" y2="1728" x1="912" />
            <wire x2="928" y1="1728" y2="1728" x1="912" />
            <wire x2="1600" y1="1504" y2="1504" x1="912" />
            <wire x2="1600" y1="1504" y2="1728" x1="1600" />
            <wire x2="1680" y1="1728" y2="1728" x1="1600" />
            <wire x2="1696" y1="1728" y2="1728" x1="1680" />
            <wire x2="1600" y1="1728" y2="1728" x1="1568" />
        </branch>
        <branch name="led5">
            <wire x2="1936" y1="1728" y2="1728" x1="1904" />
        </branch>
        <instance x="1184" y="1984" name="XLXI_16" orien="R0" />
        <instance x="928" y="1760" name="XLXI_17" orien="R0" />
        <instance x="1680" y="1760" name="XLXI_18" orien="R0" />
        <branch name="led4">
            <wire x2="1648" y1="2144" y2="2144" x1="1616" />
        </branch>
        <branch name="CLK0a">
            <wire x2="912" y1="2272" y2="2272" x1="720" />
            <wire x2="1232" y1="2272" y2="2272" x1="912" />
            <wire x2="1184" y1="1856" y2="1856" x1="912" />
            <wire x2="912" y1="1856" y2="2272" x1="912" />
        </branch>
        <branch name="sw4">
            <wire x2="1232" y1="2144" y2="2144" x1="1200" />
        </branch>
        <instance x="1232" y="2400" name="XLXI_2" orien="R0" />
        <text style="fontsize:40;fontname:Arial" x="1756" y="2276">3A</text>
        <text style="fontsize:40;fontname:Arial" x="1748" y="1568">3B</text>
        <rect width="1456" x="692" y="1368" height="564" />
        <rect width="1500" x="460" y="1952" height="488" />
        <iomarker fontsize="28" x="1936" y="1728" name="led5" orien="R0" />
        <iomarker fontsize="28" x="1648" y="2144" name="led4" orien="R0" />
        <iomarker fontsize="28" x="1200" y="2144" name="sw4" orien="R180" />
        <iomarker fontsize="28" x="720" y="2272" name="CLK0a" orien="R180" />
        <instance x="2432" y="464" name="XLXI_39" orien="R0" />
        <instance x="2160" y="960" name="XLXI_40" orien="R0" />
        <iomarker fontsize="28" x="1248" y="336" name="Led0" orien="R0" />
        <text style="fontsize:40;fontname:Arial" x="1224" y="252">1A</text>
        <branch name="sw0">
            <wire x2="2000" y1="240" y2="240" x1="1904" />
            <wire x2="2112" y1="240" y2="240" x1="2000" />
            <wire x2="2000" y1="240" y2="800" x1="2000" />
            <wire x2="2160" y1="800" y2="800" x1="2000" />
        </branch>
        <branch name="sw1">
            <wire x2="1968" y1="464" y2="464" x1="1904" />
            <wire x2="2096" y1="464" y2="464" x1="1968" />
            <wire x2="1968" y1="464" y2="864" x1="1968" />
            <wire x2="2160" y1="864" y2="864" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="1904" y="240" name="sw0" orien="R180" />
        <iomarker fontsize="28" x="1904" y="464" name="sw1" orien="R180" />
        <branch name="sw2">
            <wire x2="1952" y1="528" y2="528" x1="1904" />
            <wire x2="2064" y1="528" y2="528" x1="1952" />
            <wire x2="2096" y1="528" y2="528" x1="2064" />
            <wire x2="1952" y1="528" y2="928" x1="1952" />
            <wire x2="2160" y1="928" y2="928" x1="1952" />
            <wire x2="2112" y1="304" y2="304" x1="2064" />
            <wire x2="2064" y1="304" y2="528" x1="2064" />
        </branch>
        <iomarker fontsize="28" x="1904" y="528" name="sw2" orien="R180" />
        <branch name="XLXN_172">
            <wire x2="2416" y1="496" y2="496" x1="2352" />
            <wire x2="2432" y1="400" y2="400" x1="2416" />
            <wire x2="2416" y1="400" y2="496" x1="2416" />
        </branch>
        <branch name="XLXN_175">
            <wire x2="2416" y1="272" y2="272" x1="2368" />
            <wire x2="2416" y1="272" y2="336" x1="2416" />
            <wire x2="2432" y1="336" y2="336" x1="2416" />
        </branch>
        <branch name="led6">
            <wire x2="2720" y1="368" y2="368" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2720" y="368" name="led6" orien="R0" />
        <branch name="led7">
            <wire x2="2496" y1="832" y2="832" x1="2480" />
            <wire x2="2720" y1="832" y2="832" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2720" y="832" name="led7" orien="R0" />
        <rect width="1324" x="1736" y="156" height="964" />
        <text style="fontsize:40;fontname:Arial" x="2796" y="564">4A</text>
        <line x2="3060" y1="616" y2="616" x1="1736" />
        <text style="fontsize:40;fontname:Arial" x="2796" y="724">4B</text>
        <instance x="2096" y="592" name="XLXI_38" orien="R0" />
        <instance x="2112" y="368" name="XLXI_41" orien="R0" />
    </sheet>
</drawing>