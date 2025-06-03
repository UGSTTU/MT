# --- Variables ---
:local newCore1 "core1-daltx.ugsvrs.com"
:local newCore2 "core2-cltnc.ugsvrs.com"
:local newCore3 "core3-lasnv.ugsvrs.com"
:local addrList "UGSAuthIPs"

:put "=============================================================================="
:put "       _______"
:put "     .'       `."
:put "   .'           `."
:put "   | SOSS-SCRIPTS|"
:put "   |     UGS     |"
:put "   |             |"
:put "   |             |"
:put "   |   Alfredo   |"
:put "   |   Marinara  |"
:put "   |             |"
:put "   |             |"
:put "   |             |"
:put "   |_____________|"
:put ""
:put "Oh, so you wanna update your core IP's? Let's cook something up real quick."
:put "We will be updating Core 1, Core 2, and Core 3's IP Addresses if all goes to plan"
:put ""
:put "=============================================================================="
:put "    Let's get cookin!"
:log info "Oh, so you wanna update your core IP's? Let's cook something up real quick."

# --- CORE 1 ---
:local core1Comment "UGS Core 1"
:local found1 false
/ip firewall address-list
:foreach i in=[find where list=$addrList] do={
    :if ([get $i comment] = $core1Comment) do={
        :log info ("Updating " . $core1Comment . " to " . $newCore1)
        :put "	uh huh, a little of this"
        set $i address=$newCore1
        :set found1 true
    }
}
:if (!$found1) do={
	:put "WARNING!!!"
	:put "Core 1: Well, looks like you are missing some FW rules. I added it for you and imma check the others, but you should go back through your FW or setup again from scratch"
	:put "WARNING!!!"
    :log warning ("No entry found for " . $core1Comment . ", adding new entry")
    add list=$addrList address=$newCore1 comment=$core1Comment
}

# --- CORE 2 ---
:local core2Comment "UGS Core 2"
:local found2 false
/ip firewall address-list
:foreach i in=[find where list=$addrList] do={
    :if ([get $i comment] = $core2Comment) do={
        :log info ("Updating " . $core2Comment . " to " . $newCore2)
        :put "		And, some of thisss"
        set $i address=$newCore2
        :set found2 true
    }
}
:if (!$found2) do={
	:put "WARNING!!!"
	:put "Core 2: Oh no, you're missing Core 2??? I added it, but yeah, you really should look at your FW rules or reset this thang"
	:put "WARNING!!!"
	:log warning ("No entry found for " . $core2Comment . ", adding new entry")
    add list=$addrList address=$newCore2 comment=$core2Comment
}

# --- CORE 3 ---
:local core3Comment "UGS Core 3"
:local found3 false
/ip firewall address-list
:foreach i in=[find where list=$addrList] do={
    :if ([get $i comment] = $core3Comment) do={
        :log info ("Updating " . $core3Comment . " to " . $newCore3)
        :put "			Little more Oregano"
        set $i address=$newCore3
        :set found3 true
    }
}
:if (!$found3) do={
	:put "WARNING!!!"
	:put "Core 3: Alrighty broski, this thing is COOKED, just reset it or do your FW rules from scratch. I was still nice enough to add Core 3 to the Address List tho"
	:put "WARNING!!!"
    :log warning ("No entry found for " . $core3Comment . ", adding new entry")
    add list=$addrList address=$newCore3 comment=$core3Comment
}

:put " "
:put "*** Oh look, we already done, it's like magic ***"
:put "if you did not get any errors we should be all good here, laters!"
:log info "UGS Cores 1, 2, and 3 have been SOSS'D UP. FQDN BABY, what is this, amateur hour?"
